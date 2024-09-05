<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="my_order.aspx.cs" Inherits="ShoesShopSystem.customer.my_order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Profile</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!------------------------------ Alert Box CDN ------------------------------>
    <script src="sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10"></link>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <style>
        /** {
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
        }*/

        /* Set gray background color and 100% height */
        /*.sidenav {
            background-color: #000;
            border: 2px solid black;
            border-top: none;
            border-left: none;
            position: fixed;
            left: 0;
            width: 49vh;
            height: 100vh;
            z-index: 1;
        }*/

        /* On small screens, set height to 'auto' for the grid */
        /*@media screen and (max-width: 767px) {
            .row.content {
                height: auto;
            }
        }*/
        /* ------- Menu ------- */
        /*.menu {
            position: relative;
            top: 20px;
        }

        .nav-stacked li a {
            position: relative;
            color: white;
            font-size: 15px;
            letter-spacing: 0.6px;
            transition: all 0.3s ease;
        }

            .nav-stacked li a:hover {
                color: black;
            }*/
        /* --------------------------------- Fixed Form -------------------------------- */
        /*.col-sm-9 {
            display: flex;
            position: absolute;
            padding: 30px;
            top: 30px;
            z-index: 0;
            margin-left: 25%;
        }

        .profile-card {
            position: relative;
            display: flex;
            width: 100%;
            height: 80px;
            top: 47px;
            background-color: transparent;
            align-items: center;
        }*/
        /* ---------------- Hello text (h5) ---------------- */
        /*.profile-card h5 {
                position: absolute;
                display: flex;
                left: 95px;
                font-size: 14px;
                top: 10px;
                color: #fff;
                letter-spacing: 1px;
            }*/
        /* ---------------- Name of the customer (h2) ---------------- */
        /*.profile-card h2 {
                position: absolute;
                display: flex;
                left: 95px;
                font-size: 22px;
                font-weight: 600;
                top: 20px;
                color: #fff;
                letter-spacing: 1px;
            }*/
        /* --------- Customer Logo ------- */
        /*.profile-card .cust-logo {
                display: block;
                position: relative;
                width: 75px;
                height: 75px;
                border-radius: 60%;
                border: 1.5px solid white;
                box-shadow: 0px 0px 20px #fff;
            }*/
        /* ------------------------------- profile Update (camera icon) ------------------------------------ */
        /*.change-photo {
            display: block;
            position: relative;
            top: -42px;
            right: 12px;
            width: 100%;
        }

        .glyphicon.glyphicon-camera {
            color: white;
            font-size: 17.5px;
            left: 175px;
            cursor: pointer;
        }*/
        /* ------------- change-btn ---------------- */
        /*.change-btn {
            position: relative;
            border: none;
            padding: 6px;
            color: #000;
            background-color: #fff;
            cursor: pointer;
            width: 100%;
            text-transform: uppercase;
            font-size: 10.5px;
            letter-spacing: 0.3px;
            font-weight: 600;
            top: 2px;
            left: 154px;
            border: 1px solid #fff;
        }

            .change-btn:hover {
                opacity: 0.9;
            }*/
        /* ------------------- hr ---------------------- */
        /*.line-after-photo {
            position: relative;
            top: 25px;
        }*/
        /* --------------------------------- Image - Upload ------------------------------- */
        /*.image-upload {
            position: absolute;
            display: block;
            left: 31%;
            top: 1px;
            width: 35%;
            height: 34vh;
            padding: 20px;
            align-items: center;
            border-radius: 5px;
            border: 1.5px solid #000;
            box-shadow: 0px 0px 20px #000;
        }

            .image-upload .note {
                display: block;
                position: relative;
                font-size: 13px;
                top: -8px;
            }*/
        /* ------------- Upload-btn ---------------- */
        /*button {
            position: relative;
            border: none;
            padding: 9px;
            color: white;
            background-color: #000;
            cursor: pointer;
            width: 55%;
            text-transform: uppercase;
            font-size: 12.5px;
            letter-spacing: 0.3px;
            font-weight: 600;
            top: 7px;
            left: 65px;
            border-radius: 20px;
        }

            button:hover {
                opacity: 0.7;
            }*/
        /* ------------- Upload-icon ---------------- */
        /*#upload-icon {
            position: relative;
            color: white;
            font-size: 16px;
            left: -5%;
        }


        .cust-logo-default {
            display: block;
            position: relative;
            width: 75px;
            height: 75px;
            border-radius: 60%;
            border: 1.5px solid white;
            box-shadow: 0px 0px 20px #fff;
            left: 14px;
        }*/

        /*--------------------- sidetext(Shoes.shop) --------------------*/
        /*.sidetext {
            background-color: #000;
            border: 2px solid black;
            border-top: none;
            border-left: none;
            position: relative;
            top: 12px;
            bottom: 30px;*/
        /*z-index: 1;*/
        /*}

            .sidetext h1 {
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

                .sidetext h1 span {
                    color: orangered;
                    font-size: 32px;
                }

            .sidetext p {
                display: block;
                position: relative;
                font-size: 14.5px;
                color: grey;
                text-align: center;
                letter-spacing: 1px;
                top: 9px;
            }


        .container {
            width: 150%;
            margin-bottom: 1%;
        }


        .design {*/
        /* background-color: red; */
        /*box-shadow: 0 0 20px rgba(0, 0, 0, 1), inset 0 0 1px rgba(255, 255, 255, 0.9);
            height: auto;
            width: 90%;
            position: relative;
            left: 5%;
            margin-top: 2%;
            padding: 10px;
        }

        .format {
            width: 90%;
            position: relative;
            left: 5%;*/
        /* top: 55px; */
        /*height: 25vh;
            margin: 25px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2), inset 0 0 1px rgba(255, 255, 255, 0.9);
            display: flex;
            align-items: center;*/
        /* background-color: green; */
        /*}

        .image {
            height: 65%;
            width: 25%;
            transition: all ease 0.5s;
        }*/

        /*.format:hover .image {
            height: 80%;
            width: 27%;
            position: relative;
        }*/

        /*.details {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-left: 10px;
            position: relative;
        }


        .name {
            font-family: optima;
            font-size: 20px;
            margin: 5px;
        }

        .qlabel {
            font-size: 15px;
            font-weight: 600;
            margin: 5px;
        }

        .quantity {
            font-weight: 600;
            margin: 5px;
        }

        .company {
            text-transform: uppercase;
            font-family: 'Times New Roman', Times, serif;
            font-weight: 600;
            margin: 5px;
        }

        .size {
            text-transform: uppercase;
            font-family: 'Times New Roman', Times, serif;
            margin: 5px;
        }


        .right-details {
            display: flex;
            flex-direction: column;*/
        /* align-items: flex-end; */
        /*margin: 20px;
        }

        .price,
        .status {
            margin: 10px;*/
        /* Adjust the margin as needed */
        /*}

        .cancel_order {
            margin: 10px;
            text-transform: uppercase;
            padding: 5px;
            font-size: 12px;
            background-color: red;
            opacity: 0.8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 108px;
            position: relative;
        }

            .cancel_order:hover {
                background-color: red;
                opacity: 1;
                transition: all ease 0.5s;
            }

        .print_order {
            margin: 10px;
            text-transform: uppercase;
            padding: 5px;
            font-size: 12px;
            background-color: lightblue;
            opacity: 0.8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 108px;
            position: relative;
            color: black;
            font-weight: 600;
        }

            .print_order:hover {
                background-color: lightblue;
                opacity: 1;
                color: black;
                transition: all ease 0.5s;
            }

        .no_order {
            text-transform: uppercase;
            text-align: center;
            margin: 70px;
        }

        .pay_now {
            margin: 10px;
            text-transform: uppercase;
            padding: 5px;
            font-size: 12px;
            background-color: green;
            opacity: 0.8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100px;
            position: relative;
        }

            .pay_now:hover {
                background-color: green;
                opacity: 1;
                transition: all ease 0.5s;
            }

        .total_details {
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

            .total_details span {
                font-family: optima;
                font-size: 18px;
                font-weight: 600;
                position: relative;
                padding: 15px;
            }*/
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
            left: 0;
            width: 49vh;
            height: 100vh;
            z-index: 1;
            border-right: 1.5px solid #fff;
        }

        /* On small screens, set height to 'auto' for the grid */
        @media screen and (max-width: 767px) {
            .row.content {
                height: auto;
            }
        }

        body {
            display: block;
            height: 100vh;
            justify-content: center;
            align-items: center;
            /* background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url(shoes_sign_up.jpg), transparent;    */
            background-position: center;
            background-size: cover;
        }
        /* ------- Menu ------- */
        .menu {
            position: relative;
            top: 20px;
        }

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
        /* --------------------------------- Fixed Form -------------------------------- */
        .col-sm-9 {
            display: flex;
            position: absolute;
            padding: 30px;
            top: 30px;
            z-index: 0;
            margin-left: 25%;
        }

        .profile-card {
            position: relative;
            display: flex;
            width: 100%;
            height: 80px;
            top: 47px;
            /* background-color: wheat; */
            align-items: center;
        }
            /* ---------------- Hello text (h5) ---------------- */
            .profile-card h5 {
                position: absolute;
                display: flex;
                left: 95px;
                font-size: 14px;
                top: 10px;
                color: #fff;
                letter-spacing: 1px;
            }
            /* ---------------- Name of the customer (h2) ---------------- */
            .profile-card h2 {
                position: absolute;
                display: flex;
                left: 95px;
                font-size: 22px;
                font-weight: 600;
                top: 20px;
                color: #fff;
                letter-spacing: 1px;
            }
            /* ------------------ Customer Logo ------------ */
            .profile-card .cust-logo {
                display: block;
                position: relative;
                width: 75px;
                height: 75px;
                border-radius: 60%;
                border: 1.5px solid white;
                box-shadow: 0px 0px 20px #fff;
            }
        
        /* ------------------------------------ All Orders display here ----------------------------- */
        .col-sm-9 {
            position: relative;
            display: flex;
            flex-direction: column;
            /* background-color: lightgrey; */
        }
            /* -------------- Your Orders Text -------------- */
            .col-sm-9 h1 {
                display: block;
                position: relative;
                text-align: center;
                font-size: 27px;
                font-weight: 600;
                top: -20px;
            }
        /* .col-sm-9 .all-product{
            padding: 10px;
            justify-content: left;
            width: 745px;
            height: 26vh;
            position: relative;
            background-color: red;
        } */
        /* --------------------------- products card (items card) --------------------- */
        /* .all-product .order-card{
            display: flex;
            border-radius: .5rem;
            box-shadow: 0 0px 8px 0 rgba(0, 0, 0, 0.4);
            width: 870px;
            height: 156px;
            font-family: arial;
            padding: 17px;
            background-color: white;
            text-align: left;
            background-color: yellow;
        } */
        /* --------------------- For product Details ---------------- */
        .product-details {
            display: block;
            position: relative;
            padding: 5px;
            width: 482px;
            height: 170px;
            top: -17px;
            left: 20px;
            /* background-color: yellow; */
        }
        /* ---------------------------------- order-details ------------------------------ */
        .order-details {
            display: block;
            position: absolute;
            width: 40%;
            height: 20vh;
            padding: 13px;
            top: 10.5px;
            left: 77.9%;
            /* background-color: red; */
        }
        /* ------------------------------------------- Cotainer ------------------------------------------- */
        .container {
            width: 100%;
            padding: 10px;
            height: auto;
            position: relative;
        }
        /* ----------------------------------- Main White box ------------------------- */
        .design {
            box-shadow: 0 0 12px #000;
            height: auto;
            width: auto;
            position: relative;
            padding: 15px;
            margin: 15px;
            /* background-color: red; */
        }
        /* ---------------- Product cards ---------------- */
        .format {
            width: auto;
            position: relative;
            height: 25vh;
            margin: 25px;
            box-shadow: 0 0 10px grey;
            border-radius: 6px;
            padding: 18px;
            display: flex;
            align-items: center;
            /* background-color: green; */
        }
        /* ------------------- Product Image ---------------- */
        .image {
            position: relative;
            width: 22%;
            height: 91px;
            top: 10px;
        }

        .product-details {
            display: block;
            position: relative;
            padding: 5px;
            width: 482px;
            height: 165px;
            top: -1px;
            left: 20px;
            /* background-color: red; */
        }
            /* ------------------------ brand - category ---------------------- */
            .product-details h2 {
                display: flex;
                position: relative;
                font-size: 15.5px;
                text-transform: uppercase;
                font-weight: 600;
            }
            /* ----------- For product Description --------- */
            .product-details .description {
                font-size: 15px;
                letter-spacing: 0.4px;
            }
            /* -------- price -------- */
            .product-details .price {
                position: relative;
                color: #000;
                font-size: 15px;
                /* font-weight: 600; */
                left: 57%;
                top: -65px;
            }
            /* --------- Size --------- */
            .product-details .size {
                position: relative;
                color: grey;
                top: -32px;
                letter-spacing: 0.5px;
                text-transform: uppercase;
            }
            /* --------- Quantity --------- */
            .product-details .quantity {
                position: relative;
                font-weight: 600;
                top: -8px;
            }
        /* --------- date --------- */
        .order-details .date {
            position: relative;
            color: #000;
            left: -29px;
            font-size: 15px;
            font-weight: 600;
            top: -22px;
            letter-spacing: 0.5px;
        }
        /* ------ collect your product ------- */
        .right-details .text {
            display: flex;
            position: absolute;
            width: 30%;
            font-size: 12.8px;
            letter-spacing: 0.5px;
            color: brown;
            top: 10px;
            left: 554px;
        }
        /* --- payment status ------ */
        .right-details .status {
            position: absolute;
            display: flex;
            font-size: 14px;
            font-weight: 600;
            left: 554px;
            top: 66%;
        }
        /* ------------------------- Cancel-Order ---------------------------- */
        .cancel-btn {
            display: flex;
            position: relative;
            justify-content: center;
            font-size: 14px;
            font-weight: 600;
            letter-spacing: 0.4px;
            left: 16%;
            /* top: 5px; */
            height: 30px;
            align-items: center;
        }
        .print-btn {
    display: flex;
    position: absolute;
    justify-content: center;
    font-size: 14px;
    font-weight: 600;
    letter-spacing: 0.4px;
    left: 69%;
    /* top: 5px; */
    height: 30px;
    align-items: center;
}
        /* ------------ Total amount --------------- */
        .total_details {
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        .total-amt {
            font-size: 18px;
            font-weight: 600;
            position: relative;
            padding: 15px;
            display: flex;
            left: -150px;
            top: -11px;
        }
        /*--------------------- sidetext(Shoes.shop) --------------------*/
        .sidetext {
            background-color: #000;
            border: 2px solid black;
            border-top: none;
            border-left: none;
            position: relative;
            top: 12px;
            bottom: 30px;
            */
            /*z-index: 1;*/
        }

            .sidetext h1 {
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

                .sidetext h1 span {
                    color: orangered;
                    font-size: 32px;
                }

            .sidetext p {
                display: block;
                position: relative;
                font-size: 14.5px;
                color: grey;
                text-align: center;
                letter-spacing: 1px;
                top: 9px;
            }

            .cust-logo-default {
    display: block;
    position: relative;
    width: 75px;
    height: 75px;
    border-radius: 60%;
    border: 1.5px solid white;
    box-shadow: 0px 0px 20px #fff;
    left: 14px;
}
            /* ------------------- hr ---------------------- */
.line-after-photo {
    position: relative;
    top: 25px;
}
    </style>
</head>
<body>
    <nav class="navbar navbar-inverse visible-xs">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="customer_home.php"><span class="glyphicon glyphicon-home"></span>&nbsp; Home</a></li>
                    <li><a href="update_profile.php"><span class="glyphicon glyphicon-edit"></span>&nbsp; Update Profile</a></li>
                    <li><a href="change_pass.aspx"><span class="glyphicon glyphicon-lock"></span>&nbsp; Change Password</a></li>
                    <li><a href="logout.php"><span class="glyphicon glyphicon-off"></span>&nbsp; Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row content">
            <div class="col-sm-3 sidenav hidden-xs">
                <%--<img src="/images/addidas.jpg" class="cust-logo" alt="photo">--%>

                <div class="sidetext">
                    <h1>Shoes<span>.Shop</span></h1>
                    <p>Shoesshop8700@gmail.com</p>
                </div>

                <img src="/images/user_icon.png" class="cust-logo-default" alt="profile" height="75" width="75" style="border-radius: 70%; top: 7%; box-shadow: 0px 0px 15px #fff;">

                <h3 style="position: relative; color: #fff; left: 38%; top: -15px;">My profile</h3>

                <hr class="line-after-photo">
                <div class="menu">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="Home1.aspx"><span class="glyphicon glyphicon-home"></span>&nbsp; Home</a></li>
                        <li><a href="customer_panel.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp; My profile</a></li>
                        <li class="active"><a href="my_order.aspx"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp; My Orders</a></li>
                        <li><a href="update_profile.aspx"><span class="glyphicon glyphicon-edit"></span>&nbsp; Update Profile</a></li>
                        <li><a href="change_pass.aspx"><span class="glyphicon glyphicon-lock"></span>&nbsp; Change Password</a></li>
                        <li><a href="feedback.php"><span class="glyphicon glyphicon-envelope"></span>&nbsp; Feedback</a></li>
                        <hr>
                        <li><a href="Logout.aspx"><span class="glyphicon glyphicon-off"></span>&nbsp; Logout</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-9">
                <asp:PlaceHolder ID="PlaceHolderNoOrder" runat="server" Visible="false">
                    <div class="alert alert-info" role="alert">
                        <h3><i class="fa fa-shopping-cart"></i>No Orders Yet !</h3>
                    </div>

                </asp:PlaceHolder>

                <h1><span class="glyphicon glyphicon-shopping-cart"></span> My Orders</h1>

                <asp:PlaceHolder ID="PlaceHolderOrders" runat="server" Visible="true">
                     <form id="form1" runat="server">
                        <div class="container">
                            <asp:Repeater ID="orderRepeater" runat="server" OnItemDataBound="orderRepeater_ItemDataBound" OnItemCommand="orderRepeater_ItemCommand">
                                <ItemTemplate>
                                    <div class="design">
                                        <div class="order-details">
                                            <h6 class="date">* Order on <%# ((DateTime)Eval("order_date")).ToString("MM/dd/yyyy") %></h6>
                                        </div>
                                        <asp:Repeater ID="orderDetailsRepeater" runat="server">
                                            <ItemTemplate>
                                                <div class="format">
                                                    <asp:Image ID="productImage" runat="server" CssClass="image" ImageUrl='<%# GetImageSrc(Eval("image")) %>' />
                                                    <div class="product-details">
                                                        <h2><%# Eval("brand") %> - <%# Eval("category") %></h2>
                                                        <p class="description"><%# Eval("description") %></p>
                                                        <p class="price">₹ <%# Eval("price") %></p>
                                                        <h5 class="size">Size : <%# Eval("size") %></h5>
                                                        <h5 class="quantity">Quantity: <%# Eval("quantity") %></h5>
                                                    </div>
                                                    <div class="right-details">
                                                        <h5 class="text">Collect your product at our offline store</h5>
                                                        <h3 class="status">Payment Status |&nbsp;<span style="color: <%# (Eval("payment_status").ToString() == "Completed") ? "green" : "orangered" %>"><%# Eval("payment_status") %></span></h3>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <div class="total_details">
                                            <span class="total-amt">Total amount : ₹ <%# Eval("total_price") %></span>
                                            <%--<form runat="server" onserverclick="CancelOrder_Click">--%>
                                                <%--<asp:HiddenField ID="orderId" runat="server" Value='<%# Eval("order_id") %>' />--%>
                                                <%--<asp:Button ID="BtnCancelOrder" runat="server" Text="Cancel Order" CssClass="btn btn-danger cancel-btn" OnClick="CancelOrder_Click" />--%>

                                            <asp:Button ID="btnPrint" runat="server" Text="Print Bill" CssClass="btn btn-primary print-btn" OnClick="btnPrint_Click" Visible='<%# true %>' CommandArgument='<%# Eval("order_id") %>' />

                                            <asp:Button ID="BtnCancelOrder" runat="server" Text="Cancel Order" CssClass="btn btn-danger cancel-btn" CommandName="CancelOrder" CommandArgument='<%# Eval("order_id") %>' />
                                            <%--</form>--%>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </form>
                </asp:PlaceHolder>
            </div>
        </div>
    </div>


</body>
</html>
