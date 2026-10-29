<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="Movie_Ticketing_System.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <style>
            .button-28{
                margin-left: 1%;
            }
            body {
                font-family: "Georgia";
                background: linear-gradient(rgba(0,0,0,0.2), rgba(0,0,0,0.2)),url(Images/CinameBackground1.jpg);
                padding: 0;
                width: 100%;
                background-repeat: no-repeat;
                background-size:cover;
                background-attachment: fixed;
                font-size: 16px
            }
            h1 {
                color: #ff8000;
                font-size: 40px;
                text-align: center;
                text-transform: uppercase;
                position: relative;
                margin: 20px 0 40px;
            }
            h1::after {
                content: "";
                width: 100px;
                position: absolute;
                margin: 0 auto;
                height: 4px;
                border-radius: 1px;
                background: orange;
                left: 0;
                right: 0;
                bottom: -20px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);                
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: Cornsilk;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
            .dataTables_filter, .dataTables_info {
                display: none;
            }
            tr:hover{
                box-shadow: 0px 0px 3px 0px #888888;
            }

            th{
                text-align:center;
            }
            tr{
                text-align:center;
            }
            th a {
                display: block;
            }
            input[type="Submit"]:hover{
                color:darkblue;
                font-weight:bold;
                box-shadow: 0px 0px 18px #888888;
            }
            .dropbtn {
                color: black;
                padding: 16px;
                font-size: 18px;
                border: none;
            }
            .dropdown {
                position: relative;
                display: inline-block;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                text-align: left !important;
                border-radius: 30px;
            }
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                width: 200px;
                font-size: 15px;
            }
            .dropdown-content a:hover {
                background-color: orange;
                color:white;
                border-radius: 30px;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }
            .icons{

                margin-left: 15px;
                height: 10px;
                font-size: 20px !important;
            }
            * {
                margin: 0;
                padding: 0;
                list-style-type: none;
            }
            .nav {
                font-family: "Georgia";
                padding: 1rem 3rem 1.5rem;
                text-transform: uppercase;
                cursor: pointer;
                color: black;
                min-width: 80px;
                margin: auto;
            }

            .nav:active {
                transform: translateY(4px);
            }
            .navlink:hover{
                color: white;
                animation: spring 300ms ease-out;
                text-shadow: 0 -1px 0 #ef816c;
                font-weight: bold;
                border: 1px solid black;
                background-color: orange;
                border-radius: 30px;
                width:100%;
                text-decoration: none;
            }
            .navactive {
                color: orangered;
                font-weight: bold;
            }
            @keyframes spring {
                15% {
                    -webkit-transform-origin: center center;
                    -webkit-transform: scale(1.2, 1.1);
                }
                40% {
                    -webkit-transform-origin: center center;
                    -webkit-transform: scale(0.95, 0.95);
                }
                75% {
                    -webkit-transform-origin: center center;
                    -webkit-transform: scale(1.05, 1);
                }
                100% {
                    -webkit-transform-origin: center center;
                    -webkit-transform: scale(1, 1);
                }
            }
            .shameless-plug{
                position: absolute;
                bottom: 10px;
                right: 0;
                padding: 8px 20px;
                color: white;
                text-decoration: none;
            }
            .gg-shopping-cart {
                display: block;
                box-sizing: border-box;
                position: absolute;
                z-index: 5;
                margin-left: 20%;
                margin-top: 10%;
                transform: scale(var(--ggs,1));
                width: 20px;
                height: 21px;
                background:
                    linear-gradient(
                    to left,currentColor 12px,
                    transparent 0)
                    no-repeat -1px 6px/18px 2px,
                    linear-gradient(
                    to left,currentColor 12px,
                    transparent 0)
                    no-repeat 6px 14px/11px 2px,
                    linear-gradient(
                    to left,currentColor 12px,
                    transparent 0)
                    no-repeat 0 2px/4px 2px,
                    radial-gradient(
                    circle,currentColor 60%,
                    transparent 40%)
                    no-repeat 12px 17px/4px 4px,
                    radial-gradient(
                    circle,currentColor 60%,
                    transparent 40%)
                    no-repeat 6px 17px/4px 4px
            }
            .gg-shopping-cart::after,
            .gg-shopping-cart::before {
                content: "";
                display: block;
                position: absolute;
                box-sizing: border-box;
                width: 2px;
                height: 14px;
                background: currentColor;
                top: 2px;
                left: 4px;
                transform: skew(12deg)
            }
            .gg-shopping-cart::after {
                height: 10px;
                top: 6px;
                left: 16px;
                transform: skew(-12deg)
            }
            .gg-search {
                box-sizing: border-box;
                position: absolute;
                z-index: 6;
                margin-left: 20%;
                margin-top: 10%;
                display: block;
                transform: scale(var(--ggs,1));
                width: 16px;
                height: 16px;
                border: 2px solid;
                border-radius: 100%;
            }
            .gg-search::after {
                content: "";
                display: block;
                box-sizing: border-box;
                position: absolute;
                border-radius: 3px;
                width: 2px;
                height: 8px;
                background: currentColor;
                transform: rotate(-45deg);
                top: 10px;
                left: 12px
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
    <form id="form1" runat="server">
        <div id="table" class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                                <p style="color:white;font-weight:bold;margin-bottom:0;">Booking History :</p>
                        </div>
                        
                    </div></div>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="102%" AllowCustomPaging="True" ForeColor="#333333" HorizontalAlign="Center" CssClass="auto-style5" DataKeyNames="BookingId" GridLines="None" AllowPaging="True" DataSourceID="SqlDataSource1">
                                <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                    <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <footerstyle width="40%"></footerstyle>
                                            <headerstyle width="40%"></headerstyle>
                                            <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="BookingId" HeaderText="Booking Id" SortExpression="BookingId" HeaderStyle-Width="7%" ItemStyle-Width="7%" FooterStyle-Width="7%" ReadOnly="True">
                                        <FooterStyle Width="7%"></FooterStyle>
                                        <HeaderStyle Width="7%"></HeaderStyle>
                                        <ItemStyle Width="7%"></ItemStyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" SortExpression="BookingDate" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount(RM)" SortExpression="OrderDate" DataFormatString="{0:0.00}" />
                                

                                    <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <a href="BookingHistoryDetails.aspx?BookingId=<%#Eval("BookingId") %>&ordDate=<%#Eval("BookingDate") %>" style="font-size:14px;" class="btn btn-primary">
                                                View Order Details
                                            </a>
                                        </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>

                                </asp:TemplateField>

                           </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                            
                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" BorderStyle="Solid" Height="60px" />
                                <PagerSettings FirstPageText="First" LastPageText="Last" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" Font-Size="Small" Height="60px" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" Wrap="False" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>



                </div>
            </div>  
        </div>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Booking.BookingId, [User].UserName, [User].UserId, Booking.BookingDate, Booking.Amount FROM Booking INNER JOIN [User] ON Booking.UserId = [User].UserId
WHERE [User].UserId = @UserId">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
    </body>
</asp:Content>
