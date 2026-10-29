<%@ Page Title="Search - SSC Cinema" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="searchResult.aspx.cs" Inherits="Movie_Ticketing_System.searchResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page">
            <h1 class="page-title">Results for &ldquo;<%: Request.QueryString["searchResult"] %>&rdquo;</h1>
            <asp:ListView ID="movieListView" runat="server">
                <LayoutTemplate>
                    <div class="movie-grid">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="movie-card">
                        <asp:ImageButton ID="movieImage" runat="server" CssClass="poster" AlternateText='<%# Eval("MovieName") %>' ImageUrl='<%# Eval("Movie") %>' PostBackUrl='<%# "MovieDetails.aspx?MovieID=" + Eval("Id") %>' />
                        <h3><%# Eval("MovieName") %></h3>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <p class="empty-note">No movies match that name.</p>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </form>
</asp:Content>
