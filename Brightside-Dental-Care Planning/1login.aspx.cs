using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = UserName.Text;
            string password = Password.Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Patient WHERE email = @Email AND password = @Password";
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
                            if (AlreadyHaveProfileCheckBox.Checked)
                            {
                                // Redirect to profile viewing page if the checkbox is checked
                                Response.Redirect("11profileViewing.aspx");
                            }
                            else
                            {
                                // Redirect to the default profile page
                                Response.Redirect("10profile.aspx");
                            }
                        }
                        else
                        {
                            // Login failed
                            Response.Write("Invalid email or password.");
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
