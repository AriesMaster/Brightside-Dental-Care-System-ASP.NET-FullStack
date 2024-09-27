using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Make sure the message label is hidden on page load
            DeleteSuccessMessage.Visible = false;
            DeleteSuccessMessageProfile.Visible = false;
            DeleteSuccessMessageAddress.Visible = false; // New line for Address message
        }

        // Handle the deletion of a patient record from GridView1
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the Patient_Id from the GridView
            int patientId = (int)GridView1.DataKeys[e.RowIndex].Value;

            // Create SQL delete queries for related records and the patient
            string deleteAppointmentsQuery = "DELETE FROM Appointment WHERE Patient_Id = @PatientId";
            string deleteProfileQuery = "DELETE FROM Profile WHERE Patient_Id = @PatientId";
            string deleteAddressQuery = "DELETE FROM Address WHERE Patient_Id = @PatientId";
            string deletePatientQuery = "DELETE FROM Patient WHERE Patient_Id = @PatientId";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                conn.Open();

                // Delete related appointments
                using (SqlCommand cmd = new SqlCommand(deleteAppointmentsQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@PatientId", patientId);
                    cmd.ExecuteNonQuery();
                }

                // Delete related profiles
                using (SqlCommand cmd = new SqlCommand(deleteProfileQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@PatientId", patientId);
                    cmd.ExecuteNonQuery();
                }

                // Delete related addresses
                using (SqlCommand cmd = new SqlCommand(deleteAddressQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@PatientId", patientId);
                    cmd.ExecuteNonQuery();
                }

                // Delete patient record
                using (SqlCommand cmd = new SqlCommand(deletePatientQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@PatientId", patientId);
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            // Rebind the GridView to refresh the data
            GridView1.DataBind();

            // Show success message
            DeleteSuccessMessage.Text = "You have successfully removed the patient record along with associated data.";
            DeleteSuccessMessage.Visible = true;
        }

        // Handle the deletion of a profile record from GridView2
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the Profile_Id from the GridView
            int profileId = (int)GridView2.DataKeys[e.RowIndex].Value;

            // Create the SQL delete query
            string deleteQuery = "DELETE FROM Profile WHERE Profile_Id = @ProfileId";

            // Execute the delete query using SqlConnection and SqlCommand
            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@ProfileId", profileId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            // Rebind the GridView to refresh the data
            GridView2.DataBind();

            // Show success message for profile
            DeleteSuccessMessageProfile.Text = "You have successfully removed the profile record.";
            DeleteSuccessMessageProfile.Visible = true;
        }

        // Handle the deletion of an address record from GridView3
        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the Address_Id from the GridView
            int addressId = (int)GridView3.DataKeys[e.RowIndex].Value;

            // Create the SQL delete query
            string deleteQuery = "DELETE FROM Address WHERE Address_Id = @AddressId";

            // Execute the delete query using SqlConnection and SqlCommand
            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@AddressId", addressId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            // Rebind the GridView to refresh the data
            GridView3.DataBind();

            // Show success message for address
            DeleteSuccessMessageAddress.Text = "You have successfully removed the address record.";
            DeleteSuccessMessageAddress.Visible = true;
        }

        protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the Booking_Id from the GridView
            int bookingId = (int)GridView4.DataKeys[e.RowIndex].Value;

            // Create the SQL delete query
            string deleteQuery = "DELETE FROM Appointment WHERE Booking_Id = @BookingId";

            // Execute the delete query using SqlConnection and SqlCommand
            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@BookingId", bookingId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            // Rebind the GridView to refresh the data
            GridView4.DataBind();

            // Show success message for appointments
            DeleteSuccessMessageAppointments.Text = "You have successfully removed the appointment record.";
            DeleteSuccessMessageAppointments.Visible = true;
        }

        protected void GridView5_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the Service_Type_Id from the GridView
            int serviceTypeId = (int)GridView5.DataKeys[e.RowIndex].Value;

            // SQL delete query for the service type only
            string deleteServiceTypeQuery = "DELETE FROM Service_Type WHERE Service_Type_Id = @ServiceTypeId";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                conn.Open();

                // Delete the service type without affecting related appointments
                using (SqlCommand cmd = new SqlCommand(deleteServiceTypeQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@ServiceTypeId", serviceTypeId);
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            // Rebind the GridView to refresh the data
            GridView5.DataBind();

            // Show success message for Service Types
            DeleteSuccessMessageServiceTypes.Text = "You have successfully removed the service type record.";
            DeleteSuccessMessageServiceTypes.Visible = true;
        }



        protected void GridView6_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the Doctor_Id from the GridView
            int doctorId = (int)GridView6.DataKeys[e.RowIndex].Value;

            // SQL delete query for doctor record (no need to delete appointments based on Doctor_Id)
            string deleteDoctorQuery = "DELETE FROM Doctor WHERE Doctor_Id = @DoctorId";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                conn.Open();

                // Delete the doctor record
                using (SqlCommand cmd = new SqlCommand(deleteDoctorQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@DoctorId", doctorId);
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            // Rebind the GridView to refresh the data
            GridView6.DataBind();

            // Show success message for Doctor deletion
            DeleteSuccessMessageDoctors.Text = "You have successfully removed the doctor record.";
            DeleteSuccessMessageDoctors.Visible = true;
        }

        protected void GridView7_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Perform deletion and then show success message
            int adminId = Convert.ToInt32(GridView7.DataKeys[e.RowIndex].Value);
            // Code to delete the admin from the database can go here (handled by SqlDataSource)

            DeleteSuccessMessageAdmins.Text = "Admin deleted successfully!";
            DeleteSuccessMessageAdmins.Visible = true;

            // Optionally, you may want to rebind the GridView to reflect changes
            GridView7.DataBind();
        }



    }
}
