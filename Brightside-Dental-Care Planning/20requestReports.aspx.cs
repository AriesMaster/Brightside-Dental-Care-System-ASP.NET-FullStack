using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReportGrid();
            }
        }

        protected void FilterButton_Click(object sender, EventArgs e)
        {
            BindReportGrid();
        }

        protected void DetailedFilterButton_Click(object sender, EventArgs e)
        {
            BindDetailedReportGrid();
        }

        private void BindReportGrid()
        {
            string startDate = StartDate.Text;
            string endDate = EndDate.Text;

            // SQL query to get summarized report data
            string query = @"
                SELECT 
                    st.Service_name,
                    COUNT(a.Booking_Id) AS TotalAppointments,
                    SUM(a.Price) AS TotalRevenue,
                    CAST(GETDATE() AS DATE) AS ReportDate
                FROM 
                    Appointment a
                INNER JOIN 
                    Service_Type st ON a.Service_Type_Id = st.Service_Type_Id
                WHERE 
                    a.Booking_Date BETWEEN @StartDate AND @EndDate
                GROUP BY 
                    st.Service_name";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        ReportGridView.DataSource = dt;
                        ReportGridView.DataBind();
                        NoRecordsLabel.Visible = false; // Hide no records message
                    }
                    else
                    {
                        // Show message if no records found
                        NoRecordsLabel.Text = "No records found for the selected date range.";
                        NoRecordsLabel.Visible = true;
                        ReportGridView.DataSource = null; // Clear the grid view
                        ReportGridView.DataBind(); // Rebind to refresh the grid view
                    }
                }
            }
        }

        private void BindDetailedReportGrid()
        {
            string startDate = DetailedStartDate.Text;
            string endDate = DetailedEndDate.Text;

            // SQL query to get detailed report data
            string query = @"
                SELECT 
                    a.Booking_Id,
                    p.first_name AS Patient_FirstName,
                    p.last_name AS Patient_LastName,
                    st.Service_name,
                    a.Booking_Date,
                    a.Price
                FROM 
                    Appointment a
                INNER JOIN 
                    Profile p ON a.Patient_Id = p.Patient_Id
                INNER JOIN 
                    Service_Type st ON a.Service_Type_Id = st.Service_Type_Id
                WHERE 
                    a.Booking_Date BETWEEN @StartDate AND @EndDate";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        DetailedReportGridView.DataSource = dt;
                        DetailedReportGridView.DataBind();
                        DetailedNoRecordsLabel.Visible = false; // Hide no records message
                    }
                    else
                    {
                        // Show message if no records found
                        DetailedNoRecordsLabel.Text = "No detailed records found for the selected date range.";
                        DetailedNoRecordsLabel.Visible = true;
                        DetailedReportGridView.DataSource = null; // Clear the grid view
                        DetailedReportGridView.DataBind(); // Rebind to refresh the grid view
                    }
                }
            }
        }
    }
}
