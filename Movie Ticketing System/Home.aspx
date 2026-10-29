<%@ Page Title="SSC Cinema" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Movie_Ticketing_System.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .crumbs {
            display: none;
        }

        .hero {
            display: flex;
            align-items: center;
            min-height: 420px;
            padding: 48px 32px;
            background: #0b0b0b url(Images/CinemaBackGround.jpg) center 30% / cover no-repeat;
        }

        .hero-text {
            width: 100%;
            max-width: 1160px;
            margin: 0 auto;
        }

        .hero h1 {
            margin: 0 0 8px;
            font-size: 40px;
            font-weight: 700;
        }

        .hero p {
            max-width: 440px;
            margin: 0 0 22px;
            color: #d6d2cc;
            font-size: 17px;
        }

        .section-head {
            display: flex;
            align-items: baseline;
            justify-content: space-between;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <section class="hero">
            <div class="hero-text">
                <h1>SSC Cinema</h1>
                <p>Pick a movie, choose your seats and add popcorn before you get here.</p>
                <a class="btn" href="MovieList.aspx">See all movies</a>
            </div>
        </section>

        <div class="page">
            <div class="section-head">
                <h2 class="section-title">Now showing</h2>
                <a href="MovieList.aspx">View all</a>
            </div>
            <asp:ListView ID="Movie" runat="server">
                <LayoutTemplate>
                    <div class="movie-grid">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="movie-card">
                        <asp:ImageButton ID="movieImage" runat="server" CssClass="poster" AlternateText='<%# Eval("MovieName") %>' ImageUrl='<%# Eval("Movie") %>' PostBackUrl='<%# "MovieDetails.aspx?MovieID=" + Eval("Id") %>' />
                        <h3><%# Eval("MovieName") %></h3>
                        <asp:Button ID="purchaseButton" runat="server" Text="Buy tickets" CssClass="btn" OnClick="cartBtn_Click" PostBackUrl='<%# "~/BookingMovie.aspx?MovieID=" + Eval("Id") %>' />
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </form>
</asp:Content>
