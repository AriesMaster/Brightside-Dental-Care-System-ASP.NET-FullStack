<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="4service_offered.aspx.cs" Inherits="Brightside_Dental_Care_Planning.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ffffff;
            color: #000000;
        }
        .centered {
            text-align: center;
            margin-bottom: 40px;
        }
        .service-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        .service-container {
            background-color: #f8f8f8;
            padding: 20px;
            width: 300px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .service-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
            margin-bottom: 20px;
        }
        .service-container h2 {
            color: #333333;
            font-size: 1.5em;
            margin-bottom: 10px;
        }
        .service-container p {
            color: #666666;
            font-size: 1em;
            margin-bottom: 15px;
        }
        .service-price {
            font-weight: bold;
            color: #000000;
            font-size: 1.2em;
        }
        .price-list {
            text-align: left;
            margin-top: 10px;
        }
        .price-list li {
            margin-bottom: 5px;
        }
    </style>

    <h1 class="centered">Our Services</h1>
    <div class="service-list">
        
        <div class="service-container">
            <img alt="general" src="pictures/extraction.jpg" class="service-image" />
            <h2>General Dentistry</h2>
            <p>Routine check-ups, cleanings, fillings, and other basic dental care services.</p>
            <ul class="price-list">
                <li>Check-up: R500</li>
                <li>Cleaning: R600</li>
                <li>Filling: R1,200</li>
            </ul>
        </div>

        <div class="service-container">
            <img alt="cosmetic" src="pictures/whitening.jpeg" class="service-image" />
            <h2>Cosmetic Dentistry</h2>
            <p>Teeth whitening, veneers, bonding, and smile makeovers to improve the appearance of your teeth.</p>
            <ul class="price-list">
                <li>Teeth Whitening: R1,000</li>
                <li>Veneers: R2,500 each</li>
                <li>Bonding: R1,800</li>
            </ul>
        </div>

        <div class="service-container">
            <img alt="restorative" src="pictures/damaged.jpeg" class="service-image" />
            <h2>Restorative Dentistry</h2>
            <p>Crowns, bridges, dentures, and dental implants to repair or replace damaged or missing teeth.</p>
            <ul class="price-list">
                <li>Crown: R3,000</li>
                <li>Bridge: R5,000</li>
                <li>Denture: R4,500</li>
                <li>Dental Implant: R10,000</li>
            </ul>
        </div>

        <div class="service-container">
            <img alt="orthodontics" src="pictures/braces.jpg" class="service-image" />
            <h2>Orthodontics</h2>
            <p>Traditional metal braces, clear aligners, and retainers to straighten teeth and improve bite alignment.</p>
            <ul class="price-list">
                <li>Metal Braces: R15,000</li>
                <li>Clear Aligners: R25,000</li>
                <li>Retainers: R2,000</li>
            </ul>
        </div>

        <div class="service-container">
            <img alt="emergency" src="pictures/toothache.jpg" class="service-image" />
            <h2>Emergency Dentistry</h2>
            <p>Urgent care for dental emergencies, including toothaches, lost fillings, broken teeth, and extractions.</p>
            <ul class="price-list">
                <li>Toothache Treatment: R800</li>
                <li>Lost Filling Repair: R1,000</li>
                <li>Broken Tooth Repair: R2,500</li>
                <li>Extraction: R2,000</li>
            </ul>
        </div>
    </div>

</asp:Content>
