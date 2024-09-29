using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initial Page Load Logic
            if (!IsPostBack)
            {
                // Optionally set default dates or any initialization logic
                TextBoxStartDate.Text = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd"); // One month ago
                TextBoxEndDate.Text = DateTime.Now.ToString("yyyy-MM-dd"); // Today
            }
        }

        protected void ButtonGenerateReport_Click(object sender, EventArgs e)
        {
            // Get start and end dates
            DateTime startDate;
            DateTime endDate;

            if (DateTime.TryParse(TextBoxStartDate.Text, out startDate) && DateTime.TryParse(TextBoxEndDate.Text, out endDate))
            {
                // Generate report based on the date range
                GenerateReport(startDate, endDate);
            }
            else
            {
                LabelMessage.Text = "Please enter valid start and end dates.";
                LabelMessage.Visible = true;
            }
        }

        private void GenerateReport(DateTime startDate, DateTime endDate)
        {
            string query = @"
                SELECT 
                    d.first_name + ' ' + d.last_name AS DoctorName, 
                    COUNT(a.Booking_Id) AS TotalAppointments, 
                    SUM(s.Price) AS TotalRevenue
                FROM 
                    Appointment a
                INNER JOIN 
                    Doctor d ON a.Doctor_Id = d.Doctor_Id
                INNER JOIN 
                    Service_Type s ON a.Service_Type_Id = s.Service_Type_Id
                WHERE 
                    a.Appointment_Date BETWEEN @StartDate AND @EndDate
                GROUP BY 
                    d.first_name, d.last_name
                ORDER BY 
                    TotalRevenue DESC;";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridViewReports.DataSource = dt;
                        GridViewReports.DataBind();
                    }
                }
            }

            LabelMessage.Text = "Report generated successfully.";
            LabelMessage.Visible = true;
        }
    }
}
