using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticketing_System
{
    public partial class MovieTicketingSystem : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // The header shows one account link, depending on who is logged in
            if (Session["UserId"] != null)
            {
                accountLink.InnerText = "Profile";
                accountLink.HRef = "~/UserProfile.aspx";
            }
            else if (Session["Role"] as string == "Admin")
            {
                accountLink.InnerText = "Admin";
                accountLink.HRef = "~/MaintainHall.aspx";
            }
        }
    }
}