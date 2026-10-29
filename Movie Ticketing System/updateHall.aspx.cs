using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Movie_Ticketing_System
{
    public partial class updateHall : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["updateId"] != null && !IsPostBack)
            {

                con.Open();
                string strSelect = "Select * From MovieHall Where MovieHallId=@Id";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Id", Session["updateId"].ToString());
                SqlDataReader dtrHall = cmdSelect.ExecuteReader();
                while (dtrHall.Read())
                {
                    if (dtrHall["MovieHallId"].Equals(Session["updateId"].ToString()))
                    {
                        txtId.Text = dtrHall["MovieHallId"].ToString();
                        txtName.Text = dtrHall["Name"].ToString();
                        txtLocation.Text = dtrHall["Location"].ToString();
                    }
                }
                con.Close();
            }
            if (Session["updateId"] == null)
            {
                Session["Emsg"] = "Please try again. Hall not found.";
                Response.Redirect("~/maintainHall.aspx");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Open();
            string strUpdate = "UPDATE MovieHall SET Name=@Name, Location=@Location WHERE MovieHallId=@MovieHallId";
            SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
            cmdUpdate.Parameters.AddWithValue("@MovieHallId", txtId.Text);
            cmdUpdate.Parameters.AddWithValue("@Name", txtName.Text);
            cmdUpdate.Parameters.AddWithValue("@Location", txtLocation.Text);


            int n = cmdUpdate.ExecuteNonQuery();
            if (n > 0)
            {
                con.Close();
                Session["msg"] = txtId.Text + "'s record is updated";
                Response.Redirect("~/MaintainHall.aspx");

            }
            else
            {
                con.Close();
                Session["Emsg"] = "Ops! Unable to update record for " + txtId.Text;
                Response.Redirect("~MaintainHall.aspx");
            }
        }
        protected void txtId_TextChanged(object sender, EventArgs e)
        {

        }

    }
}