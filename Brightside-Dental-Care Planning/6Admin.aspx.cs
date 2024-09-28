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
        }

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

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Set the row index to be edited
            GridView1.EditIndex = e.NewEditIndex;

            // Rebind the data to the GridView to reflect the edit mode
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Reset the edit index to -1 to cancel edit mode
            GridView1.EditIndex = -1;

            // Rebind the data to the GridView
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Retrieve the Patient_Id from the GridView
                int patientId = (int)GridView1.DataKeys[e.RowIndex].Value;

                // Get the new values from the GridView
                string email = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBoxEmail")).Text;
                string password = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBoxPassword")).Text;

                // Validate email and password
                if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
                {
                    throw new Exception("Email and password cannot be empty.");
                }

                // Create SQL update query
                string updateQuery = "UPDATE Patient SET email = @Email, password = @Password WHERE Patient_Id = @PatientId";

                using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
                {
                    conn.Open();

                    // Update the patient record
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@PatientId", patientId);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Optionally show success message in session or similar for the admin page
                Session["SuccessMessage"] = "Patient record updated successfully.";

                // Redirect to the admin page after update
                Response.Redirect("6Admin.aspx"); // Update this with your actual admin page URL
            }
            catch (SqlException sqlEx)
            {
                // Log and show SQL exception details
                DeleteSuccessMessage.Text = "SQL Error: " + sqlEx.Message;
                DeleteSuccessMessage.Visible = true;
            }
            catch (Exception ex)
            {
                // Log and show generic exception details
                DeleteSuccessMessage.Text = "Error: " + ex.Message;
                DeleteSuccessMessage.Visible = true;
            }
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
            // Retrieve the Admin_Id from the GridView
            int adminId = (int)GridView7.DataKeys[e.RowIndex].Value;

            // SQL delete query for the admin record
            string deleteAdminQuery = "DELETE FROM Admin WHERE Admin_Id = @AdminId";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                conn.Open();

                // Delete the admin record
                using (SqlCommand cmd = new SqlCommand(deleteAdminQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@AdminId", adminId);
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            // Rebind the GridView to refresh the data
            GridView7.DataBind();

            // Show success message for admin deletion
            DeleteSuccessMessageAdmins.Text = "You have successfully removed the admin record.";
            DeleteSuccessMessageAdmins.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("20requestReports.aspx");
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("22AddDoctor.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("23AddAdmin.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("24AddServiceTypes.aspx");
        }
    }
}
