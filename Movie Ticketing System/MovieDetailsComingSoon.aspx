<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="MovieDetailsComingSoon.aspx.cs" Inherits="Movie_Ticketing_System.MovieDetailsComingSoon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .movie-detail {
            display: flex;
            gap: 48px;
            align-items: flex-start;
        }

            .movie-detail .movieImage {
                width: 300px;
                flex-shrink: 0;
                border-radius: 4px;
            }

        .movie-info h1 {
            margin: 0 0 12px;
            font-size: 32px;
            font-weight: 600;
        }

        .movie-info .description {
            display: block;
            max-width: 640px;
            margin-bottom: 24px;
            color: #d6d2cc;
            font-size: 17px;
        }

        .facts {
            margin: 0 0 28px;
            padding: 16px 0 0;
            border-top: 1px solid var(--line);
            list-style: none;
            color: var(--muted);
        }

            .facts li {
                margin-bottom: 6px;
            }

        @media (max-width: 700px) {
            .movie-detail {
                flex-direction: column;
                gap: 24px;
            }

                .movie-detail .movieImage {
                    width: 220px;
                }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page movie-detail">
            <asp:Image ID="movieImage" runat="server" CssClass="movieImage" />
            <div class="movie-info">
                <h1>
                    <asp:Label ID="lblMovieName" runat="server" CssClass="movieName" /></h1>
                <asp:Label ID="lblDescription" runat="server" CssClass="description" />
                <ul class="facts">
                    <li>
                        <asp:Label ID="lblReleaseDate" runat="server" /></li>
                    <li>
                        <asp:Label ID="lblDuration" runat="server" /></li>
                    <li>
                        <asp:Label ID="lblGenre" runat="server" /></li>
                    <li>
                        <asp:Label ID="lblLanguage" runat="server" /></li>
                </ul>
            </div>
        </div>
    </form>
</asp:Content>
