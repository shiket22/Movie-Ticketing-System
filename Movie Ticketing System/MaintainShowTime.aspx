<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainShowTime.aspx.cs" Inherits="Movie_Ticketing_System.admin.MaintainShowTime" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UFT-8" />
        <title>Admin</title>
    <link href="css/admin.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/07873a9147.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
 <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $(".hamburger").click(function () {
                $(".wrapper").toggleClass("active");


            })
        });

    </script>

   
    <style type="text/css">
        .auto-style6 {
            margin-left: 0px;
            margin-right: 37px;
            border-radius: 2%;
            margin-top: 2;
        }
    </style>

   
    </head>
<body>    
    <div class="wrapper">
        <div class="top_navbar">
            <div class="logo">
                <a href="#">Admin</a>
                </div>
        <div class="top_menu">
            <div class="home_link">
                <a href="LoginRegister.aspx?logout=1">
                    <span class="icon1"></span>
                   <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    <span>Log Out</span>
                </a>
                </div>
            


       </div>
      </div>
           
     
    <div class="main_body">
        <div class="sidebar_menu">
            <div class="inner__sidebar_menu">

           
            <ul>
                <li>
                    <a href="MaintainMovie.aspx">
                        <span class="icon">
                            <i class="fa-solid fa-gears fa-flip-both"></i>
                        </span>
                        <span class="list">MaintainMovie</span>
                    </a>
                </li>

                <li>
                      <a href="MaintainHall.aspx">
                    <span class="icon">
                        <i class="fa-solid fa-house-chimney-user"></i>
                    </span>
                    <span class="list">MaintainHall</span>
                    </a>
                </li>

                <li>
    <a href="MaintainShowTime.aspx">
        <span class="icon">
            <i class="fa-regular fa-calendar-days"></i>
        </span>
        <span class="list">MaintainShowTime</span>
    </a>
</li>
          </ul>

                <div class="hamburger">
                    <div class="inner_hamburger">
                        <span class="arrow">
                            <i class="fas fa-long-arrow-alt-left"
                                aria-hidden="true"></i>
                            <i class="fas fa-long-arrow-alt-right"
                                aria-hidden="true" style="display:none;"></i>
                        </span>

                    </div>

                </div>
 </div>

      </div>

        <div style="background: #f5f5f5; padding: 96px 24px 48px 274px;">

            <form id="form1" runat="server">
            <div class="container-xl content">
                <div class="auto-style4">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6"><h2><b>Maintain Show Time</b></h2></div>
                                <div class="col-sm-6">
                                    <asp:Button ID="btnAdd" class="btn btn-accent" runat="server" Text="Add New Show Time" PostBackUrl="MaintainShowTime.aspx" />
                                </div>
                            </div>
                        </div>



                        <table style="width:100%;">
                            <tr>
                                
                                <td>
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="#009900" Text="[lblMsg]" Font-Size="15pt"></asp:Label>
                                    <asp:Label ID="lblEMsg" runat="server" ForeColor="#CC0000" Text="[lblEMsg]" Font-Size="15pt"></asp:Label>
                                </td>
                        </table>

                        <p style="color:black;font-weight:bold;font-size:15px;margin-bottom:10px;">Search Movie&nbsp;&nbsp; :
                                <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" Width="180px" Height="25px"></asp:TextBox> &nbsp;&nbsp;<asp:Button ID="btnAll" CssClass="btn btn-outline-secondary btn-sm" runat="server" Text="Show All Movie" Onclick="btnAll_Click" />
                        </p>
                        

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="102%" ForeColor="#333333" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="auto-style6" DataKeyNames="Id" >
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>

                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
                                


                                <asp:BoundField DataField="MovieName" HeaderText="MovieName" SortExpression="MovieName" />
                                <asp:BoundField DataField="ShowTime" HeaderText="ShowTime" SortExpression="ShowTime" />
                                 <asp:TemplateField HeaderText="Action" SortExpression="Id">
     <EditItemTemplate>
         <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
     </EditItemTemplate>
     <ItemTemplate>
         <asp:ImageButton ID="cmdUpdate" runat="server" Text="Update" MovieID='<%# Eval("Id") %>' Height="43px" ImageUrl="~/Images/updateIcon.png" Width="48px" OnClick="cmdUpdate_Click" DataField="MovieId"  />
         &nbsp;
     <asp:ImageButton ID="cmdDelete" runat="server" MovieID='<%# Eval("Id") %>' OnClick="cmdDelete_Click" DataField="Id" Height="44px" ImageUrl="~/Images/deleteIcon.png"
         OnClientClick="return confirm('Are you sure you want to delete? This action cannot be undone.');" PostBackUrl="~/MaintainShowTime.aspx" Width="51px" />
     </ItemTemplate>
 </asp:TemplateField>
                                
    </Columns>
    <EditRowStyle BackColor="#FFF8E6" Height="65px" />
    
    <EmptyDataRowStyle Width="65px" />
    
    <FooterStyle BackColor="#2B2B2B" ForeColor="White" Font-Bold="True" Width="65px" />
    <HeaderStyle BackColor="#2B2B2B" Font-Bold="True" ForeColor="White" BorderStyle="Solid" Height="65px" Font-Size="15px" />
    <PagerSettings FirstPageText="First" LastPageText="Last" />
    <PagerStyle BackColor="#F0F0F0" ForeColor="#333333" HorizontalAlign="Right" Height="30px" VerticalAlign="Middle" />
    <RowStyle BackColor="#FFFFFF" Font-Size="Small" Height="60px" />
    <SelectedRowStyle BackColor="#FFF3D6" Font-Bold="True" ForeColor="#333333" Wrap="False" />
    <SortedAscendingCellStyle BackColor="#FAFAFA" />
    <SortedAscendingHeaderStyle BackColor="#3A3A3A" />
    <SortedDescendingCellStyle BackColor="#F2F2F2" />
    <SortedDescendingHeaderStyle BackColor="#3A3A3A" />
</asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [MovieName], [ShowTime] FROM [Movie]"></asp:SqlDataSource>
                        <p style="margin-left:45%;"><asp:Label ID="lblNoRecord" runat="server" Text="[lblNoRecord]" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="20pt" Font-Strikeout="False" ForeColor="#3333CC"></asp:Label></p>

                        <br />
                        <p style="margin-left:45%;">&nbsp;</p>

                    </div>
                </div>  
            </div>
            </form>
            <br />


            </div>
         </div>
         </div>
</body>
</html> 