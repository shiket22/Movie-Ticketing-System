using System;
using System.IO;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System
{
    public partial class MovieComingSoon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMovies();
            }
        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MovieDetails.aspx");
        }

        protected void BindMovies()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT * FROM Movie WHERE ReleaseDate > @Today ORDER BY MovieName ASC", connection);
                command.Parameters.AddWithValue("@Today", DateTime.Today);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable moviesTable = new DataTable();

                connection.Open();
                adapter.Fill(moviesTable);

                Movie.DataSource = moviesTable;
                Movie.DataBind();
            }
        }
    }
}