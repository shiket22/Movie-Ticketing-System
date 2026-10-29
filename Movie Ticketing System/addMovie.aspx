<%@ Page Title="Add movie - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addMovie.aspx.cs" Inherits="Movie_Ticketing_System.addMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <p class="crumb"><a href="MaintainMovie.aspx">Movies</a> / Add movie</p>
                <h1>Add movie</h1>
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
                        <label for="<%= txtMovieId.ClientID %>">Movie ID</label>
                        <asp:TextBox ID="txtMovieId" runat="server" CssClass="input" ReadOnly="true"></asp:TextBox>
                        <p class="hint">Assigned automatically.</p>
                    </div>
                    <div class="field">
                        <label for="<%= txtReleaseDate.ClientID %>">Release date</label>
                        <asp:TextBox ID="txtReleaseDate" runat="server" CssClass="input" placeholder="2024-07-26"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredDate" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Enter the release date" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareDate" runat="server" ControlToValidate="txtReleaseDate" Type="Date" Operator="DataTypeCheck" ErrorMessage="Enter a valid date" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <div class="field wide">
                        <label for="<%= txtMovieName.ClientID %>">Movie name</label>
                        <asp:TextBox ID="txtMovieName" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredName" runat="server" ControlToValidate="txtMovieName" ErrorMessage="Enter the movie name" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
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
                        <label for="<%= txtDuration.ClientID %>">Duration</label>
                        <asp:TextBox ID="txtDuration" runat="server" CssClass="input" placeholder="1 Hour 45 Minutes"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredDuration" runat="server" ControlToValidate="txtDuration" ErrorMessage="Enter the duration" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field wide">
                        <label for="<%= txtDescription.ClientID %>">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="input" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Enter a short description" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-head">
                    <h2>Poster</h2>
                    <p>Portrait PNG or JPG.</p>
                </div>
                <div class="panel-body">
                    <label class="dropzone" for="<%= image.ClientID %>">
                        <img alt="" />
                        <span><i class="ri-image-add-line"></i>Choose a poster<small>or drop an image here</small></span>
                    </label>
                    <asp:FileUpload ID="image" runat="server" CssClass="file-input" accept="image/*" />
                    <p class="file-name"></p>
                    <asp:RequiredFieldValidator ID="requiredPoster" runat="server" ControlToValidate="image" ErrorMessage="Choose a poster image" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="image" ValidationExpression="(.)+\.((jpg)|(jpeg)|(png)|(JPG)|(JPEG)|(PNG))" ErrorMessage="Use a .png, .jpg or .jpeg file" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <a class="btn btn-ghost" href="MaintainMovie.aspx">Cancel</a>
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add movie" OnClick="btnAdd_Click" />
        </div>
    </form>
</asp:Content>
