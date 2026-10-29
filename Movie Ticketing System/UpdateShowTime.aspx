<%@ Page Title="Edit show time - Admin" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateShowTime.aspx.cs" Inherits="Movie_Ticketing_System.UpdateShowTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page-head">
            <div>
                <p class="crumb"><a href="MaintainShowTime.aspx">Show times</a> / Edit show time</p>
                <h1><%: txtMovieName.Text %></h1>
            </div>
        </div>

        <div class="schedule-layout">
            <asp:Image ID="img" runat="server" CssClass="schedule-poster" AlternateText="" />
            <div class="panel">
                <div class="panel-head">
                    <h2>Schedule</h2>
                    <p>Choose the hall and the date and time it starts.</p>
                </div>
                <div class="panel-body form-grid">
                    <div class="field">
                        <label for="<%= txtId.ClientID %>">Movie ID</label>
                        <asp:TextBox ID="txtId" runat="server" CssClass="input" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="field">
                        <label for="<%= txtMovieName.ClientID %>">Movie</label>
                        <asp:TextBox ID="txtMovieName" runat="server" CssClass="input" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="field">
                        <label for="<%= hallList.ClientID %>">Hall</label>
                        <asp:DropDownList ID="hallList" runat="server" CssClass="input">
                            <asp:ListItem>Hall A</asp:ListItem>
                            <asp:ListItem>Hall B</asp:ListItem>
                            <asp:ListItem>Hall C</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field">
                        <label for="<%= txtShowTime.ClientID %>">Starts at</label>
                        <asp:TextBox ID="txtShowTime" runat="server" CssClass="input" placeholder="2024-05-08 14:30"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regDateFrom" ValidationExpression="(\d{2})/(\d{2})/(\d{4}) (\d{2}):(\d{2}):(\d{2})(\d{2})" ControlToValidate="txtShowTime" ValidationGroup="Promotion" runat="server" ErrorMessage="Invalid date" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredTime" runat="server" ControlToValidate="txtShowTime" ErrorMessage="Enter the date and time" CssClass="error" ForeColor="#C2453D" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="panel-foot">
                    <a class="btn btn-ghost" href="MaintainShowTime.aspx">Cancel</a>
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Save show time" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>
