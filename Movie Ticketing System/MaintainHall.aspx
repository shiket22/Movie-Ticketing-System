<%@ Page Title="Halls - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MaintainHall.aspx.cs" Inherits="Movie_Ticketing_System.MaintainHall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <h1>Halls</h1>
                <p class="count"><%= GridView1.Rows.Count == 1 ? "1 hall" : GridView1.Rows.Count + " halls" %></p>
            </div>
            <a class="btn btn-primary" href="addHall.aspx"><i class="ri-add-line"></i>Add hall</a>
        </div>

        <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success"></asp:Label>
        <asp:Label ID="lblEMsg" runat="server" CssClass="alert alert-error"></asp:Label>

        <div class="panel">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="admin-table" GridLines="None" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Hall">
                        <ItemTemplate>
                            <strong><%# Eval("Name") %></strong>
                            <span class="id">#<%# Eval("MovieHallId") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:TemplateField HeaderText="Seats">
                        <ItemTemplate>
                            <span class="tag"><%# Eval("SeatCount") %> seats</span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemStyle CssClass="actions" />
                        <ItemTemplate>
                            <asp:ImageButton ID="cmdUpdate" runat="server" CssClass="icon-btn" ImageUrl="~/Images/icon-edit.svg" AlternateText="Edit" ToolTip="Edit" CommandArgument='<%# Eval("MovieHallId") %>' OnClick="cmdUpdate_Click" />
                            <asp:ImageButton ID="cmdDelete" runat="server" CssClass="icon-btn" ImageUrl="~/Images/icon-delete.svg" AlternateText="Delete" ToolTip="Delete" MovieHallID='<%# Eval("MovieHallId") %>' OnClick="cmdDelete_Click"
                                OnClientClick="return confirm('Delete this hall? This cannot be undone.');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblNoRecord" runat="server" CssClass="empty-state"></asp:Label>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.SqlClient"
            SelectCommand="SELECT MovieHall.*, (SELECT COUNT(*) FROM Seats WHERE Seats.MovieHallId = MovieHall.MovieHallId) AS SeatCount FROM MovieHall ORDER BY MovieHallId"></asp:SqlDataSource>
    </form>
</asp:Content>
