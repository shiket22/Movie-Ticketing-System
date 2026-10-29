<%@ Page Title="Edit hall - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="updateHall.aspx.cs" Inherits="Movie_Ticketing_System.updateHall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <p class="crumb"><a href="MaintainHall.aspx">Halls</a> / Edit hall</p>
                <h1><%: txtName.Text %></h1>
            </div>
        </div>

        <div class="panel form-narrow">
            <div class="panel-head">
                <h2>Hall details</h2>
            </div>
            <div class="panel-body">
                <div class="form-grid form-grid-3">
                    <div class="field">
                        <label for="<%= txtId.ClientID %>">Hall ID</label>
                        <asp:TextBox ID="txtId" runat="server" CssClass="input" ReadOnly="true"></asp:TextBox>
                        <p class="hint">Can't be changed.</p>
                    </div>
                    <div class="field">
                        <label for="<%= txtName.ClientID %>">Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredName" runat="server" ControlToValidate="txtName" ErrorMessage="Enter a name" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field">
                        <label for="<%= txtLocation.ClientID %>">Location</label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredLocation" runat="server" ControlToValidate="txtLocation" ErrorMessage="Enter a location" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="panel-foot">
                <a class="btn btn-ghost" href="MaintainHall.aspx">Cancel</a>
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Save changes" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </form>
</asp:Content>
