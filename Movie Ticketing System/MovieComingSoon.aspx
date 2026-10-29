<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="MovieComingSoon.aspx.cs" Inherits="Movie_Ticketing_System.MovieComingSoon" %>

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
            padding: 50px 10px 5px 5px;
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
            top: 48%;
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

        .comingSoon {
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

        .nowShowing {
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

        .comingSoon:hover {
            color: goldenrod;
            transition: all .5s;
        }

        .nowShowing:hover {
            color: goldenrod;
            transition: all .5s;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <h1>Coming Soon</h1>
            <a class="nowShowing" href="MovieList.aspx">Now Showing</a>
            <a class="comingSoon" href="MovieComingSoon.aspx">Coming Soon</a>
        </div>
        <div class="row">
            <asp:ListView ID="Movie" runat="server">
                <ItemTemplate>
                    <div class="column">
                        <a href="MovieDetails.aspx?MovieID=<%# Eval("Id") %>">
                            <div class="container">
                                <asp:ImageButton ID="movieImage" runat="server" CssClass="picture" ImageUrl='<%# Eval("Movie") %>' PostBackUrl='<%# "MovieDetailsComingSoon.aspx?MovieID=" + Eval("Id") %>' />
                                <div class="middle">
                                    <div class="text"><%# Eval("MovieName") %></div>
                                </div>
                            </div>
                        </a>
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
