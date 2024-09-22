using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace Brightside_Dental_Care_Planning
{
    public partial class _1login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = UserName.Text.Trim();
            string password = Password.Text.Trim();
            string userType = UserTypeDropDown.SelectedValue;

            // Validate email format
            if (!IsValidEmail(email))
            {
                LoginErrorLabel.Text = "Please enter a valid email format.";
                LoginErrorLabel.Visible = true;
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = string.Empty;

                // Determine which table to query based on the user type
                if (userType == "Patient")
                {
                    query = "SELECT password FROM Patient WHERE email = @Email";
                }
                else if (userType == "Doctor")
                {
                    query = "SELECT password FROM Doctor WHERE email = @Email";
                }
                else if (userType == "Admin")
                {
                    query = "SELECT password FROM Admin WHERE email = @Email";
                }

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();
                        string storedPasswordHash = command.ExecuteScalar() as string;

                        if (storedPasswordHash != null && VerifyPassword(password, storedPasswordHash))
                        {
                            // Redirect based on user type
                            if (userType == "Patient")
                            {
                                Response.Redirect("10profile.aspx");
                            }
                            else if (userType == "Doctor")
                            {
                                Response.Redirect("9Doctor.aspx");
                            }
                            else if (userType == "Admin")
                            {
                                Response.Redirect("6Admin.aspx");
                            }
                        }
                        else
                        {
                            // Login failed
                            LoginErrorLabel.Text = "Invalid email or password.";
                            LoginErrorLabel.Visible = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exception (e.g., display an error message)
                        LoginErrorLabel.Text = "An error occurred: " + ex.Message;
                        LoginErrorLabel.Visible = true;
                    }
                }
            }
        }

        private bool IsValidEmail(string email)
        {
            // Simple regex for email validation
            var emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, emailPattern);
        }

        private bool VerifyPassword(string enteredPassword, string storedPasswordHash)
        {
            // Implement password verification using hashing
            using (var hmac = new HMACSHA256())
            {
                var hashedBytes = hmac.ComputeHash(Encoding.UTF8.GetBytes(enteredPassword));
                string hashedPassword = Convert.ToBase64String(hashedBytes);
                return hashedPassword == storedPasswordHash;
            }
        }
    }
}

