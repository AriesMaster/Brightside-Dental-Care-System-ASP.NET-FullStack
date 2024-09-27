using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.Configuration;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class _1login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoginErrorLabel.Visible = false;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = UserName.Text.Trim();
            string password = Password.Text.Trim();
            string userType = UserTypeDropDown.SelectedValue;

            // Clear previous error message
            LoginErrorLabel.Text = "";

            // Validate fields
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                LoginErrorLabel.Text = "Please fill in both email and password.";
                LoginErrorLabel.Visible = true;
                return;
            }

            // Validate email format
            if (!Regex.IsMatch(email, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
            {
                LoginErrorLabel.Text = "Enter a valid email format.";
                LoginErrorLabel.Visible = true;
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = string.Empty;

                if (userType == "Patient")
                {
                    query = "SELECT Patient_Id, password FROM Patient WHERE email = @Email";
                }
                else if (userType == "Doctor")
                {
                    query = "SELECT Doctor_Id, password FROM Doctor WHERE email = @Email";
                }
                else if (userType == "Admin")
                {
                    query = "SELECT Admin_Id, password FROM Admin WHERE email = @Email";
                }

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            string storedPassword = reader["password"].ToString();
                            if (storedPassword == password)
                            {
                                // Store user info in session
                                Session["UserName"] = email;
                                if (userType == "Patient")
                                {
                                    Session["Patient_Id"] = reader["Patient_Id"]; // Store Patient_Id
                                    Response.Redirect("11profileview.aspx");
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
                                LoginErrorLabel.ForeColor = System.Drawing.Color.Red;
                                LoginErrorLabel.Visible = true;
                            }
                        }
                        else
                        {
                            // No user found
                            LoginErrorLabel.Text = "Invalid email or password.";
                            LoginErrorLabel.ForeColor = System.Drawing.Color.Red;
                            LoginErrorLabel.Visible = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exception
                        LoginErrorLabel.Text = "An error occurred: " + ex.Message;
                        LoginErrorLabel.ForeColor = System.Drawing.Color.Red;
                        LoginErrorLabel.Visible = true;
                    }
                }
            }
        }
    }
}
