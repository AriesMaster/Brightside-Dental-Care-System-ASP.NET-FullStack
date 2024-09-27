using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm15 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load the existing profile information if the page is being loaded for the first time
                LoadProfileData();
            }
        }

        private void LoadProfileData()
        {
            // Retrieve the Patient_Id from the session
            if (Session["Patient_Id"] == null)
            {
                ErrorLabel.Text = "Patient ID not found in session.";
                return;
            }

            int patientId = Convert.ToInt32(Session["Patient_Id"]);
            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Query to retrieve the profile and address information
                string query = @"
                    SELECT p.first_name, p.last_name, p.phone_number, p.Date_of_Birth, p.Gender,
                           a.Street, a.City, a.Province
                    FROM Profile p
                    JOIN Address a ON p.Patient_Id = a.Patient_Id
                    WHERE p.Patient_Id = @PatientId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PatientId", patientId);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            FirstNameTextBox.Text = reader["first_name"].ToString();
                            LastNameTextBox.Text = reader["last_name"].ToString();
                            PhoneNumberTextBox.Text = reader["phone_number"].ToString();
                            DateOfBirthTextBox.Text = Convert.ToDateTime(reader["Date_of_Birth"]).ToString("yyyy-MM-dd");
                            GenderDropDownList.SelectedValue = reader["Gender"].ToString();
                            StreetTextBox.Text = reader["Street"].ToString();
                            CityTextBox.Text = reader["City"].ToString();
                            ProvinceTextBox.Text = reader["Province"].ToString();
                        }
                        else
                        {
                            ErrorLabel.Text = "Profile not found.";
                        }
                    }
                }
            }
        }

        protected void SaveProfileButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string firstName = FirstNameTextBox.Text;
                string lastName = LastNameTextBox.Text;
                string phoneNumber = PhoneNumberTextBox.Text;
                DateTime dateOfBirth;

                // Validate DateOfBirth input
                if (!DateTime.TryParse(DateOfBirthTextBox.Text, out dateOfBirth))
                {
                    ErrorLabel.Text = "Please enter a valid date of birth.";
                    return;
                }

                string gender = GenderDropDownList.SelectedValue;

                // Address fields
                string street = StreetTextBox.Text;
                string city = CityTextBox.Text;
                string province = ProvinceTextBox.Text;

                // Retrieve the Patient_Id from session
                if (Session["Patient_Id"] == null)
                {
                    ErrorLabel.Text = "Patient ID not found in session.";
                    return;
                }

                int patientId = Convert.ToInt32(Session["Patient_Id"]);

                bool profileUpdated = UpdateProfile(patientId, firstName, lastName, phoneNumber, dateOfBirth, gender, street, city, province);

                if (profileUpdated)
                {
                    ProfileStatusLabel.Text = "Profile updated successfully!";
                    Response.Redirect("11profileview.aspx"); // Redirect to profile view after successful update
                }
                else
                {
                    ErrorLabel.Text = "Error updating profile. Please try again.";
                }
            }
            else
            {
                ErrorLabel.Text = "Please fill in all required fields.";
            }
        }

        // Method to update the profile in the database
        private bool UpdateProfile(int patientId, string firstName, string lastName, string phoneNumber, DateTime dateOfBirth, string gender, string street, string city, string province)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            // Queries to update the Profile and Address tables
            string profileQuery = @"UPDATE Profile SET 
                                        first_name = @FirstName,
                                        last_name = @LastName,
                                        phone_number = @PhoneNumber,
                                        Date_of_Birth = @DateOfBirth,
                                        Gender = @Gender
                                    WHERE Patient_Id = @PatientId";

            string addressQuery = @"UPDATE Address SET 
                                        Street = @Street,
                                        City = @City,
                                        Province = @Province
                                    WHERE Patient_Id = @PatientId";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlTransaction transaction = connection.BeginTransaction())
                    {
                        try
                        {
                            // Update Profile table
                            using (SqlCommand profileCommand = new SqlCommand(profileQuery, connection, transaction))
                            {
                                profileCommand.Parameters.AddWithValue("@PatientId", patientId);
                                profileCommand.Parameters.AddWithValue("@FirstName", firstName);
                                profileCommand.Parameters.AddWithValue("@LastName", lastName);
                                profileCommand.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                                profileCommand.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                                profileCommand.Parameters.AddWithValue("@Gender", gender);

                                profileCommand.ExecuteNonQuery();
                            }

                            // Update Address table
                            using (SqlCommand addressCommand = new SqlCommand(addressQuery, connection, transaction))
                            {
                                addressCommand.Parameters.AddWithValue("@PatientId", patientId);
                                addressCommand.Parameters.AddWithValue("@Street", street);
                                addressCommand.Parameters.AddWithValue("@City", city);
                                addressCommand.Parameters.AddWithValue("@Province", province);

                                addressCommand.ExecuteNonQuery();
                            }

                            // Commit the transaction
                            transaction.Commit();
                            return true;
                        }
                        catch (Exception)
                        {
                            // Rollback the transaction in case of any errors
                            transaction.Rollback();
                            throw;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error (add appropriate logging)
                ErrorLabel.Text = $"Error: {ex.Message}";
                // Optionally log the stack trace or use a logging library
                Console.WriteLine(ex.StackTrace);  // For debugging purposes
                return false;
            }
        }
    }
}
