using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System
{
    public partial class UpdateMovie : AdminPage
    {
        private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["updateId"] != null && !IsPostBack)
            {

                con.Open();
                string strSelect = "Select * From Movie Where Id=@Id";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Id", Session["updateId"].ToString());
                SqlDataReader dtrMovie = cmdSelect.ExecuteReader();
                while (dtrMovie.Read())
                {
                    if (dtrMovie["Id"].Equals(Session["updateId"].ToString()))
                    {
                        txtId.Text = dtrMovie["Id"].ToString();
                        img.ImageUrl = "../" + dtrMovie["Movie"].ToString();
                        txtMovieName.Text = dtrMovie["MovieName"].ToString();
                        txtDate.Text = dtrMovie["ReleaseDate"] == DBNull.Value ? "" : ((DateTime)dtrMovie["ReleaseDate"]).ToString("yyyy-MM-dd");
                        txtDescription.Text = dtrMovie["Description"].ToString();
                        txtTime.Text = dtrMovie["DurationTime"].ToString();
                        SelectOrAdd(GenreList, dtrMovie["Genre"].ToString());
                        SelectOrAdd(LanguageList, dtrMovie["Language"].ToString());



                    }
                }
                con.Close();
            }
            if (Session["updateId"] == null)
            {
                Session["Emsg"] = "Please try again. Movie not found.";
                Response.Redirect("~/maintainMovie.aspx");
            }


        }


        // Selects the movie's saved value, adding it first if the list doesn't have it (selecting a missing value throws)
        private static void SelectOrAdd(DropDownList list, string value)
        {
            if (list.Items.FindByValue(value) == null)
            {
                list.Items.Add(value);
            }
            list.SelectedValue = value;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Open();
            string strUpdate = "UPDATE Movie SET MovieName=@MovieName,ReleaseDate=@ReleaseDate, Description=@Description, DurationTime=@DurationTime,Genre=@Genre,Language=@Language, Movie=@Movie WHERE Id=@Id";
            SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
            cmdUpdate.Parameters.AddWithValue("@Id", txtId.Text);
            cmdUpdate.Parameters.AddWithValue("@MovieName", txtMovieName.Text);
            cmdUpdate.Parameters.AddWithValue("@ReleaseDate", txtDate.Text);
            cmdUpdate.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmdUpdate.Parameters.AddWithValue("@DurationTime", txtTime.Text);
            cmdUpdate.Parameters.AddWithValue("@Genre", GenreList.SelectedItem.Value.ToString());
            cmdUpdate.Parameters.AddWithValue("@Language", LanguageList.SelectedItem.Value.ToString());


            if (imgUpload.HasFile == true)
            {
                string strSelect = "Select * From Movie";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                SqlDataReader dtrMovie = cmdSelect.ExecuteReader();
                int found = 0;
                while (dtrMovie.Read())
                {
                    if (dtrMovie["Movie"].ToString().Equals("../images/" + imgUpload.PostedFile.FileName))
                    {
                        found++;
                    }
                    if (dtrMovie["Movie"].ToString().Equals("../images/" + found + imgUpload.PostedFile.FileName))
                    {
                        found++;
                    }
                }

                var path = Server.MapPath("~/images/");
                var directory = new DirectoryInfo(path);

                if (directory.Exists == false)
                {
                    directory.Create();
                }

                if (found == 0)
                {
                    var file = Path.Combine(path, imgUpload.PostedFile.FileName);
                    imgUpload.SaveAs(file);
                    cmdUpdate.Parameters.AddWithValue("@Movie", "../images/" + imgUpload.PostedFile.FileName);
                }
                else
                {
                    var file = Path.Combine(path, imgUpload.PostedFile.FileName + found);
                    imgUpload.SaveAs(file);
                    cmdUpdate.Parameters.AddWithValue("@Movie", "../images/" + found + imgUpload.PostedFile.FileName);
                }
                dtrMovie.Close();

            }
            else
            {
                cmdUpdate.Parameters.AddWithValue("@Movie", img.ImageUrl.ToString());

            }


            int n = cmdUpdate.ExecuteNonQuery();
            if (n > 0)
            {
                con.Close();
                Session["msg"] = txtMovieName.Text + "'s record is updated";
                Response.Redirect("~/MaintainMovie.aspx");

            }
            else
            {
                con.Close();
                Session["Emsg"] = "Ops! Unable to update record for " + txtMovieName.Text;
                Response.Redirect("~MaintainMovie.aspx");
            }
        }
    }
}