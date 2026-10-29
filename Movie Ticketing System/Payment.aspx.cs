using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System
{
    public partial class Payment : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        private static readonly Random random = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                if (Session["bookingid"] != null)
                {
                    int movieId = 0;
                    string hallId = "";
                    DateTime currentDateTime = DateTime.Now;

                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT Id From ShowTime Where ShowTimeId = @ShowTimeId", con);
                    cmd.Parameters.AddWithValue("@ShowTimeId", Session["selectedSTID"]);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            movieId = Convert.ToInt32(reader["Id"]);
                        }

                        reader.Close();

                        string strSelectMovieInfo = "SELECT Movie.MovieName, ShowTime.StartTime, ShowTime.MovieHallId, MovieHall.Name AS HallName FROM Movie INNER JOIN ShowTime ON Movie.Id = ShowTime.Id INNER JOIN MovieHall ON ShowTime.MovieHallId = MovieHall.MovieHallId WHERE Movie.Id = @Id AND ShowTime.ShowTimeId = @ShowTimeId";
                        SqlCommand cmdMovieInfo = new SqlCommand(strSelectMovieInfo, con);
                        cmdMovieInfo.Parameters.AddWithValue("@Id", movieId);
                        cmdMovieInfo.Parameters.AddWithValue("@ShowTimeId", Session["selectedSTID"]);
                        SqlDataReader dtrInfo = cmdMovieInfo.ExecuteReader();

                        if (dtrInfo.HasRows)
                        {
                            while (dtrInfo.Read())
                            {
                                lblMovName.Text = dtrInfo["MovieName"].ToString();
                                lblStartTime.Text = dtrInfo["StartTime"].ToString();
                                hallId = dtrInfo["MovieHallId"].ToString();
                                lblCurrentDT.Text = currentDateTime.ToString("yyyy-MM-dd HH:mm:ss");
                                lblTranId.Text = GenerateTransactionId();
                                lblHall.Text = dtrInfo["HallName"].ToString();
                            }
                        }

                        dtrInfo.Close();
                    }




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
                    lblAmount.Text = String.Format("{0:0.00}", total) + "";
                    lblSubTotal.Text = String.Format("{0:0.00}", total) + "";
                    txtAmount.Text = String.Format("{0:0.00}", total) + "";

                    con.Close();

                    if (total == 0)
                    {
                        Response.Write(@"
                <script>
                alert('Your Order is Empty, Please Select At Least One Item');
                window.location = '/Home.aspx';
                </script>");
                    }
                }

            }


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!txtAmount.Text.ToString().Equals("0.00"))
            {
                con.Open();
                string strDeleteFood = "DELETE FROM BookingSeat WHERE BookingId = @BookingId";
                SqlCommand cmdDeleteFood = new SqlCommand(strDeleteFood, con);
                cmdDeleteFood.Parameters.AddWithValue("@BookingId", Session["bookingid"].ToString());
                cmdDeleteFood.ExecuteNonQuery();

                String strUpdate = "UPDATE Booking SET BookingDate=@BookingDate,Amount=@Amount,PaymentCard=@PaymentCard WHERE BookingId=@BookingId";
                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
                cmdUpdate.Parameters.AddWithValue("@BookingDate", DateTime.Now);
                cmdUpdate.Parameters.AddWithValue("@Amount", Double.Parse(txtAmount.Text.ToString()));
                cmdUpdate.Parameters.AddWithValue("@PaymentCard", txtCardNum.Text);
                cmdUpdate.Parameters.AddWithValue("@BookingId", Session["bookingid"].ToString());
                int n = cmdUpdate.ExecuteNonQuery();
                con.Close();
                if (n > 0)
                {
                    Session["bookingid"] = null;
                    Response.Write(@"<script>
                alert('Payment Successfully');
                window.location = 'BookingHistory.aspx';
                </script>");
                }
                else
                {
                    Response.Write(@"<script>
                alert('Something wrong. Please try again.');
                window.location = 'Payment.aspx';
                </script>");
                }
            }
            else
            {
                Response.Redirect("FnB.aspx");
            }
        }


        public static string GenerateTransactionId()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            char[] idChars = new char[10];

            for (int i = 0; i < idChars.Length; i++)
            {
                idChars[i] = chars[random.Next(chars.Length)];
            }

            return new string(idChars);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
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

                    Response.Write(@"
                <script>
                alert('Payment Cancel');
                window.location = '/Home.aspx';
                </script>");

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