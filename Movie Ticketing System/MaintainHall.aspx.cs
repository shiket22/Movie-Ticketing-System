using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Movie_Ticketing_System
{
    public partial class MaintainHall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGridView();
            }

            if (Session["SuccessMessage"] != null)
            {
                lblMsg.Text = Session["SuccessMessage"].ToString();
                Session.Remove("SuccessMessage");
            }
            else
            {
                lblMsg.Text = " ";
            }
            if (Session["ErrorMessage"] != null)
            {
                lblEMsg.Text = Session["ErrorMessage"].ToString();
                Session.Remove("ErrorMessage");
            }
            else
            {
                lblEMsg.Text = " ";
            }
            int recordNum = 0;

            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                recordNum++;
            }
            if (recordNum == 0)
            {
                lblNoRecord.Text = "No Record Found";
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
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");
            con.Open();

            string strDelete = "Delete From MovieHall Where MovieHallId=@MovieHallId";
            SqlCommand cmdDelete2 = new SqlCommand(strDelete, con);
            cmdDelete2.Parameters.AddWithValue("@MovieHallId", MovieHallId);
            int n = cmdDelete2.ExecuteNonQuery();



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