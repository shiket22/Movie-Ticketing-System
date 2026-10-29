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
    public partial class UserProfile : System.Web.UI.Page
    {
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Session["UserId"] != null)
                {

                    con = new SqlConnection(strCon);
                    con.Open();



                    string strSelect = "Select * From [User] where UserId = @UserId";
                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                    cmdSelect.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                    SqlDataReader dtrUser = cmdSelect.ExecuteReader();
                    while (dtrUser.Read())
                    {
                        if (dtrUser["UserId"].Equals(Session["UserId"].ToString()))
                        {
                            lblCusName.Text = dtrUser["UserName"].ToString();
                            txtFullName.Text = dtrUser["UserName"].ToString();
                            txtEmail.Text = dtrUser["Email"].ToString();
                            txtPhoneNumber.Text = dtrUser["PhoneNum"].ToString();
                        }
                    }

                    dtrUser.Close();





                    con.Close();

                }
                else
                {
                    Response.Redirect("LoginRegister.aspx");
                }
            }
        }

        protected void UpdateInfoBtn_Click(object sender, EventArgs e)
        {
            string oldEmail = string.Empty;
            string oldPhoneNum = string.Empty;

            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();

                string strSelect = "Select * From [User] where UserId = @UserId";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());

                using (SqlDataReader dtrUser = cmdSelect.ExecuteReader())
                {
                    while (dtrUser.Read())
                    {
                        if (dtrUser["UserId"].Equals(Session["UserId"].ToString()))
                        {
                            oldEmail = dtrUser["Email"].ToString();
                            oldPhoneNum = dtrUser["PhoneNum"].ToString();
                        }
                    }
                }

                // Check email and phone number validity
                if (IsEmailRegistered(txtEmail.Text) && oldEmail != txtEmail.Text)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "emailError", "alert('Email address is already registered.');", true);
                    EmailCustomValidator.IsValid = false;
                    return;
                }

                if (IsPhoneNumRegistered(txtPhoneNumber.Text) && oldPhoneNum != txtPhoneNumber.Text)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "phoneNumError", "alert('Phone number is already registered.');", true);
                    PhoneNumCustomValidator.IsValid = false;
                    return;
                }

                // Update user information
                string strUpdate = "UPDATE [User] SET UserName=@UserName, Email=@Email, PhoneNum=@PhoneNum WHERE UserId=@UserId";
                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
                cmdUpdate.Parameters.AddWithValue("@UserName", txtFullName.Text);
                cmdUpdate.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmdUpdate.Parameters.AddWithValue("@PhoneNum", txtPhoneNumber.Text);
                cmdUpdate.Parameters.AddWithValue("@UserId", Session["UserId"]);

                int n = cmdUpdate.ExecuteNonQuery();

                if (n > 0)
                {
                    Response.Write(@"
                <script>
                alert('Information Update Successful!');
                window.location = '/UserProfile.aspx';
                </script>");
                }
                else
                {
                    Response.Write(@"
                <script>
                alert('Nothing Change!');
                window.location = '/UserProfile.aspx';
                </script>");
                }
            }


        }

        protected void YesBtn_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Response.Write(@"
                        <script>
                        alert('Successfuly Log Out!');
                        window.location = '/Home.aspx';
                        </script>");


        }


        protected void ChangePasswordBtn_Click(object sender, EventArgs e)
        {
            string currentPassword = string.Empty;

            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "Select * From [User] where UserId = @UserId";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
            SqlDataReader dtrUser = cmdSelect.ExecuteReader();

            while (dtrUser.Read())
            {
                if (dtrUser["UserId"].Equals(Session["UserId"].ToString()))
                {
                    currentPassword = dtrUser["Password"].ToString();

                }

            }
            con.Close();


            if (!PasswordHasher.Verify(txtCurrentPassword.Text, currentPassword))
            {
                PasswardCustomValidator.IsValid = false;
            }
            else
            {
                con.Open();

                string strUpdate = "UPDATE [User] SET Password=@NewPassword WHERE UserId=@UserId";
                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
                cmdUpdate.Parameters.AddWithValue("@NewPassword", PasswordHasher.Hash(txtNewPassword.Text));
                cmdUpdate.Parameters.AddWithValue("@UserId", Session["UserId"]);

                int n = cmdUpdate.ExecuteNonQuery();

                if (n > 0)
                {
                    Response.Write(@"
                <script>
                alert('Password Update Successful!');
                window.location = '/UserProfile.aspx';
                </script>");
                }
                else
                {
                    Response.Write(@"
                <script>
                alert('Nothing Change!');
                window.location = '/UserProfile.aspx';
                </script>");
                }

            }



        }



        //protected void No_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("UserProfile.aspx");
        //}
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
                con.Close();

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
                con.Close();

            }
            return phoneNumRegistered;
        }

    }


}