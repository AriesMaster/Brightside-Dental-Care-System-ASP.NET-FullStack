<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="3homepage.aspx.cs" Inherits="Brightside_Dental_Care_Planning._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ffffff;
            color: #333333;
            margin: 0;
            padding: 0;
        }
        main {
            padding: 40px;
        }
        h1 {
            font-size: 2.5em;
            font-weight: bold;
            color: #333333;
            margin-bottom: 20px;
        }
        .lead {
            font-size: 1.2em;
            color: #666666;
            margin-bottom: 30px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            font-size: 1.2em;
            padding: 15px 30px;
            border-radius: 5px;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .text-center {
            text-align: center;
        }
        .image-container {
            text-align: center;
            margin-bottom: 40px;
        }
        .image-container img {
            width: 80%;
            max-width: 700px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>

    <main>
        <section class="image-container">
            <h1>Welcome to Brightside Dental Care</h1>
            <img alt="Dental Care" src="pictures/home.png" />
        </section>
        <p class="lead text-center">Want to book an appointment? Press the button below.</p>
        <p class="text-center">
            <a href="1login.aspx" class="btn btn-primary">BOOK NOW </a>&nbsp;</p>
    </main>

</asp:Content>
