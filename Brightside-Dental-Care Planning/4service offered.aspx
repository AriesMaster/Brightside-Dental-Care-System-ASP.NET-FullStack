<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="4service_offered.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .centered {
            text-align: center;
        }
        .service-container {
            background-color: #f7f7f7;
            padding: 20px;
            margin: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .service-image {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
            margin-bottom: 20px
        }
    </style>

    <h1 class="centered">Our Services</h1>
    <div class="service-list">
        
       <img alt="general" src="pictures/extraction.jpg" style="width: 250px; height: 250px; margin: 40px auto 20px; display: block; margin-left: auto; margin-right: auto;" />
        <div class="service-container">
            <h2>General Dentistry</h2>
            <p>Routine check-ups, cleanings, fillings and other basic dental care services.</p>
        </div>

        <img alt="cosmetic" src="pictures/whitening.jpeg" style="width: 250px; height: 250px; margin: 20px auto; display: block; margin-left: auto; margin-right: auto;" />
        <div class="service-container">
            <h2>Cosmetic Dentistry</h2>
            <p>Teeth whitening, veneers, bonding, and smile makeovers to improve the appearance of your teeth.</p>
        </div>

         <img alt="restorative" src="pictures/damaged.jpeg" style="width: 250px; height: 250px; margin: 20px auto; display: block; margin-left: auto; margin-right: auto;" />
        <div class="service-container">
            <h2>Restorative Dentistry</h2>
            <p>Crowns, bridges, dentures, and dental implants to repair or replace damaged or missing teeth.</p>
        </div>

        
         <img alt="orthodontics" src="pictures/braces.jpg" style="width: 300px; height: 250px; margin: 20px auto; display: block; margin-left: auto; margin-right: auto;" />
        <div class="service-container">
            <h2>Orthodontics</h2>
            <p>Traditional metal braces, clear aligners, and retainers to straighten teeth and improve bite alignment.</p>
        </div>

        <img alt="emergency" src="pictures/toothache.jpg" style="width: 300px; height: 250px; margin: 20px auto; display: block; margin-left: auto; margin-right: auto;" />
        <div class="service-container">
            <h2>Emergency Dentistry</h2>
            <p>Urgent care for dental emergencies, including toothaches, lost fillings, broken teeth, and extractions.</p>
        </div>
    </div>
   
</asp:Content>