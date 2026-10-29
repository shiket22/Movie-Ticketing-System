using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System
{
    public partial class FnB : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                con.Open();
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
                con.Close();
            }

        }

        protected void btnAddFood_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                Button btnAddFood = sender as Button;
                String foodId = btnAddFood.Attributes["FoodID"].ToString();
                int qtyFood = 0;

                foreach (DataListItem dlitem in DataList1.Items)
                {
                    var qtyF = dlitem.FindControl("qtyFood") as DropDownList;

                    String fId = qtyF.Attributes["FoodID"].ToString();
                    if (fId.Equals(foodId))
                    {
                        qtyFood = Int16.Parse(qtyF.SelectedItem.Value.ToString());

                    }
                }


                con.Open();
                string strSelect = "Select * From Booking Where UserId=@UserId";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                SqlDataReader dtrOrders = cmdSelect.ExecuteReader();
                String bookingid = "";
                int found = 0;
                while (dtrOrders.Read())
                {
                    if (dtrOrders["PaymentCard"].ToString() == null || dtrOrders["PaymentCard"].ToString().Equals(""))
                    {
                        bookingid = dtrOrders["BookingId"].ToString();
                        Session["OID"] = bookingid;
                        found++;
                    }
                }
                dtrOrders.Close();
                if (found == 0)
                {
                    string strSelect2 = "Select * From Booking";
                    SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);
                    SqlDataReader dtrOID = cmdSelect2.ExecuteReader();
                    String lastOId = "";
                    while (dtrOID.Read())
                    {
                        lastOId = dtrOID["BookingId"].ToString();
                    }
                    dtrOID.Close();
                    int num = 0;
                    if (lastOId == null || lastOId.Equals(""))
                    {
                        num = 10001;
                    }
                    else
                    {
                        num = Int16.Parse(lastOId) + 1;
                    }
                    bookingid = num + "";
                    Session["OID"] = bookingid;
                    string strInsert = "Insert Into Booking(BookingId,UserId) Values(@BookingId,@UserId)";
                    SqlCommand cmdAdd = new SqlCommand(strInsert, con);
                    cmdAdd.Parameters.AddWithValue("@BookingId", bookingid);
                    cmdAdd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                    cmdAdd.ExecuteNonQuery();
                }

                string strSelect4 = "Select * From BookingItem";
                SqlCommand cmdSelect4 = new SqlCommand(strSelect4, con);
                SqlDataReader dtrFour = cmdSelect4.ExecuteReader();
                int exist = 0;
                SqlCommand cmdUpdate = new SqlCommand();
                while (dtrFour.Read())
                {
                    if (dtrFour["FoodId"].ToString().Equals(foodId) && dtrFour["BookingId"].ToString().Equals(bookingid))
                    {
                        exist++;
                        String strUpdate = "Update BookingItem SET Quantity=@Quantity WHERE BookingItemId=@BookingItemId";
                        cmdUpdate = new SqlCommand(strUpdate, con);
                        cmdUpdate.Parameters.AddWithValue("@Quantity", Int16.Parse(dtrFour["Quantity"].ToString()) + qtyFood);
                        cmdUpdate.Parameters.AddWithValue("@BookingItemId", dtrFour["BookingItemId"].ToString());

                    }

                }
                dtrFour.Close();
                if (exist > 0)
                {

                    int n = cmdUpdate.ExecuteNonQuery();

                    if (n > 0)
                    {
                        Response.Write(@"<script>
                alert('Food is added to cart.');
                window.location = 'FnB.aspx';
                </script>");
                    }
                    else
                    {
                        Response.Write(@"<script>
                alert('Something wrong. Please try again.');
                window.location = 'FnB.aspx';
                </script>");
                    }
                }
                else if (exist == 0)
                {
                    string strSelect3 = "Select * From BookingItem";
                    SqlCommand cmdSelect3 = new SqlCommand(strSelect3, con);
                    SqlDataReader dtrOItemID = cmdSelect3.ExecuteReader();
                    String lastOItemId = "";
                    while (dtrOItemID.Read())
                    {
                        lastOItemId = dtrOItemID["BookingItemId"].ToString();
                    }
                    dtrOItemID.Close();
                    int bookingItemId = 0;
                    if (lastOItemId == null || lastOItemId.Equals(""))
                    {
                        bookingItemId = 10001;
                    }
                    else
                    {
                        bookingItemId = Int16.Parse(lastOItemId) + 1;
                    }

                    string strInsert2 = "Insert Into BookingItem Values(@BookingItemId,@BookingId,@FoodId,@Quantity)";
                    SqlCommand cmdAdd2 = new SqlCommand(strInsert2, con);
                    cmdAdd2.Parameters.AddWithValue("@BookingItemId", bookingItemId);
                    cmdAdd2.Parameters.AddWithValue("@BookingId", bookingid);
                    cmdAdd2.Parameters.AddWithValue("@FoodId", foodId);
                    cmdAdd2.Parameters.AddWithValue("@Quantity", qtyFood);
                    int n = cmdAdd2.ExecuteNonQuery();
                    if (n > 0)
                    {
                        Response.Write(@"<script>
                alert('Food is added to cart.');
                window.location = 'FnB.aspx';
                </script>");
                    }
                    else
                    {
                        Response.Write(@"<script>
                alert('Something wrong. Please try again.');
                window.location = 'FnB.aspx';
                </script>");
                    }
                }

                con.Close();

            }
        }

        protected void btnAddDrink_Click(object sender, EventArgs e)
        {
            Button btnAddDrink = sender as Button;
            String foodId = btnAddDrink.Attributes["FoodID"].ToString();
            int qtyFood = 0;

            foreach (DataListItem dlitem in DataList2.Items)
            {
                var qtyF = dlitem.FindControl("qtyDrink") as DropDownList;

                String fId = qtyF.Attributes["FoodID"].ToString();
                if (fId.Equals(foodId))
                {
                    qtyFood = Int16.Parse(qtyF.SelectedItem.Value.ToString());

                }
            }

            con.Open();
            string strSelect = "Select * From Booking Where UserId=@UserId";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
            SqlDataReader dtrOrders = cmdSelect.ExecuteReader();
            String bookingid = "";
            int found = 0;
            while (dtrOrders.Read())
            {
                if (dtrOrders["PaymentCard"].ToString() == null || dtrOrders["PaymentCard"].ToString().Equals(""))
                {
                    bookingid = dtrOrders["BookingId"].ToString();
                    Session["OID"] = bookingid;
                    found++;
                }
            }
            dtrOrders.Close();
            if (found == 0)
            {
                string strSelect2 = "Select * From Booking";
                SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);
                SqlDataReader dtrOID = cmdSelect2.ExecuteReader();
                String lastOId = "";
                while (dtrOID.Read())
                {
                    lastOId = dtrOID["BookingId"].ToString();
                }
                dtrOID.Close();
                int num = 0;
                if (lastOId == null || lastOId.Equals(""))
                {
                    num = 10001;
                }
                else
                {
                    num = Int16.Parse(lastOId) + 1;
                }
                bookingid = num + "";
                string strInsert = "Insert Into Booking(BookingId,UserId) Values(@BookingId,@UserId)";
                SqlCommand cmdAdd = new SqlCommand(strInsert, con);
                cmdAdd.Parameters.AddWithValue("@BookingId", bookingid);
                cmdAdd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                cmdAdd.ExecuteNonQuery();
            }

            string strSelect4 = "Select * From BookingItem";
            SqlCommand cmdSelect4 = new SqlCommand(strSelect4, con);
            SqlDataReader dtrFour = cmdSelect4.ExecuteReader();
            int exist = 0;
            SqlCommand cmdUpdate = new SqlCommand();
            while (dtrFour.Read())
            {
                if (dtrFour["FoodId"].ToString().Equals(foodId) && dtrFour["BookingId"].ToString().Equals(bookingid))
                {
                    exist++;
                    String strUpdate = "Update BookingItem SET Quantity=@Quantity WHERE BookingItemId=@BookingItemId";
                    cmdUpdate = new SqlCommand(strUpdate, con);
                    cmdUpdate.Parameters.AddWithValue("@Quantity", Int16.Parse(dtrFour["Quantity"].ToString()) + qtyFood);
                    cmdUpdate.Parameters.AddWithValue("@BookingItemId", dtrFour["BookingItemId"].ToString());

                }

            }
            dtrFour.Close();
            if (exist > 0)
            {

                int n = cmdUpdate.ExecuteNonQuery();

                if (n > 0)
                {
                    Response.Write(@"<script>
                alert('Food is added to cart.');
                window.location = 'FnB.aspx';
                </script>");
                }
                else
                {
                    Response.Write(@"<script>
                alert('Something wrong. Please try again.');
                window.location = 'FnB.aspx';
                </script>");
                }
            }
            else if (exist == 0)
            {
                string strSelect3 = "Select * From BookingItem";
                SqlCommand cmdSelect3 = new SqlCommand(strSelect3, con);
                SqlDataReader dtrOItemID = cmdSelect3.ExecuteReader();
                String lastOItemId = "";
                while (dtrOItemID.Read())
                {
                    lastOItemId = dtrOItemID["BookingItemId"].ToString();
                }
                dtrOItemID.Close();
                int bookingItemId = 0;
                if (lastOItemId == null || lastOItemId.Equals(""))
                {
                    bookingItemId = 10001;
                }
                else
                {
                    bookingItemId = Int16.Parse(lastOItemId) + 1;
                }

                string strInsert2 = "Insert Into BookingItem Values(@BookingItemId,@BookingId,@FoodId,@Quantity)";
                SqlCommand cmdAdd2 = new SqlCommand(strInsert2, con);
                cmdAdd2.Parameters.AddWithValue("@BookingItemId", bookingItemId);
                cmdAdd2.Parameters.AddWithValue("@BookingId", bookingid);
                cmdAdd2.Parameters.AddWithValue("@FoodId", foodId);
                cmdAdd2.Parameters.AddWithValue("@Quantity", qtyFood);
                int n = cmdAdd2.ExecuteNonQuery();
                if (n > 0)
                {
                    Response.Write(@"<script>
                alert('Food is added to cart.');
                window.location = 'FnB.aspx';
                </script>");
                }
                else
                {
                    Response.Write(@"<script>
                alert('Something wrong. Please try again.');
                window.location = 'FnB.aspx';
                </script>");
                }
            }

            con.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                con.Open();
                string strSelect = "Select * From Booking Where UserId=@UserId";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                SqlDataReader dtrOrders = cmdSelect.ExecuteReader();
                string bookingid = "";
                int found = 0;
                while (dtrOrders.Read())
                {
                    if (dtrOrders["PaymentCard"] == DBNull.Value || string.IsNullOrEmpty(dtrOrders["PaymentCard"].ToString()))
                    {
                        bookingid = dtrOrders["BookingId"].ToString();
                        found++;
                    }
                }
                dtrOrders.Close();

                if (!string.IsNullOrEmpty(bookingid))
                {



                    List<string> seatIds = new List<string>();

                    string selectSeat = "Select SeatId From BookingSeat Where BookingId=@BookingId";
                    SqlCommand cmdselectSeat = new SqlCommand(selectSeat, con);
                    cmdselectSeat.Parameters.AddWithValue("@BookingId", bookingid);
                    SqlDataReader dtrSeat = cmdselectSeat.ExecuteReader();

                    while (dtrSeat.Read())
                    {
                        string seatId = dtrSeat["SeatId"].ToString();
                        seatIds.Add(seatId);
                    }

                    dtrSeat.Close();

                    string[] seatIdArray = seatIds.ToArray();
                    foreach (string seatId in seatIdArray)
                    {
                        string strUpdate = "UPDATE Seats SET IsAvailable = @IsAvailable WHERE SeatID = @SeatID AND ShowTimeId = @ShowTimeId";
                        SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
                        cmdUpdate.Parameters.AddWithValue("@IsAvailable", true);
                        cmdUpdate.Parameters.AddWithValue("@SeatID", seatId);
                        cmdUpdate.Parameters.AddWithValue("@ShowTimeId", Session["selectedSTID"].ToString());
                        cmdUpdate.ExecuteNonQuery();
                    }

                    string strDeleteFood = "DELETE FROM BookingSeat WHERE BookingId = @BookingId";
                    SqlCommand cmdDeleteFood = new SqlCommand(strDeleteFood, con);
                    cmdDeleteFood.Parameters.AddWithValue("@BookingId", bookingid);
                    cmdDeleteFood.ExecuteNonQuery();

                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write(@"
                <script>
                alert('Login An Account To Continue');
                window.location = '/LoginRegister.aspx';
                </script>");
                }

                con.Close();
            }
        }
    }
}