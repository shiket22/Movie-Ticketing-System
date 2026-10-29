<%@ Page Title="Coming soon - SSC Cinema" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="MovieComingSoon.aspx.cs" Inherits="Movie_Ticketing_System.MovieComingSoon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page">
            <h1 class="page-title">Movies</h1>
            <div class="tabs">
                <a href="MovieList.aspx">Now Showing</a>
                <a href="MovieComingSoon.aspx" class="active">Coming Soon</a>
            </div>
            <asp:ListView ID="Movie" runat="server">
                <LayoutTemplate>
                    <div class="movie-grid">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="movie-card">
                        <asp:ImageButton ID="movieImage" runat="server" CssClass="poster" AlternateText='<%# Eval("MovieName") %>' ImageUrl='<%# Eval("Movie") %>' PostBackUrl='<%# "MovieDetailsComingSoon.aspx?MovieID=" + Eval("Id") %>' />
                        <h3><%# Eval("MovieName") %></h3>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <p class="empty-note">No upcoming movies have been announced yet.</p>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </form>
</asp:Content>
