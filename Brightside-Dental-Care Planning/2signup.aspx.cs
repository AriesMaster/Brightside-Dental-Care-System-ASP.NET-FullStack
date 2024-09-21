using System;
using System.Data.SqlClient;
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

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                Response.Write("All fields are required.");
                return;
            }

            if (password != confirmPassword)
            {
                Response.Write("Passwords do not match.");
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                Response.Write("Connection string is not configured.");
                return;
            }

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
                        //Response.Redirect("1login.aspx");
                    }
                    catch (Exception ex)
                    {
                        // Handle exception (e.g., display an error message)
                        Response.Write("An error occurred: " + ex.Message);
                    }
                }
            }
        }
    }
}
