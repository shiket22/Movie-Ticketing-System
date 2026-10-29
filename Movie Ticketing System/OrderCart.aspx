<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="OrderCart.aspx.cs" Inherits="Movie_Ticketing_System.OrderCart1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Alpha - Order Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-family: "Georgia" !important;
            background-image: url(Images/CinameBackground1.jpg);
            padding: 0;
            width: 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            color: white !important;
        }

        h1, h2, h3, h4, h5, h6 {
            color: white;
        }

        .title {
            color: #ff8000;
            font-size: 40px;
            text-align: center;
            text-transform: uppercase;
            position: relative;
            margin: 20px 0 40px;
        }

            .title::after {
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

        th {
            font-size: 18px;
        }

        .box {
            width: 100%;
            height: 250px;
            margin-left: auto;
            margin-right: auto;
            background: linear-gradient(rgba(174, 182, 191,0.5), rgba(174, 182, 191,0.5));
            color: white;
        }

        .addBtn {
            background-color: yellow !important;
            color: black;
            border: 0px;
            padding: 12px;
        }

            .addBtn:hover {
                background-color: gold !important;
                color: orangered;
                text-decoration: none;
            }

        .actionIcon {
            color: black;
        }

            .actionIcon:hover {
                color: orangered;
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
                    color: white;
                    border-radius: 30px;
                }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        * {
            margin: 0;
            padding: 0;
            list-style-type: none;
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

        .shameless-plug {
            position: absolute;
            bottom: 10px;
            right: 0;
            padding: 8px 20px;
            color: white;
            text-decoration: none;
        }

        .btn {
            font-size: 16px;
            text-transform: uppercase;
            font-weight: 700;
        }

        .qty {
            background-color: white;
            font-size: 20px;
            font-weight: 300;
            width: 100%;
            padding: 5px;
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
                    color: white;
                    border-radius: 30px;
                }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .icons {
            margin-left: 15px;
            height: 10px;
            font-size: 20px !important;
        }

        * {
            padding: 0;
            list-style-type: none;
            margin-left: 0;
            margin-right: 0;
            margin-bottom: 0;
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

        .shameless-plug {
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
            background: linear-gradient( to left,currentColor 12px, transparent 0) no-repeat -1px 6px/18px 2px, linear-gradient( to left,currentColor 12px, transparent 0) no-repeat 6px 14px/11px 2px, linear-gradient( to left,currentColor 12px, transparent 0) no-repeat 0 2px/4px 2px, radial-gradient( circle,currentColor 60%, transparent 40%) no-repeat 12px 17px/4px 4px, radial-gradient( circle,currentColor 60%, transparent 40%) no-repeat 6px 17px/4px 4px
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

        .auto-style1 {
            height: 36px;
        }

        .auto-style2 {
            height: 35px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <form id="form1" runat="server">
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2">
                        <h1 class="title">Movie Ticket Cart</h1>
                        <p style="text-align: center;"><i>
                            <asp:Label ID="lblTotalSeat" runat="server" Text="[lblTotalSeat]"></asp:Label>
                            booked seat(s) in your cart</i></p>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td style="width: 10%;"></td>
                    <td colspan="1">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingSeatId" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="90%" BorderStyle="None" ForeColor="White" Font-Bold="False" HorizontalAlign="Center" Font-Size="Large">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Item" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <br />
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("MovieImage" )%>' Height="100px" Width="100px" BorderStyle="Inset" />
                                        <br />
                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:BoundField DataField="MovieName" HeaderText=" " SortExpression="MovieName" />

                                <asp:TemplateField HeaderText="Unit Price" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        RM <%#String.Format("{0:0.00}",Eval("Price"))%>
                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <%--<asp:BoundField DataField="SeatNumber" HeaderText=" " SortExpression="SeatNumber" />--%>
                                <asp:BoundField DataField="SeatNumber" HeaderText="SeatNumber" SortExpression="SeatNumber" />
                                <asp:TemplateField HeaderText="Total Price" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        RM <%#String.Format("{0:0.00}",(Double.Parse(Eval("Price").ToString())))%>

                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="cmdDelete" runat="server" BookingSeatId='<%# Eval("BookingSeatId") %>' OnClick="cmdDelete_Click" OnClientClick="return confirm('Sure to remove from cart? This action cannot be undone.');" ImageUrl="~/images/deleteIcon.png" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle Height="60px" HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Left" Font-Size="Large" />
                        </asp:GridView>
                    </td>
                </tr>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="
    SELECT BookingSeat.BookingSeatId, Movie.MovieName AS MovieName, Movie.Movie AS MovieImage, Movie.Price, Seats.SeatNumber AS SeatNumber
    FROM BookingSeat 
    INNER JOIN Seats ON Seats.SeatId = BookingSeat.SeatId
    INNER JOIN ShowTime ON Seats.ShowTimeId = ShowTime.ShowTimeId
    INNER JOIN Movie ON ShowTime.Id = Movie.Id
    WHERE BookingSeat.BookingId=@BookingId
">
                    <SelectParameters>
                        <asp:SessionParameter Name="BookingId" SessionField="OID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2">
                        <h1 class="title">Order Cart</h1>
                        <p style="text-align: center;"><i>
                            <asp:Label ID="lblTotalMeal" runat="server" Text="[lblTotalMeal]"></asp:Label>
                            meal(s) in your cart</i></p>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td style="width: 10%;"></td>
                    <td colspan="1">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingItemId" DataSourceID="SqlDataSource2" GridLines="Horizontal" Width="90%" BorderStyle="None" ForeColor="White" Font-Bold="False" HorizontalAlign="Center" Font-Size="Large">
                            <Columns>
                                <asp:TemplateField HeaderText="No." ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Meal" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <br />
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%#Eval("FoodImage" )%>' Height="100px" Width="100px" BorderStyle="Inset" />
                                        <br />
                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:BoundField DataField="FoodName" HeaderText=" " SortExpression="FoodName" />

                                <asp:TemplateField HeaderText="Unit Price" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        RM <%#String.Format("{0:0.00}",Eval("Price"))%>
                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <br />
                                        <asp:Button ID="btnDecrease" OnClick="btnDecrease_Click" Style="color: black;" BookingItemID='<%# Eval("BookingItemId") %>' runat="server" Text="  -  " Width="30px" /><asp:TextBox ID="txtFoodQty" OnTextChanged="txtFoodQty_TextChanged" BookingItemID='<%# Eval("BookingItemId") %>' runat="server" Style="color: black; text-align: center" value='<%#Eval("Quantity" )%>' Width="50px" AutoPostBack="True"></asp:TextBox><asp:Button ID="btnIncrease" Style="color: black;" OnClick="btnIncrease_Click" BookingItemID='<%# Eval("BookingItemId") %>' runat="server" Text=" + " Width="30px" />
                                        <br />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*Please enter number" ControlToValidate="txtFoodQty" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Price" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        RM <%#String.Format("{0:0.00}",(Double.Parse(Eval("Price").ToString())*Double.Parse(Eval("Quantity").ToString())))%>

                                        <footerstyle width="40%"></footerstyle>

                                        <headerstyle width="40%"></headerstyle>

                                        <itemstyle style="padding-left: 15px;" width="40%"></itemstyle>
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="cmdDelete" runat="server" BookingItemID='<%# Eval("BookingItemId") %>' OnClick="cmdDelete_Click" OnClientClick="return confirm('Sure to remove from cart? This action cannot be undone.');" ImageUrl="~/images/deleteIcon.png" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle Height="60px" HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Left" Font-Size="Large" />
                        </asp:GridView>
                    </td>
                </tr>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="
    SELECT BookingItem.BookingItemId, Food.FoodName, Food.FoodImage, Food.Price, BookingItem.Quantity FROM BookingItem 
INNER JOIN Food ON Food.FoodId=BookingItem.FoodId
WHERE BookingItem.BookingId=@BookingId
">
                    <SelectParameters>
                        <asp:SessionParameter Name="BookingId" SessionField="OID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                        <br />
                        <p style="color: ghostwhite; font-size: 30px; font-weight: bold; margin-left: 70%; margin-bottom: 0%; margin-right: 8%;">Total:</p>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                        <p style="color: ghostwhite; font-size: 30px; font-weight: bold; margin-left: 70%; margin-top: 0%; margin-bottom: 0%; margin-right: 8%;">RM<asp:Label ID="lblTotal" runat="server" Text="[lblTotal]"></asp:Label></p>
                        <br />
                        <p style="margin-left: 70%; margin-top: 0%; margin-right: 8%;">
                            <asp:Button ID="btnCheckOut" Style="width: 200px; font-size: 25px;" class="btn-primary mb-4 btn-lg pl-5 pr-5 addBtn" runat="server" Text="Checkout" PostBackUrl="Payment.aspx" /></p>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
            </table>

        </form>
    </body>

</asp:Content>
