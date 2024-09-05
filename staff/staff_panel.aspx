<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staff_panel.aspx.cs" Inherits="ShoesShopSystem.staff.staff_panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        /* -------------------------- All icons ---------------------- */
        .icon {
            display: block;
            position: relative;
            font-size: 47px;
            color: #fff;
        }

        * {
            padding: 0;
            margin: 0;
        }

        .row.content {
            height: 550px;
        }

        .navbar-inverse {
            background-color: #000;
            color: white;
            font-size: 17px;
            position: fixed;
            top: 0;
            right: 0;
            width: 100%;
            z-index: 2;
        }
        /* Set gray background color and 100% height */
        .sidenav {
            background-color: #000;
            border: 2px solid black;
            border-top: none;
            border-left: none;
            position: fixed;
            top: 30px;
            left: 0;
            height: 100vh;
            z-index: 1;
        }

            .sidenav h1 {
                display: block;
                position: relative;
                font-size: 35px;
                color: #80ced6;
                letter-spacing: 1px;
                font-weight: 600;
                text-align: center;
                top: 8px;
                text-shadow: 0px 0px 30px #fff;
            }

                .sidenav h1 span {
                    color: orangered;
                    font-size: 32px;
                }

            .sidenav p {
                display: block;
                position: relative;
                font-size: 14.5px;
                color: grey;
                text-align: center;
                letter-spacing: 1px;
                top: 9px;
            }

        /* On small screens, set height to 'auto' for the grid */
        @media screen and (max-width: 767px) {
            .row.content {
                height: auto;
            }
        }
        /* --------- Customer Logo ------- */
        .admin-logo {
            display: block;
            position: relative;
            text-align: center;
            width: 145px;
            margin-left: 66px;
            filter: drop-shadow(0px 0px 10px #fff);
        }
        /* ------- Menu ------- */
        .nav-stacked li a {
            position: relative;
            color: white;
            font-size: 15px;
            letter-spacing: 0.6px;
            transition: all 0.3s ease;
        }

            .nav-stacked li a:hover {
                color: black;
            }



       
    </style>
</head>
<body>
    <nav class="navbar-inverse">
        <div class="container-fluid">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/customer/Login.aspx"><span style="top: 2.5px;" class="glyphicon glyphicon-off"></span>Logout</a></li>
            </ul>
        </div>
    </nav>

    <nav class="navbar navbar-inverse visible-xs demo">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div>
            <!----------- For Responsive ------------->
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Add Category</a></li>
                    <li><a href="#">Customer details</a></li>
                    <li><a href="#">Profile Update</a></li>
                    <li><a href="#">Feedbacks</a></li>
                    <li><a href="customer_login.php"><span class="glyphicon glyphicon-log-in"></span>&nbsp; Logout</a></li>
                    <li><a href="customer_home.php"><span class="glyphicon glyphicon-home"></span>&nbsp; Home</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row content">
            <div class="col-sm-3 sidenav hidden-xs">
                <!-------------- Shop text / Email ------------->
                <h1>Staff<span>.Dashboard</span></h1>
                <p>Shoesshop8700@gmail.com</p>

                <img src="/images/cust_log.png" class="admin-logo">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="staff_panel.aspx"><span class="glyphicon glyphicon-signal"></span>&nbsp; Dashboard</a></li>
                    <li><a href="staff_add_product.aspx"><span class="glyphicon glyphicon-plus"></span>&nbsp; Add Products</a></li>

                    <li><a href="add_staff.aspx"><span class="glyphicon glyphicon-plus"></span>&nbsp; View Order</a></li>
                    <li><a href="add_customer.aspx"><span class="glyphicon glyphicon-plus"></span>&nbsp; Track Order</a></li>
                    <li><a href="staff_chang_pass.aspx"><span class="glyphicon glyphicon-list"></span>&nbsp; Change Password</a></li>
                    <%--                    <li><a href="view_customer.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp; View Customer</a></li>
                    <li><a href="admin_view_order.php"><span class="glyphicon glyphicon-list-alt"></span>&nbsp; View Orders</a></li>
                    <li><a href="view_payment.php"><span class="glyphicon glyphicon-usd"></span>&nbsp; View Payments</a></li>
                    <li><a href="view_feedback.php"><span class="glyphicon glyphicon-envelope"></span>&nbsp; Feedbacks</a></li>
                    <li><a href="admin_change_pass.aspx"><span class="glyphicon glyphicon-lock"></span>&nbsp; Change Password</a></li>--%>
                    <!-- <li><a href="#section3"><span class="glyphicon glyphicon-text-size"></span>&nbsp; Feedbacks</a></li> -->
                </ul>
                <br>
            </div>
            <br>
            <div class="col-sm-9">
            </div>
        </div>
    </div>
</body>
</html>
