using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class _11profileViewing : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"]?.ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                // Handle the case where the connection string is null or empty
                // Log the error or show an error message to the user
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT first_name, last_name, Date_of_Birth, Gender, phone_number FROM Profile WHERE Profile_Id = @ProfileID";
                int profileID = GetLoggedInUserProfileID();

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProfileID", profileID);

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (FirstNameLabel != null) FirstNameLabel.Text = reader["first_name"].ToString();
                            if (LastNameLabel != null) LastNameLabel.Text = reader["last_name"].ToString();
                            if (DOBLabel != null) DOBLabel.Text = reader["Date_of_Birth"].ToString();
                            if (GenderLabel != null) GenderLabel.Text = reader["Gender"].ToString();
                            if (PhoneNumberLabel != null) PhoneNumberLabel.Text = reader["phone_number"].ToString();
                        }
                        else
                        {
                            // Handle case where no data is found
                            if (FirstNameLabel != null) FirstNameLabel.Text = "No data found";
                            if (LastNameLabel != null) LastNameLabel.Text = "No data found";
                            if (DOBLabel != null) DOBLabel.Text = "No data found";
                            if (GenderLabel != null) GenderLabel.Text = "No data found";
                            if (PhoneNumberLabel != null) PhoneNumberLabel.Text = "No data found";
                        }
                    }
                }
            }
        }

        private int GetLoggedInUserProfileID()
        {
            // Placeholder method to get the logged-in user's profile ID.
            // Replace with your actual logic for fetching the ProfileID.
            return 1;
        }

        protected void MakeAppointmentButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("5Appointment.aspx");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("3homepage.aspx");
        }

        protected void CreateProfileButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("10profile.aspx");
        }
    }
}
