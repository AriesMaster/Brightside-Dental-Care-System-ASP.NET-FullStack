using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Brightside_Dental_Care_Planning
{
    public partial class Admin : System.Web.UI.Page
    {
        private string connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            if (!IsPostBack)
            {
                LoadAdminData();
            }
        }

        // Load data into a GridView or other UI element
        private void LoadAdminData()
        {
            string query = "SELECT Admin_Id, email, first_name, last_name FROM Admin";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                // Bind data to a GridView or similar control
                // Example: GridView1.DataSource = reader;
                // GridView1.DataBind();
            }
        }

        protected void CreateButton_Click(object sender, EventArgs e)
        {
            string email = EmailTextBox.Text;
            string password = PasswordTextBox.Text;
            string firstName = FirstNameTextBox.Text;
            string lastName = LastNameTextBox.Text;

            string query = "INSERT INTO Admin (email, password, first_name, last_name) VALUES (@Email, @Password, @FirstName, @LastName)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                connection.Open();
                command.ExecuteNonQuery();
            }
            LoadAdminData(); // Reload data to reflect changes
        }

        protected void FetchButton_Click(object sender, EventArgs e)
        {
            int adminId;
            if (int.TryParse(RecordIdTextBox.Text, out adminId))
            {
                string query = "SELECT email, first_name, last_name FROM Admin WHERE Admin_Id = @AdminId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@AdminId", adminId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        EmailTextBox.Text = reader["email"].ToString();
                        FirstNameTextBox.Text = reader["first_name"].ToString();
                        LastNameTextBox.Text = reader["last_name"].ToString();
                        // Consider adding password handling if required
                    }
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            int adminId;
            if (int.TryParse(RecordIdTextBox.Text, out adminId))
            {
                string email = EmailTextBox.Text;
                string firstName = FirstNameTextBox.Text;
                string lastName = LastNameTextBox.Text;
                // Password update logic should be handled securely; omit if unchanged
                string query = "UPDATE Admin SET email = @Email, first_name = @FirstName, last_name = @LastName WHERE Admin_Id = @AdminId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@FirstName", firstName);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@AdminId", adminId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                LoadAdminData(); // Reload data to reflect changes
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            int adminId;
            if (int.TryParse(DeleteRecordIdTextBox.Text, out adminId))
            {
                string query = "DELETE FROM Admin WHERE Admin_Id = @AdminId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@AdminId", adminId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                LoadAdminData(); // Reload data to reflect changes
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Implement logout logic here
            // Example: Clear session data and redirect
            Session.Abandon();
            Response.Redirect("1login.aspx");
        }
    }
}
