using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctorProfile();
            }
        }

        private void LoadDoctorProfile()
        {
            // Assuming you are using a session variable to get the logged-in doctor's email
            string email = Session["UserName"] as string;

            if (!string.IsNullOrEmpty(email))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT email, first_name, last_name, password FROM Doctor WHERE email = @Email";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Email", email);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        EmailTextBox.Text = reader["email"].ToString();
                        FirstNameTextBox.Text = reader["first_name"].ToString();
                        LastNameTextBox.Text = reader["last_name"].ToString();
                        PasswordTextBox.Text = reader["password"].ToString();
                    }
                }
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            string email = EmailTextBox.Text;
            string firstName = FirstNameTextBox.Text;
            string lastName = LastNameTextBox.Text;
            string password = PasswordTextBox.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Doctor SET email = @Email, first_name = @FirstName, last_name = @LastName, password = @Password WHERE email = @OriginalEmail";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.AddWithValue("@OriginalEmail", Session["UserName"]); // Use the session variable to find the original record

                connection.Open();
                command.ExecuteNonQuery();
            }

            // Optionally, redirect to another page or display a success message
            Response.Redirect("9Doctor.aspx");
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("9Doctor.aspx");
        }
    }
    
}
