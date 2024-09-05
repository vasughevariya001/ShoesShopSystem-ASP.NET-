<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="payment_success.aspx.cs" Inherits="ShoesShopSystem.WebForm21" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Online Payment</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            /* font-family: 'Poppins', sans-serif; */
        }
        html {
            scroll-behavior: smooth;
        }
        /* ------------------------------------- header ---------------------------------------- */
        #header {
            width: 100%;
            height: 16vh;
            /* position: fixed; */
            /* background: linear-gradient(rgba(0.7,0,1,0.8),rgba(0.7,0,1,0.8)),url(images/puma_background.jpg),transparent; */
            background-position: center;
            background-size: cover;
            /* background-color: red; */
        }
        /*.navbar {
            position: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 70px;
            background: #000;
            display: inline-block;
            text-align: center;
        }
        .logo {
            display: flex;
            align-items: center;
            position: absolute;
            width: 100px;
            padding: 7px;
            top: 1%;
            left: 20px;
        }
        .logo img {
            width: 100px;
        }
        .navbar ul li {
            display: inline-block;
            margin: 26px;

        }
        .navbar ul li a {
            text-decoration: none;
            justify-content: center;
            position: relative;
            font-size: 17px;
            letter-spacing: 0.5px;
            color: #fff;
            padding: 7px 12px;
            transition: all 0.1s ease;
            left: 28px;
        }

        .navbar ul li a:hover {
            border-radius: 30px;
            background-color: white;
            color: black;
        }
        .login-btn {
            position: relative;
            left: 175px;
        }

        .reg-btn {
            position: relative;
            left: 200px;
        }*/
        /* --------------- Drop Down ---------------- */
        /*.dropdown-menu{*/
            /* background-color: red; */
            /*position: absolute;
            height: 160px;
            width: 20px;
            top: 40px;
        }
        .dropdown-menu li a{
            margin: -20px;
        }
        #effect li a{
            color: black;
        }
        #effect li a:hover{
            background-color: black;
            color: white;
        }*/
         /* --------------- Cart-icon -------------- */
         /*.cart-icon{
            position: relative;
            font-size: 22px;
            color: white;
            left: 17%;
            top: 4px;
        }*/
        /* ------------------------------------ Cart-Count -------------------------------- */
        /*.cart-icon span{
            position: absolute;
            height: 20px;
            width: 20px;
            background-color: #fff;
            line-height: 22px;
            text-align: center;
            top: -40%;
            font-size: 15px;
            font-weight: 600;
            margin-left: -0.9rem;
            border-radius: 50%;
            color: #000;
        }
        .cart-icon:hover{
            color: white;
        }*/
        /* ------------- user-icon ---------------- */
        /*#user-icon{
            position: relative;
            display: block;
            top: -85px;
            margin-left: 89%;
            cursor: pointer;
        }*/
        /* ---------------------------- Order Placed Successfully Container ---------------------------- */
        .container{
            display: block;
            height: 110vh;
        }
        /* ------------------ Display the payment details of customer --------------------- */
        .payment-details{
            display: block;
            position: relative;
            width: 40%;
            /* background-color: lightblue; */
            border: 5px solid lightgrey;
            border-radius: 8px;
            padding: 20px;
            left: 30%;
        }
        .payment-details h5{
            display: flex;
            position: relative;
            align-items: center;
            justify-content: space-between;
            font-size: 16px;
        }
        .payment-details p{
            align-items: center;
            position: relative;
            top: 5px;
        }
        .payment-details .p-status{
            color: green;
            font-size: 16px;
            font-weight: 600;
        }
        .payment-details  .btn.btn-success{
            position: relative;
            font-size: 15px;
            font-weight: 600;
            letter-spacing: 1px;
            left: 30%;
            top: 6px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="alert alert-success">
            <h4><strong>Success!</strong> Your payment was successful</h4>
            <h2>Order Placed Successfully !</h2>
        </div>

         <div class="payment-details">
            <h5><strong>Customer Name: </strong><p><%= CustomerName %></p></h5>
            <h5><strong>Email: </strong><p><%= Email %></p></h5>
            <h5><strong>City: </strong><p><%= City %></p></h5>
            <h5><strong>Address: </strong><p><%= Address %></p></h5>
            <h5><strong>Pincode: </strong><p><%= Pincode %></p></h5>

            <hr style="background-color: black; width: 100%; height: 1px;">

            <h5><strong>Total Products: </strong><p><%= TotalProducts %></p></h5>
            <h5><strong>Total Price: </strong><p> ₹<%= TotalPrice %></p></h5>
            <h5><strong>Payment Status: </strong><p class="p-status"> Completed </p></h5>

            <a href="Home1.aspx"><button class="btn btn-success">Continue Shopping</button></a>
        </div>

    </div>
</asp:Content>
