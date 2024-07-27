using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Brightside_Dental_Care_Planning
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any code you need to run on initial page load
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            // Here you would typically validate the user credentials.
            // For now, we'll assume the credentials are valid and redirect to the appointment page.

            // Redirect to the appointment page
            Response.Redirect("5Appointment.aspx");
        }
    }
}
