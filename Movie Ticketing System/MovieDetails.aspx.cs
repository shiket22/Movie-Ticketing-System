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
    public partial class MovieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if MovieID is passed in the query string
                if (Request.QueryString["MovieID"] != null)
                {
                    int movieID;
                    if (int.TryParse(Request.QueryString["MovieID"], out movieID))
                    {
                        // Load movie details from the database
                        LoadMovieDetails(movieID);
                    }
                    else
                    {
                        // Handle invalid MovieID
                        Response.Write(@"<script>
                        alert('Something wrong. Please try again.');
                        window.location = 'MovieDetails.aspx';
                        </script>");
                    }
                }
                else
                {
                    // Handle missing MovieID
                    Response.Write(@"<script>
                    alert('Something wrong. Please try again.');
                    window.location = 'MovieDetails.aspx';
                    </script>");
                }
            }
        }
        protected void cartBtn_Click(object sender, EventArgs e)
        {

        }
        private void LoadMovieDetails(int movieID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT * FROM Movie WHERE Id = @MovieID", connection);
                command.Parameters.AddWithValue("@MovieID", movieID);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    // Populate movie details
                    movieImage.ImageUrl = reader["Movie"].ToString();
                    lblMovieName.Text = reader["MovieName"].ToString();
                    lblDescription.Text = reader["Description"].ToString();
                    lblReleaseDate.Text = "Release Date: " + ((DateTime)reader["ReleaseDate"]).ToString("MMMM dd, yyyy");
                    lblDuration.Text = "Duration: " + reader["DurationTime"].ToString();
                    lblGenre.Text = "Genre: " + reader["Genre"].ToString();
                    lblLanguage.Text = "Language: " + reader["Language"].ToString();
                }
                else
                {
                    // Handle invalid MovieID
                    Response.Write(@"<script>
                    alert('Something wrong. Please try again.');
                    window.location = 'MovieDetails.aspx';
                    </script>");
                }
            }
        }
    }
}