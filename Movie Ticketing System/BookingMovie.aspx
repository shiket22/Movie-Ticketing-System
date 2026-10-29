<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="BookingMovie.aspx.cs" Inherits="Movie_Ticketing_System.BookingMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .booking {
            max-width: 760px;
        }

            .booking label {
                display: block;
                margin-bottom: 6px;
                color: var(--muted);
                font-size: 14px;
            }

        .showtime-select {
            width: 100%;
            margin-bottom: 24px;
            padding: 10px 12px;
            border: 1px solid var(--line);
            border-radius: 4px;
            background: var(--surface-raised);
            color: var(--text);
            font: inherit;
        }

        .booking-panel {
            padding: 24px;
            border: 1px solid var(--line);
            border-radius: 6px;
            background: var(--surface);
        }

            .booking-panel .facts {
                display: flex;
                gap: 32px;
                margin: 0 0 28px;
                color: var(--muted);
            }

                .booking-panel .facts .fact {
                    color: var(--text);
                    font-weight: 600;
                }

        .screen {
            width: 70%;
            margin: 0 auto 8px;
            padding-top: 6px;
            border-top: 3px solid var(--muted);
            color: var(--muted);
            font-size: 12px;
            letter-spacing: 0.3em;
            text-align: center;
        }

        .exit {
            position: relative;
            height: 32px;
        }

            .exit:before, .exit:after {
                content: "EXIT";
                position: absolute;
                top: 50%;
                padding: 1px 4px;
                border: 1px solid #5e8f5e;
                border-radius: 3px;
                color: #8fc08f;
                font-size: 11px;
                transform: translate(0, -50%);
            }

            .exit:before {
                left: 0;
            }

            .exit:after {
                right: 0;
            }

        .seat-grid {
            margin: 0 auto;
        }

        .seat-available, .seat-booked {
            width: 36px;
            height: 30px;
            margin: 4px;
            border: 1px solid var(--line);
            border-radius: 6px 6px 3px 3px;
            font: inherit;
            font-size: 11px;
        }

        .seat-available {
            background: var(--surface-raised);
            color: var(--text);
            cursor: pointer;
        }

            .seat-available:hover {
                border-color: var(--accent);
                color: var(--accent);
            }

        .seat-booked {
            background: #111;
            color: #555;
            cursor: not-allowed;
        }

        .seat-actions {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 28px;
        }
    </style>
    <form id="form1" runat="server">
        <div class="page booking">
            <h1 class="page-title">
                <asp:Label ID="lblMovieName" runat="server" /></h1>
            <label>Show time</label>
            <asp:DropDownList ID="ddlMovieTime" runat="server" CssClass="showtime-select" AutoPostBack="True" OnSelectedIndexChanged="ddlMovieTime_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="StartTime" DataValueField="StartTime">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StartTime] FROM [ShowTime] WHERE [Id] = @Id">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="movieId" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="pnlBooking" runat="server" CssClass="booking-panel" Visible="false">
                <p class="facts">
                    <span>Show time:
                        <asp:Label ID="lblShowTime" runat="server" CssClass="fact" /></span>
                    <span>Hall:
                        <asp:Label ID="lblMovieHallName" runat="server" CssClass="fact"></asp:Label></span>
                </p>
                <div class="screen">SCREEN</div>
                <div class="exit"></div>
                <asp:Panel ID="seatMap" runat="server" Visible="false">
                    <asp:DataList ID="SeatDataList" runat="server" CssClass="seat-grid" RepeatColumns="10" RepeatDirection="Horizontal" OnItemCommand="SeatDataList_ItemCommand">
                        <ItemTemplate>
                            <asp:Button ID="SeatButton" runat="server" Text='<%# Eval("SeatNumber") %>'
                                Enabled='<%# Convert.ToBoolean(Eval("IsAvailable")) %>'
                                CssClass='<%# Convert.ToBoolean(Eval("IsAvailable")) ? "seat-available" : "seat-booked" %>'
                                CommandName="SelectSeat" CommandArgument='<%# Eval("SeatId") %>'
                                data-seat-number='<%# Eval("SeatNumber") %>' />
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="seat-actions">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-outline" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnConfirmSeat" runat="server" Text="Continue to food" CssClass="btn" OnClick="btnConfirmSeat_Click" />
                    </div>
                </asp:Panel>
            </asp:Panel>
        </div>
        <asp:HiddenField ID="selectedSeatsHiddenField" runat="server" />
    </form>
</asp:Content>
