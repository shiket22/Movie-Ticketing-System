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
    public partial class UpdateShowTime : AdminPage
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
                        txtShowTime.Text = dtrMovie["ShowTime"] == DBNull.Value ? "" : ((DateTime)dtrMovie["ShowTime"]).ToString("yyyy-MM-dd HH:mm");
                        // Selecting a value the list doesn't have throws, so add the saved hall first if needed
                        string hall = dtrMovie["Hall"].ToString();
                        if (hall != "" && hallList.Items.FindByValue(hall) == null)
                        {
                            hallList.Items.Add(hall);
                        }
                        if (hall != "")
                        {
                            hallList.SelectedValue = hall;
                        }


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
        protected void btnStaffEditSave_Click(object sender, EventArgs e)
        {
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
        }

        protected void txtStaffEditName_TextChanged(object sender, EventArgs e)
        {

        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Open();
            string strUpdate = "UPDATE Movie SET MovieName=@MovieName,ShowTime=@ShowTime,Hall=@Hall WHERE Id=@Id";
            SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
            cmdUpdate.Parameters.AddWithValue("@Id", txtId.Text);
            cmdUpdate.Parameters.AddWithValue("@MovieName", txtMovieName.Text);
            cmdUpdate.Parameters.AddWithValue("@ShowTime", txtShowTime.Text);
            cmdUpdate.Parameters.AddWithValue("@Hall", hallList.SelectedItem.Value.ToString());


            int n = cmdUpdate.ExecuteNonQuery();
            if (n > 0)
            {
                con.Close();
                Session["msg"] = txtMovieName.Text + "'s record is updated";
                Response.Redirect("~/MaintainShowTime.aspx");

            }
            else
            {
                con.Close();
                Session["Emsg"] = "Ops! Unable to update record for " + txtMovieName.Text;
                Response.Redirect("~MaintainShowTime.aspx");
            }
        }
    }
}

