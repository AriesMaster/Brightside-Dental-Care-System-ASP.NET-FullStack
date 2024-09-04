using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Brightside_Dental_Care_Planning
{
    public partial class _1login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = UserName.Text;
            string password = Password.Text;
            string userType = UserTypeDropDown.SelectedValue;

            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = string.Empty;

                // Determine which table to query based on the user type
                if (userType == "Patient")
                {
                    query = "SELECT COUNT(*) FROM Patient WHERE email = @Email AND password = @Password";
                }
                else if (userType == "Doctor")
                {
                    query = "SELECT COUNT(*) FROM Doctor WHERE email = @Email AND password = @Password";
                }
                else if (userType == "Admin")
                {
                    query = "SELECT COUNT(*) FROM Admin WHERE email = @Email AND password = @Password";
                }

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        int count = (int)command.ExecuteScalar();

                        if (count > 0)
                        {
                            // Redirect based on user type
                            if (userType == "Patient")
                            {
                                Response.Redirect("10profile.aspx");
                            }
                            else if (userType == "Doctor")
                            {
                                Response.Redirect("9Doctor.aspx"); // Redirect to doctor's dashboard
                            }
                            else if (userType == "Admin")
                            {
                                Response.Redirect("6Admin.aspx"); // Redirect to admin page
                            }
                        }
                        else
                        {
                            // Login failed
                            Response.Write("Invalid email, password, or user type.");
                        }
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
