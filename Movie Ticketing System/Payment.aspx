<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Movie_Ticketing_System.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,regular,500,600,700,800,900,200italic,300italic,italic,500italic,600italic,700italic,800italic,900italic" rel="stylesheet" />

    <style>
        :root {
            --onyx: hsl(0, 0%, 25%);
            --azure: hsl(219, 77%, 60%);
            --white: hsl(0, 0%, 100%);
            --platinum: hsl(0, 0%, 91%);
            --gainsboro: hsl(0, 0%, 90%);
            --red-salsa: hsl(0, 77%, 60%);
            --dim-gray: hsl(0, 0%, 39%);
            --davys-gray: hsl(0, 0%, 30%);
            --spanish-gray: hsl(0, 0%, 62%);
            --quick-silver: hsl(0, 0%, 64%);
            --f5-28: 28px;
            --f5-24: 24px;
            --fs-18: 18px;
            --f5-15: 15px;
            --fs-14: 14px;
            --fw-5: 500;
            --fw-6: 600;
            --fw-7: 700;
            --px: 60px;
            --radius: 5px;
        }


        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            font-family: 'Source Sans 3', sans-serif;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        button {
            border: none;
            background: none;
            font: inherit;
            cursor: pointer;
        }

        ion-icon, span {
            display: inline-block;
        }

        label {
            display: block;
        }

        input {
            font: inherit;
            width: 100%;
            border: none;
        }

            input:focus {
                outline: 2px solid var(--azure);
            }
            /**
            * Remove number input up & down button
            */

            input::-webkit-inner-spin-button,
            input::-webkit-outer-spin-button {
                appearance: none;
                -webkit-appearance: none;
                margin: 0;
            }

        /* Custom scrollbar style
             */

        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: transparent;
        }

        ::-webkit-scrollbar-thumb {
            background: hsl(0, 0%, 80%);
            border-radius: 10px;
        }

        -webkit-scrollbar-thumb:hover {
            background: hsl(0, 0%, 70%);
        }


        /*Main Conntainner*/
        .container {
            max-width: 1440px;
            min-height: 100vh;
            margin: auto;
            display: flex;
            flex-direction: column;
        }
        heading {
            font-size: var(--fs-28);
            font-weight: var(--fw-6);
            color: var(--onyx);
            border-bottom: 1px solid var(--gainsboro);
            padding: 20px var(--px);
            display: flex;
            align-items: center;
            gap: 20px;
        }
        heading ion-icon { font-size: 40px; }

        .item-flex {
            display: flex;
            flex-grow: 1;
        }
        /**
          * checkout section style
           */
        .checkout {
            width: 70%;
            padding:40px var(--px);
            background: var(--white);
            border-right: 1px solid var(--gainsboro);
        }

        section-heading {
            color: var(--onyx);
            margin-bottom: 30px;
            font-size: var(--fs-24);
            font-weight: var(--fw-5);
        }

        .payment-form {
            margin-bottom: 40px;
        }

        .payment-method {
            display: flex;
            align-items: center;
            gap: 30px;
            margin-bottom: 40px;
        }

            .payment-method .method {
                border: 1px solid var(--quick-silver);
                border-radius: var(--radius);
                width: 50%;
                display: flex;
                align-items: center;
                padding: 15px 30px;
                gap: 20px;
                cursor: pointer;
            }

            .payment-method .selected {
                border-color: var(--azure);
            }

            .payment-method .method ion-icon {
                font-size: 20px;
            }

            .payment-method .method .checkmark {
                margin-left: auto;
                color: var(--quick-silver);
            }

            .payment-method .method .fill {
                color: var(--azure);
            }

        .label-default {
            padding-left: 10px;
            margin-bottom: 5px;
            font-size: var(--fs-14);
            color: var(--spanish-gray);
        }
        .input-default {
            background: var(--platinum);
            border-radius: var(--radius);
            color: var(--davys-gray);
        }
        .payment-form input {
            padding: 10px 15px;
            font-size: var(--fs-18);
            font-weight: var(--fw-5);
        }

        cardholder-name,
        .card-number {
            margin-bottom: 10px;
        }

            .card-number input,
            .cvv input {
                letter-spacing: 3px;
            }

        .input-flex {
            display: flex;
            align-items: center;
            gap: 30px;
        }

            .input-flex .expire-date, 
            .input-flex .cvv {
                width: 50%;
            }

        .expire-date .input-flex {
            color: var(--spanish-gray);
            gap: 5px;
        }

        .expire-date .input-flex input {
            text-align: center;
        }

        .btn {
            border-radius: var(--radius);
        }



        .btn-success {
            background: #28a745;
            font-weight: var(--fw-5);
            color: #212529;
            padding: 13px 45px;
            margin-right: 10px;

        }

            .btn-success b {
                
            }


            .btn-success:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }

        .btn-warning {
            background-color: #ffc107;
            font-weight: var(--fw-5);
            color: #212529;
            border-color: #ffc107;
            padding: 13px 45px;
        }

            .btn-warning:hover {
                background-color: #e0a800;
                border-color: #d39e00;
            }

            /* 
                Cart
            */

        .transaction {
            width: 40%;
            height:80%;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
        }

        .transaction-detail-box {
            padding: 40px var(--px);
            margin-bottom: auto; 
        }

        transaction-card:not(:last-child) {
            margin-bottom: 20px;
        }

        .transaction-card .card {
            position: relative;
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .card {
            border-radius: var(--radius);
            padding:10px;
        }

        .card .detail .movie-name {
            font-weight: var(--fw-6);
            font-size: var(--fs-15);
            color: var(--dim-gray);
            margin-bottom: 10px;
        }
            
        .card detail wrapper {
            display: flex;
            gap: 20px;
        }




        .discount-token {
            padding: 20px var(--px);
            border-top: 1px solid var(--gainsboro);
            border-bottom: 1px solid var(--gainsboro);
        }

        .wrapper-flex {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .wrapper-flex input {
            padding: 12px 15px;
            font-weight: var(--fw-6);
            letter-spacing: 2px;
        }

        .btn-outline {
            padding: 10px 25px;
            border: 1px solid var(--azure);
            color: var(--azure);
        }

        btn-outline:hover {
            background: var(--azure);
            color: var(--white);
        }

        .btn-outline:focus{
                            color: var(--white);
                background: var(--azure);
                outline: 2px solid var(--azure);
                outline-offset: 2px;
        }

        .amount {
            padding: 40px var(--px);
        }

            .amount > div {
                display: flex;
                justify-content: space-between;
            }

                .amount > div:not(:last-child) {
                    margin-bottom: 10px;
                }

            .amount .total {
                font-size: var(--fs-18);
                font-weight: var(--fw-7);
                color: var(--onyx);
            }
    </style>

</head>

<body>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <form id="form1" runat="server">
        <main class="container">
            <h1 class="heading">
                <ion-icon name="ticket"></ion-icon>
                Payment </h1>

            <div class="item-flex">
                <section class="checkout">
                    <h2 class="section-heading">Payment Details</h2>
                    <div class="payment-form">
                        <div class="payment-method">
                            <button class="method selected" id="creditCardBtn" type="button">
                                <ion-icon name="card"></ion-icon>
                                <span>Credit Card</span>
                                <ion-icon class="checkmark fill" name="checkmark-circle"></ion-icon>
                            </button>
                            <button class="method" id="paypalBtn" type="button">
                                <ion-icon name="logo-paypal"></ion-icon>
                                <span>PayPal</span>
                                <ion-icon class="checkmark" name="checkmark-circle-outline"></ion-icon>
                            </button>
                        </div>

                        <div class="cardholder-name">
                            <asp:Label ID="Label1" for="cc_name" class="label-default" runat="server" Text="Card Holder's Name"></asp:Label>
                            <asp:TextBox ID="txtName" class="input-default" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Card holder name is required" Display="Dynamic" ControlToValidate="txtName" ForeColor="#CC0000" ValidationGroup="submit"></asp:RequiredFieldValidator>
                        </div>

                        <div class="card-number">
                            <asp:Label ID="Label2" class="label-default" runat="server" Text="Card Number"></asp:Label>
                            <asp:TextBox ID="txtCardNum" class="input-default" runat="server" MaxLength="16"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Card Number is required" Display="Dynamic" ControlToValidate="txtCardNum" ForeColor="#CC0000" ValidationGroup="submit"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Card Number contains 16 number" ValidationExpression="[0-9]{16}" ControlToValidate="txtCardNum" Display="Dynamic" ForeColor="#CC0000" ValidationGroup="submit"></asp:RegularExpressionValidator>
                            <br />
                        </div>

                        <div class="input-flex">
                            <div class="expire-date">
                                <label for="expire-date" class="label-default">Expiration date</label>
                                <div class="input-flex">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Expire Month is required" Display="Dynamic" ControlToValidate="txtExpMonth" ForeColor="#CC0000" ValidationGroup="submit"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Expire Month must in range [1-12]" ControlToValidate="txtExpMonth" MaximumValue="12" MinimumValue="1" Type="Integer" ForeColor="#CC0000" ValidationGroup="submit"></asp:RangeValidator>
                                    <asp:TextBox ID="txtExpMonth" class="input-default" runat="server" MaxLength="2"></asp:TextBox>
                                    /<asp:TextBox ID="txtExpYear" class="input-default" runat="server" MaxLength="4"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Expire Year is required" Display="Dynamic" ControlToValidate="txtExpYear" ForeColor="#CC0000" ValidationGroup="submit"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Expire Year must in range [2024-2030]" ControlToValidate="txtExpYear" Display="Dynamic" MaximumValue="2030" MinimumValue="2024" Type="Integer" ForeColor="#CC0000" ValidationGroup="submit"></asp:RangeValidator>
                                </div>
                            </div>

                            <div class="cvv">
                                <label for="cvv" class="label-default">CVV</label>
                                <asp:TextBox ID="txtCVC" class="input-default" runat="server" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*CVC is required" ControlToValidate="txtCVC" Display="Dynamic" ForeColor="#CC0000" ValidationGroup="submit"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*CVC contains 3 number" Display="Dynamic" ForeColor="#CC0000" ControlToValidate="txtCVC" ValidationExpression="[0-9]{3}" ValidationGroup="submit"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <label class="label-default"><h3>Total Amount:</h3></label>
                            <asp:TextBox ID="txtAmount" Style="background-color: #fff;" class="input-default" runat="server" Enabled="True" ReadOnly="True"></asp:TextBox>
                    <hr>


                    </div>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-warning" Width="150px"  OnClick="btnCancel_Click"/>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" Width="150px" OnClick="btnSubmit_Click" ValidationGroup="submit"/>
                    

                </section>


                <section class="transaction">
                    <div class="transaction-detail-box">
                        <h2 class="section-heading">Transaction Detail</h2>

                        <div class="transaction-card">
                            <div class="card">
                                <div class="detail">
                                    <span>Title Of Film: </span><h4 class="movie-name"><asp:Label ID="lblMovName" runat="server"></asp:Label></h4>
                                    Cinema: <h4 class="movie-name">Kuala Lumpur - Setapak Central</h4>
                                    Show Date/Time: <h4 class="movie-name"><asp:Label ID="lblStartTime" runat="server"></asp:Label></h4>
                                    Hall: <h4 class="movie-name"><asp:Label ID="lblHall"  runat="server"></asp:Label></h4>
                                    Trans Date: <h4 class="movie-name"><asp:Label ID="lblCurrentDT"  runat="server"></asp:Label></h4>
                                    Trans ID: <h4 class="movie-name"><asp:Label ID="lblTranId"  runat="server"></asp:Label></h4>  
                                </div>
                            </div>
                        </div>

                        
                    </div>

                    <div class="wrapper">
                        <div class="discount-token">
                            <label for="discount-token" class="label-default">
                                Gift card/Discount code</label>
                            <div class="wrapper-flex">
                                <input type="text" name="discount-token" id="discount-token" class="input-default" />
                                <button class="btn btn-outline">Apply</button>
                            </div>
                        </div>

                        <div class="amount">
                            <div class="subtotal">
                                <span>Subtotal</span><span>RM<span id="subtotal"><asp:Label ID="lblSubTotal" runat="server"></asp:Label></span></span>
                            </div>
                            <div class="tax">
                                <span>Tax</span> <span>RM <span id="tax">0.00</span></span>
                            </div>
                            <div class="total">
                                <span>Total</span> <span>RM <span id="total"><asp:Label ID="lblAmount" runat="server"></asp:Label></span></span>
                            </div>
                        </div>
                        </div>
                </section>





            </div>
        </main>
    </form>


</body>
</html>
<script>
    // Get references to the buttons and the checkmark icons
    const creditCardBtn = document.getElementById("creditCardBtn");
    const paypalBtn = document.getElementById("paypalBtn");
    const creditCardCheckmark = document.querySelector("#creditCardBtn .checkmark");
    const paypalCheckmark = document.querySelector("#paypalBtn .checkmark");

    // Add click event listeners to the buttons
    creditCardBtn.addEventListener("click", function () {
        // Remove 'selected' class from all buttons
        creditCardBtn.classList.add("selected");
        paypalBtn.classList.remove("selected");

        // Toggle the checkmark icons
        creditCardCheckmark.classList.add("fill");
        paypalCheckmark.classList.remove("fill");

        // Set icon names
        creditCardCheckmark.setAttribute("name", "checkmark-circle");
        paypalCheckmark.setAttribute("name", "checkmark-circle-outline");
    });

    paypalBtn.addEventListener("click", function () {
        // Remove 'selected' class from all buttons
        paypalBtn.classList.add("selected");
        creditCardBtn.classList.remove("selected");

        // Toggle the checkmark icons
        paypalCheckmark.classList.add("fill");
        creditCardCheckmark.classList.remove("fill");

        // Set icon names
        paypalCheckmark.setAttribute("name", "checkmark-circle");
        creditCardCheckmark.setAttribute("name", "checkmark-circle-outline");
    });
</script>

