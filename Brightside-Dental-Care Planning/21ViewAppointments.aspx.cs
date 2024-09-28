using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the Patient_Id from session
                if (Session["Patient_Id"] != null)
                {
                    int patientId = Convert.ToInt32(Session["Patient_Id"]);
                    SqlDataSource1.SelectParameters["PatientId"].DefaultValue = patientId.ToString();
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                    // Check if there are any appointments
                    if (dv.Count > 0)
                    {
                        GridView1.DataSource = dv;
                        GridView1.DataBind();
                        GridView1.Visible = true; // Show the GridView
                        NoAppointmentsLabel.Visible = false; // Hide the no appointments message
                    }
                    else
                    {
                        GridView1.Visible = false; // Hide the GridView
                        NoAppointmentsLabel.Text = "You don't have any appointments yet.";
                        NoAppointmentsLabel.Visible = true; // Show the no appointments message
                    }
                }
                else
                {
                    // If no Patient_Id found in session, redirect to login
                    Response.Redirect("1login.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Logic to navigate to appointment creation page
            Response.Redirect("11profileview.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Logic to view profile details
            Response.Redirect("5Appointment.aspx");
        }
    }
}
