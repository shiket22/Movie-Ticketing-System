<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainMovie.aspx.cs" Inherits="Movie_Ticketing_System.MaintainMovie" %>

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

   
    </head>
<body>    
    <div class="wrapper">
        <div class="top_navbar">
            <div class="logo">
                <a href="#">Admin</a>
                </div>
        <div class="top_menu">
            <div class="home_link">
                <a href="#">
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

        <div style="background: #f5f5f5;">
        <div class="header">
            <section class="hero-wrap hero-wrap-2" style="height:70%;background:url('../Images/SSC Logo.png');background-size:320px;box-shadow: inset 0 0 0 50vw rgba(0,0,0,0.5);background-attachment: fixed;" data-stellar-background-ratio="0.5">

                <div class="container">
                    <h1 style="font-size:65px;text-align:center;margin-top:15%;color:white;text-shadow: 1px 1px 2px white, 0 0 25px blue, 0 0 5px darkblue;
                        font-weight: bold;">Maintain Movie</h1>
                </div>
                <br/><br/><br/><br/><br/><br/><br/>
            </section>
            <div style="background-color:darkgray;box-shadow: inset 0 0 0 50vw rgba(0,0,0,0.5);">
            <p></p>
        </div>
        </div>

            <form id="form1" runat="server">
            <div class="container-xl content" style="box-shadow: 5px 5px 5px 5px #888888;border-radius:2%;">
                <div class="auto-style4">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6"><h2 style="color:white;text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;"><b>Maintain Movie</b></h2></div>
                                <div class="col-sm-6">
                                    <asp:Button ID="btnAdd" class="btn btn-success" style="cursor: cell;" runat="server" Text="Add New Movie" PostBackUrl="~/addMovie.aspx" />
                                </div>
                            </div>
                        </div>



                        <table style="width:100%;">
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="#009900" Text="[lblMsg]" Font-Size="15pt"></asp:Label>
                                    <asp:Label ID="lblEMsg" runat="server" ForeColor="#CC0000" Text="[lblEMsg]" Font-Size="15pt"></asp:Label>
                                </td>
                            </tr>
                        </table>

                        <p style="color:black;font-weight:bold;font-size:15px;margin-bottom:10px;">Search Movie by ID&nbsp;&nbsp; :
                                <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" Width="180px" Height="25px"></asp:TextBox> &nbsp;&nbsp;<asp:Button ID="btnAll" style="background-color:yellow;font-size:13px;border-radius:6px;width:180px;" runat="server" Text="Show All Movie" Onclick="btnAll_Click" />
                        </p>
                        

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="111%" ForeColor="#333333" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="auto-style5" DataKeyNames="Id">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Movie Image" SortExpression="MovieImage">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Movie") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl='<%# Eval("Movie") %>' Width="129px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MovieName" HeaderText="Movie Name" SortExpression="MovieName" />
                                <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="DurationTime" HeaderText="Duration Time" SortExpression="DurationTime" />
                                <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                                <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" />
                                <asp:TemplateField HeaderText="Action" SortExpression="Id">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="cmdUpdate" runat="server" Text="Update" MovieID='<%# Eval("Id") %>' Height="43px" ImageUrl="~/Images/updateIcon.png" Width="48px"  OnClick="cmdUpdate_Click"  DataField="MovieId" />
                                        &nbsp;
                                        <asp:ImageButton ID="cmdDelete" runat="server" MovieID='<%# Eval("Id") %>' OnClick="cmdDelete_Click" DataField="Id" Height="44px" ImageUrl="~/Images/deleteIcon.png" 
                                            OnClientClick="return confirm('Are you sure you want to delete? This action cannot be undone.');" PostBackUrl="~/MaintainMovie.aspx" Width="51px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" Height="65px" />
                            
                            <EmptyDataRowStyle Width="65px" />
                            
                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" Width="65px" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" BorderStyle="Solid" Height="65px" Font-Size="15px" />
                            <PagerSettings FirstPageText="First" LastPageText="Last" />
                            <PagerStyle BackColor="#66FFFF" ForeColor="#3333CC" HorizontalAlign="Right" Height="30px" VerticalAlign="Middle" />
                            <RowStyle BackColor="#EFF3FB" Font-Size="Small" Height="60px" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" Wrap="False" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>

                        <p style="margin-left:45%;"><asp:Label ID="lblNoRecord" runat="server" Text="[lblNoRecord]" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="20pt" Font-Strikeout="False" ForeColor="#3333CC"></asp:Label></p>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MovieTicketingSystem.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Id, Movie, MovieName, ReleaseDate, Description, DurationTime, Genre, Language, Hall FROM Movie WHERE (Id = @search) OR (MovieName = @search) OR (Description = @search)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="search" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
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