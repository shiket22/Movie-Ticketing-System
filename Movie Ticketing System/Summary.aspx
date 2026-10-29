<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="Movie_Ticketing_System.Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .summary-container {
            width: 80%;
            padding: 50px;
            background-color: black;
            margin: 50px auto;
            display: flex;
            flex-direction: column;
            color: whitesmoke;
        }

        .movie-selected,
        .order-summary {
            flex: 1;
        }

        .order-summary {
            border-top: solid 2px;
            border-top-color: gray;
            margin-top: 20px;
            padding: 10px;
        }

        .movie-selected {
            display: flex;
            align-items: center;
        }

        .movie-picture {
            flex: 0 0 auto;
            margin-right: 20px;
        }

        .movie-detail {
            margin-top: 30px;
            display: flex;
            flex-wrap: wrap;
        }

        .movie-info {
            flex: 1;
            padding: 10px;
            height: 25em;
        }

        .cinema,
        .hall,
        .time,
        .seat {
            width: 50%;
            margin-top: 10px;
        }

        .hall {
            order: 3;
        }

        .seat {
            order: 4;
        }

        .movie-selected img {
            max-width: 100%;
            height: 25em;
            width: 18em;
        }

        .title h2 {
            margin-bottom: 10px;
        }

        .name h2 {
            margin-top: 10px;
        }



        span {
            font-size: 15px;
            font-weight: lighter;
            color: gainsboro;
        }

        .label,
        .label-price {
            font-size: 25px;
            font-weight: bold;
            color: white;
        }


        .ticket-summary,
        .food-summary {
            margin-top: 20px;
        }

        .order-detail {
            display: flex;
        }

        .label-item-container,
        .label-price-container {
            margin-top: 2px;
            flex: 1;
        }

        .label-price-container {
            text-align: right;
        }

        .RM {
            font-size: 22px;
            font-weight: bold;
            color: white;
            display: inline-block;
            margin-top: auto;
            margin-right: 5px;
            margin-left: auto;
        }

        .total {
            display: inline-block;
            margin-top: auto;
            margin-right: 5px;
            margin-left: auto;
        }

        .sub-total {
            border-top: solid 3px;
            border-bottom: solid 3px;
            border-color: #CCCC00;
            margin-top: 20px;
            padding-top: 15px;
            display: flex;
            align-items: center;
            color: #FAFA00;
        }

        .Total-RM,
        .total-price {
            color: #FAFA00;
        }

        .order-summary > .ticket-summary > span,
        .order-summary > .food-summary > span {
            color: #CCCC00;
        }

        .checkout-footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 70px;
            background-color: #333;
            text-align: center;
            padding: 10px 0;
            border-top-left-radius: 50px;
            border-top-right-radius: 50px;
        }

        .checkout-button {
            background-color: yellow;
            color: black;
            border: none;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="summary-container">
            <div class="movie-selected">
                <div class="movie-picture">
                    <img src="Images\GodzillaxKongTheNewEmpire.png" />
                </div>
                <div class="movie-info">
                    <div class="title">
                        <h2>GODZILLA X KONG: THE NEW EMPIRE</h2>
                        <span>1 h 55 m</span> <span>| ENG</span>
                    </div>
                    <div class="movie-detail">
                        <div class="cinema">
                            <span>Cinema</span>
                            <h2>Kuala Lumpur - Setapak Central</h2>
                        </div>
                        <div class="time">
                            <span>Time</span>
                            <h2>Teu 2 Apr, 12.00 AM</h2>
                        </div>
                        <div class="hall">
                            <span>Hall</span>
                            <h2>Hall 7</h2>
                        </div>
                        <div class="seat">
                            <span>Seat(s)</span>
                            <h2>100, 101, 102</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="order-summary">
                <div class="ticket-summary">
                    <span>Ticket(s)</span>
                    <div class="order-detail">
                        <div class="label-item-container">
                            <asp:Label ID="AdultTicket" runat="server" Text="Adult" CssClass="label"></asp:Label>
                            <asp:Label ID="AdultTicketQuantiry" runat="server" Text=" x 1 " CssClass="label"></asp:Label>
                        </div>
                        <div class="label-price-container">
                            <p class="RM">RM </p>
                            <asp:Label ID="AdultTicketTotalPrice" runat="server" Text="20" CssClass="label-price"></asp:Label>
                        </div>
                    </div>
                    <div class="order-detail">
                        <div class="label-item-container">
                            <asp:Label ID="StudentTicket" runat="server" Text="Student" CssClass="label"></asp:Label>
                            <asp:Label ID="StudentTicketQuantiry" runat="server" Text=" x 1 " CssClass="label"></asp:Label>
                        </div>
                        <div class="label-price-container">
                            <p class="RM">RM </p>
                            <asp:Label ID="AStudentTicketTotalPrice" runat="server" Text="12" CssClass="label-price"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="food-summary">
                    <span>Food & Beverage</span>
                    <div class="order-detail">
                        <div class="label-item-container">
                            <asp:Label ID="Food" runat="server" Text="Cola" CssClass="label"></asp:Label>
                            <asp:Label ID="FoodQuantity" runat="server" Text=" x 1 " CssClass="label"></asp:Label>
                        </div>
                        <div class="label-price-container">
                            <p class="RM">RM </p>
                            <asp:Label ID="FoodPrice" runat="server" Text="6" CssClass="label-price"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sub-total">
                <div class="label-item-container">
                    <h1 class="total">Total</h1>
                </div>
                <div class="label-price-container">
                    <p class="RM Total-RM">RM </p>
                    <asp:Label ID="TotalPrice" runat="server" Text="123" CssClass="label-price total-price"></asp:Label>
                </div>
            </div>
        </div>
        <div class="checkout-footer">
            <asp:Button ID="btnCheckout" runat="server" CssClass="checkout-button" Text="Check Out" OnClick="btnCheckout_Click" />
        </div>
    </form>
</asp:Content>
