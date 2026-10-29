<%@ Page Title="Movies - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MaintainMovie.aspx.cs" Inherits="Movie_Ticketing_System.MaintainMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <h1>Movies</h1>
                <p class="count"><%= GridView1.Rows.Count == 1 ? "1 movie" : GridView1.Rows.Count + " movies" %></p>
            </div>
            <a class="btn btn-primary" href="addMovie.aspx"><i class="ri-add-line"></i>Add movie</a>
        </div>

        <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success"></asp:Label>
        <asp:Label ID="lblEMsg" runat="server" CssClass="alert alert-error"></asp:Label>

        <div class="panel">
            <div class="toolbar">
                <div class="search">
                    <i class="ri-search-line"></i>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="input" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" placeholder="Movie ID or full name"></asp:TextBox>
                </div>
                <asp:Button ID="btnAll" runat="server" CssClass="btn btn-ghost" Text="Show all" OnClick="btnAll_Click" />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="admin-table" GridLines="None" DataKeyNames="Id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Movie">
                        <ItemTemplate>
                            <div class="movie-cell">
                                <asp:Image ID="Image1" runat="server" CssClass="thumb" ImageUrl='<%# Eval("Movie") %>' AlternateText="" />
                                <div>
                                    <strong><%# Eval("MovieName") %></strong>
                                    <div class="tags">
                                        <span class="tag tag-accent"><%# Eval("Genre") %></span>
                                        <span class="tag"><%# Eval("Language") %></span>
                                        <span class="tag"><%# Eval("DurationTime") %></span>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <span class="id">#<%# Eval("Id") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Release date">
                        <ItemStyle CssClass="nowrap" />
                        <ItemTemplate>
                            <%# Eval("ReleaseDate", "{0:d MMM yyyy}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <p class="clamp"><%# Eval("Description") %></p>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemStyle CssClass="actions" />
                        <ItemTemplate>
                            <asp:ImageButton ID="cmdUpdate" runat="server" CssClass="icon-btn" ImageUrl="~/Images/icon-edit.svg" AlternateText="Edit" ToolTip="Edit" MovieID='<%# Eval("Id") %>' OnClick="cmdUpdate_Click" />
                            <asp:ImageButton ID="cmdDelete" runat="server" CssClass="icon-btn" ImageUrl="~/Images/icon-delete.svg" AlternateText="Delete" ToolTip="Delete" MovieID='<%# Eval("Id") %>' OnClick="cmdDelete_Click"
                                OnClientClick="return confirm('Delete this movie? This cannot be undone.');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblNoRecord" runat="server" CssClass="empty-state"></asp:Label>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Id, Movie, MovieName, ReleaseDate, Description, DurationTime, Genre, Language, Hall FROM Movie WHERE (Id = @search) OR (MovieName = @search) OR (Description = @search)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="search" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
