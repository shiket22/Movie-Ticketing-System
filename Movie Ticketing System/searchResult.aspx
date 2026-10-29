<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="searchResult.aspx.cs" Inherits="Movie_Ticketing_System.searchResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(Images/CinameBackground1.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        h1 {
            color: white;
            padding: 0 0 0 45%;
            margin-top: 40px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <h1>Search Result</h1>
        <div class="row">
        <asp:ListView ID="movieListView" runat="server">
            <ItemTemplate>
                <div class="column">
                    <h4 style="text-align: center; color: sandybrown; font-size: 20px;"><i><b><%# Eval("MovieName") %></b></i></h4> 
                    <a href="MovieDetails.aspx?MovieID=<%# Eval("Id") %>">
                        <div class="container">
                            <asp:ImageButton ID="movieImage" runat="server" CssClass="picture" ImageUrl='<%# Eval("Movie") %>' PostBackUrl='<%# "MovieDetails.aspx?MovieID=" + Eval("Id") %>' />
                            <div class="middle">
                                <div class="text"><%# Eval("MovieName") %></div>
                            </div>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:ListView>
            </div>
        <br /><br /><br /><br /><br />
    </form>
</asp:Content>
