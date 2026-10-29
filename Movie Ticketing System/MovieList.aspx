<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="MovieList.aspx.cs" Inherits="Movie_Ticketing_System.MovieList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(Images/CinameBackground1.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        h1 {
            color: whitesmoke;
            text-align: center;
            font-weight: bold;
            font-family: 'Times New Roman', Times, serif;
            font-size: 40px;
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

        .container {
            position: relative;
            width: 50%;
        }

        .middle {
            transition: .8s ease;
            opacity: 0;
            position: absolute;
            top: 50%;
            left: 98%;
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
            font-size: 24px;
            font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;
            font-weight: bold;
        }

        .addToCart {
            display: flex;
            align-items: center;
            margin-left: 35%;
            margin-bottom: 30px;
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

        .auto-style1 {
            color: whitesmoke;
            display: block;
            text-align: center;
            padding: 50px 5px;
            font-family: sans-serif;
            font-size: 30px;
            font-weight: bold;
            position: relative;
            margin-left: 50px;
            top: -18px;
            left: 240px;
            width: 300px;
            height: 0px;
        }

        .auto-style2 {
            color: whitesmoke;
            display: block;
            text-align: center;
            padding: 50px 5px;
            font-family: sans-serif;
            font-size: 30px;
            font-weight: bold;
            position: relative;
            margin-left: 50px;
            top: 80px;
            left: -48px;
            width: 300px;
            height: 0px;
        }

        .auto-style1:hover {
            color: goldenrod;
            transition: all .5s;
        }

        .auto-style2:hover {
            color: goldenrod;
            transition: all .5s;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <h1>Now Showing</h1>
            <a class="auto-style2" href="MovieList.aspx">Now Showing</a>
            <a class="auto-style1" href="MovieComingSoon.aspx">Coming Soon</a>
        </div>


        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="row">
            <asp:ListView ID="Movie" runat="server">
                <ItemTemplate>
                    <div class="column">
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
    </form>
</asp:Content>
