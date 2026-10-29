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
    public partial class MaintainMovie : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
            }
            if (Session["msg"] != null)
            {
                lblMsg.Text = Session["msg"].ToString();
                Session["msg"] = null;
            }
            else
            {
                lblMsg.Text = " ";
            }
            if (Session["Emsg"] != null)
            {
                lblEMsg.Text = Session["Emsg"].ToString();
                Session["Emsg"] = null;
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
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (txtSearch.Text.Equals(""))
            {
                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = SqlDataSource2;
                GridView1.DataBind();
            }

            Page_Load(sender, e);
        }
        protected void btnAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("/maintainMovie.aspx");
        }
        protected void cmdUpdate_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton cmdUpdate = sender as ImageButton;
            String Id = cmdUpdate.Attributes["MovieID"].ToString();
            Session["updateId"] = Id;
            Response.Redirect("~/UpdateMovie.aspx");
        }
        protected void cmdDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton cmdDelete = sender as ImageButton;
            String Id = cmdDelete.Attributes["MovieID"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string strDelete = "Delete From Movie Where Id=@Id";
            SqlCommand cmdDelete2 = new SqlCommand(strDelete, con);
            cmdDelete2.Parameters.AddWithValue("@Id", Id);
            int n = cmdDelete2.ExecuteNonQuery();



            if (n > 0)
            {
                Session["msg"] = "Record for " + Id + " is deleted. ";
                con.Close();
                Response.Redirect("~/MaintainMovie.aspx");
            }
            else
            {
                Session["Emsg"] = "Ops! Unable to delete record for " + Id;
                con.Close();
                Response.Redirect("~/MaintainMovie.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}