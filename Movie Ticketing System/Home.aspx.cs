using System;
using System.IO;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");
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

        protected void cartBtn_Click(object sender, EventArgs e)
        {

        }

        protected void BindMovies()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\MovieTicketingSystem.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT TOP 3 * FROM Movie WHERE ReleaseDate <= @Today ORDER BY NEWID()", connection);
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