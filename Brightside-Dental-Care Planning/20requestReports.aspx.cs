using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load initial report
                LoadPatientAppointmentsSummary();
            }
        }

        private void LoadPatientAppointmentsSummary()
        {
            string query = @"
                SELECT p.Patient_Id, 
                       pr.first_name + ' ' + pr.last_name AS PatientName,
                       COUNT(a.Booking_Id) AS TotalAppointments, 
                       SUM(CASE WHEN a.Status = 'Completed' THEN 1 ELSE 0 END) AS CompletedAppointments
                FROM Patient p
                LEFT JOIN Profile pr ON p.Patient_Id = pr.Patient_Id
                LEFT JOIN Appointment a ON p.Patient_Id = a.Patient_Id
                GROUP BY p.Patient_Id, pr.first_name, pr.last_name
                ORDER BY TotalAppointments DESC";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewPatientAppointments.DataSource = dt;
                GridViewPatientAppointments.DataBind();
            }
        }

        protected void ButtonGenerateReport_Click(object sender, EventArgs e)
        {
            DateTime startDate;
            DateTime endDate;

            if (DateTime.TryParse(StartDate.Text, out startDate) && DateTime.TryParse(EndDate.Text, out endDate))
            {
                LoadServicesUtilizedSummary(startDate, endDate);
            }
            else
            {
                // Handle invalid date input
                // You can show a message or set an error label
            }
        }

        private void LoadServicesUtilizedSummary(DateTime startDate, DateTime endDate)
        {
            string query = @"
                SELECT s.Service_Type_Id, s.Service_Name, 
                       COUNT(a.Booking_Id) AS TotalBookings, 
                       SUM(a.Cost) AS TotalRevenue
                FROM Service_Type s
                JOIN Appointment a ON s.Service_Type_Id = a.Service_Type_Id
                WHERE a.Booking_Date BETWEEN @StartDate AND @EndDate
                GROUP BY s.Service_Type_Id, s.Service_Name
                ORDER BY TotalRevenue DESC";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StartDate", startDate);
                cmd.Parameters.AddWithValue("@EndDate", endDate);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewServicesUtilized.DataSource = dt;
                GridViewServicesUtilized.DataBind();
            }
        }
    }
}
