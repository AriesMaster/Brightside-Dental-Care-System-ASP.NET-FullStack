<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="7About.aspx.cs" Inherits="Brightside_Dental_Care_Planning.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <!-- Add any CSS or JavaScript files here -->
    </head>
    <body>
        <main aria-labelledby="title">
            <h2 id="title" style="text-align: center;"><%: Title %>.</h2>
            
            <div class="service-list">
                <img alt="our-team" src="pictures/staff.png" style="width: 500px; height: auto; margin: 20px auto; display: block;" />
                <div class="service-container">
                    <h2>Our Team</h2>
                    <p>At Brightside Dental Care, we have a team of highly skilled and experienced dentists, hygienists, and support staff who are dedicated to providing the best possible dental care to our patients. Our team is committed to staying up-to-date with the latest dental technologies and techniques to ensure that we can provide the most effective and comfortable treatments.</p>
                </div>

                <div class="service-container">
                    <h2>Our Mission</h2>
                    <p>Our mission is to provide high-quality, affordable dental care to our patients in a comfortable and welcoming environment. We believe that everyone deserves to have a healthy and beautiful smile, and we are committed to helping our patients achieve that goal.</p>
                </div>

                <div class="service-container">
                    <h2>Our History</h2>
                    <p>Brightside Dental Care has been serving the community for over 20 years. We have built a reputation for excellence in dental care, and we are proud to have many long-time patients who trust us with their dental health.</p>
                </div>

                <div class="service-container">
                    <h2>Our Facility</h2>
                    <p>Our state-of-the-art facility is equipped with the latest dental technologies and amenities to ensure that our patients receive the best possible care. We have a comfortable waiting area, private consultation rooms, and modern treatment rooms with the latest dental equipment.</p>
                </div>
            </div>
        </main>
    </body>
</asp:Content>