<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateS.aspx.cs" Inherits="Movie_Ticketing_System.admin.UpdateS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
          <style>

              body {
    font-family: Georgia, sans-serif;
    font-weight: 300;
    font-size: 18px;
    line-height: 1.7;
    padding: 0;
   background-image: url('../images/cinema.png');
    overflow-x: hidden;
}

        .seat-available {
            background-color: lightgreen;
            width: 30px;
            height: 30px;
            border: 1px solid black;
            margin: 13px 13px 13px 13px;
            text-align: center;
            cursor: pointer;
        }

        .seat-booked {
            background-color: lightgray;
            width: 30px;
            height: 30px;
            border: 1px solid black;
            margin: 13px 13px 13px 13px;
            text-align: center;
            cursor: not-allowed;
        }

        .seat-selected {
            background-color: lightblue;
            width: 30px;
            height: 30px;
            border: 1px solid black;
            margin: 13px 13px 13px 13px;
            text-align: center;
            cursor: pointer;
        }

        .seat {
            display: inline-block;
            margin: 5px;
        }

        /* Style for the form container */
#form1 {
    margin: 0 auto;
    max-width: 650px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

/* Style for the movie name heading */
h1 {
    font-size: 24px;
    color: #333;
    margin-bottom: 20px;
}

/* Style for the dropdown list */
#ddlMovieTime {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Style for the panel containing booking information */
#pnlBooking {
    margin-top: 20px;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
}

/* Style for the showtime heading */
h2 {
    font-size: 20px;
    color: #555;
    margin-bottom: 15px;
}

.seat {
    text-align:center;
    background-color: #f0f0f0;
}

.seat select h2 {
  width: 60%;
  margin: 100px auto 35px auto;
}

.exit {
  position: relative;
  height: 50px;
}
.exit:before, .exit:after {
  content: "EXIT";
  font-size: 14px;
  line-height: 18px;
  padding: 0px 2px 2px 2px;
  display: block;
  position: absolute;
  background: red;
  color: white;
  top: 50%;
  transform: translate(0, -50%);
  border-radius: 5px;
}
.exit:before {
  left: 10px;
}
.exit:after {
  right: 10px;
}

/* Style for the seat map panel */
#seatMap {
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 15px;
}

/* Style for the confirm seat button */
.btnConfirmSeat {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

/* Hover effect for the confirm seat button */
.btnConfirmSeat:hover {
    background-color: #0056b3;
}
    </style>
</head>
<body>
     <form id="form1" runat="server">
     <div>
         <h1>Maintain Hall : <asp:Label ID="lblMovieName" runat="server" /></h1>
         <asp:DropDownList ID="ddlMovieTime" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMovies_SelectedIndexChanged">
             <asp:ListItem Text="Select a hall" Value="" />
             <asp:ListItem Text="Hall 1" Value="1" />
             <asp:ListItem Text="Hall 2" Value="2" />
             <asp:ListItem Text="Hall 3" Value="3" />
         </asp:DropDownList>
         
         <br /><br />
         
         <asp:Panel ID="pnlBooking" runat="server" Visible="false">
             <h2>Booking Seats for Showtime : <asp:Label ID="lblShowTime" runat="server" /></h2>
             <div class="seat">
                 <!-- Seat map will be generated here -->
                 <div class="select">
                     <h2>SCREEN</h2>
                 </div>
                 <div class="exit"></div>
                 <asp:Panel ID="seatMap" runat="server">
                     <asp:DataList ID="SeatDataList" runat="server" RepeatColumns="10" RepeatDirection="Horizontal" Width="522px">
                         <ItemTemplate>
                             <asp:Button ID="SeatButton" runat="server" Text='<%# Eval("SeatNumber") %>'
                                 Enabled='<%# Convert.ToBoolean(Eval("IsAvailable")) %>'
                                 CssClass='<%# Convert.ToBoolean(Eval("IsAvailable")) ? "seat-available" : "seat-booked" %>'
                                 CommandName="SelectSeat" CommandArgument='<%# Eval("SeatID") %>' />


                         </ItemTemplate>
                     </asp:DataList>
                     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/add.png" />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:ImageButton ID="ImageButton2" runat="server" Height="63px" ImageUrl="~/Images/minus.png" />
                 </asp:Panel>
             </div>
         </asp:Panel>

         

     </div>
 </form>
        <div>
        </div>
    
</body>
</html>