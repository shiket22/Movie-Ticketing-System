using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System
{
    public partial class OrderCart1 : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                con.Open();
                if (!IsPostBack)
                {

                    string strSelect = "Select * From Booking Where UserId=@UserId";
                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                    cmdSelect.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                    SqlDataReader dtrOrders = cmdSelect.ExecuteReader();
                    while (dtrOrders.Read())
                    {
                        if (dtrOrders["PaymentCard"].ToString() == null || dtrOrders["PaymentCard"].ToString().Equals(""))
                        {
                            Session["OID"] = dtrOrders["BookingId"].ToString();
                        }
                    }
                    dtrOrders.Close();
                }
                if (Session["OID"] != null)
                {
                    string strSelectTotalSeat = "Select count(*) From BookingSeat Where BookingId=@BookingId"; 
                    string strSelectTotalMeal = "Select count(*) From BookingItem Where BookingId=@BookingId";

                    SqlCommand cmdTotalSeat = new SqlCommand(strSelectTotalSeat, con);
                    SqlCommand cmdTotalMeal = new SqlCommand(strSelectTotalMeal, con);
                    cmdTotalSeat.Parameters.AddWithValue("@BookingId", Session["OID"].ToString());
                    cmdTotalMeal.Parameters.AddWithValue("@BookingId", Session["OID"].ToString());
                    int countSeat = (int)cmdTotalSeat.ExecuteScalar();
                    int countMeal = (int)cmdTotalMeal.ExecuteScalar();
                    lblTotalSeat.Text = countSeat + "";
                    lblTotalMeal.Text = countMeal + "";

                    string strSelectFood = "SELECT Food.Price AS FPrice, BookingItem.Quantity AS FQuantity FROM BookingItem INNER JOIN Food ON Food.FoodId = BookingItem.FoodId WHERE BookingItem.BookingId = @BookingId";
                    string strSelectSeat = "SELECT Movie.Price AS SPrice, COUNT(BookingSeat.SeatId) AS SQuantity FROM BookingSeat INNER JOIN Seats ON Seats.SeatId = BookingSeat.SeatId INNER JOIN ShowTime ON Seats.ShowTimeId = ShowTime.ShowTimeId INNER JOIN Movie ON ShowTime.Id = Movie.Id WHERE BookingSeat.BookingId = @BookingId GROUP BY Movie.Price;";
                    SqlCommand cmdSelectFood = new SqlCommand(strSelectFood, con);
                    SqlCommand cmdSelectSeat = new SqlCommand(strSelectSeat, con);
                    cmdSelectFood.Parameters.AddWithValue("@BookingId", Session["OID"].ToString());
                    cmdSelectSeat.Parameters.AddWithValue("@BookingId", Session["OID"].ToString());

                    double total = 0;
                    using (SqlDataReader dtrSelectFood = cmdSelectFood.ExecuteReader())
                    {
                        while (dtrSelectFood.Read())
                        {
                            total += (Int16.Parse(dtrSelectFood["FQuantity"].ToString()) * Double.Parse(dtrSelectFood["FPrice"].ToString()));
                        }
                    }

                    using (SqlDataReader dtrSelectSeat = cmdSelectSeat.ExecuteReader())
                    {
                        while (dtrSelectSeat.Read())
                        {
                            total += (Int16.Parse(dtrSelectSeat["SQuantity"].ToString()) * Double.Parse(dtrSelectSeat["SPrice"].ToString()));
                        }
                    }
                    lblTotal.Text = String.Format("{0:0.00}", total) + "";
                }
                else
                {
                    lblTotalSeat.Text = "0";
                    lblTotalMeal.Text = "0";
                    lblTotal.Text = "0.00";
                }
                con.Close();
            }
        }

        //    string strSelectTotal = "Select count(*) From BookingItem Where BookingId=@BookingId";
        //            SqlCommand cmdTotal = new SqlCommand(strSelectTotal, con);
        //            cmdTotal.Parameters.AddWithValue("@BookingId", Session["OID"].ToString());
        //            int count = (int)cmdTotal.ExecuteScalar();
        //            lblTotalMeal.Text = count + "";


        //            string strSelect2 = "SELECT Food.Price as price, BookingItem.Quantity as Quantity FROM BookingItem INNER JOIN Food ON Food.FoodId = BookingItem.FoodId WHERE BookingItem.BookingId = @BookingId";
        //            SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);
        //            cmdSelect2.Parameters.AddWithValue("@BookingId", Session["OID"].ToString());
        //            SqlDataReader dtrSelect2 = cmdSelect2.ExecuteReader();
        //            double total = 0;
        //            while (dtrSelect2.Read())
        //            {
        //                total += (Int16.Parse(dtrSelect2["Quantity"].ToString()) * Double.Parse(dtrSelect2["price"].ToString()));
        //            }
        //            lblTotal.Text = String.Format("{0:0.00}", total) + "";
        //            dtrSelect2.Close();
        //        }
        //        else
        //        {
        //            lblTotalMeal.Text = "0";
        //            lblTotal.Text = "0.00";
        //        }
        //        con.Close();
        //    }
        //}

        protected void cmdDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton cmdDelete = sender as ImageButton;
            String oItemId = cmdDelete.Attributes["BookingItemID"];
            String bItemId = cmdDelete.Attributes["BookingSeatID"];
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            if (!string.IsNullOrEmpty(oItemId))
            {
                string strDeleteFood = "DELETE FROM BookingItem WHERE BookingItemId = @BookingItemId";
                SqlCommand cmdDeleteFood = new SqlCommand(strDeleteFood, con);
                cmdDeleteFood.Parameters.AddWithValue("@BookingItemId", oItemId);
                cmdDeleteFood.ExecuteNonQuery();

                
            }

            if (!string.IsNullOrEmpty(bItemId))
            {
                string strDeleteSeat = "DELETE FROM BookingSeat WHERE BookingSeatId = @BookingSeatId";
                SqlCommand cmdDeleteSeat = new SqlCommand(strDeleteSeat, con);
                cmdDeleteSeat.Parameters.AddWithValue("@BookingSeatId", bItemId);
                cmdDeleteSeat.ExecuteNonQuery();

            }
            con.Close();

            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); 
            //con.Open();
            //string strDeleteFood = "Delete From BookingItem Where BookingItemId=@BookingItemId";
            //string strDeleteSeat = "Delete From BookingSeat Where BookingSeatId=@BookingSeatId";

            //SqlCommand cmdDeleteFood = new SqlCommand(strDeleteFood, con);
            //SqlCommand cmdDeleteSeat = new SqlCommand(strDeleteSeat, con);

            //cmdDeleteFood.Parameters.AddWithValue("@BookingItemId", oItemId);
            //cmdDeleteFood.ExecuteNonQuery();

            //cmdDeleteSeat.Parameters.AddWithValue("@BookingSeatId", bItemId);
            //cmdDeleteSeat.ExecuteNonQuery();
            //con.Close();
            //Response.Redirect("OrderCart.aspx");

        }

        protected void btnDecrease_Click(object sender, EventArgs e)
        {

            Button btn = sender as Button;
            String OItemID = btn.Attributes["BookingItemID"].ToString();
            foreach (GridViewRow gvrow in GridView2.Rows)
            {
                var txtQty = gvrow.FindControl("txtFoodQty") as TextBox;
                if (txtQty.Attributes["BookingItemID"].ToString().Equals(OItemID))
                {
                    if (Int16.Parse(txtQty.Text) == 1)
                    {
                        con.Open();
                        String strDelete = "Delete From BookingItem WHERE BookingItemId=@BookingItemId";
                        SqlCommand cmdDelete = new SqlCommand(strDelete, con);
                        cmdDelete.Parameters.AddWithValue("@BookingItemId", OItemID);
                        int n = cmdDelete.ExecuteNonQuery();
                        con.Close();
                        if (n > 0)
                        {
                            Response.Write(@"<script>
                        alert('Item is removed from cart');
                        window.location = 'OrderCart.aspx';
                        </script>");
                        }
                        else
                        {
                            Response.Write(@"<script>
                        alert('Something error. Please try again.');
                        window.location = 'OrderCart.aspx';
                        </script>");
                        }

                    }
                    else
                    {
                        con.Open();
                        String strUpdate = "Update BookingItem SET Quantity=@Quantity WHERE BookingItemId=@BookingItemId";
                        SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
                        cmdUpdate.Parameters.AddWithValue("@Quantity", Int16.Parse(txtQty.Text) - 1);
                        cmdUpdate.Parameters.AddWithValue("@BookingItemId", OItemID);
                        int n = cmdUpdate.ExecuteNonQuery();
                        con.Close();
                        if (n > 0)
                        {
                            txtQty.Text = (Int16.Parse(txtQty.Text) - 1) + "";
                            Response.Write(@"<script>
                        window.location = 'OrderCart.aspx';
                        </script>");
                        }
                        else
                        {
                            Response.Write(@"<script>
                        alert('Something error. Please try again.');
                        window.location = 'OrderCart.aspx';
                        </script>");
                        }

                    }
                }
            }
        }

        protected void btnIncrease_Click(object sender, EventArgs e)
        {

            Button btn = sender as Button;
            String OItemID = btn.Attributes["BookingItemID"].ToString();
            foreach (GridViewRow gvrow in GridView2.Rows)
            {
                var txtQty = gvrow.FindControl("txtFoodQty") as TextBox;
                if (txtQty.Attributes["BookingItemID"].ToString().Equals(OItemID))
                {
                    con.Open();
                    String strUpdate = "Update BookingItem SET Quantity=@Quantity WHERE BookingItemId=@BookingItemId";
                    SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
                    cmdUpdate.Parameters.AddWithValue("@Quantity", Int16.Parse(txtQty.Text) + 1);
                    cmdUpdate.Parameters.AddWithValue("@BookingItemId", OItemID);
                    int n = cmdUpdate.ExecuteNonQuery();
                    con.Close();
                    if (n > 0)
                    {
                        txtQty.Text = (Int16.Parse(txtQty.Text) + 1) + "";
                        Response.Write(@"<script>
                        window.location = 'OrderCart.aspx';
                        </script>");
                    }
                    else
                    {
                        Response.Write(@"<script>
                        alert('Something error. Please try again.');
                        window.location = 'OrderCart.aspx';
                        </script>");
                    }


                }
            }

        }

        protected void txtFoodQty_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = sender as TextBox;
            String OItemID = txt.Attributes["BookingItemID"].ToString();
            try
            {
                if (Int16.Parse(txt.Text.ToString()) != 0)
                {
                    con.Open();
                    String strUpdate = "Update BookingItem SET Quantity=@Quantity WHERE BookingItemId=@BookingItemId";
                    SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
                    cmdUpdate.Parameters.AddWithValue("@Quantity", Int16.Parse(txt.Text.ToString()));
                    cmdUpdate.Parameters.AddWithValue("@BookingItemId", OItemID);
                    int n = cmdUpdate.ExecuteNonQuery();
                    con.Close();
                    if (n > 0)
                    {
                        Response.Write(@"<script>
                        window.location = 'OrderCart.aspx';
                        </script>");
                    }
                    else
                    {
                        Response.Write(@"<script>
                        alert('Something error. Please try again.');
                        window.location = 'OrderCart.aspx';
                        </script>");
                    }
                }
                else
                {
                    con.Open();
                    String strDelete = "Delete From BookingItem WHERE BookingItemId=@BookingItemId";
                    SqlCommand cmdDelete = new SqlCommand(strDelete, con);
                    cmdDelete.Parameters.AddWithValue("@BookingItemId", OItemID);
                    int n = cmdDelete.ExecuteNonQuery();
                    con.Close();
                    if (n > 0)
                    {
                        Response.Write(@"<script>
                        alert('Item is removed from cart');
                        window.location = 'OrderCart.aspx';
                        </script>");
                    }
                    else
                    {
                        Response.Write(@"<script>
                        alert('Something error. Please try again.');
                        window.location = 'OrderCart.aspx';
                        </script>");
                    }
                }
            }
            catch (FormatException ex)
            {
                Response.Write(@"<script>
                        alert('The quantity only can be number');
                        window.location = 'OrderCart.aspx';
                        </script>");
            }

        }
    }
}