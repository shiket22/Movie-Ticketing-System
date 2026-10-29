using System;
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
    public partial class searchResult : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["searchResult"]))
            {
                string searchTerm = Request.QueryString["searchResult"];

                    con.Open();
                    string query = "SELECT MovieName, Id, Movie FROM Movie WHERE MovieName LIKE @searchTerm";
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@searchTerm", "%" + searchTerm + "%");

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            DataTable dataTable = new DataTable();
                            dataTable.Load(reader);

                            movieListView.DataSource = dataTable;
                            movieListView.DataBind();
                        }
                    }
            }
            else
            {
                Response.Write(@"<script>
                        alert('Please do not leave it blank. Please try again.');
                        window.location = 'Home.aspx';
                        </script>");
            }
        }
    }
}