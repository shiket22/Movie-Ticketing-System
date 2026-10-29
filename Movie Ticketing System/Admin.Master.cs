using System;
using System.IO;
using System.Web.UI.HtmlControls;

namespace Movie_Ticketing_System
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Highlight the sidebar link for the section the current page belongs to
            string page = Path.GetFileNameWithoutExtension(Request.Path).ToLowerInvariant();
            HtmlAnchor active;
            if (page.Contains("hall") || page == "updates")
            {
                active = navHalls;
            }
            else if (page.Contains("showtime"))
            {
                active = navShowTimes;
            }
            else
            {
                active = navMovies;
            }
            active.Attributes["class"] = "active";
        }
    }
}
