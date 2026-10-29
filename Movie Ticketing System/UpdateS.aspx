<%@ Page Title="Seats - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateS.aspx.cs" Inherits="Movie_Ticketing_System.admin.UpdateS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <p class="crumb"><a href="MaintainHall.aspx">Halls</a> / Seats</p>
                <h1>Seats
                    <asp:Label ID="lblMovieName" runat="server" /></h1>
            </div>
        </div>

        <div class="panel form-narrow">
            <div class="panel-head">
                <h2>Seat map</h2>
                <p>Pick a hall to see which seats are taken.</p>
            </div>
            <div class="panel-body">
                <div class="field">
                    <asp:DropDownList ID="ddlMovieTime" runat="server" CssClass="input" AutoPostBack="true" OnSelectedIndexChanged="ddlMovies_SelectedIndexChanged">
                        <asp:ListItem Text="Select a hall" Value="" />
                        <asp:ListItem Text="Hall 1" Value="1" />
                        <asp:ListItem Text="Hall 2" Value="2" />
                        <asp:ListItem Text="Hall 3" Value="3" />
                    </asp:DropDownList>
                </div>
                <asp:Panel ID="pnlBooking" runat="server" Visible="false">
                    <p class="hint">Showing seats for
                        <asp:Label ID="lblShowTime" runat="server" /></p>
                    <div class="screen">SCREEN</div>
                    <asp:Panel ID="seatMap" runat="server">
                        <asp:DataList ID="SeatDataList" runat="server" CssClass="seat-grid" RepeatColumns="10" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <asp:Button ID="SeatButton" runat="server" Text='<%# Eval("SeatNumber") %>'
                                    Enabled='<%# Convert.ToBoolean(Eval("IsAvailable")) %>'
                                    CssClass='<%# Convert.ToBoolean(Eval("IsAvailable")) ? "seat-available" : "seat-booked" %>'
                                    CommandName="SelectSeat" CommandArgument='<%# Eval("SeatID") %>' />
                            </ItemTemplate>
                        </asp:DataList>
                    </asp:Panel>
                </asp:Panel>
            </div>
        </div>
    </form>
</asp:Content>
