<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="8Contact.aspx.cs" Inherits="Brightside_Dental_Care_Planning.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" style="display: flex; justify-content: center; align-items: center; flex-direction: column; padding: 20px;">
        <h1>Contact Us</h1>
        <address>
            <table style="width: 80%; margin: 0 auto;">
                <tr>
                    <th>Contact Information</th>
                    <th>Details</th>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td>South East Boulevard Shopping Centre, Hendrik Van Eck Blvd, Vanderbijlpark S. E. 8, Vanderbijlpark, 1910</td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td>(016) 258-9433</td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><a href="mailto:info@brightsidedental.co.za">info@brightsidedental.co.za</a></td>
                </tr>
                <tr>
                    <td>Hours:</td>
                    <td>Monday - Friday, 9am - 5pm<br>Saturday - 9am - 1pm</td>
                </tr>
            </table>
            <img alt="Our Location" src="pictures/loca.jpg" style="max-width: 80%; margin: 20px auto;" />
        </address>
    </main>
</asp:Content>