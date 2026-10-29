<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="FnB.aspx.cs" Inherits="Movie_Ticketing_System.FnB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .food-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 24px;
        }

            .food-grid > span {
                display: block;
            }

        .food-item {
            padding: 16px;
            border: 1px solid var(--line);
            border-radius: 6px;
            background: var(--surface);
        }

            .food-item img {
                display: block;
                width: 100%;
                aspect-ratio: 1;
                margin-bottom: 12px;
                border-radius: 4px;
                object-fit: cover;
            }

            .food-item h3 {
                margin: 0;
                font-size: 16px;
                font-weight: 600;
            }

            .food-item .price {
                margin: 2px 0 14px;
                color: var(--muted);
            }

            .food-item .order {
                display: flex;
                gap: 10px;
                align-items: center;
            }

            .food-item select {
                padding: 7px 8px;
                border: 1px solid var(--line);
                border-radius: 4px;
                background: var(--surface-raised);
                color: var(--text);
                font: inherit;
            }

        .page-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 40px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="page">
            <h1 class="page-title">Food &amp; Drinks</h1>

            <h2 class="section-title">Snacks</h2>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="food-grid">
                <ItemTemplate>
                    <div class="food-item">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("FoodImage" )%>' AlternateText='<%#Eval("FoodName" )%>' />
                        <h3><%#Eval("FoodName" )%></h3>
                        <p class="price">RM <%#String.Format("{0:0.00}",Eval("Price"))%></p>
                        <div class="order">
                            <asp:DropDownList ID="qtyFood" runat="server" FoodID='<%# Eval("FoodId") %>' aria-label="Quantity">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnAddFood" runat="server" Text="Add to cart" CssClass="btn" FoodID='<%# Eval("FoodId") %>' OnClick="btnAddFood_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FoodId, CategoryId, FoodName, Price, Description, FoodImage FROM Food
WHERE Food.CategoryId='CAT001'"></asp:SqlDataSource>

            <h2 class="section-title">Drinks</h2>
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="food-grid">
                <ItemTemplate>
                    <div class="food-item">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("FoodImage" )%>' AlternateText='<%#Eval("FoodName" )%>' />
                        <h3><%#Eval("FoodName" )%></h3>
                        <p class="price">RM <%#String.Format("{0:0.00}",Eval("Price"))%></p>
                        <div class="order">
                            <asp:DropDownList ID="qtyDrink" runat="server" FoodID='<%# Eval("FoodId") %>' aria-label="Quantity">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnAddDrink" runat="server" Text="Add to cart" CssClass="btn" FoodID='<%# Eval("FoodId") %>' OnClick="btnAddDrink_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FoodId, CategoryId, FoodName, Price, Description, FoodImage FROM Food
WHERE Food.CategoryId='CAT002'"></asp:SqlDataSource>

            <div class="page-actions">
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-outline" OnClick="btnBack_Click" />
                <asp:Button ID="btnProceed" runat="server" Text="Go to cart" PostBackUrl="~/OrderCart.aspx" CssClass="btn" />
            </div>
        </div>
    </form>
</asp:Content>
