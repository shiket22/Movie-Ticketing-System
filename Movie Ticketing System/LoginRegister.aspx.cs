using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Collections;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.Services;

namespace Movie_Ticketing_System
{
    public partial class LoginRegister : System.Web.UI.Page
    {

        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["logout"] != null)
            {
                Session.Clear();
                Response.Redirect("LoginRegister.aspx");
            }

            if (Session["UserId"] != null)
            {
                Response.Redirect("UserProfile.aspx");
            }
            else if (Session["Role"] as string == "Admin")
            {
                Response.Redirect("~/MaintainHall.aspx");
            }
        }

        protected void SigInBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();

                string strSelect = "SELECT UserId, Role, Password FROM [User] WHERE Email = @Email";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Email", txtEmailLogin.Text);

                SqlDataReader reader = cmdSelect.ExecuteReader();
                if (reader.Read() && PasswordHasher.Verify(txtPasswordLogin.Text, reader["Password"].ToString()))
                {
                    string userIdStr = reader["UserId"].ToString();
                    string userRole = reader["Role"].ToString();

                    if (userRole == "Customer")
                    {
                        Session["UserId"] = userIdStr;
                        Response.Redirect("Home.aspx");
                    }
                    else if (userRole == "Admin")
                    {
                        Session["Role"] = "Admin";
                        Response.Redirect("~/MaintainHall.aspx");
                    }
                }
                else
                {
                    if (IsEmailRegistered(txtEmailLogin.Text) == false)
                    {
                        LoginEmailValidator.IsValid = false;
                    }
                    else
                    {
                        LoginPasswordValidator.IsValid = false;
                    }
                }
            }
        }

        protected void SignUpBtn_Click1(object sender, EventArgs e)
        {


            if (IsPhoneNumRegistered(txtPhoneNumber.Text))
            {
                // Phone number is already registered, display error message
                PhoneNumCustomValidator.IsValid = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "phoneNumError", "alert('Phone number is already registered.');", true);

                return; // Prevent further processing
            }
            if (IsEmailRegistered(txtEmail.Text))
            {
                // Email address is already registered, display error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "emailError", "alert('Email address is already registered.');", true);
                EmailCustomValidator.IsValid = false;

                return;
            }



            con = new SqlConnection(strCon);
            con.Open();


            string strSelect = "SELECT COUNT(*) FROM [User]";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.ExecuteScalar();


            String nextUserId = Guid.NewGuid().ToString();


            String insertQuery = "INSERT INTO [User] VALUES(@UserId, @UserName, @Password, @Email, @PhoneNum, @Role)";
            string role = "Customer";

            SqlCommand cmd = new SqlCommand(insertQuery, con);
            cmd.Parameters.AddWithValue("@UserId", nextUserId);
            cmd.Parameters.AddWithValue("@UserName", txtFullName.Text);
            cmd.Parameters.AddWithValue("@PhoneNum", txtPhoneNumber.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", PasswordHasher.Hash(txtRegisterPassword.Text));
  
            cmd.Parameters.AddWithValue("@Role", role);
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write(@"
                <script>
                alert('Account Successfuly Registered!');
                window.location = '/LoginRegister.aspx';
                </script>");

                con.Close();
            }
            else
            {
                Response.Write(@"
                <script>
                alert('Something wrong!');
                </script>");

                con.Close();
            }
        }


        private bool IsEmailRegistered(string email)
        {
            bool emailRegistered = false;
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();
                string strSelect = "SELECT COUNT(*) FROM [User] WHERE Email = @Email";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Email", email);
                int count = (int)cmdSelect.ExecuteScalar();
                emailRegistered = count > 0;
            }
            return emailRegistered;
        }
        private bool IsPhoneNumRegistered(string phoneNum)
        {
            bool phoneNumRegistered = false;
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();
                string strSelect = "SELECT COUNT(*) FROM [User] WHERE PhoneNum = @PhoneNum";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@PhoneNum", phoneNum);
                int count = (int)cmdSelect.ExecuteScalar();
                phoneNumRegistered = count > 0;
            }
            return phoneNumRegistered;
        }

    }
}