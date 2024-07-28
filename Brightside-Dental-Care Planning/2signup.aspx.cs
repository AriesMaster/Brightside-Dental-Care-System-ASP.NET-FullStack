using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("1login.aspx");
        }
    }
}