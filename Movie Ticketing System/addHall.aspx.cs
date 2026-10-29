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
    public partial class addHall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");

            {
                string query = "INSERT INTO MovieHall (MovieHallId, Name, Location) VALUES (@MovieHallId, @Name, @Location)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MovieHallId", txtHallId.Text);
                cmd.Parameters.AddWithValue("@Name", txtHallName.Text);
                cmd.Parameters.AddWithValue("@Location", txtLocation.Text);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    // Insert seats for the new hall
                    InsertSeats(txtHallId.Text);

                    // If insertion is successful, you can do something here, like showing a success message.
                    Response.Write("<script>alert('Hall added successfully');</script>");
                    Response.Redirect("MaintainHall.aspx");
                }
                else
                {
                    // If insertion fails, show an error message.
                    Response.Write("<script>alert('Failed to add Hall');</script>");
                }
            }
        }

        private void InsertSeats(string movieHallId)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");
            {
                con.Open();
                string maxSeatId = GetMaxSeatId();
                int startSequence = 1;
                if (!string.IsNullOrEmpty(maxSeatId))
                {
                    string[] parts = maxSeatId.Split('_');
                    if (parts.Length == 2 && int.TryParse(parts[1], out int maxSequence))
                    {
                        startSequence = maxSequence + 1;
                    }
                    else
                    {
                        // Handle the case where maxSeatId does not follow the expected format
                        // You can log an error message or throw an exception here
                        Console.WriteLine($"Warning: Invalid SeatId format '{maxSeatId}'. Generating sequential numbers starting from 1.");
                    }
                }

                for (int i = startSequence; i < startSequence + 50; i++)
                {
                    string seatNumber = $"S{i - startSequence + 1}";
                    string seatId = $"{movieHallId}_{i.ToString("D3")}";
                    string query = "INSERT INTO Seats (SeatID, MovieHallId, SeatNumber, IsAvailable) VALUES (@SeatId, @MovieHallId, @SeatNumber, @IsAvailable)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@SeatID", seatId);
                    cmd.Parameters.AddWithValue("@MovieHallId", movieHallId);
                    cmd.Parameters.AddWithValue("@SeatNumber", seatNumber);
                    cmd.Parameters.AddWithValue("@IsAvailable", 1);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private string GetMaxSeatId()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");
            {
                con.Open();
                string query = "SELECT MAX(SeatId) FROM Seats";
                SqlCommand cmd = new SqlCommand(query, con);
                object result = cmd.ExecuteScalar();
                return result?.ToString() ?? string.Empty;
            }
        }

    }
}