using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm5 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Logic on page load (if needed)
        }

        protected void CreateProfileButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string firstName = FirstName.Text;
                string lastName = LastName.Text;
                string phoneNumber = PhoneNumber.Text;
                DateTime dateOfBirth;

                // Validate DateOfBirth input
                if (!DateTime.TryParse(DateOfBirth.Text, out dateOfBirth))
                {
                    ErrorLabel.Text = "Please enter a valid date of birth.";
                    return;
                }

                string gender = Gender.SelectedValue;

                // Address fields
                string street = Street.Text;
                string city = City.Text;
                string province = Province.Text;

                // Retrieve the Patient_Id from session
                if (Session["Patient_Id"] == null)
                {
                    ErrorLabel.Text = "Patient ID not found in session.";
                    return;
                }

                int patientId = Convert.ToInt32(Session["Patient_Id"]);

                bool profileCreated = SaveProfile(patientId, firstName, lastName, phoneNumber, dateOfBirth, gender, street, city, province);

                if (profileCreated)
                {
                    ProfileStatusLabel.Text = "Profile created successfully!";
                    Response.Redirect("11profileview.aspx");  // Redirect to profile view after successful creation
                }
                else
                {
                    ErrorLabel.Text = "Error creating profile. Please try again.";
                }
            }
            else
            {
                ErrorLabel.Text = "Please fill in all required fields.";
            }
        }


        // Method to save the profile to the database
        private bool SaveProfile(int patientId, string firstName, string lastName, string phoneNumber, DateTime dateOfBirth, string gender, string street, string city, string province)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            // Queries to insert into Profile and Address tables
            string profileQuery = @"INSERT INTO Profile (Patient_Id, first_name, last_name, phone_number, Date_of_Birth, Gender)
                            VALUES (@PatientId, @FirstName, @LastName, @PhoneNumber, @DateOfBirth, @Gender)";

            string addressQuery = @"INSERT INTO Address (Patient_Id, Street, City, Province)
                            VALUES (@PatientId, @Street, @City, @Province)";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Begin a transaction to ensure both inserts succeed together
                    SqlTransaction transaction = connection.BeginTransaction();

                    try
                    {
                        // Insert into Profile table
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

                        // Insert into Address table
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

