using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Brightside_Dental_Care_Planning
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No additional logic needed for Page_Load
        }

        protected void ButtonAddServiceType_Click(object sender, EventArgs e)
        {
            string serviceName = TextBoxServiceName.Text.Trim();
            string serviceDesc = TextBoxServiceDesc.Text.Trim();
            string priceText = TextBoxPrice.Text.Trim();
            decimal price;

            // Validate the inputs
            if (string.IsNullOrEmpty(serviceName) || string.IsNullOrEmpty(serviceDesc) ||
                string.IsNullOrEmpty(priceText) || !decimal.TryParse(priceText, out price) || price < 0)
            {
                AddSuccessMessage.Text = "Please fill in all fields correctly.";
                AddSuccessMessage.ForeColor = System.Drawing.Color.Red;
                AddSuccessMessage.Visible = true;
                return;
            }

            // Create SQL insert query
            string insertQuery = "INSERT INTO Service_Type (Service_name, Service_Desc, Price) VALUES (@ServiceName, @ServiceDesc, @Price)";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dentistdatabaseConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@ServiceName", serviceName);
                    cmd.Parameters.AddWithValue("@ServiceDesc", serviceDesc);
                    cmd.Parameters.AddWithValue("@Price", price);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        AddSuccessMessage.Text = "You have successfully added a new service type.";
                        AddSuccessMessage.ForeColor = System.Drawing.Color.Green;
                        AddSuccessMessage.Visible = true;

                        // Clear the fields after success
                        TextBoxServiceName.Text = string.Empty;
                        TextBoxServiceDesc.Text = string.Empty;
                        TextBoxPrice.Text = string.Empty;
                    }
                    catch (SqlException ex)
                    {
                        AddSuccessMessage.Text = "Error: " + ex.Message;
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
