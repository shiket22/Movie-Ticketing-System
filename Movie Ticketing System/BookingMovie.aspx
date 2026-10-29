<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="BookingMovie.aspx.cs" Inherits="Movie_Ticketing_System.BookingMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .seat-available {
            background-color: lightgreen;
            width: 30px;
            height: 30px;
            border: 1px solid black;
            margin: 13px 13px 13px 13px;
            text-align: center;
            cursor: pointer;
        }

        .seat-booked {
            background-color: lightgray;
            width: 30px;
            height: 30px;
            border: 1px solid black;
            margin: 13px 13px 13px 13px;
            text-align: center;
            cursor: not-allowed;
        }

        .seat-selected {
            background-color: lightblue;
            width: 30px;
            height: 30px;
            border: 1px solid black;
            margin: 13px 13px 13px 13px;
            text-align: center;
            cursor: pointer;
        }

        .seat {
            display: inline-block;
            margin: 5px;
        }

        /* Style for the form container */
        body {
            background-image: url(Images/CinameBackground1.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        #form1 {
            margin: 0 auto;
            max-width: 650px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        /* Style for the movie name heading */
        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        /* Style for the dropdown list */
        #ddlMovieTime {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Style for the panel containing booking information */
        #pnlBooking {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }

        /* Style for the showtime heading */
        h2 {
            font-size: 20px;
            color: #555;
            margin-bottom: 15px;
        }

        .seat {
            text-align: center;
            background-color: #f0f0f0;
        }

            .seat select h2 {
                width: 60%;
                margin: 100px auto 35px auto;
            }

        .exit {
            position: relative;
            height: 50px;
        }

            .exit:before, .exit:after {
                content: "EXIT";
                font-size: 14px;
                line-height: 18px;
                padding: 0px 2px 2px 2px;
                display: block;
                position: absolute;
                background: red;
                color: white;
                top: 50%;
                transform: translate(0, -50%);
                border-radius: 5px;
            }

            .exit:before {
                left: 10px;
            }

            .exit:after {
                right: 10px;
            }

        /* Style for the seat map panel */
        #seatMap {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 15px;
            text-align: center;
        }

        /* Style for the confirm seat button */
        .addToCart {
            display: flex;
            align-items: center;
            text-align: center;
            width: 40%;
            margin: auto auto 35px auto;
        }

        .btnConfirmSeat {
            display: inline-block;
            background-color: goldenrod;
            font-size: 16px;
            color: white;
            text-decoration: none;
            padding: 6px 10px;
            transition: all .5s;
            margin: 5px;
        }

        .btnCancel {
            display: inline-block;
            font-size: 16px;
            text-decoration: none;
            padding: 6px 10px;
            transition: all .5s;
            margin: 5px;
        }

        /* Hover effect for the confirm seat button */
        .btnConfirmSeat:hover {
            background-color: darkgoldenrod;
        }
    </style>

    <form id="form1" runat="server">

        <div>
            <h1>Booking for Movie :
                <asp:Label ID="lblMovieName" runat="server" /></h1>
            <asp:DropDownList ID="ddlMovieTime" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMovieTime_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="StartTime" DataValueField="StartTime">
            </asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StartTime] FROM [ShowTime] WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="movieId" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />
            <br />

            <asp:Panel ID="pnlBooking" runat="server" Visible="false">
                <h2>Booking Seats for Showtime :
                    <asp:Label ID="lblShowTime" runat="server" /></h2>
                <h2>Movie Hall Name :
                    <asp:Label ID="lblMovieHallName" runat="server"></asp:Label></h2>

                <div class="seat">
                    <!-- Seat map will be generated here -->
                    <div class="select">
                        <h2>SCREEN</h2>
                    </div>
                    <div class="exit"></div>
                    <asp:Panel ID="seatMap" runat="server" Visible="false" AutoPostBack="True">
                        <asp:DataList  AutoPostBack="True" ID="SeatDataList" runat="server" RepeatColumns="10" RepeatDirection="Horizontal" Width="522px" OnItemCommand="SeatDataList_ItemCommand">
                            <ItemTemplate>
                                <asp:Button ID="SeatButton" runat="server" Text='<%# Eval("SeatNumber") %>'
                                    Enabled='<%# Convert.ToBoolean(Eval("IsAvailable")) %>'
                                    CssClass='<%# Convert.ToBoolean(Eval("IsAvailable")) ? "seat-available" : "seat-booked" %>'
                                    CommandName="SelectSeat" CommandArgument='<%# Eval("SeatId") %>'
                                    data-seat-number='<%# Eval("SeatNumber") %>' />
                            </ItemTemplate>
                        </asp:DataList>
                         
                        Selected seats: <span id="selectedSeatsList"></span>
                        <div class="addToCart">
                            <asp:Button ID="btnConfirmSeat" runat="server" Text="Confirm Seat"  CssClass="btnConfirmSeat"  OnClick="btnConfirmSeat_Click" />

                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancel" OnClick="btnCancel_Click" />
                        </div>
                    </asp:Panel>
                </div>
            </asp:Panel>

        </div>
        <asp:HiddenField ID="selectedSeatsHiddenField" runat="server" />

    </form>




</asp:Content>
