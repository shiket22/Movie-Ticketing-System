<%@ Page Title="Show times - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MaintainShowTime.aspx.cs" Inherits="Movie_Ticketing_System.admin.MaintainShowTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <h1>Show times</h1>
                <p class="count">Pick a movie to set its hall and show time.</p>
            </div>
        </div>

        <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success"></asp:Label>
        <asp:Label ID="lblEMsg" runat="server" CssClass="alert alert-error"></asp:Label>

        <div class="panel">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="admin-table" GridLines="None" DataKeyNames="Id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Movie">
                        <ItemTemplate>
                            <div class="movie-cell">
                                <asp:Image ID="Image1" runat="server" CssClass="thumb" ImageUrl='<%# Eval("Movie") %>' AlternateText="" />
                                <div>
                                    <strong><%# Eval("MovieName") %></strong>
                                    <span class="id">#<%# Eval("Id") %></span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hall">
                        <ItemTemplate>
                            <%# string.IsNullOrEmpty(Eval("Hall") as string) ? "<span class=\"id\">None</span>" : Eval("Hall") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Show time">
                        <ItemTemplate>
                            <%# Eval("ShowTime") is DBNull ? "<span class=\"tag\">Not scheduled</span>" : "<span class=\"tag tag-success\">" + Eval("ShowTime", "{0:d MMM yyyy, h:mm tt}") + "</span>" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemStyle CssClass="actions" />
                        <ItemTemplate>
                            <asp:ImageButton ID="cmdUpdate" runat="server" CssClass="icon-btn" ImageUrl="~/Images/icon-edit.svg" AlternateText="Edit show time" ToolTip="Edit show time" MovieID='<%# Eval("Id") %>' OnClick="cmdUpdate_Click" />
                            <asp:ImageButton ID="cmdDelete" runat="server" CssClass="icon-btn" ImageUrl="~/Images/icon-clear.svg" AlternateText="Clear show time" ToolTip="Clear show time" MovieID='<%# Eval("Id") %>' OnClick="cmdDelete_Click"
                                OnClientClick="return confirm('Clear the show time for this movie?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblNoRecord" runat="server" CssClass="empty-state"></asp:Label>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Movie], [MovieName], [Hall], [ShowTime] FROM [Movie]"></asp:SqlDataSource>
    </form>
</asp:Content>
