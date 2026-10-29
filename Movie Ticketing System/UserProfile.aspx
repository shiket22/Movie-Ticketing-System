<%@ Page Title="Profile - SSC Cinema" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Movie_Ticketing_System.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <style>
        .container {
            padding-top: 30px;
            padding-bottom: 50px;
        }

        #sideBar {
            padding: 15px;
            padding-left: 15px;
            border: 1px solid var(--line);
            border-radius: 6px;
            background-color: var(--surface);
            color: var(--muted);
        }



        .admin-content {
            margin-bottom: 20px;
            margin-left: 20px;
            border-radius: 10px;
        }

        .btn-update {
            padding: 10px;
            float: right;
            margin-right: 20px;
        }

        @-moz-document url-prefix() {
            fieldset {
                display: table-cell;
            }
        }

        .sideBar-Name {
            font-size: 30px;
            justify-content: center;
        }

        .sideBar-Name-Container {
            width: 100%;
            text-align: center;
            border-color: var(--line);
            border-bottom: solid;
            border-bottom-width: 2px;
            margin-bottom: 10px;
            margin-top: 5px;
        }

        .panel-title {
            font-size: 1.2em;
        }

        .logout {
            font-size: 15px;
        }

        .error {
            text-align: center;
            padding: 30px 20px;
            background: linear-gradient(90deg, white 30%, #FBE3E4 70%);
            color: #8A1F11;
        }

        @media print {

            body * {
                visibility: hidden;
            }

            .print-container, .print-container * {
                visibility: visible;
            }

            .print-container {
                position: absolute;
                left: 0px;
                top: 1px;
            }
        }

        /*        a.topnav:visited {
            color: #03cafc;
            background-color: transparent;
            text-decoration: none;
        }*/

        .loginIcon-container {
            border-radius: 50%;
            display: inline-flex;
            height: 50px;
            width: 100%;
            font-size: 80px;
            justify-content: center;
        }





        .nav-pills li a:hover {
            color: white;
            background-color: #404040;
        }

        .nav-pills.nav-stacked.admin-menu li.active a {
            background-color: #606060;
        }

        .nav a {
            color: gray;
        }

        .panel.panel-info {
            border-color: var(--line);
            background-color: var(--surface);
        }

            .panel.panel-info > .panel-heading {
                border-color: var(--line);
                background-color: var(--surface-raised);
                color: var(--text);
            }

        .panel .panel-body {
            background-color: var(--surface);
        }

        .btn-primary,
        .btn-primary:focus {
            border-color: var(--accent);
            background-color: var(--accent);
            color: var(--on-accent);
        }

            .btn-primary:hover,
            .btn-primary:active {
                border-color: var(--accent-hover);
                background-color: var(--accent-hover);
                color: var(--on-accent);
            }

        #profile {
            padding: 8px;
        }



        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

            .input-group label {
                margin-bottom: 5px;
            }

        .txtBox {
            padding: 8px;
            border: 1px solid var(--line);
            border-radius: 4px;
            background-color: var(--surface-raised);
            color: var(--text);
        }

        #change-password .btn-lg {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
            margin-left: auto;
        }

        .btn-lg {
            padding: 12px 24px;
        }


        .ticket-container {
            width: 43em;
            height: 24em;
            color: white;
            font-family: sans-serif;
            border-bottom: 1px solid;
            border-color: black;
        }

        .card {
            background: linear-gradient(to bottom, #d9a441 0%, #d9a441 26%, #ecedef 26%, #ecedef 100%);
            height: 20em;
            float: left;
            position: relative;
            padding: 1em;
            padding-top: 3em;
            margin-top: 30px;
        }

        .card-left {
            border-top-left-radius: 8px;
            border-bottom-left-radius: 8px;
            width: 20em;
        }

        .card-right {
            width: 11em;
            border-left: 0.18em dashed #fff;
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
        }

            .card-right::before,
            .card-right::after {
                content: "";
                position: absolute;
                display: block;
                width: 0.9em;
                height: 0.9em;
                background: #fff;
                border-radius: 50%;
                left: -0.5em;
            }

            .card-right::before {
                top: -0.4em;
            }

            .card-right::after {
                bottom: -0.4em;
            }

        .mainTitle {
            font-size: 1.2em;
            margin-top: 0;
            font-weight: bold;
        }

        h1 span {
            font-weight: normal;
        }

        .card-title {
            /*                   margin: -1em 0 0 0;*/
        }


        .title,
        .name,
        .seat,
        .time,
        .date {
            text-transform: uppercase;
            font-weight: normal;
        }

            .title h2,
            .name h2,
            .seat h2,
            .time h2,
            .date h2 {
                font-size: 1.3em;
                color: #000000;
                margin: 0;
                font-weight: bold;
            }

            .title span,
            .name span,
            .seat span,
            .time span,
            .date span {
                font-size: 0.8em;
                color: #000000;
            }

        .title {
            margin: 2em 0 0 0;
        }

        .title,
        .name,
        .date {
            width: 20em;
        }

        .name,
        .seat {
            margin: 0.7em 0 0 0;
        }

        .time {
            margin: 0.7em 0 0 1em;
        }

        .date {
            margin: 0.7em 0 0 0;
        }

        .seat,
        .time,
        .date {
            float: left;
        }

        .eye {
            position: relative;
            width: 2em;
            height: 1.5em;
            background: #fff;
            margin: 0 auto;
            border-radius: 1em/0.6em;
            z-index: 1;
        }

            .eye::before,
            .eye::after {
                content: "";
                display: block;
                position: absolute;
                border-radius: 50%;
            }

            .eye::before {
                width: 1em;
                background: #d9a441;
                height: 1em;
                z-index: 2;
                left: 8px;
                top: 4px;
            }

            .eye::after {
                width: 0.5em;
                height: 0.5em;
                background: #fff;
                z-index: 3;
                left: 12px;
                top: 8px;
            }

        .number {
            text-align: center;
            text-transform: uppercase;
        }

            .number h3 {
                color: #d9a441;
                margin: 0.9em 0 0 0;
                font-size: 2.5em;
            }

            .number span {
                display: block;
                color: #a2aeae;
            }

        .barcode {
            height: 2em;
            width: 0;
            margin: 2em 0 0 2em;
            box-shadow: 1px 0 0 1px #343434, 5px 0 0 1px #343434, 10px 0 0 1px #343434, 11px 0 0 1px #343434, 15px 0 0 1px #343434, 18px 0 0 1px #343434, 22px 0 0 1px #343434, 23px 0 0 1px #343434, 26px 0 0 1px #343434, 30px 0 0 1px #343434, 35px 0 0 1px #343434, 37px 0 0 1px #343434, 41px 0 0 1px #343434, 44px 0 0 1px #343434, 47px 0 0 1px #343434, 51px 0 0 1px #343434, 56px 0 0 1px #343434, 59px 0 0 1px #343434, 64px 0 0 1px #343434, 68px 0 0 1px #343434, 72px 0 0 1px #343434, 74px 0 0 1px #343434, 77px 0 0 1px #343434, 81px 0 0 1px #343434;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <div class="col-md-3" id="sideBar">
                    <div class="loginIcon-container">
                        <i class="ri-account-circle-fill"></i>
                    </div>
                    <div class="sideBar-Name-Container">
                        <span class="sideBar-Name">
                            <asp:Label ID="lblCusName" CssClass="sideBar-Nam" runat="server"></asp:Label></span>
                    </div>
                    <ul class="nav nav-pills nav-stacked admin-menu">
                        <li class="active"><a href="#" data-target-id="profile"><i class="glyphicon glyphicon-user"></i>Edit Profile</a></li>
                        <li><a href="#" data-target-id="change-password"><i class="glyphicon glyphicon-lock"></i>Change Password</a></li>
                        <li><a href="#" data-target-id="history"><i class="glyphicon glyphicon-calendar"></i>Ticket History</a></li>
                        <li><a href="#" data-target-id="logout"><i class="glyphicon glyphicon-log-out"></i>Logout</a></li>
                    </ul>
                </div>

                <div class="sideBarDetail">

                    <div class="col-md-8 admin-content" id="profile">
                        <div class="panel panel-info" style="margin: 1em;">
                            <div class="panel-heading">
                                <h2 class="panel-title">Name</h2>
                            </div>
                            <div class="panel-body">
                                <div class="input-group">
                                    <asp:TextBox ID="txtFullName" CssClass="txtBox" MaxLength="50" runat="server" placeholder="Full Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FullNameRequired" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required." ToolTip="Full Name is required." ValidationGroup="UpdateInfo" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Full Name is required.</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-info" style="margin: 1em;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Email</h3>
                            </div>
                            <div class="panel-body">
                                <div class="input-group">
                                    <asp:TextBox ID="txtEmail" CssClass="txtBox" MaxLength="50" runat="server" placeholder="Eamil Address"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="EmailRegex" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address format." ValidationGroup="UpdateInfo" Display="Dynamic" ForeColor="Red" Font-Size="Smaller" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b">*Invalid email address format.</asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="EmailCustomValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is already registered." ValidationGroup="UpdateInfo" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Email address is already registered.</asp:CustomValidator>
                                    <asp:RequiredFieldValidator ID="RegisterEmailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is required." ToolTip="Email address is required." ValidationGroup="UpdateInfo" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Email address is required.</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-info" style="margin: 1em;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Phone Number</h3>
                            </div>
                            <div class="panel-body">
                                <!-- Replace with user's phone number -->
                                <div class="input-group">
                                    <asp:TextBox ID="txtPhoneNumber" CssClass="txtBox" MaxLength="50" runat="server" placeholder="Phone Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="PhoneNumRegex" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Invalid phone number format." ValidationGroup="UpdateInfo" ForeColor="Red" ValidationExpression="^(010|011|012|013|014|016|017|019)\d{7,8}$" Display="Dynamic" Font-Size="Smaller">*Invalid phone number format.</asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="PhoneNumCustomValidator" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is already registered." ValidationGroup="UpdateInfo" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Phone Number is already registered.</asp:CustomValidator>
                                    <asp:RequiredFieldValidator ID="PhoneNumRequired" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required." ToolTip="Phone Number is required." ValidationGroup="UpdateInfo" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Phone Number is required.</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="UpdateInfoBtn" runat="server" Text="Update" CssClass="btn btn-primary btn-update" OnClick="UpdateInfoBtn_Click" ValidationGroup="UpdateInfo" />


                    </div>

                    <div class="col-md-8 admin-content" id="change-password" style="display: none;">
                        <div class="panel panel-info" style="margin: 1em;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Change Password</h3>
                            </div>
                            <div class="panel-body" id="changePassword">
                                <div class="input-group">
                                    <label>Current Password :</label>
                                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="txtBox" TextMode="Password"></asp:TextBox>
                                    <asp:CustomValidator ID="PasswardCustomValidator" runat="server" ControlToValidate="txtCurrentPassword" ErrorMessage="Wrong Password." ValidationGroup="ChangePassword" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Wrong Password.</asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="PasswordRegex" runat="server" ControlToValidate="txtCurrentPassword" ErrorMessage="Password must be at least 8 characters long and contain both letters and numbers." ValidationGroup="ChangePassword" Display="Dynamic" ForeColor="Red" Font-Size="Smaller" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$">*Password must at least 8 characters contain both letters and numbers.</asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RegisterPasswordRequired" runat="server" ControlToValidate="txtCurrentPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword" ForeColor="Red" Display="Dynamic" Font-Size="Smaller">*Password is required.</asp:RequiredFieldValidator>
                                </div>
                                <div class="input-group">
                                    <label>New Password :</label>
                                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="txtBox" TextMode="Password"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Password must be at least 8 characters long and contain both letters and numbers." ValidationGroup="ChangePassword" Display="Dynamic" ForeColor="Red" Font-Size="Smaller" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$">*Password must at least 8 characters contain both letters and numbers.</asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword" ForeColor="Red" Display="Dynamic" Font-Size="Smaller">*New Password is required.</asp:RequiredFieldValidator>

                                </div>
                                <div class="input-group">
                                    <label>Confirm Password :</label>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="txtBox" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="comparePassword" runat="server" ErrorMessage="*Password did no match." Style="color: red;" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ForeColor="Red" Font-Size="Smaller" ValidationGroup="ChangePassword"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="ChangePassword" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Comfirm Password is required.</asp:RequiredFieldValidator>
                                </div>
                                <asp:Button ID="ChangePasswordBtn" runat="server" Text="Change Password" CssClass="btn btn-primary btn-lg" OnClick="ChangePasswordBtn_Click" ValidationGroup="ChangePassword"/>
                            </div>
                        </div>
                    </div>


                    <!-- Other content sections with static content -->
                    <div class="col-md-8 admin-content" id="history" style="display: none;">
                        <!-- Static content for history -->
                        <div class="panel panel-info" style="margin: 1em;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Ticket History</h3>
                            </div>
                            <div class="panel-body">
                                <asp:DataList AutoPostBack="True" ID="TicketDataList" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Vertical">
                                    <ItemTemplate>
                                        <div class="ticket-container">
                                            <div class="card card-left">
                                                <div class="card-title">
                                                    <h1 class="mainTitle">SSC <span class="mainTitle1">Cinema</span></h1>
                                                </div>
                                                <div class="title">
                                                    <h2><%# Eval("MovieName") %></h2>
                                                    <span>movie</span>
                                                </div>
                                                <div class="name">
                                                    <h2><%# Eval("UserName") %></h2>
                                                    <span>name</span>
                                                </div>
                                                <div class="seat">
                                                    <h2><%# Eval("SeatNumber") %></h2>
                                                    <span>seat</span>
                                                </div>
                                                <div class="time">
                                                    <h2><%# Eval("ShowTime") %></h2>
                                                    <span>time</span>
                                                </div>
<%--                                                <div class="date">
                                                    <h2><%# Eval("ShowDate") %></h2>
                                                    <span>date</span>
                                                </div>--%>
                                            </div>
                                            <div class="card card-right">
                                                <div class="eye"></div>
                                                <div class="number">
                                                    <!--hall name-->
                                                    <h3><%# Eval("Name") %></h3>
                                                    <span>hall</span>
                                                </div>
                                                <div class="barcode"></div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="
                                    SELECT Booking.BookingId, [User].UserName, Seats.SeatNumber AS SeatNumber, ShowTime.StartTime AS ShowTime, Movie.MovieName, MovieHall.Name
                                    FROM Booking
                                    INNER JOIN BookingSeat ON Booking.BookingId = BookingSeat.BookingId
                                    INNER JOIN Seats ON BookingSeat.SeatId = Seats.SeatId
                                    INNER JOIN [User] ON Booking.UserId = [User].UserId
                                    INNER JOIN ShowTime ON Booking.ShowTimeId = ShowTime.ShowTimeId
                                    INNER JOIN Movie ON ShowTime.Id = Movie.Id
                                    INNER JOIN MovieHall ON Seats.MovieHallId = MovieHall.MovieHallId
                                    WHERE [User].UserId = @UserId">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="UserId" SessionField="UserId" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <div class="ticket-container">
                                    <div class="card card-left">
                                        <div class="card-title">
                                            <h1 class="mainTitle">Mandan <span class="mainTitle1">Cinema</span></h1>

                                        </div>
                                        <div class="title">
                                            <h2>GODZILLA X KONG: THE NEW EMPIRE</h2>
                                            <span>movie</span>

                                        </div>
                                        <div class="name">
                                            <h2>Adam Wingard</h2>
                                            <span>name</span>
                                        </div>
                                        <div class="seat">
                                            <h2>100, 101, 102</h2>
                                            <span>seat</span>
                                        </div>
                                        <div class="time">
                                            <h2>11.00 PM</h2>
                                            <span>time</span>
                                        </div>
                                        <div class="date">
                                            <h2>22 FEB 2024</h2>
                                            <span>date</span>
                                        </div>
                                    </div>


                                    <div class="card card-right">
                                        <div class="eye"></div>
                                        <div class="number">
                                            <h3>5</h3>
                                            <span>hall</span>
                                        </div>
                                        <div class="barcode"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8 admin-content" id="logout" style="display: none;">
                        <!-- Static content for logout confirmation -->
                        <div class="panel panel-info" style="margin: 1em;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Confirm Logout</h3>
                            </div>
                            <div class="panel-body">
                                Do you really want to logout?
                                <asp:Button ID="YesBtn" runat="server" Text="Yes" CssClass="btn btn-primary" OnClick="YesBtn_Click" />
                                <asp:Button ID="NoBtn"  runat="server" Text="No" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>

    <script>


        $(document).ready(function () {

            var navItems = $('.admin-menu li > a');
            var navListItems = $('.admin-menu li');
            var allWells = $('.admin-content');
            var allWellsExceptFirst = $('.admin-content:not(:first)');
            allWellsExceptFirst.hide();
            navItems.click(function (e) {
                e.preventDefault();
                navListItems.removeClass('active');
                $(this).closest('li').addClass('active');
                allWells.hide();
                var target = $(this).attr('data-target-id');
                $('#' + target).show();
            });
        });
    </script>

</asp:Content>
