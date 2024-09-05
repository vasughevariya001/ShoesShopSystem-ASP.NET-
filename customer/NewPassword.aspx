<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewPassword.aspx.cs" Inherits="ShoesShopSystem.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <title>Forgot Password</title>
 <style>
     * {
         margin: 0px;
         padding: 0px;
         font-family: 'Poppins', sans-serif;
     }

     body {
         display: flex;
         align-items: center;
         min-height: 100vh;
         background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url(images/shoes_sign_up.jpg), transparent;
         /* background: yellow; */
         background-position: center;
         background-size: cover;
     }

     .navbar {
         position: absolute;
         align-items: center;
         width: 100%;
         height: 70px;
         background: #fff;
         display: inline-block;
         text-align: center;
         top: 0;
     }

     .logo {
         display: flex;
         align-items: center;
         position: absolute;
         width: 100px;
         padding: 7px;
         top: -30%;
         left: 20px;
     }

     .logo img {
         width: 100px;
     }

     .container {
         background: #222;
         position: absolute;
         width: 430px;
         height: 400px;
         border-radius: 10px;
         left: 35%;
         top: 145px;
         box-shadow: 0px 0px 20px 0px #fff;
     }

     .container form {
         position: absolute;
         padding: 50px 30px;
         border-radius: 8px;
         display: flex;
         flex-direction: column;
     }

     .container h1 {
         position: relative;
         top: 16px;
         color: #fff;
         font-weight: 500;
         text-align: center;
         /* font-size: 28px; */
         left: 6px;
         letter-spacing: 0.1em;
     }

     .container .inputbox {
         position: relative;
         top: -25px;
         width: 320px;
         left: 2%;
         margin-top: 35px;
     }

     .container .inputbox input {
         position: relative;
         width: 100%;
         padding: 20px 10px 10px;
         background: transparent;
         outline: none;
         border: none;
         box-shadow: none;
         color: #fff;
         font-size: 1em;
         letter-spacing: 0.05em;
         transition: 0.5s;
         z-index: 10;
     }

     .container .inputbox span {
         position: absolute;
         left: 1%;
         top: -10px;
         padding: 20px 0px 10px;
         pointer-events: none;
         color: #8f8f8f;
         font-size: 1em;
         letter-spacing: 0.05em;
         transition: 0.5s;
     }

     .container .inputbox input:valid~span,
     .container .inputbox input:focus~span {
         color: #fff;
         font-size: 0.85em;
         transform: translateY(-40px);
     }

     .container .inputbox i {
         position: absolute;
         left: 0;
         bottom: 0;
         width: 115%;
         height: 2px;
         background: #000;
         border-radius: 4px;
         overflow: hidden;
         transition: 0.5s;
         pointer-events: none;
     }

     .container .inputbox input:valid~i,
     .container .inputbox input:focus~i {
         height: 40px;
     }

     .container .btn {
         text-align: center;
         text-decoration: none;
         position: relative;
         width: 95%;
         padding: 9px;
         border: none;
         outline: none;
         background: #fff;
         color: #000;
         cursor: pointer;
         font-size: 1.1em;
         font-weight: 600;
         border-radius: 30px;
         left:1%;
     }
         .container .btn-otp {
             align-items: center;
             text-decoration: none;
             position: relative;
             width: 25%;
             left: 280px;
             top: -12px;
             padding: 9px;
             border: none;
             outline: none;
             background: #fff;
             color: #000;
             cursor: pointer;
             font-size: 1em;
             font-weight: 600;
             border-radius: 30px;
         }
         .container .btn-verify {
             text-align: center;
             text-decoration: none;
             position: relative;
             width: 95%;
             padding: 9px;
             border: none;
             outline: none;
             background: #fff;
             color: #000;
             cursor: pointer;
             font-size: 1.1em;
             font-weight: 600;
             border-radius: 30px;
             left: 1%;
         }

     .icon {
         color: black;
         border-radius: 15px;
         padding: 6px;
         position: absolute;
         top: 40px;
         left: 35px;
         background-color: white;
     }
 </style>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
     <form id="form1">
        <asp:ScriptManager runat="server" />
        <div class="container">
            <asp:Panel ID="Panel1" Visible="true">
                <h1>Forgot Password</h1><br /><br /><br />

               <asp:Panel ID="NewPasswordPanel" Visible="false">

                    <div class="inputbox">
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <span>New Password</span>
                        <i></i>
                    </div><br />

                    <div class="inputbox">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <span>Confirm Password</span>
                        <i></i>
                    </div>

                   <asp:Button ID="btnVerify" runat="server" CssClass="btn-verify" Text="Submit" OnClick="btnVerify_Click" />
            </asp:Panel>
        </div>
    </form>

</asp:Content>
