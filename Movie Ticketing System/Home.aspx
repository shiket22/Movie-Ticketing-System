<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Movie_Ticketing_System.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(Images/CinameBackground1.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .column {
            float: left;
            width: 32.5%;
            padding: 5px;
        }

        .row::after {
            content: "";
            clear: both;
            display: table;
        }

        .picture {
            width: 400px;
            height: 500px;
            margin-left: 34%;
        }

        .bground {
            width: 1900px;
            height: 700px;
        }

        .firstcharacter {
            float: left;
            font-size: 60px;
            line-height: 60px;
            padding-top: 4px;
            padding-right: 10px;
            padding-left: 3px;
            font-style: italic;
            top: -10px;
            position: relative;
            color: darkorange;
            font-family: "Playfair Display", serif;
        }

        .auto-style1 {
            width: 1730px;
        }

        .container {
            position: relative;
            width: 50%;
        }

        .middle {
            transition: .8s ease;
            opacity: 0;
            position: absolute;
            top: 50%;
            left: 100%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            text-align: center;
        }

        .container:hover .picture {
            opacity: 0.4;
        }

        .container:hover .middle {
            opacity: 1;
        }

        .text {
            background-color: transparent;
            color: white;
            font-size: 20px;
            font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;
            font-weight: bold;
        }

        .addToCart {
            display: flex;
            align-items: center;
            margin-left: 35%;
            margin-top: 8px;
        }

        .cartBtn {
            display: inline-block;
            background-color: goldenrod;
            border-radius: 5px;
            font-size: 16px;
            color: white;
            text-decoration: none;
            padding: 12px 30px;
            transition: all .5s;
        }

            .cartBtn:hover {
                background-color: darkgoldenrod;
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div id="fh5co-about" data-section="about" style="border-top: 3px solid white;">
            <div>
                <img src="Images\Thank.png" class="bground"></div>
            <div>
                <h2 style="color: white; font-size: 30px; font-weight: bold; text-align:center;">About Us</h2>
                <p class="auto-style1" style="text-align: justify; color: white; font-family: 'Berlin Sans FB'; font-size: 19px; text-align:justify; padding: 0 0 0 4%;">
                    <span class="firstcharacter">W</span>elcome to SSC Cinema. your ultimate destination for all things cinema!
            At SSC Cinema, we believe in the transformative power of cinema to entertain, inspire, and provoke thought. Whether you're a casual moviegoer or a hardcore cinephile, 
            our goal is to be your go-to resource for everything related to films. Explore our extensive database of movie reviews, curated lists, in-depth analyses, and the latest industry 
            news. From timeless classics to cutting-edge indie gems and blockbuster hits, we've got you covered with comprehensive coverage of all genres and eras. Join us on this cinematic
            journey, and let's explore the boundless wonders of the silver screen together!
                </p>
            </div>
        </div>
        <br />



        <h3 style="text-align: center; font-size: 50px; font-family: 'Gabriola'!important; color: darkorange"><b>Movies Now Available</b></h3>
        <div class="row">
            <asp:ListView ID="Movie" runat="server">
                <ItemTemplate>
                    <div class="column">
                        <h4 style="text-align: center; color: sandybrown; font-size: 20px;"><i><b><%# Eval("MovieName") %></b></i></h4>
                        <a href="MovieDetails.aspx?MovieID=<%# Eval("Id") %>">
                            <div class="container">
                                <asp:ImageButton ID="movieImage" runat="server" CssClass="picture" ImageUrl='<%# Eval("Movie") %>' PostBackUrl='<%# "MovieDetails.aspx?MovieID=" + Eval("Id") %>'/>
                                <div class="middle">
                                    <div class="text"><%# Eval("MovieName") %></div>
                                </div>
                            </div>
                        </a>
                        <div class="addToCart">
                            <asp:Button ID="purchaseButton" runat="server" Text="Purchase Ticket" CssClass="cartBtn" OnClick="cartBtn_Click" PostBackUrl='<%# "~/BookingMovie.aspx?MovieID=" + Eval("Id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</asp:Content>
