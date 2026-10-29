<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMovie.aspx.cs" Inherits="Movie_Ticketing_System.UpdateMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Update Movie</title>
<link rel="stylesheet" href="https://fonts.google.com/specimen/Roboto">
<link rel="stylesheet" href="https://technext.github.io/product-admin/css/fontawesome.min.css">
 <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/templatemo-style.css">
<link rel="stylesheet" href="../sass/style.scss" type="text/css"/>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/icon.css" type="text/css"/>

    <style>
        body {
            font-family: Georgia, sans-serif;
            font-size: 18px;
            background-color: #f2f2f2;
        }

        .file-upload {
            background-color: #ffffff;
            width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .file-upload-btn {
            width: 100%;
            margin: 0;
            color: #fff;
            background: #1FB264;
            border: none;
            padding: 10px;
            border-radius: 4px;
            border-bottom: 4px solid #15824B;
            transition: all .2s ease;
            outline: none;
            text-transform: uppercase;
            font-weight: 700;
        }

        .file-upload-btn:hover {
            background: #1AA059;
            color: #ffffff;
            transition: all .2s ease;
            cursor: pointer;
        }

        .file-upload-btn:active {
            border: 0;
            transition: all .2s ease;
        }

        .file-upload-content {
            display: none;
            text-align: center;
        }

        .file-upload-input {
            position: absolute;
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            outline: none;
            opacity: 0;
            cursor: pointer;
        }

        .image-upload-wrap {
            margin-top: 20px;
            border: 4px dashed #1FB264;
            position: relative;
        }

        .image-dropping,
        .image-upload-wrap:hover {
            background-color: #1FB264;
            border: 4px dashed #ffffff;
        }

        .image-title-wrap {
            padding: 0 15px 15px 15px;
            color: #222;
        }

        .drag-text {
            text-align: center;
        }

        .drag-text h3 {
            font-weight: 100;
            text-transform: uppercase;
            color: #15824B;
            padding: 60px 0;
        }

        .file-upload-image {
            max-height: 350px;
            max-width: 350px;
            margin: auto;
            padding: 20px;
        }

        .remove-image {
            width: 200px;
            margin: 0;
            color: #fff;
            background: #cd4535;
            border: none;
            padding: 10px;
            border-radius: 4px;
            border-bottom: 4px solid #b02818;
            transition: all .2s ease;
            outline: none;
            text-transform: uppercase;
            font-weight: 700;
        }

        .remove-image:hover {
            background: #c13b2a;
            color: #ffffff;
            transition: all .2s ease;
            cursor: pointer;
        }

        .remove-image:active {
            border: 0;
            transition: all .2s ease;
        }
        .selectform select:focus{
            background-color:grey;
        }

        .fh5co-logo .aHeader{
            font-size: 40px !important
        }
        .aHeader:not(.logo){
            font-size:20px !important;
            font-family: 'icomoon' !important;
        }

        .dropbtn {
            color: white;
            padding: 16px;
            font-size: 16px;
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
            z-index:1;
            text-align: left !important;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            width: 200px;
            font-size: 15px;
            z-index:1;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .icons{
            margin-top: 0 !important;
            padding-top: 0 !important;
            margin-left: 15px;
            height: 10px;
            font-size: 20px !important;
        }

        .fh5co-main-nav .fh5co-menu-1 a, .fh5co-main-nav .fh5co-menu-2 a, .fh5co-main-nav .fh5co-logo a {
            padding: 25px 10px;
            color: #130d08;
            display: -moz-inline-stack;
            display: inline-block;
            zoom: 1;
            z-index : 1;
        }

        #navbar {
            z-index: 1;

        }

        .sticky {
            position: fixed;
            top: 0;
            width: 100%;
        }

        .sticky + .content {
            padding-top: 60px;
        }

        .auto-style7 {
            display: block;
            width: 59%;
            font-size: 14px;
            line-height: 1.42857;
            color: #555555;
            background-clip: padding-box;
            border-radius: 4px;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            height: 42px;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            font-weight: 300;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            border: 1px solid #ccc;
            padding: 10px 20px;
            background: #fff;
            margin-left:30px;
        }
        .auto-style9 {
            height: 111px;
            width: 181px;
        }
        .auto-style11 {
            width: 30px;
            height: 19px;
        }
        .auto-style111 {
            width: 30px;
            height: 19px;
            margin-left:0px;
        }

        .auto-style13 {
            width: 99%
        }

        .auto-style14 {
            width: 316px;
            height: 273px;
        }

        .auto-style16 {
            width: 22%;
            height: 88px;
        }
        .auto-style18 {
            width: 15%;
            height: 111px;
        }

        .auto-style21 {
            width: 93px;
            height: 19px;
        }

        .auto-style22 {
            height: 185px;
            width: 15%;
        }
        .auto-style23 {
            height: 185px;
        }
        
        .auto-style29 {
            height: 88px;
        }

        .auto-style35 {
            width: 22%;
        }
        .auto-style36 {
            width: 15%;
        }

        .auto-style37 {
            margin-left: 0px;
        }

        .first {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            position: relative;
            width: 85%;
            min-height: 1px;
            -webkit-box-flex: 0;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 100px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
            height: 657px;
        }

        .auto-style39 {
            height: 120px;
            width: 207px;
        }
        
        .auto-style40 {
            height: 120px;
            width: 181px;
        }
        
        </style>

</head>
    <body>
        <form id="form1" runat="server">
       

        <div class="container tm-mt-big tm-mb-big">
            
            <p style="text-align:right;font-size:20px;margin-top:0px;margin-bottom:0px;transform: translate(-18%);"><input type="submit" id="btnBack" class="btn btn-success" value="Back" style="font-weight:bold;" formaction="../MaintainMovie.aspx" /></p>
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">

                    <div class="first">

                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block" style="font-size:30px;font-weight:bold;color: #222"></h2>
                            </div>
                        </div>
                        <div class="row">
                            <table class="auto-style13">
                                <tr>
                                    <td class="auto-style35" rowspan="3">
                                        <asp:Image ID="img" style="border: 3px solid black; box-shadow: 3px 3px 3px 3px #888888;" class="auto-style14" runat="server" />
                                        </td>
                                    
                                    <td class="auto-style39">
                                        <label style="color: #444;" class="auto-style11">Movie ID</label><br />
                                        <asp:TextBox ID="txtId" runat="server" Height="36px" Width="185px" class="auto-style7 form-control" ReadOnly="true" ToolTip="Id is not allowed to change"></asp:TextBox>
                                    </td>
                                    <td class="auto-style40">
                                        &nbsp;<br />
                                        <label style="color: #444;" class="auto-style11">
                                        <br />
                                        Release Date</label><br />
                                        <asp:TextBox ID="txtDate" runat="server"  Height="36px" Width="185px"  class="auto-style7 form-control"></asp:TextBox>
                                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredDate" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="*Release Date is required" Font-Size="8pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="auto-style11">
                                        &nbsp;<label style="color: #444;" class="auto-style11" "">DurationTime</label><br />
                                        <asp:TextBox ID="txtTime" runat="server" Height="36px" Width="280px" class="auto-style7 form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">
                                       <label style="color: #444;" class="auto-style11">Movie Name</label><br />
                                        <asp:TextBox ID="txtMovieName" runat="server" Height="36px" Width="185px"  class="auto-style7 form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredName" runat="server" ControlToValidate="txtMovieName" Display="Dynamic" ErrorMessage="*Movie Name is required" Font-Size="8pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <br />
                                    </td>
                                    <td class="auto-style9">
                                        <label style="color: #444;" class="auto-style11">Genre</label><br />
                                     <asp:DropDownList ID="GenreList" runat="server" Height="45px" Width="200px" class="auto-style7 form-control" Style="background-color: white; font-size: 13px; color: black;">
                                            <asp:ListItem>Advanture</asp:ListItem>
                                            <asp:ListItem>Action</asp:ListItem>
                                            <asp:ListItem>Horror</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                    </td>
                                    <td class="auto-style11" colspan="2">
                                        <label style="color: #444;" class="auto-style111">Language</label><br />
                                        <asp:DropDownList ID="LanguageList" runat="server" Height="45px" Width="200px" class="auto-style7 form-control" Style="background-color: white; font-size: 13px; color: black;">
                                            <asp:ListItem>English</asp:ListItem>
                                            <asp:ListItem>Malay</asp:ListItem>
                                            <asp:ListItem>Chinese</asp:ListItem>
                                        </asp:DropDownList>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="auto-style22">
                                       </td>

                                    <td class="auto-style23" colspan="2">
                                        <label style="color: #444;" class="auto-style21">Description</label><br />
                                        <asp:TextBox ID="txtDescription" runat="server" Rows="3" class="form-control" TextMode="MultiLine" CssClass="auto-style37" Width="460px"></asp:TextBox>

                                        <br />
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredDes" runat="server" ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="*Description is required" Font-Size="8pt" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16"></td>
                                    <td class="auto-style36"></td>
                                    <td colspan="2" class="auto-style29">
                                        <label style="color: #444;">Select an image
                                        </label>
                                        <asp:FileUpload ID="imgUpload" type="file" accept="image/*" class="form-control" runat="server" />
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Only .png/.jpg/.jpeg allowed only" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="(.)+\.((jpg)|(jpeg)|(png))" ControlToValidate="imgUpload"></asp:RegularExpressionValidator>
                                        <p style="color: red; font-size: 12px;">*Leave it blank if don't want update image</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style35">&nbsp;</td>
                                    <td class="auto-style36"></td>
                                    <td colspan="2">
                                        <asp:Button ID="btnUpdate" class="btn btn-primary btn-block text-uppercase" runat="server" Text="Update Movie" style="width: 99%; margin-left: 42" OnClick="btnUpdate_Click" /><br />
                                    </td>
                                </tr>
                                </table>
                            <br />

                            </div>

                        </div>
                    </div>
                </div>
            </div>
     

       </form>

                        </body>
