using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.Configuration;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SignupButton_Click(object sender, EventArgs e)
        {
            string email = UserName.Text;
            string password = Password.Text;
            string confirmPassword = ConfirmPassword.Text;

            // Clear previous messages
            SignupStatusLabel.Text = "";
            ErrorLabel.Text = "";

            // Validate fields
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                ErrorLabel.Text = "All fields are required.";
                return;
            }

            // Check if passwords match
            if (password != confirmPassword)
            {
                ErrorLabel.Text = "Passwords do not match.";
                return;
            }

            // Password strength validation
            if (password.Length < 6 || !Regex.IsMatch(password, @"[a-zA-Z]") || !Regex.IsMatch(password, @"[0-9]") || !Regex.IsMatch(password, @"[!@#$%^&*]"))
            {
                ErrorLabel.Text = "Password must be at least 6 characters long and contain letters, numbers, and special characters.";
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                ErrorLabel.Text = "Connection string is not configured.";
                return;
            }

            // Insert the new user into the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Patient (email, password) VALUES (@Email, @Password)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        SignupStatusLabel.Text = "Signup successful! You can now log in.";
                    }
                    catch (Exception ex)
                    {
                        ErrorLabel.Text = "An error occurred: " + ex.Message;
                    }
                }
            }
        }
    }
}
