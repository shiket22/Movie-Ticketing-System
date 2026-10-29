<%@ Page Title="Add hall - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addHall.aspx.cs" Inherits="Movie_Ticketing_System.addHall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <p class="crumb"><a href="MaintainHall.aspx">Halls</a> / Add hall</p>
                <h1>Add hall</h1>
            </div>
        </div>

        <div class="panel form-narrow">
            <div class="panel-head">
                <h2>Hall details</h2>
            </div>
            <div class="panel-body">
                <div class="form-grid form-grid-3">
                    <div class="field">
                        <label for="<%= txtHallId.ClientID %>">Hall ID</label>
                        <asp:TextBox ID="txtHallId" runat="server" CssClass="input" MaxLength="6" placeholder="MH010"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredId" runat="server" ControlToValidate="txtHallId" ErrorMessage="Enter an ID" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="idTaken" runat="server" ControlToValidate="txtHallId" ErrorMessage="That ID is already used" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:CustomValidator>
                        <p class="hint">Up to 6 characters.</p>
                    </div>
                    <div class="field">
                        <label for="<%= txtHallName.ClientID %>">Name</label>
                        <asp:TextBox ID="txtHallName" runat="server" CssClass="input" placeholder="Hall J"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredName" runat="server" ControlToValidate="txtHallName" ErrorMessage="Enter a name" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="field">
                        <label for="<%= txtLocation.ClientID %>">Location</label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="input" placeholder="Level 2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredLocation" runat="server" ControlToValidate="txtLocation" ErrorMessage="Enter a location" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <p class="note"><i class="ri-information-line"></i>A new hall gets 50 seats, numbered S1 to S50.</p>
            </div>
            <div class="panel-foot">
                <a class="btn btn-ghost" href="MaintainHall.aspx">Cancel</a>
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add hall" OnClick="btnAdd_Click" />
            </div>
        </div>
    </form>
</asp:Content>
