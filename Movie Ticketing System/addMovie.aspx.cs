using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;


namespace Movie_Ticketing_System
{
    public partial class addMovie : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string strSelect = "Select Id From Movie";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            SqlDataReader dtrMovie = cmdSelect.ExecuteReader();

            while (dtrMovie.Read())
            {
                int num = Convert.ToInt32(dtrMovie[0]);
                num++;
                txtMovieId.Text = num.ToString();
            }
            con.Close();
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            con.Open();
            string strInsert = "Insert Into Movie Values(@Id,@Movie,@MovieName,@ReleaseDate,@Description,@DurationTime,@Genre,@Language,@Hall,@Price,@ShowTime)";
            SqlCommand cmdAdd = new SqlCommand(strInsert, con);
            cmdAdd.Parameters.AddWithValue("@Id", txtMovieId.Text);
            cmdAdd.Parameters.AddWithValue("@MovieName", txtMovieName.Text);
            cmdAdd.Parameters.AddWithValue("@ReleaseDate", txtReleaseDate.Text);
            cmdAdd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmdAdd.Parameters.AddWithValue("@DurationTime", txtDuration.Text);
            cmdAdd.Parameters.AddWithValue("@Genre", GenreList.SelectedItem.Value.ToString());
            cmdAdd.Parameters.AddWithValue("@Language", LanguageList.SelectedItem.Value.ToString());
            cmdAdd.Parameters.AddWithValue("@Hall", "");
            cmdAdd.Parameters.AddWithValue("@Price", "");
            cmdAdd.Parameters.AddWithValue("@ShowTime", "");



            string strSelect = "Select * From Movie";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            SqlDataReader dtrMovie = cmdSelect.ExecuteReader();
            int found = 0;
            while (dtrMovie.Read())
            {
                if (dtrMovie["Movie"].Equals("../images/" + image.PostedFile.FileName))
                {
                    found++;
                }
                if (dtrMovie["Movie"].ToString().Equals("../images/" + found + image.PostedFile.FileName))
                {
                    found++;
                }
            }
            dtrMovie.Close();

            if (found == 0)
            {
                cmdAdd.Parameters.AddWithValue("@Movie", "../images/" + image.PostedFile.FileName);
            }
            else
            {
                cmdAdd.Parameters.AddWithValue("@Movie", "../images/" + found + image.PostedFile.FileName);
            }

            int n = cmdAdd.ExecuteNonQuery();
            if (n > 0)
            {
                var path = Server.MapPath("~/images/");
                var directory = new DirectoryInfo(path);

                if (directory.Exists == false)
                {
                    directory.Create();
                }

                if (found == 0)
                {
                    var file = Path.Combine(path, image.PostedFile.FileName);
                    image.SaveAs(file);
                }
                else
                {
                    var file = Path.Combine(path, found + image.PostedFile.FileName);
                    image.SaveAs(file);
                }

                Session["msg"] = "Record for" + txtMovieName.Text + " is added";
                con.Close();
                Response.Redirect("~/MaintainMovie.aspx");

            }
            else
            {
                Session["Emsg"] = "Ops! Unable to add record for " + txtMovieId.Text;
                con.Close();
                Response.Redirect("~/MaintainHall.aspx");
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            image.PostedFile.InputStream.Dispose();
        }

    }
}
