using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System
{
    public partial class BookingMovie : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind the movie name and time dropdown list on the initial page load

                int movieId = Convert.ToInt32(Request.QueryString["movieId"]);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Movie WHERE Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", movieId);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        lblMovieName.Text = reader["MovieName"].ToString();
                    }
                }
                con.Close();
            }
        }


        protected void ddlMovieTime_SelectedIndexChanged(object sender, EventArgs e)
        {

            string selectedShowTime = ddlMovieTime.SelectedValue;
            DateTime parsedDate = DateTime.Parse(selectedShowTime);
            string movieId = Request.QueryString["movieId"];
            con.Open();


            SqlCommand cmd = new SqlCommand("SELECT ShowTime.ShowTimeId, MovieHall.MovieHallId, MovieHall.Name FROM ShowTime INNER JOIN MovieHall ON ShowTime.MovieHallId = MovieHall.MovieHallId WHERE ShowTime.Id = @Id AND ShowTime.StartTime = @StartTime", con);

            cmd.Parameters.AddWithValue("@Id", movieId);
            cmd.Parameters.AddWithValue("@StartTime", parsedDate);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                /*
                                Response.Write(@"
                                        <script>
                                        alert('has row');
                                        </script>");*/

                while (reader.Read())
                {


                    /*                    Response.Write(@"
                        <script>
                        var updatedPhoneNumber = '" + reader["Name"].ToString() + @"';  // Pass the C# variable to JavaScript
                        alert(updatedPhoneNumber);  // Display the phone number in an alert

                        </script>");*/

                    lblMovieHallName.Text = reader["Name"].ToString();
                    string movieHallId = reader["MovieHallId"].ToString();
                    Session["movieHallId"] = reader["MovieHallId"].ToString();
                    string selectedSTID = reader["ShowTimeId"].ToString();
                    Session["selectedSTID"] = reader["ShowTimeId"].ToString();


                    DataTable seatData = GetSeatData(selectedSTID);
                    SeatDataList.DataSource = seatData;
                    SeatDataList.DataBind();
                }
            }
            else
            {
                Response.Write(@"
                        <script>
                        alert('no row');
                        </script>");
            }
            reader.Close();

            if (Session["UserId"] != null)
            {
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
                }


                con.Close();
            }

            if (!string.IsNullOrEmpty(selectedShowTime))
            {
                pnlBooking.Visible = true;
                lblShowTime.Text = ddlMovieTime.SelectedItem.Text;

                // Ensure that the seatMap panel is visible
                seatMap.Visible = true;


            }
            else
            {
                pnlBooking.Visible = false;
            }

            con.Close();
        }

        private DataTable GetSeatData(string showTMID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();
            DataTable seatData = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT SeatId, SeatNumber, IsAvailable FROM Seats WHERE ShowTimeId = @ShowTimeId", con);
            cmd.Parameters.AddWithValue("@ShowTimeId", showTMID);

            SqlDataReader reader = cmd.ExecuteReader();
            seatData.Load(reader);

            con.Close();
            return seatData;
        }



        protected void SeatDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if (e.CommandName == "SelectSeat")
            {

                if (Session["UserId"] == null)
                {
                    Response.Write(@"
                <script>
                alert('Login An Account To Continue');
                window.location = '/LoginRegister.aspx';
                </script>");



                }
                else
                {

                    string seatId = e.CommandArgument.ToString();
                    DateTime currentDateTime = DateTime.Now;

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
                            Session["bookingid"] = bookingid;
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
                        Session["bookingid"] = bookingid;
                        string strInsert = "INSERT INTO Booking (BookingId, UserId, ShowTimeId, BookingDate) VALUES (@BookingId, @UserId, @ShowTimeId, @BookingDate)";
                        SqlCommand cmdAdd = new SqlCommand(strInsert, con);
                        cmdAdd.Parameters.AddWithValue("@BookingId", bookingid);
                        cmdAdd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                        cmdAdd.Parameters.AddWithValue("@ShowTimeId", Session["selectedSTID"].ToString());
                        cmdAdd.Parameters.AddWithValue("@BookingDate", currentDateTime);
                        cmdAdd.ExecuteNonQuery();



                    }
                    String nextBookingSeatId = Guid.NewGuid().ToString();
                    string strInsert2 = "INSERT INTO BookingSeat (BookingSeatId, BookingId, SeatId) VALUES (@BookingSeatId, @BookingId, @SeatId)";
                    SqlCommand cmdAddSeat = new SqlCommand(strInsert2, con);
                    cmdAddSeat.Parameters.AddWithValue("@BookingSeatId", nextBookingSeatId);
                    cmdAddSeat.Parameters.AddWithValue("@BookingId", bookingid);
                    cmdAddSeat.Parameters.AddWithValue("@SeatId", seatId);
                    cmdAddSeat.ExecuteNonQuery();

                    /*                    Button seatButton = e.Item.FindControl("SeatButton") as Button;
                                        seatButton.CssClass = "seat-selected";*/


                    string strUpdate = "UPDATE Seats SET IsAvailable = @IsAvailable WHERE SeatID = @SeatID AND ShowTimeId = @ShowTimeId";
                    SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
                    cmdUpdate.Parameters.AddWithValue("@IsAvailable", false);
                    cmdUpdate.Parameters.AddWithValue("@SeatID", seatId);
                    cmdUpdate.Parameters.AddWithValue("@ShowTimeId", Session["selectedSTID"].ToString());
                    cmdUpdate.ExecuteNonQuery();


                    int n = cmdUpdate.ExecuteNonQuery();

                    if (n > 0)
                    {
                        Response.Write(@"<script>
                         alert('Seats booked: ' + seatId);
                            window.location = 'BookingMovie.aspx';
                            </script>");
                    }
                    else
                    {
                        Response.Write(@"<script>
                            alert('Something wrong. Please try again.');
                                window.location = 'BookingMovie.aspx';
                                </script>");
                    }

                    BindSeatData();
                    con.Close();



                }

            }

        }


        private void BindSeatData()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();
            SqlCommand command = con.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT SeatID, SeatNumber, IsAvailable FROM Seats WHERE ShowTimeId = @ShowTimeId";
            command.Parameters.AddWithValue("@ShowTimeId", Session["selectedSTID"]);
            DataTable table = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(table);
            SeatDataList.DataSource = table;
            SeatDataList.DataBind();
            con.Close();
        }

        protected void btnConfirmSeat_Click(object sender, EventArgs e)
        {

            Response.Redirect("FnB.aspx");

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