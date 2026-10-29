using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Movie_Ticketing_System
{
    public partial class MaintainHall : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGridView();
            }

            if (Session["msg"] != null)
            {
                lblMsg.Text = Session["msg"].ToString();
                Session["msg"] = null;
            }
            else
            {
                lblMsg.Text = "";
            }
            if (Session["Emsg"] != null)
            {
                lblEMsg.Text = Session["Emsg"].ToString();
                Session["Emsg"] = null;
            }
            else
            {
                lblEMsg.Text = "";
            }
            int recordNum = 0;

            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                recordNum++;
            }
            if (recordNum == 0)
            {
                lblNoRecord.Text = "No halls yet.";
            }
            else
            {
                lblNoRecord.Text = "";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
        protected void btnAll_Click(object sender, EventArgs e)
        {

        }
        protected void cmdUpdate_Click(object sender, ImageClickEventArgs e)
        {
            {
                ImageButton btn = (ImageButton)sender;
                string movieHallId = btn.CommandArgument;
                Session["updateId"] = movieHallId;
                Response.Redirect("~/UpdateHall.aspx?movieHallId=" + movieHallId);
            }
        }
        protected void cmdDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton cmdDelete = sender as ImageButton;
            String MovieHallId = cmdDelete.Attributes["MovieHallID"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string strDelete = "Delete From MovieHall Where MovieHallId=@MovieHallId";
            SqlCommand cmdDelete2 = new SqlCommand(strDelete, con);
            cmdDelete2.Parameters.AddWithValue("@MovieHallId", MovieHallId);
            int n;
            try
            {
                n = cmdDelete2.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                // The hall still has seats or show times pointing at it
                Session["Emsg"] = "Hall " + MovieHallId + " has seats or show times, so it can't be deleted.";
                con.Close();
                Response.Redirect("~/MaintainHall.aspx");
                return;
            }



            if (n > 0)
            {
                Session["msg"] = "Record for " + MovieHallId + " is deleted. ";
                con.Close();
                Response.Redirect("~/MaintainHall.aspx");
            }
            else
            {
                Session["Emsg"] = "Ops! Unable to delete record for " + MovieHallId;
                con.Close();
                Response.Redirect("~/MaintainHall.aspx");
            }
        }




        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BindGridView()
        {
            // Use the SqlDataSource to bind the GridView with data
            GridView1.DataBind();
        }
    }
}