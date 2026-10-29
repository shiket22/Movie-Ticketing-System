<%@ Page Title="Cart - SSC Cinema" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="OrderCart.aspx.cs" Inherits="Movie_Ticketing_System.OrderCart1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .section-title .count {
            color: var(--muted);
            font-weight: 400;
        }

        .cart-table .thumb {
            display: block;
            width: 56px;
            height: 72px;
            border-radius: 4px;
            object-fit: cover;
        }

        .qty {
            display: inline-flex;
        }

        .qty-btn {
            width: 30px;
            height: 32px;
            border: 1px solid var(--line);
            background: var(--surface-raised);
            color: var(--text);
            font: inherit;
            cursor: pointer;
        }

        .qty-input {
            width: 46px;
            height: 32px;
            box-sizing: border-box;
            border: 1px solid var(--line);
            border-right: none;
            border-left: none;
            background: var(--surface);
            color: var(--text);
            font: inherit;
            text-align: center;
        }

        .remove-btn {
            width: 22px;
            height: 22px;
        }

        .cart-total {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 24px;
            margin-top: 32px;
            padding-top: 20px;
            border-top: 1px solid var(--line);
            font-size: 18px;
        }

            .cart-total strong {
                font-size: 24px;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page">
            <h1 class="page-title">Cart</h1>

            <h2 class="section-title">Tickets <span class="count">(<asp:Label ID="lblTotalSeat" runat="server" Text="[lblTotalSeat]"></asp:Label>)</span></h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingSeatId" DataSourceID="SqlDataSource1" GridLines="None" CssClass="data-table cart-table">
                <Columns>
                    <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Movie">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("MovieImage" )%>' CssClass="thumb" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MovieName" HeaderText="" SortExpression="MovieName" />
                    <asp:BoundField DataField="SeatNumber" HeaderText="Seat" SortExpression="SeatNumber" />
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            RM <%#String.Format("{0:0.00}",Eval("Price"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:ImageButton ID="cmdDelete" runat="server" CssClass="remove-btn" AlternateText="Remove" BookingSeatId='<%# Eval("BookingSeatId") %>' OnClick="cmdDelete_Click" OnClientClick="return confirm('Sure to remove from cart? This action cannot be undone.');" ImageUrl="~/images/deleteIcon.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
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

            <h2 class="section-title">Food &amp; drinks <span class="count">(<asp:Label ID="lblTotalMeal" runat="server" Text="[lblTotalMeal]"></asp:Label>)</span></h2>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingItemId" DataSourceID="SqlDataSource2" GridLines="None" CssClass="data-table cart-table">
                <Columns>
                    <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%#Eval("FoodImage" )%>' CssClass="thumb" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="FoodName" HeaderText="" SortExpression="FoodName" />
                    <asp:TemplateField HeaderText="Unit price">
                        <ItemTemplate>
                            RM <%#String.Format("{0:0.00}",Eval("Price"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <div class="qty">
                                <asp:Button ID="btnDecrease" runat="server" CssClass="qty-btn" OnClick="btnDecrease_Click" BookingItemID='<%# Eval("BookingItemId") %>' Text="-" /><asp:TextBox ID="txtFoodQty" runat="server" CssClass="qty-input" OnTextChanged="txtFoodQty_TextChanged" BookingItemID='<%# Eval("BookingItemId") %>' value='<%#Eval("Quantity" )%>' AutoPostBack="True"></asp:TextBox><asp:Button ID="btnIncrease" runat="server" CssClass="qty-btn" OnClick="btnIncrease_Click" BookingItemID='<%# Eval("BookingItemId") %>' Text="+" />
                            </div>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*Please enter number" ControlToValidate="txtFoodQty" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ForeColor="#e0645c"></asp:CompareValidator>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            RM <%#String.Format("{0:0.00}",(Double.Parse(Eval("Price").ToString())*Double.Parse(Eval("Quantity").ToString())))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:ImageButton ID="cmdDelete" runat="server" CssClass="remove-btn" AlternateText="Remove" BookingItemID='<%# Eval("BookingItemId") %>' OnClick="cmdDelete_Click" OnClientClick="return confirm('Sure to remove from cart? This action cannot be undone.');" ImageUrl="~/images/deleteIcon.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="
    SELECT BookingItem.BookingItemId, Food.FoodName, Food.FoodImage, Food.Price, BookingItem.Quantity FROM BookingItem 
INNER JOIN Food ON Food.FoodId=BookingItem.FoodId
WHERE BookingItem.BookingId=@BookingId
">
                <SelectParameters>
                    <asp:SessionParameter Name="BookingId" SessionField="OID" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="cart-total">
                <span>Total <strong>RM<asp:Label ID="lblTotal" runat="server" Text="[lblTotal]"></asp:Label></strong></span>
                <asp:Button ID="btnCheckOut" runat="server" Text="Checkout" CssClass="btn" PostBackUrl="Payment.aspx" />
            </div>
        </div>
    </form>
</asp:Content>
