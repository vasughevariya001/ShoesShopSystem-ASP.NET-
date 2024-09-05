<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="admin_view_order.aspx.cs" Inherits="ShoesShopSystem.WebForm22" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* -------------------------------  No Orders Yet ------------------------------- */
        .alert.alert-danger {
            display: block;
            position: relative;
            width: 188%;
            height: 30vh;
            left: 43.5%;
            top: 180px;
            text-align: center;
        }

        .glyphicon.glyphicon-folder-close {
            position: relative;
            font-size: 70px;
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
        
        /* ---------------------------- Add Product Text --------------------- */
        .col-sm-9 {
            display: flex;
            position: relative;
            justify-content: center;
        }

        .alert.alert-info {
            display: flex;
            position: absolute;
            width: 148%;
            height: 9vh;
            align-items: center;
            left: 34.5%;
            top: -450px;
        }

            .alert.alert-info h3 {
                position: relative;
                font-weight: 600;
            }
        /* -------------------------- order-table ------------------------------ */
        .order-table {
            display: block;
            position: absolute;
            /*background-color: lightblue;*/
            left: 34.5%;
            width: 108.5%;
            top: -376px;
            z-index: 0;
            text-transform: uppercase;
            padding: 5px;
        }

        /* ------------------------- All Orders (Second Table) ------------------------ */
        .all-orders th {
            background-color: #b4cbe0;
        }

        .order-hover tr:hover {
            background-color: #ebf3fb;
        }
        /* ------------------------------------------------- Send Bill ----------------------------------------- */
        #send-mail {
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1100;
            background-color: rgba(0, 0, 0, .7);
            padding: 2rem;
            display: none;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            width: 100%;
            height: 130vh;
        }

            #send-mail h1 {
                display: block;
                position: relative;
                text-align: center;
                font-weight: 600;
                font-size: 31px;
            }
        

        .buttons {
            display: flex;
            position: relative;
            width: 80%;
            margin: 5px;
            top: 7%;
            left: 7%;
            height: 5.6vh;
        }

        .btn-send {
            display: flex;
            position: relative;
            padding: 17px;
            text-transform: uppercase;
        }

        .btn-cancel {
            padding: 7px;
            position: relative;
            font-size: 17px;
            text-transform: uppercase;
            margin-left: 5%;
        }

        /* ------------------------------ Order Row 1 ------------------------------ */
        .order1 {
            width: 128%;
            position: relative;
            top: 20px;

        }
        /* ------------------- Order Deatils from tbl_order_details ---------------- */
        .orderdetails {
            width: 128%;
            /* background-color: red; */
            position: relative;
            top: 20px;
            
        }
        /* -------- Order image -------- */
        .img {
            width: 135px;
            height: 70px;
        }

        .orderdetails th {
            background-color: lightgrey;
            color: #000;
        }

        table {
            box-shadow: 0px 0px 10px #000;
        }

        table, td, th {
            border: 1.5px solid black;
            border-collapse: collapse;
            padding: 10px;
            text-align: center;
            font-size: 14.5px;
        }

            table th {
                background-color: lightgray;
                color: #000;
            }

        tr:hover {
            background-color: #E6E4E4;
        }

        thead th {
            text-transform: uppercase;
        }

        table th {
            text-transform: uppercase;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-9">
        <div class="alert alert-info">
            <h3><span class="glyphicon glyphicon-list-alt"></span> View Orders</h3>
        </div>

        <div class="order-table">
            <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand" OnItemDataBound="rptOrders_ItemDataBound">
                <ItemTemplate>

                    <div class="format">
                        <table class="order1">
                            <thead class="all-orders">
                                <tr>
                                    <th>Order id</th>
                                    <th>Order date</th>
                                    <th>Customer Name</th>
                                    <th>Total Product</th>
                                    <th>Total Price</th>
                                    <th>Order Status</th>
                                    <th>Bill</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>

                            <tr>
                                <td><%# Eval("order_id") %></td>
                                <td><%# ((DateTime)Eval("order_date")).ToString("MM/dd/yyyy") %></td>
                                <td><%# Eval("customer_name") %></td>
                                <td><%# Eval("total_products") %></td>
                                <td><%# Eval("total_price") %></td>
                                <%--<td><%# Eval("order_status") %></td>--%>
                                <td>
                                    <span style='color: <%# Eval("order_status").ToString() == "Placed" ? "green" : "orangered" %>; font-weight: 600;'><%# Eval("order_status") %></span>
                                </td>

                                <td>
                                    <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-primary print-btn" Text="Print" CommandName="Print" CommandArgument='<%# Eval("order_id") %>' />
                                </td>
                                <td>
                                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger cancel-btn" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("order_id") %>' />
                                </td>
                            </tr>
                        </table>

                        <asp:Repeater ID="rptOrderDetails" runat="server">
                            <HeaderTemplate>
                                <table class="orderdetails">
                                    <tr>
                                        <th>Order Id</th>
                                        <th>Product Image</th>
                                        <th>Description</th>
                                        <th>Brand</th>
                                        <th>Quantity</th>
                                        <th>Size</th>
                                        <th>Price</th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("odr_id") %></td>
                                    <td>
                                        <img class="img" src="<%# GetImageSrc(Eval("image")) %>" alt="" /></td>
                                    <td><%# Eval("description") %></td>
                                    <td><%# Eval("brand") %></td>
                                    <td><%# Eval("quantity") %></td>
                                    <td><%# Eval("size") %></td>
                                    <td><%# Eval("price") %></td>
                                </tr>
                            </ItemTemplate>

                            <FooterTemplate>
                                </table>    
                            </FooterTemplate>

                        </asp:Repeater>

                        <asp:Panel ID="pnlNoOrders" runat="server" CssClass="alert alert-danger" Visible="false">
                            <span class="glyphicon glyphicon-folder-close"></span>
                            <h3>No Orders Yet</h3>
                        </asp:Panel>

                    </div>

                    <br>
                    <br>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
