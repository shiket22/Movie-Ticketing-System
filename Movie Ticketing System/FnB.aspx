<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="FnB.aspx.cs" Inherits="Movie_Ticketing_System.FnB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/style.css" />
<style>
    /*body {
        font-family: "Georgia" !important;
        
        padding: 0;
        margin-left: 3%;
        height: 100vh;
        width: 94%;
        background-repeat: no-repeat;
        background-size: cover;
    }*/
    body {
        font-family: Georgia, sans-serif;
        font-weight: 300;
        font-size: 18px;
        line-height: 1.7;
        color: #c4c3ca;
        background-color: #1f2029;
        background-image: url(Images/CinameBackground1.jpg);
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
    }

    h1 {
        color: #ff8000;
        font-size: 20px;
        text-align: center;
        text-transform: uppercase;
        position: relative;
        margin: 0 0 20px;
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

    

    * {
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

    

    

    .auto-style1 {
        height: 66px;
    }

    .clear {
        padding-left:10px;
        padding-bottom:200px!Important;
    }

    .btnCancel {
        display: inline-block;
        font-size: 16px;
        text-decoration: none;
        padding: 6px 10px;
        transition: all .5s;
        margin: 5px;
    }

    .btnProceed {
        display: inline-block;
        background-color: goldenrod;
        font-size: 16px;
        color: white;
        text-decoration: none;
        padding: 6px 10px;
        transition: all .5s;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <body>
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style1" style="text-align: center;">
                    <h1 class="title">Foods & Snacks</h1>
                </td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="0px" CellPadding="100" Width="300px">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <div style="background-position: center; color: white; margin-left: 30%; margin-bottom: 30px; border-width: thick; border-radius: 6px; border-style: double; border-color: white; background-image: url('../images/foodBg.jpg'); background-repeat: no-repeat; text-align: center; width: 300px;">
                                <br />
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("FoodImage" )%>' Height="200px" Width="200px" BorderStyle="Inset" /><br />
                                <%#Eval("FoodName" )%><br />
                                RM <%#String.Format("{0:0.00}",Eval("Price"))%>
                                <br />
                                Quantity:
                                <asp:DropDownList ID="qtyFood" Style="color: black;" runat="server" FoodID='<%# Eval("FoodId") %>'>
                                    <asp:ListItem style="color: black;">1</asp:ListItem>
                                    <asp:ListItem style="color: black;">2</asp:ListItem>
                                    <asp:ListItem style="color: black;">3</asp:ListItem>
                                    <asp:ListItem style="color: black;">4</asp:ListItem>
                                    <asp:ListItem style="color: black;">5</asp:ListItem>
                                </asp:DropDownList><br />
                                <asp:Button ID="btnAddFood" Style="color: black; margin-top: 20px; width: 120px; background-color: yellow; border-radius: 8px;" runat="server" Text="Add to cart" FoodID='<%# Eval("FoodId") %>' OnClick="btnAddFood_Click" />
                                <br />
                                <br />
                            </div>
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <table width="50">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </SeparatorTemplate>

                    </asp:DataList>

                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FoodId, CategoryId, FoodName, Price, Description, FoodImage FROM Food
WHERE Food.CategoryId='CAT001'"></asp:SqlDataSource>
                </td>
                <td></td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td style="text-align: center;">
                    <h1 class="title">Drinks</h1>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="4" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="0px" CellPadding="100" Width="300px">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <div style="background-position: center; color: white; margin-left: 30%; margin-bottom: 30px; border-width: thick; border-radius: 6px; border-style: double; border-color: white; background-image: url('../images/foodBg.jpg'); background-repeat: no-repeat; text-align: center; width: 300px;">
                                <br />
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("FoodImage" )%>' Height="200px" Width="200px" BorderStyle="Inset" /><br />
                                <%#Eval("FoodName" )%><br />
                                RM <%#String.Format("{0:0.00}",Eval("Price"))%>
                                <br />
                                Quantity:
                                <asp:DropDownList ID="qtyDrink" runat="server" Style="color: black;" FoodID='<%# Eval("FoodId") %>'>
                                    <asp:ListItem style="color: black;">1</asp:ListItem>
                                    <asp:ListItem style="color: black;">2</asp:ListItem>
                                    <asp:ListItem style="color: black;">3</asp:ListItem>
                                    <asp:ListItem style="color: black;">4</asp:ListItem>
                                    <asp:ListItem style="color: black;">5</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:Button ID="btnAddDrink" Style="color: black; margin-top: 20px; width: 120px; background-color: yellow; border-radius: 8px;" runat="server" Text="Add to cart" FoodID='<%# Eval("FoodId") %>' OnClick="btnAddDrink_Click" />
                                <br />
                                <br />
                            </div>
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <table width="50">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </SeparatorTemplate>

                    </asp:DataList>
                                   
                   <asp:Button ID="btnBack" runat="server" Text="Back"  CssClass="btnCancel" OnClick="btnBack_Click" />
                   <asp:Button ID="btnProceed" runat="server" Text="Proceed" PostBackUrl="~/OrderCart.aspx" Width="100px" CssClass="btnProceed" />
               
                </td>
            </tr>
        </table>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FoodId, CategoryId, FoodName, Price, Description, FoodImage FROM Food
WHERE Food.CategoryId='CAT002'"></asp:SqlDataSource>
    </form>


</body>
</asp:Content>
