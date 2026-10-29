<%@ Page Title="" Language="C#" MasterPageFile="~/MovieTicketingSystem.Master" AutoEventWireup="true" CodeBehind="LoginRegister.aspx.cs" Inherits="Movie_Ticketing_System.LoginRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-register-content {
            display: flex;
            justify-content: center;
            padding: 48px 16px;
        }

        .container {
            position: relative;
            width: 960px;
            height: 600px;
            overflow: hidden;
            border: 1px solid var(--line);
            border-radius: 8px;
            background-color: var(--surface);
        }

        .form-container {
            position: absolute;
            width: 60%;
            height: 100%;
            padding: 0px 40px;
            transition: all 0.6s ease-in-out;
        }

        .sign-up-container {
            opacity: 0;
            z-index: 1;
        }

        .sign-in-container {
            z-index: 2;
        }

        .signUpAndLogin {
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 0px 50px;
            margin-right: 14%;
        }

            .signUpAndLogin h1 {
                margin: 0 0 6px;
                font-size: 26px;
                font-weight: 600;
            }

            .signUpAndLogin > span {
                margin-bottom: 18px;
                color: var(--muted);
                font-size: 14px;
            }

        .infield {
            position: relative;
            padding-top: 10px;
            width: 70%;
        }

        .errorMsg {
            width: 70%;
        }

        input.input1 {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 12px;
            border: 1px solid var(--line);
            border-radius: 4px;
            outline: none;
            background-color: var(--surface-raised);
            color: var(--text);
            font: inherit;
            font-size: 15px;
        }

            input.input1:focus {
                border-color: var(--accent);
            }

        .button1, .button2 {
            margin-top: 18px;
            padding: 10px 36px;
            border: 1px solid var(--accent);
            border-radius: 4px;
            background: var(--accent);
            color: var(--on-accent);
            font: inherit;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

            .button1:hover, .button2:hover {
                background: var(--accent-hover);
            }

        .overlay-container {
            position: absolute;
            top: 0;
            left: 60%;
            width: 40%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 9;
        }

        #overlayBtn {
            cursor: pointer;
            position: absolute;
            left: 50%;
            top: 352px;
            transform: translate(-50%);
            width: 150px;
            height: 42px;
            border: none;
            background: transparent;
        }

        .overlay {
            position: relative;
            background: #0f0f0f;
            color: var(--text);
            left: -150%;
            height: 100%;
            width: 250%;
            transition: transform 0.6s ease-in-out;
        }

        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0px 40px;
            text-align: center;
            height: 100%;
            width: 340px;
            transition: 0.6s ease-in-out;
        }

            .overlay-panel h1 {
                margin: 0;
                font-size: 24px;
                font-weight: 600;
            }

            .overlay-panel p {
                margin: 12px 0 28px;
                color: var(--muted);
                font-size: 15px;
            }

            .overlay-panel .button1 {
                width: 150px;
                margin: 0;
                padding: 10px 0;
                border-color: var(--line);
                background: transparent;
                color: var(--text);
            }

        .overlay-left {
            right: 60%;
            transform: translateX(-12%);
        }

        .overlay-right {
            right: 0;
            transform: translateX(0%);
        }

        .right-panel-active .overlay-container {
            transform: translateX(-150%);
        }

        .right-panel-active .overlay {
            transform: translateX(50%);
        }

        .right-panel-active .overlay-left {
            transform: translateX(25%);
        }

        .right-panel-active .overlay-right {
            transform: translateX(35%);
        }

        .right-panel-active .sign-in-container {
            transform: translateX(20%);
            opacity: 0;
        }

        .right-panel-active .sign-up-container {
            transform: translateX(66.7%);
            opacity: 1;
            z-index: 5;
            animation: show 0.6s;
        }

        @keyframes show {
            0%, 50% {
                opacity: 0;
                z-index: 1;
            }

            50.1%, 100% {
                opacity: 1;
                z-index: 5;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="login-register-content">
            <div class="container" id="container">
                <div class="form-container sign-up-container">
                    <div class="signUpAndLogin" style="margin-right: 25%">
                        <h1>Create Account</h1>
                        <span>All fields are required.</span>
                        <div class="infield">
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="input1" placeholder="Full Name"></asp:TextBox>
                        </div>
                        <div class="errorMsg">
                            <asp:RequiredFieldValidator ID="FullNameRequired" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required." ToolTip="Full Name is required." ValidationGroup="SignUp" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Full Name is required.</asp:RequiredFieldValidator>
                        </div>
                        <div class="infield">
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="input1" placeholder="Phone Number"></asp:TextBox>
                        </div>
                        <div class="errorMsg">
                            <asp:RegularExpressionValidator ID="PhoneNumRegex" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Invalid phone number format." ValidationGroup="SignUp" ForeColor="Red" ValidationExpression="^(010|011|012|013|014|016|017|019)\d{7,8}$" Display="Dynamic" Font-Size="Smaller">*Invalid phone number format.</asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="PhoneNumCustomValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Phone Number is already registered." ValidationGroup="SignUp" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Phone Number is already registered.</asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="PhoneNumRequired" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required." ToolTip="Phone Number is required." ValidationGroup="SignUp" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Phone Number is required.</asp:RequiredFieldValidator>
                        </div>
                        <div class="infield">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input1" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="errorMsg">
                            <asp:RegularExpressionValidator ID="EmailRegex" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address format." ValidationGroup="SignUp" Display="Dynamic" ForeColor="Red" Font-Size="Smaller" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b">*Invalid email address format.</asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="EmailCustomValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is already registered." ValidationGroup="SignUp" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Email address is already registered.</asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="RegisterEmailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is required." ToolTip="Email address is required." ValidationGroup="SignUp" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Email address is required.</asp:RequiredFieldValidator>
                        </div>
                        <div class="infield">
                            <asp:TextBox ID="txtRegisterPassword" runat="server" CssClass="input1" TextMode="Password" placeholder="Password"></asp:TextBox>
                        </div>
                        <div class="errorMsg">
                            <asp:RegularExpressionValidator ID="PasswordRegex" runat="server" ControlToValidate="txtRegisterPassword" ErrorMessage="Password must be at least 8 characters long and contain both letters and numbers." ValidationGroup="SignUp"  Display="Dynamic" ForeColor="Red" Font-Size="Smaller" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" >*Password must at least 8 characters contain both letters and numbers.</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RegisterPasswordRequired" runat="server" ControlToValidate="txtRegisterPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="SignUp" ForeColor="Red"  Display="Dynamic" Font-Size="Smaller">*Password is required.</asp:RequiredFieldValidator>
                        </div>
                        <div class="infield">
                            <asp:TextBox ID="txtRegisterConfirmPassword" runat="server" CssClass="input1" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                        </div>
                        <div class="errorMsg">
                            <asp:CompareValidator ID="comparePassword" runat="server" ErrorMessage="*Password did no match." Style="color: red;" ControlToCompare="txtRegisterPassword" ControlToValidate="txtRegisterConfirmPassword" Display="Dynamic" ForeColor="Red" Font-Size="Smaller" ValidationGroup="SignUp"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="txtRegisterConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="SignUp" Display="Dynamic" ForeColor="Red" Font-Size="Smaller" >*Comfirm Password is required.</asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="SignUpBtn" runat="server" Text="Sign Up" CssClass="button2" OnClick="SignUpBtn_Click1" ValidationGroup="SignUp"/>
                    </div>
                </div>

                <div class="form-container sign-in-container">
                    <div class="signUpAndLogin">
                        <h1>Sign in</h1>
                        <span>Use the email you registered with.</span>
                        <div class="infield">
                            <asp:TextBox ID="txtEmailLogin" runat="server" CssClass="input1" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="errorMsg">
                           <asp:CustomValidator ID="LoginEmailValidator" runat="server" ErrorMessage="Invalid Email Address" ControlToValidate="txtEmailLogin" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Invalid Email Address</asp:CustomValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailLogin" ErrorMessage="Invalid email address format." ValidationGroup="Login" Display="Dynamic" ForeColor="Red" Font-Size="Smaller" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b">*Invalid email address format.</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="LoginEmailRequired" runat="server" ControlToValidate="txtEmailLogin" ErrorMessage="Email address is required." ToolTip="Email address is required." ValidationGroup="Login"  Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Email address is required.</asp:RequiredFieldValidator>
                        </div>
                        <div class="infield">
                            <asp:TextBox ID="txtPasswordLogin" runat="server" CssClass="input1" TextMode="Password" placeholder="Password"></asp:TextBox>
                        </div>
                        <div class="errorMsg">
                            <asp:CustomValidator ID="LoginPasswordValidator" runat="server" ErrorMessage="Invalid Password" ControlToValidate="txtEmailLogin" Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Invalid Password</asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="LoginPasswordRequired" runat="server" ControlToValidate="txtPasswordLogin" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login"  Display="Dynamic" ForeColor="Red" Font-Size="Smaller">*Password is required.</asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="SigInBtn" runat="server" Text="Sign In" class="button1" OnClick="SigInBtn_Click" ValidationGroup="Login"/>
                    </div>
                </div>

                <div class="overlay-container" id="overlayCon">
                    <div class="overlay">
                        <div class="overlay-panel overlay-left">
                            <h1>Have an account?</h1>
                            <p>Sign in to see your cart and past bookings.</p>
                            <button class="button1">Sign In</button>
                        </div>
                        <div class="overlay-panel overlay-right">
                            <h1>New here?</h1>
                            <p>Create an account to book seats and order snacks.</p>
                            <button class="button1">Sign Up</button>
                        </div>
                    </div>
                    <button id="overlayBtn"></button>
                </div>
            </div>
        </div>
    </form>

    <script>
        const container = document.getElementById('container');
        const overlayCon = document.getElementById('overlayCon');
        const overlayBtn = document.getElementById('overlayBtn');



        overlayBtn.addEventListener('click', (event) => {
            // Prevent default link behavior
            event.preventDefault();

            // Toggle the class on the container
            container.classList.toggle('right-panel-active');
        });



        overlayCon.addEventListener('click', (event) => {
            // Check if the click occurred outside the overlay content
            if (!overlayCon.contains(event.target)) {
                // Remove the right-panel-active class if present
                container.classList.remove('right-panel-active');
            }
        });

        

    </script>
</asp:Content>
