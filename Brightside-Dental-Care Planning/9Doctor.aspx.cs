using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("18EditDoctor.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind(); // Rebind the GridView to show the dropdown
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Find the dropdown control for AppointmentStatus in the edit row
            DropDownList ddlStatus = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlAppointmentStatus");

            // Update the SqlDataSource parameters
            SqlDataSource1.UpdateParameters["AppointmentStatus"].DefaultValue = ddlStatus.SelectedValue;
            SqlDataSource1.UpdateParameters["Booking_Id"].DefaultValue = GridView1.DataKeys[e.RowIndex].Value.ToString();

            // Perform the update
            SqlDataSource1.Update();

            // Exit edit mode and rebind
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

    }
}