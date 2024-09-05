<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="ShoesShopSystem.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
        /* ---------------------------------------- Total users and all data ----------------------------------  */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, 26.8rem);
            gap: 2.7rem;
            width: 95%;
            height: 30vh;
            position: absolute;
            /* background-color: grey; */
            margin-top: -520px;
            left: 38%;
            padding: 12px;
        }
        /* -------------------------------------------- Total-user (Card) -------------------------------------- */
        .total-user {
            position: relative;
            display: block;
            text-align: center;
            width: 90%;
            height: 24vh;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px #000;
            background-color: #f7786b;
        }
            /* --------------- Total User text ----------------- */
            .total-user .users {
                position: relative;
                font-size: 29px;
                font-weight: 600;
            }

        .total-staff {
            position: relative;
            display: block;
            text-align: center;
            width: 90%;
            height: 24vh;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px #000;
            background-color: #92a8d1;
        }

            .total-staff .staff {
                position: relative;
                font-size: 29px;
                font-weight: 600;
            }
        /* ------------------------------------------ Total-product (Card) ------------------------------------ */
        .total-product {
            position: relative;
            display: block;
            text-align: center;
            width: 90%;
            height: 24vh;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px #000;
            background-color: #92a8d1;
        }
            /* ---------- Total product text -------------- */
            .total-product .product {
                position: relative;
                font-size: 29px;
                font-weight: 600;
            }
        /* ------------------------------------------- Total-Orders (Card) ------------------------------------- */
        .total-orders {
            position: relative;
            display: block;
            text-align: center;
            width: 90%;
            height: 24vh;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px #000;
            background-color: #80ced6;
        }
            /* ------------ Total order text ------------- */
            .total-orders .order {
                position: relative;
                font-size: 29px;
                font-weight: 600;
            }
        /* ------------------------------------------- Total-Feedback (Card) ------------------------------------- */
        .total-feedback {
            position: relative;
            display: block;
            text-align: center;
            width: 90%;
            height: 24vh;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px #000;
            background-color: #80ced6;
        }
            /* ------------ Total feedback text ------------- */
            .total-feedback .feedback {
                position: relative;
                font-size: 29px;
                font-weight: 600;
            }
        /* ------------------------------------------- Complete Payments (Card) ------------------------------------- */
        .complete-payment {
            position: relative;
            display: block;
            text-align: center;
            width: 90%;
            height: 24vh;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px #000;
            background-color: #f7786b;
        }
            /* ------------ Total Complete Payment text ------------- */
            .complete-payment .com-payment {
                position: relative;
                font-size: 24px;
                font-weight: 600;
                top: -13px;
            }
        /* ------------------------------------------- Pending Payments (Card) ------------------------------------- */
        .pending-payment {
            position: relative;
            display: block;
            text-align: center;
            width: 90%;
            height: 24vh;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px #000;
            background-color: #92a8d1;
        }
            /* ------------ Total Pending Payment text ------------- */
            .pending-payment .pending-pay {
                position: relative;
                font-size: 24px;
                font-weight: 600;
                top: -13px;
            }

        .total-boy {
            position: relative;
            display: block;
            text-align: center;
            width: 90%;
            height: 24vh;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 25px #000;
            background-color: #80ced6;
        }
            /* ------------ Total feedback text ------------- */
            .total-boy .boy {
                position: relative;
                font-size: 29px;
                font-weight: 600;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-9">
        <div class="cards">
            <div class="total-user">
                <a href="view_cust.aspx"><span class="glyphicon glyphicon-user icon"></span></a>
                <h1 class="users">Total Customer
                <br>
                    <span style="color: #deeaee;" id="userCountLabel" runat="server">0</span></h1>
            </div>

            <div class="total-product">
                <a href="view_product.php"><span class="glyphicon glyphicon-stats icon"></span></a>
                <h1 class="product">Total Products
                <br>
                    <span style="color: #deeaee;" id="productCountLabel" runat="server">0</span></h1>
            </div>

            <div class="total-orders">
                <a href="admin_view_order.php"><span class="glyphicon glyphicon-list-alt icon"></span></a>
                <h1 class="order">Total Orders
                <br>
                    <span style="color: #deeaee;" id="orderCountLabel" runat="server">0</span></h1>
            </div>

            <div class="total-feedback">
                <a href="view_feedback.php"><span class="glyphicon glyphicon-envelope icon"></span></a>
                <h1 class="feedback">New Feedback
                <br>
                    <span style="color: #deeaee;" id="feedbackCountLabel" runat="server">0</span></h1>
            </div>

            <div class="complete-payment">
                <a href="#"><span class="glyphicon glyphicon-usd icon"></span></a>
                <h1 class="com-payment">Completed Payments
                <br>
                    <span style="color: #deeaee;" id="completePaymentLabel" runat="server">₹ </span></h1>
            </div>

            <div class="pending-payment">
                <a href="#"><span class="glyphicon glyphicon-usd icon"></span></a>
                <h1 class="pending-pay">Pending Payments
                <br>
                    <span style="color: #deeaee;" id="pendingPaymentLabel" runat="server">₹ </span></h1>
            </div>

            <div class="total-staff">
                <a href="view_cust.aspx"><span class="glyphicon glyphicon-user icon"></span></a>
                <h1 class="staff">Total Staff
                <br>
                    <span style="color: #deeaee;" id="staffCountLabel" runat="server">0</span></h1>
            </div>

            <%--<div class="total-boy">
                <a href="view_cust.aspx"><span class="glyphicon glyphicon-user icon"></span></a>
                <h1 class="boy">Delivery Boy
                <br>
                    <span style="color: #deeaee;" id="BoyCountLabel" runat="server">0</span></h1>
            </div>--%>

        </div>
    </div>
</asp:Content>
