<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="MovieDetailsComingSoon.aspx.cs" Inherits="Movie_Ticketing_System.MovieDetailsComingSoon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-image: url(Images/CinameBackground1.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .title {
            color: whitesmoke;
            text-align: center;
            font-weight: bold;
            font-family: 'Times New Roman', Times, serif;
            font-size: 40px;
        }

        .left {
            width: 50%;
            position: relative;
        }

        .movieDesc {
            border-bottom: 1px solid #E1E8EE;
            margin-bottom: 20px;
        }

            .movieDesc p {
                font-size: 20px;
                color: white;
                font-weight: 300;
                line-height: 24px;
            }

            .movieDesc h2 {
                color: white;
                font-weight: bold;
                font-family: sans-serif;
                font-size: 30px;
            }

            .movieDesc h4 {
                color: white;
                font-weight: bold;
                font-family: 'Times New Roman', Times, serif;
                font-size: 24px;
            }

        .desc {
            width: 1000px;
        }

        .picture {
            position: absolute;
            left: 8%;
            right: 31px;
            top: 100px;
        }

        .movieDetail {
            width: 70%;
            margin-left: 504px;
            margin-top: 170px;
            margin-bottom: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <h1 class="title">Movie Details</h1>
        </div>

        <div class="left">
            <div class="picture">
                <asp:Image ID="movieImage" runat="server" CssClass="movieImage" />
            </div>
        </div>

        <div class="movieDetail">
            <div class="movieDesc">
                <h2>
                    <asp:Label ID="lblMovieName" runat="server" CssClass="movieName" /></h2>
                <h4 class="desc">
                    <asp:Label ID="lblDescription" runat="server" CssClass="description" /></h4>
                <p>
                    <asp:Label ID="lblReleaseDate" runat="server" /></p>
                <p>
                    <asp:Label ID="lblDuration" runat="server" /></p>
                <p>
                    <asp:Label ID="lblGenre" runat="server" /></p>
                <p>
                    <asp:Label ID="lblLanguage" runat="server" /></p>
            </div>
        </div>
    </form>
</asp:Content>
