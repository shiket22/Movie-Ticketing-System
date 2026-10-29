<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addHall.aspx.cs" Inherits="Movie_Ticketing_System.addHall" %>

<!DOCTYPE html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Hall</title>
    <link rel="stylesheet" href="https://fonts.google.com/specimen/Roboto">
    <link rel="stylesheet" href="https://technext.github.io/product-admin/css/fontawesome.min.css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../sass/style.scss" type="text/css" />
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/icon.css" type="text/css" />

    <style>
        body {
            font-family: Georgia, sans-serif;
            font-weight: 300;
            font-size: 18px;
            line-height: 1.7;
            padding: 0;
            background-color: #f2f2f2;
            overflow-x: hidden;
        }

        .auto-style1 {
            position: relative;
            width: 85%;
            min-height: 1px;
            -webkit-box-flex: 0;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 100px;
            top: 50px;
            padding-left: 15px;
            padding-right: 15px;
            height: 657px;
        }

        .auto-style2 {
            position: relative;
            width: 100%;
            min-height: 1px;
            -webkit-box-flex: 0;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            top: 30px;
            text-align: center;
            padding-left: 30px;
            padding-right: 15px;
        }

        .auto-style3 {
            z-index: -1;
            height: 750px;
        }

        .auto-style4 {
            width: 210px;
            height: 70px;
        }


        .auto-style10 {
            height: 69px;
            width: 272px;
        }

        .auto-style5 {
            width: 45%;
            height: 101px;
            margin: 0 0 0 27%;
        }

        .auto-style12 {
            height: 648px;
        }

        .auto-style14 {
            width: 255px;
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

        .selectform select:focus {
            background-color: grey;
        }

        .fh5co-logo .aHeader {
            font-size: 40px !important
        }

        .aHeader:not(.logo) {
            font-size: 20px !important;
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
            z-index: 1;
            text-align: left !important;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                width: 200px;
                font-size: 15px;
                z-index: 1;
            }

                .dropdown-content a:hover {
                    background-color: #ddd;
                }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .icons {
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
            z-index: 1;
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
    </style>

    <script>
     function readURL(input) {
             if (input.files && input.files[0]) {

                 var reader = new FileReader();

                 reader.onload = function (e) {
                     $('.image-upload-wrap').hide();

                     $('.file-upload-image').attr('src', e.target.result);
                     $('.file-upload-content').show();

                     $('.image-title').html(input.files[0].name);
                 };

                 reader.readAsDataURL(input.files[0]);

             } else {
                 removeUpload();
             }
        }


         function removeUpload() {
             $('.file-upload-input').replaceWith($('.file-upload-input').clone());
             $('.file-upload-content').hide();
             $('.image-upload-wrap').show();
         }
         $('.image-upload-wrap').bind('dragover', function () {
             $('.image-upload-wrap').addClass('image-dropping');
         });
         $('.image-upload-wrap').bind('dragleave', function () {
             $('.image-upload-wrap').removeClass('image-dropping');
         });
    </script>

</head>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>

    <form id="form1" runat="server">
        <div class="auto-style3">
            <input type="submit" id="btnBack" class="btn btn-success" value="Back" style="font-weight: bold;" formaction="../MaintainHall.aspx" />
            <div class="auto-style1">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto" style="background: #fff; border: 1px solid #ddd; border-radius: 8px;">
                    <div class="auto-style12">
                        <div class="auto-style2">
                            <h2 class="tm-block-title d-inline-block" style="font-size: 30px; font-weight: bold; color: #222">Add Hall</h2>
                        </div>
                        <br />
                        <table class="auto-style5">
                            <tr>
                                <td class="auto-style4">
                                    <label style="color: #444;">ID</label><br />
                                    <asp:TextBox ID="txtHallId" runat="server" Height="36px" Width="190px" placeholder="*** e.g.:1"></asp:TextBox> <br/>
                                </td>
                                <td class="auto-style10">
                                    <label style="color: #444;">Hall Name</label><br />
                                    <asp:TextBox ID="txtHallName" runat="server" Height="36px" Width="190px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="requiredName" runat="server" ControlToValidate="txtHallName" Display="Dynamic" ErrorMessage="*Hall Name is required" ForeColor="Red" Font-Size="8pt"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style14">
                                    <label style="color: #444;">Location</label><br />
                                    <asp:TextBox ID="txtLocation" runat="server" Height="36px" Width="190px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredLocation" runat="server" ControlToValidate="txtLocation" Display="Dynamic" ErrorMessage="*Location is required" Font-Size="8pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <br />
                                    <asp:Button ID="btnAdd" class="btn btn-primary btn-block text-uppercase" runat="server" Text="Add Hall Now" Width="150px" Height="50px" OnClick="btnAdd_Click" OnClientClick="Are you sure want to add this Hall?" /></td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>

    </form>


</body>
</html>

