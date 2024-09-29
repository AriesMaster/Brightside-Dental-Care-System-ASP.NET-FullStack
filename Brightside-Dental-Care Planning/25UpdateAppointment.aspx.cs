using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if Booking_Id is present in the query string
                if (Request.QueryString["Booking_Id"] != null)
                {
                    int bookingId = int.Parse(Request.QueryString["Booking_Id"]);
                    LoadAppointmentData(bookingId);
                }
            }
        }

        private void LoadAppointmentData(int bookingId)
        {
            // Fetch appointment data from the database
            string query = "SELECT * FROM Appointment WHERE Booking_Id = @BookingId";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@BookingId", bookingId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Populate fields with existing data
                        BookingDateTextBox.Text = reader["Booking_Date"].ToString();
                        AdditionalInfoTextBox.Text = reader["Additional_Info"].ToString();
                        ServiceNameTextBox.Text = reader["Service_name"].ToString();
                        PatientFirstNameTextBox.Text = reader["Patient_FirstName"].ToString();
                        PatientLastNameTextBox.Text = reader["Patient_LastName"].ToString();
                        PriceTextBox.Text = reader["Price"].ToString();
                        AppointmentStatusTextBox.Text = reader["AppointmentStatus"].ToString();
                    }
                    reader.Close();
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            // Update the appointment in the database
            if (Request.QueryString["Booking_Id"] != null)
            {
                int bookingId = int.Parse(Request.QueryString["Booking_Id"]);

                // Attempt to parse the price
                decimal price;
                if (!decimal.TryParse(PriceTextBox.Text, out price))
                {
                    MessageLabel.Text = "Please enter a valid price.";
                    MessageLabel.ForeColor = System.Drawing.Color.Red; // Change the color for error messages
                    MessageLabel.Visible = true;
                    return; // Exit the method if price parsing fails
                }

                string updateQuery = "UPDATE Appointment SET Booking_Date = @BookingDate, Additional_Info = @AdditionalInfo, " +
                                     "Service_name = @ServiceName, Patient_FirstName = @PatientFirstName, " +
                                     "Patient_LastName = @PatientLastName, Price = @Price, AppointmentStatus = @AppointmentStatus " +
                                     "WHERE Booking_Id = @BookingId";

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@BookingDate", BookingDateTextBox.Text);
                        cmd.Parameters.AddWithValue("@AdditionalInfo", AdditionalInfoTextBox.Text);
                        cmd.Parameters.AddWithValue("@ServiceName", ServiceNameTextBox.Text);
                        cmd.Parameters.AddWithValue("@PatientFirstName", PatientFirstNameTextBox.Text);
                        cmd.Parameters.AddWithValue("@PatientLastName", PatientLastNameTextBox.Text);
                        cmd.Parameters.AddWithValue("@Price", price); // Use the parsed decimal value
                        cmd.Parameters.AddWithValue("@AppointmentStatus", AppointmentStatusTextBox.Text);
                        cmd.Parameters.AddWithValue("@BookingId", bookingId);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Show success message
                MessageLabel.Text = "Appointment updated successfully.";
                MessageLabel.ForeColor = System.Drawing.Color.Green; // Change color for success messages
                MessageLabel.Visible = true;
            }
        }


        protected void Backtoadmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("6Admin.aspx");
        }
    }
}
