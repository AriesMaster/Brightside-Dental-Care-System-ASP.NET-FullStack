<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="8Contact.aspx.cs" Inherits="Brightside_Dental_Care_Planning.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" style="display: flex; justify-content: center; align-items: center; flex-direction: column; padding: 40px; background-color: #f4f4f4;">
        <h1 id="title" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #333333; margin-bottom: 30px;">Contact Us</h1>

        <div style="width: 100%; max-width: 900px; background-color: #ffffff; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); overflow: hidden;">
            <table style="width: 100%; border-collapse: collapse;">
                <thead style="background-color: #333333; color: #ffffff;">
                    <tr>
                        <th style="padding: 15px; text-align: left;">Contact Information</th>
                        <th style="padding: 15px; text-align: left;">Details</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="border-bottom: 1px solid #dddddd;">
                        <td style="padding: 15px;">Address:</td>
                        <td style="padding: 15px;">South East Boulevard Shopping Centre, Hendrik Van Eck Blvd, Vanderbijlpark S. E. 8, Vanderbijlpark, 1910</td>
                    </tr>
                    <tr style="border-bottom: 1px solid #dddddd;">
                        <td style="padding: 15px;">Phone:</td>
                        <td style="padding: 15px;"><a href="tel:+27162589433" style="color: #007bff; text-decoration: none;">(016) 258-9433</a></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #dddddd;">
                        <td style="padding: 15px;">Email:</td>
                        <td style="padding: 15px;"><a href="mailto:info@brightsidedental.co.za" style="color: #007bff; text-decoration: none;">info@brightsidedental.co.za</a></td>
                    </tr>
                    <tr>
                        <td style="padding: 15px;">Hours:</td>
                        <td style="padding: 15px;">Monday - Friday, 9am - 5pm<br>Saturday - 9am - 1pm</td>
                    </tr>
                </tbody>
            </table>

            <div style="text-align: center; padding: 20px;">
                <img alt="Our Location" src="pictures/loca.jpg" style="max-width: 100%; height: auto; border-radius: 10px;" />
            </div>
        </div>
    </main>
</asp:Content>
