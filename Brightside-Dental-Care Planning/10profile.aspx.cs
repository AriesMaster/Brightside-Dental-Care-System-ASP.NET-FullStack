using System;
using System.Configuration; // Add this namespace
using System.Data.SqlClient;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class _10profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Code for initial page load (if any)
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("3homepage.aspx");
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            string firstName = TextBox1.Text;
            string lastName = TextBox2.Text;
            string dob = TextBox3.Text;
            string gender = TextBox4.Text;
            string phoneNumber = TextBox5.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Profile (first_name, last_name, Date_of_Birth, Gender, phone_number) " +
                                   "VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @PhoneNumber)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@DateOfBirth", dob);
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                Response.Redirect("11profileViewing.aspx");
            }
            catch (Exception ex)
            {
                // Log or display the error message
                Response.Write("Error: " + ex.Message);
            }
        }

    }
}
