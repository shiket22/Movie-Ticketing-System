<%@ Page Title="Edit movie - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateMovie.aspx.cs" Inherits="Movie_Ticketing_System.UpdateMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <p class="crumb"><a href="MaintainMovie.aspx">Movies</a> / Edit movie</p>
                <h1><%: txtMovieName.Text %></h1>
            </div>
        </div>

        <div class="form-layout">
            <div class="panel">
                <div class="panel-head">
                    <h2>Details</h2>
                    <p>Shown on the movie page and in the listings.</p>
                </div>
                <div class="panel-body form-grid">
                    <div class="field">
                        <label for="<%= txtId.ClientID %>">Movie ID</label>
                        <asp:TextBox ID="txtId" runat="server" CssClass="input" ReadOnly="true"></asp:TextBox>
                        <p class="hint">Can't be changed.</p>
                    </div>
                    <div class="field">
                        <label for="<%= txtDate.ClientID %>">Release date</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="input" placeholder="2024-07-26"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Enter the release date" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field wide">
                        <label for="<%= txtMovieName.ClientID %>">Movie name</label>
                        <asp:TextBox ID="txtMovieName" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredName" runat="server" ControlToValidate="txtMovieName" ErrorMessage="Enter the movie name" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field">
                        <label for="<%= GenreList.ClientID %>">Genre</label>
                        <asp:DropDownList ID="GenreList" runat="server" CssClass="input">
                            <asp:ListItem>Action</asp:ListItem>
                            <asp:ListItem>Adventure</asp:ListItem>
                            <asp:ListItem>Animation</asp:ListItem>
                            <asp:ListItem>Comedy</asp:ListItem>
                            <asp:ListItem>Drama</asp:ListItem>
                            <asp:ListItem>Horror</asp:ListItem>
                            <asp:ListItem>Science Fiction</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field">
                        <label for="<%= LanguageList.ClientID %>">Language</label>
                        <asp:DropDownList ID="LanguageList" runat="server" CssClass="input">
                            <asp:ListItem>English</asp:ListItem>
                            <asp:ListItem>Malay</asp:ListItem>
                            <asp:ListItem>Chinese</asp:ListItem>
                            <asp:ListItem>Mandarin</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field">
                        <label for="<%= txtTime.ClientID %>">Duration</label>
                        <asp:TextBox ID="txtTime" runat="server" CssClass="input" placeholder="1 Hour 45 Minutes"></asp:TextBox>
                    </div>
                    <div class="field wide">
                        <label for="<%= txtDescription.ClientID %>">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="input" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredDes" runat="server" ControlToValidate="txtDescription" ErrorMessage="Enter a short description" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-head">
                    <h2>Poster</h2>
                    <p>Leave it as is to keep the current poster.</p>
                </div>
                <div class="panel-body">
                    <label class="dropzone" for="<%= imgUpload.ClientID %>">
                        <asp:Image ID="img" runat="server" AlternateText="" />
                        <span><i class="ri-image-add-line"></i>Choose a poster<small>or drop an image here</small></span>
                    </label>
                    <asp:FileUpload ID="imgUpload" runat="server" CssClass="file-input" accept="image/*" />
                    <p class="file-name"></p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="imgUpload" ValidationExpression="(.)+\.((jpg)|(jpeg)|(png)|(JPG)|(JPEG)|(PNG))" ErrorMessage="Use a .png, .jpg or .jpeg file" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <a class="btn btn-ghost" href="MaintainMovie.aspx">Cancel</a>
            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Save changes" OnClick="btnUpdate_Click" />
        </div>
    </form>
</asp:Content>
