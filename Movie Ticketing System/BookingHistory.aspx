<%@ Page Title="Your bookings - SSC Cinema" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="Movie_Ticketing_System.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page">
            <h1 class="page-title">Your bookings</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="data-table" DataKeyNames="BookingId" GridLines="None" AllowPaging="True" AllowCustomPaging="True" DataSourceID="SqlDataSource1" EmptyDataText="You have no bookings yet.">
                <Columns>
                    <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BookingId" HeaderText="Booking ID" SortExpression="BookingId" ReadOnly="True" />
                    <asp:BoundField DataField="BookingDate" HeaderText="Booking date" SortExpression="BookingDate" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount (RM)" SortExpression="OrderDate" DataFormatString="{0:0.00}" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Booking.BookingId, [User].UserName, [User].UserId, Booking.BookingDate, Booking.Amount FROM Booking INNER JOIN [User] ON Booking.UserId = [User].UserId
WHERE [User].UserId = @UserId">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
