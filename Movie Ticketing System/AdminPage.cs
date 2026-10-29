using System;

namespace Movie_Ticketing_System
{
    // Admin pages inherit from this, so only a logged-in admin can open them
    public class AdminPage : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            if (Session["Role"] as string != "Admin")
            {
                Response.Redirect("~/LoginRegister.aspx");
            }
            base.OnInit(e);
        }
    }
}
