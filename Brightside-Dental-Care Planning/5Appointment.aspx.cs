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
            if (Session["AppointmentMade"] != null && (bool)Session["AppointmentMade"])
            {
                StatusLabel.Text = "You already made an appointment. Call the admin to delete or edit your appointment.";
                AppointmentPanel.Visible = false; // Hide the appointment form
            }
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

            // Check if appointment is already made
            if (Session["AppointmentMade"] != null && (bool)Session["AppointmentMade"])
            {
                ErrorLabel.Text = "You already made an appointment. Call the admin to delete or edit your appointment.";
                return;
            }

            string serviceType = ServiceType.SelectedValue;
            DateTime bookingDate;

            // Validate booking date
            if (!DateTime.TryParse(AppointmentDate.Text, out bookingDate))
            {
                ErrorLabel.Text = "Please enter a valid appointment date.";
                return;
            }

            string additionalInfo = AdditionalInfo.Text;

            // Retrieve first and last names from session
            string firstName = Session["FirstName"] != null ? Session["FirstName"].ToString() : string.Empty;
            string lastName = Session["LastName"] != null ? Session["LastName"].ToString() : string.Empty;

            // Save the appointment to the database
            bool appointmentSaved = SaveAppointment(patientId, serviceType, bookingDate, additionalInfo, firstName, lastName);

            if (appointmentSaved)
            {
                Session["AppointmentMade"] = true; // Set session variable to indicate appointment is made
                StatusLabel.Text = "Appointment made successfully!"; // Display success message
                StatusLabel.Visible = true; // Ensure status label is visible
                AppointmentPanel.Visible = true; // Hide the appointment form
            }
            else
            {
                ErrorLabel.Text = "Error making appointment. Please try again.";
            }
        }


        private bool SaveAppointment(int patientId, string serviceType, DateTime bookingDate, string additionalInfo, string firstName, string lastName)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = @"INSERT INTO Appointment (Patient_Id, Service_Type_Id, Booking_Date, Additional_Info, Service_name, Patient_FirstName, Patient_LastName)
                     VALUES (@PatientId, @ServiceTypeId, @BookingDate, @AdditionalInfo, @ServiceName, @FirstName, @LastName)";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@PatientId", patientId);
                        command.Parameters.AddWithValue("@ServiceTypeId", GetServiceTypeId(serviceType));
                        command.Parameters.AddWithValue("@BookingDate", bookingDate);
                        command.Parameters.AddWithValue("@AdditionalInfo", additionalInfo);
                        command.Parameters.AddWithValue("@ServiceName", serviceType);
                        command.Parameters.AddWithValue("@FirstName", firstName); // Use retrieved first name
                        command.Parameters.AddWithValue("@LastName", lastName); // Use retrieved last name

                        command.ExecuteNonQuery();
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                // Log the error
                Console.WriteLine(ex.Message);
                return false;
            }
        }


        private int GetServiceTypeId(string serviceName)
        {
            // Here you would typically query the database to get the Service_Type_Id based on the serviceName.
            // For the sake of this example, we'll return dummy IDs.
            return serviceName == "Consultation" ? 1 : 2; // Assuming 1 is for Consultation and 2 is for Cleaning
        }

        protected void ServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
