using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System.admin
{
    public partial class UpdateS : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["movieName"] != null)
                {
                    lblMovieName.Text = HttpUtility.UrlDecode(Request.QueryString["movieName"]);
                }
                BindSeatData();

            }
        }

        protected void ddlMovies_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedMovieTime = ddlMovieTime.SelectedValue;

            if (!string.IsNullOrEmpty(selectedMovieTime))
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
        }
        private void BindSeatData()
        {
            con.Open();
            SqlCommand command = con.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT SeatID, SeatNumber, IsAvailable FROM Seats";
            DataTable table = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(table);
            SeatDataList.DataSource = table;
            SeatDataList.DataBind();
            con.Close();
        }

    }
}