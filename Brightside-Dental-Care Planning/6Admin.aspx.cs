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


        protected void GridView5_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Set the row index to be edited
            GridView5.EditIndex = e.NewEditIndex;

            // Rebind the data to reflect the edit mode
            GridView5.DataBind();
        }

        protected void GridView5_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Reset the edit index to cancel edit mode
            GridView5.EditIndex = -1;

            // Rebind the data to refresh the grid
            GridView5.DataBind();
        }

        protected void GridView5_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Retrieve the Service_Type_Id from the GridView's DataKeys
                int serviceTypeId = (int)GridView5.DataKeys[e.RowIndex].Value;

                // Get the new values from the GridView's EditItemTemplate controls
                string serviceName = ((TextBox)GridView5.Rows[e.RowIndex].FindControl("TextBoxServiceName")).Text;
                string serviceDesc = ((TextBox)GridView5.Rows[e.RowIndex].FindControl("TextBoxServiceDesc")).Text;

                // Validate input
                if (string.IsNullOrWhiteSpace(serviceName) || string.IsNullOrWhiteSpace(serviceDesc))
                {
                    throw new Exception("Service Name and Description cannot be empty.");
                }

                // Create SQL update query
                string updateQuery = "UPDATE Service_Type SET Service_name = @ServiceName, Service_Desc = @ServiceDesc WHERE Service_Type_Id = @ServiceTypeId";

                using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
                {
                    conn.Open();

                    // Execute the update command
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@ServiceName", serviceName);
                        cmd.Parameters.AddWithValue("@ServiceDesc", serviceDesc);
                        cmd.Parameters.AddWithValue("@ServiceTypeId", serviceTypeId);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Set success message
                Session["SuccessMessageService"] = "Service type updated successfully.";

                // Reset the edit index and rebind the grid
                GridView5.EditIndex = -1;
                GridView5.DataBind();
            }
            catch (SqlException sqlEx)
            {
                // Show SQL exception details
                DeleteSuccessMessageServiceTypes.Text = "SQL Error: " + sqlEx.Message;
                DeleteSuccessMessageServiceTypes.Visible = true;
            }
            catch (Exception ex)
            {
                // Show general exception details
                DeleteSuccessMessageServiceTypes.Text = "Error: " + ex.Message;
                DeleteSuccessMessageServiceTypes.Visible = true;
            }
        }




        protected void GridView6_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Retrieve the Doctor_Id from the GridView
                int doctorId = (int)GridView6.DataKeys[e.RowIndex].Value;

                // SQL delete query for doctor record
                string deleteDoctorQuery = "DELETE FROM Doctor WHERE Doctor_Id = @DoctorId";

                using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(deleteDoctorQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@DoctorId", doctorId);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Rebind the GridView to refresh the data
                GridView6.DataBind();
                DeleteSuccessMessageDoctors.Text = "You have successfully removed the doctor record.";
                DeleteSuccessMessageDoctors.Visible = true;
            }
            catch (Exception ex)
            {
                DeleteSuccessMessageDoctors.Text = "Error during deletion: " + ex.Message;
                DeleteSuccessMessageDoctors.ForeColor = System.Drawing.Color.Red;
                DeleteSuccessMessageDoctors.Visible = true;
            }
        }

        protected void GridView6_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView6.EditIndex = e.NewEditIndex;
            GridView6.DataBind();
        }

        protected void GridView6_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView6.EditIndex = -1;
            GridView6.DataBind();
        }

        protected void GridView6_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Retrieve the Doctor_Id from the GridView
                int doctorId = (int)GridView6.DataKeys[e.RowIndex].Value;

                // Get new values from the GridView
                string email = ((TextBox)GridView6.Rows[e.RowIndex].FindControl("TextBoxEmail")).Text.Trim();
                string password = ((TextBox)GridView6.Rows[e.RowIndex].FindControl("TextBoxPassword")).Text.Trim();
                string firstName = ((TextBox)GridView6.Rows[e.RowIndex].FindControl("TextBoxFirstName")).Text.Trim();
                string lastName = ((TextBox)GridView6.Rows[e.RowIndex].FindControl("TextBoxLastName")).Text.Trim();

                // Validate input
                if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password) ||
                    string.IsNullOrWhiteSpace(firstName) || string.IsNullOrWhiteSpace(lastName))
                {
                    throw new Exception("All fields are required.");
                }

                // SQL update query
                string updateQuery = "UPDATE Doctor SET email = @Email, password = @Password, first_name = @FirstName, last_name = @LastName WHERE Doctor_Id = @DoctorId";

                using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@DoctorId", doctorId);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Set success message
                DeleteSuccessMessageDoctors.Text = "Doctor updated successfully.";
                DeleteSuccessMessageDoctors.Visible = true;

                // Reset the edit index and rebind the grid
                GridView6.EditIndex = -1;
                GridView6.DataBind();
                Response.Redirect("6Admin.aspx"); // Update this with your actual admin page URL
            }
            catch (SqlException sqlEx)
            {
                // Log detailed SQL error
                LogError(sqlEx);
                DeleteSuccessMessageDoctors.Text = "SQL Error: " + sqlEx.Message;
                DeleteSuccessMessageDoctors.ForeColor = System.Drawing.Color.Red;
                DeleteSuccessMessageDoctors.Visible = true;
            }
            catch (Exception ex)
            {
                // Log generic error
                LogError(ex);
                DeleteSuccessMessageDoctors.Text = "Error during update: " + ex.Message;
                DeleteSuccessMessageDoctors.ForeColor = System.Drawing.Color.Red;
                DeleteSuccessMessageDoctors.Visible = true;
            }
        }

        // Logging method to capture errors
        private void LogError(Exception ex)
        {
            // Implement logging mechanism (e.g., log to a file, event viewer, etc.)
            System.Diagnostics.Debug.WriteLine(ex.ToString());
        }





        // Event handler for deleting an admin record
        protected void GridView7_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Retrieve the Admin_Id from the GridView
                int adminId = (int)GridView7.DataKeys[e.RowIndex].Value;

                // SQL delete query for the admin record
                string deleteAdminQuery = "DELETE FROM Admin WHERE Admin_Id = @AdminId";

                using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(deleteAdminQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@AdminId", adminId);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Rebind the GridView to refresh the data
                GridView7.DataBind();

                // Show success message for admin deletion
                DeleteSuccessMessageAdmins.Text = "You have successfully removed the admin record.";
                DeleteSuccessMessageAdmins.ForeColor = System.Drawing.Color.Green;
                DeleteSuccessMessageAdmins.Visible = true;
            }
            catch (Exception ex)
            {
                DeleteSuccessMessageAdmins.Text = "Error during deletion: " + ex.Message;
                DeleteSuccessMessageAdmins.ForeColor = System.Drawing.Color.Red;
                DeleteSuccessMessageAdmins.Visible = true;
            }
        }

        // Event handler for editing an admin record
        protected void GridView7_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView7.EditIndex = e.NewEditIndex;
            GridView7.DataBind();
        }

        // Event handler for canceling edit
        protected void GridView7_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView7.EditIndex = -1;
            GridView7.DataBind();
        }

        // Event handler for updating an admin record
        // Event handler for updating an admin record
        protected void GridView7_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Retrieve the Admin_Id from the GridView
                int adminId = (int)GridView7.DataKeys[e.RowIndex].Value;

                // Get new values from the GridView
                string email = ((TextBox)GridView7.Rows[e.RowIndex].FindControl("TextBoxEmail")).Text.Trim();
                string password = ((TextBox)GridView7.Rows[e.RowIndex].FindControl("TextBoxPassword")).Text.Trim();
                string firstName = ((TextBox)GridView7.Rows[e.RowIndex].FindControl("TextBoxFirstName")).Text.Trim();
                string lastName = ((TextBox)GridView7.Rows[e.RowIndex].FindControl("TextBoxLastName")).Text.Trim();

                // Validate input
                if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password) ||
                    string.IsNullOrWhiteSpace(firstName) || string.IsNullOrWhiteSpace(lastName))
                {
                    throw new Exception("All fields are required.");
                }

                // SQL update query
                string updateQuery = "UPDATE Admin SET email = @Email, password = @Password, first_name = @FirstName, last_name = @LastName WHERE Admin_Id = @AdminId";

                using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@AdminId", adminId);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Show success message for admin update
                DeleteSuccessMessageAdmins.Text = "Admin updated successfully.";
                DeleteSuccessMessageAdmins.ForeColor = System.Drawing.Color.Green;
                DeleteSuccessMessageAdmins.Visible = true;

                // Reset the edit index and rebind the grid
                GridView7.EditIndex = -1;
                GridView7.DataBind();
                Response.Redirect("6Admin.aspx"); // Update this with your actual admin page URL
            }
            catch (SqlException sqlEx)
            {
                DeleteSuccessMessageAdmins.Text = "SQL Error: " + sqlEx.Message;
                DeleteSuccessMessageAdmins.ForeColor = System.Drawing.Color.Red;
                DeleteSuccessMessageAdmins.Visible = true;
            }
            catch (Exception ex)
            {
                DeleteSuccessMessageAdmins.Text = "Error during update: " + ex.Message;
                DeleteSuccessMessageAdmins.ForeColor = System.Drawing.Color.Red;
                DeleteSuccessMessageAdmins.Visible = true;
            }
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
