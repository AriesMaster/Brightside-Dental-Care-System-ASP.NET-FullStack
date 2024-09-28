using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Update the logic to show the appointment panel regardless of existing appointments
            AppointmentPanel.Visible = true;
        }

        protected void MakeAppointmentButton_Click(object sender, EventArgs e)
        {
            // Clear previous messages
            StatusLabel.Text = string.Empty;
            ErrorLabel.Text = string.Empty;

            if (Session["Patient_Id"] == null)
            {
                ErrorLabel.Text = "Patient ID not found in session.";
                return;
            }

            int patientId = Convert.ToInt32(Session["Patient_Id"]);

            // Validate booking date
            DateTime bookingDate;
            if (!DateTime.TryParse(AppointmentDate.Text, out bookingDate))
            {
                ErrorLabel.Text = "Please enter a valid appointment date.";
                return;
            }

            // Check if the selected date is a past date
            if (bookingDate < DateTime.Today)
            {
                ErrorLabel.Text = "Please select a date that is today or in the future.";
                return;
            }

            // Check if the selected date is a Sunday
            if (bookingDate.DayOfWeek == DayOfWeek.Sunday)
            {
                ErrorLabel.Text = "Appointments cannot be made on Sundays.";
                return;
            }

            // Check if the selected date is a Saturday
            if (bookingDate.DayOfWeek == DayOfWeek.Saturday)
            {
                ErrorLabel.Text = "Appointments cannot be made on Saturdays.";
                return;
            }

            string serviceType = ServiceType.SelectedValue;
            string additionalInfo = AdditionalInfo.Text;

            // Retrieve first and last names from session
            string firstName = Session["FirstName"] != null ? Session["FirstName"].ToString() : string.Empty;
            string lastName = Session["LastName"] != null ? Session["LastName"].ToString() : string.Empty;

            // Save the appointment to the database
            bool appointmentSaved = SaveAppointment(patientId, serviceType, bookingDate, additionalInfo, firstName, lastName);

            if (appointmentSaved)
            {
                StatusLabel.Text = "Appointment made successfully!<br/>You can now logout.<br/>Call the admin to delete or edit your appointment.<br/>0637968112"; // Display success message
                StatusLabel.Visible = true; // Ensure status label is visible
            }
            else
            {
                ErrorLabel.Text = "Error making appointment. Please try again.";
            }
        }




        private bool SaveAppointment(int patientId, string serviceType, DateTime bookingDate, string additionalInfo, string firstName, string lastName)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = @"INSERT INTO Appointment (Patient_Id, Service_Type_Id, Booking_Date, Additional_Info, Service_name, Patient_FirstName, Patient_LastName, Price)
                     VALUES (@PatientId, @ServiceTypeId, @BookingDate, @AdditionalInfo, @ServiceName, @FirstName, @LastName, @Price)";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@PatientId", patientId);
                        int serviceTypeId = GetServiceTypeId(serviceType);
                        command.Parameters.AddWithValue("@ServiceTypeId", serviceTypeId);

                        decimal price = GetServicePrice(serviceTypeId);
                        command.Parameters.AddWithValue("@Price", price);

                        command.Parameters.AddWithValue("@BookingDate", bookingDate);
                        command.Parameters.AddWithValue("@AdditionalInfo", additionalInfo);
                        command.Parameters.AddWithValue("@ServiceName", serviceType);
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@LastName", lastName);

                        command.ExecuteNonQuery();
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }

        private int GetServiceTypeId(string serviceName)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Service_Type_Id FROM Service_Type WHERE Service_name = @ServiceName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ServiceName", serviceName);

                    object result = command.ExecuteScalar();
                    return result != null ? (int)result : 0;
                }
            }
        }

        private decimal GetServicePrice(int serviceTypeId)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Price FROM Service_Type WHERE Service_Type_Id = @ServiceTypeId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ServiceTypeId", serviceTypeId);

                    object result = command.ExecuteScalar();
                    return result != null ? (decimal)result : 0.0m;
                }
            }
        }
        protected void BackToProfileButton_Click(object sender, EventArgs e)
        {
            // Redirect to profile view page
            Response.Redirect("~/11ProfileView.aspx");
        }


        protected void ServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
