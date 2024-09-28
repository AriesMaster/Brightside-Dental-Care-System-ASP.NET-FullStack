using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No additional logic needed for Page_Load
        }

        protected void ButtonAddAdmin_Click(object sender, EventArgs e)
        {
            string firstName = TextBoxFirstName.Text.Trim();
            string lastName = TextBoxLastName.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            string password = TextBoxPassword.Text.Trim();

            // Validate the inputs
            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) ||
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                AddSuccessMessage.Text = "Please fill in all fields.";
                AddSuccessMessage.ForeColor = System.Drawing.Color.Red;
                AddSuccessMessage.Visible = true;
                return;
            }

            if (password.Length < 6)
            {
                AddSuccessMessage.Text = "Password must be at least 6 characters.";
                AddSuccessMessage.ForeColor = System.Drawing.Color.Red;
                AddSuccessMessage.Visible = true;
                return;
            }

            // Create SQL insert query
            string insertQuery = "INSERT INTO Admin (email, password, first_name, last_name) VALUES (@Email, @Password, @FirstName, @LastName)";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        AddSuccessMessage.Text = "You have successfully added a new admin.";
                        AddSuccessMessage.ForeColor = System.Drawing.Color.Green;
                        AddSuccessMessage.Visible = true;

                        // Clear the fields after success
                        TextBoxFirstName.Text = string.Empty;
                        TextBoxLastName.Text = string.Empty;
                        TextBoxEmail.Text = string.Empty;
                        TextBoxPassword.Text = string.Empty;
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 2627) // Unique constraint violation
                        {
                            AddSuccessMessage.Text = "Error: Email must be unique.";
                        }
                        else
                        {
                            AddSuccessMessage.Text = "Error: " + ex.Message;
                        }
                        AddSuccessMessage.ForeColor = System.Drawing.Color.Red;
                        AddSuccessMessage.Visible = true;
                    }
                }
            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("6Admin.aspx"); // Change to your actual admin dashboard page URL
        }
    }
}
