<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shopping_cart.aspx.cs" Inherits="ShoesShopSystem.WebForm18" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* -------------------------------  Empty cart ------------------------------- */
        .alert.alert-danger {
            display: block;
            position: relative;
            width: 45%;
            height: 50vh;
            left: 29%;
            text-align: center;
        }

        .glyphicon.glyphicon-folder-close {
            position: relative;
            font-size: 80px;
        }

        * {
            padding: 0;
            margin: 0;
            /* font-family: 'Poppins', sans-serif; */
        }

        html {
            scroll-behavior: smooth;
        }
        /* ------------------------------------ Shopping - Cart (Section) --------------------------------------- */
        #shopping-cart {
            position: relative;
            width: 100%;
            height: 380vh;
            padding: 32px;
            justify-content: center;
            /* background-color: lightgrey; */
        }
            /* ------------- h1(shopping cart text) -------------- */
            #shopping-cart h1 {
                position: relative;
                font-weight: 600;
                font-size: 28px;
                letter-spacing: 0.5px;
                text-transform: uppercase;
            }
        /* ----------------------------- All cart items display here ------------------------- */
        .all-cart-item {
            width: 100%;
            height: auto;
            position: relative;
            display: flex;
            flex-direction: column;
            /* background-color: lightgrey; */
        }

            .all-cart-item .all-product {
                padding: 10px;
                justify-content: left;
                width: 745px;
                height: 32vh;
                position: relative;
                /* background-color: red; */
            }
        /* --------------------------- products card (items card) --------------------- */
        .all-product .products-card {
            border-radius: .5rem;
            box-shadow: 0 0px 8px 0 rgba(0, 0, 0, 0.4);
            width: 720px;
            height: 205px;
            font-family: arial;
            padding: 17px;
            background-color: white;
            text-align: left;
            /* background-color: yellow; */
        }
        /* ------------------- Product Image ---------------- */
        .products-card .image {
            position: relative;
            width: 25%;
            height: 90px;
            top: 10px;
        }
        /* ---------- product Quantity / Update-btn ---------- */
        .qty-btn {
            position: relative;
            top: 44px;
            color: #000;
            font-size: 15px;
        }
        /* --------------- Qty -------------- */
        .products-card .qty {
            border: 1px solid grey;
            padding: 3px 6px;
            font-size: 18px;
            color: #000;
            width: 6.5rem;
            height: 3.3rem;
            border-radius: 3px;
        }
        /* ----------- product Update-btn ----------- */
        .products-card .btn.btn-warning {
            position: relative;
            padding: 4px 10px;
            cursor: pointer;
            font-size: 14px;
            letter-spacing: 0.7px;
            top: -2px;
        }
        /* --------------------- For product Details ---------------- */
        .product-details {
            display: block;
            position: relative;
            padding: 5px;
            width: 482px;
            height: 205px;
            top: -108px;
            left: 220px;
            /*background-color: yellow;*/
        }
            /* ---------- product Brand and category (h2) -------- */
            .product-details h2 {
                font-size: 16px;
                text-transform: uppercase;
                font-weight: 600;
                color: grey;
            }
            /* ----------- For product Description --------- */
            .product-details .description {
                font-size: 18px;
                letter-spacing: 0.4px;
            }
            /* -------- new price -------- */
            .product-details .price {
                color: #000;
                font-size: 17.4px;
                font-weight: 600;
            }
            /* -------- Old price -------- */
            .product-details span {
                position: relative;
                color: grey;
                /* left: 1%; */
                font-size: 15px;
                font-weight: 500;
                text-decoration: line-through;
            }
            /* --------- Size --------- */
            .product-details .size {
                font-size: 16px;
                color: #000;
                letter-spacing: 0.5px;
            }
            /* ------------- Remove - Button ------------ */
            .product-details .btn.btn-danger {
                position: absolute;
                width: 92px;
                font-size: 14px;
                font-weight: 600;
                bottom: 20px;
                right: 15px;
            }

        .btn.btn-danger:hover {
            background-color: red;
            color: #fff;
        }
        /* ----------- h4 (free delivery) ----------- */
        .product-details h4 {
            position: absolute;
            color: #189A18;
            font-size: 16px;
            top: 9px;
            opacity: 0.9;
            right: 15px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight: 600;
            text-align: right;
        }
        /* -------------------------------------------- price-detail ------------------------------------ */
        .price-detail {
            border-radius: .5rem;
            box-shadow: 0 0px 8px 0 rgba(0, 0, 0, 0.08);
            border: 1.4px solid lightgrey;
            width: 435px;
            height: 430px;
            font-family: Arial;
            padding: 15px;
            background-color: white;
            justify-content: space-between;
            letter-spacing: 0.4px;
            position: absolute;
            top: 9px;
            right: 20px;
        }
            /* --------------------- price details text(h3) ---------------- */
            .price-detail h3 {
                display: block;
                position: relative;
                width: 100%;
                font-weight: 600;
                font-size: 16px;
                color: #000;
                padding: 11px;
                border-bottom: 1px solid lightgrey;
                text-transform: uppercase;
                top: -26px;
                /* background-color: lightblue; */
            }
            /* ---------------- P tag for price / discount & All ------------- */
            .price-detail p {
                display: flex;
                position: relative;
                font-size: 15.5px;
                line-height: 12px;
                color: #000;
                padding: 11px;
                justify-content: space-between;
            }

            .price-detail .discount-txt {
                color: #189A18;
            }
            /* --------------------- Total Payable amount -------------------- */
            .price-detail .total-amt {
                position: relative;
                font-size: 17.9px;
                font-weight: 600;
            }
            /* ------------------- Save-text ------------------------*/
            .price-detail .save-text {
                position: relative;
                color: #189A18;
                font-weight: 600;
                font-size: 16px;
                top: -14px;
            }
            /* ------------------------------------------ Place Order Btn -------------------------------- */
            .price-detail .button {
                position: relative;
                border: none;
                padding: 13px;
                color: white;
                background-color: #ff7b25;
                cursor: pointer;
                width: 57%;
                text-transform: uppercase;
                font-size: 15.5px;
                letter-spacing: 0.9px;
                font-weight: 600;
                left: 23%;
                top: -1px;
                border-radius: 4px;
            }

                .price-detail .button:hover {
                    opacity: 0.9;
                }
        /* ------------------------------------------------ Contact Us ---------------------------------------------- */
        #contact {
            display: flex;
            position: relative;
            justify-content: center;
            width: 100%;
            height: 100vh;
            padding: 10px;
            border-top: 1.5px solid lightgrey;
            background-color: whitesmoke;
        }

            #contact h1 {
                display: block;
                position: absolute;
                /* text-transform: uppercase; */
                font-weight: 600;
                padding: 10px;
                letter-spacing: 0.5px;
                font-size: 32px;
                color: #000;
                /* background-color: red; */
            }

            #contact span {
                display: block;
                position: absolute;
                width: 9%;
                height: 2.5px;
                background-color: red;
                top: 12%;
            }
        /* ----------------------- horizontal-contact-line ----------------------- */
        .horizontal-contact-line {
            display: flex;
            position: relative;
            width: 85%;
            height: 3px;
            left: 7%;
            border-top: 1px solid #11141D;
            border-bottom: 1px solid #4e4e4e;
            border-radius: 10px;
            background-color: grey;
        }
        /* ----------------------- contact-logo ----------------------- */
        #contact .contact-logo {
            display: flex;
            position: relative;
            justify-content: center;
            width: 47%;
            height: 69.5%;
            left: -22%;
            top: 19%;
            /* background-color: red; */
        }
        /* ------------- google Map ----------- */
        .contact-logo iframe {
            position: relative;
            width: 95%;
            height: 90%;
            border-radius: 15px;
            transition: all 1s ease;
        }

            .contact-logo iframe:hover {
                box-shadow: 0px 0px 32px black;
            }
        /* -------------------- contact-details ----------------- */
        #contact .contact-details {
            display: flex;
            position: absolute;
            justify-content: space-evenly;
            width: 42%;
            height: 34%;
            top: 21%;
            left: 55%;
            /* background-color: red; */
        }
        /* -------------------- Phone Icon ------------------- */
        .contact-details .phone {
            display: flex;
            position: absolute;
            color: #7b202d;
            font-size: 20px;
            font-weight: 600;
            left: 10px;
            transition: all 0.5s ease;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }

            .contact-details .phone:hover {
                color: #ce4257;
                cursor: pointer;
                font-size: 22px;
            }
        /* -------------------- Mail Icon ------------------- */
        .contact-details .mail {
            display: flex;
            position: absolute;
            color: #7b202d;
            font-size: 20px;
            font-weight: 600;
            left: 10px;
            top: 50px;
            transition: all 0.5s ease;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }

            .contact-details .mail:hover {
                color: #ce4257;
                cursor: pointer;
                font-size: 22px;
            }
        /* -------------------- Address(location) Icon ------------------- */
        .contact-details .address {
            display: flex;
            position: absolute;
            color: #7b202d;
            font-size: 20px;
            font-weight: 600;
            left: 10px;
            top: 100px;
            transition: all 0.5s ease;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }

            .contact-details .address:hover {
                color: #ce4257;
                cursor: pointer;
                font-size: 22px;
            }
        /* ------------------------ Working-hours ---------------------- */
        #contact .working-hours {
            display: flex;
            position: absolute;
            width: 40%;
            height: 25%;
            top: 57%;
            left: 55%;
            /* background-color: red; */
        }

        .working-hours h3 {
            display: flex;
            position: relative;
            font-size: 1.9em;
            font-weight: 600;
            padding: 15px;
            color: black;
        }

        .working-hours p {
            display: flex;
            position: absolute;
            font-size: 1.3em;
            letter-spacing: 0.4px;
            left: 3%;
            top: 45%;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }

            .working-hours p:hover {
                color: #ce4257;
                cursor: pointer;
            }
        /* ----------------------------------------------- Footer --------------------------------------------- */
        #footer {
            display: flex;
            position: relative;
            width: 100%;
            height: 57vh;
            background-color: black;
            justify-content: center;
        }

            #footer .text {
                display: flex;
                position: absolute;
                align-items: center;
                padding: 10px;
                width: 92%;
                height: 20%;
                left: 4%;
                /* background-color: red;    */
            }

                #footer .text h1 {
                    display: block;
                    position: absolute;
                    font-weight: 600;
                    font-size: 21px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    color: white;
                    top: 3%;
                }

                #footer .text p {
                    display: block;
                    position: absolute;
                    color: grey;
                    top: 63%;
                    letter-spacing: 0.3px;
                    font-size: 16px;
                }

                    #footer .text p:hover {
                        color: powderblue;
                        cursor: pointer;
                    }
                /* ---------------- social icon ---------------- */
                #footer .text .icon {
                    position: relative;
                    font-size: 25px;
                    margin: 10px;
                    left: 84%;
                    color: powderblue;
                    transition: all 0.5s ease;
                }

                    #footer .text .icon:hover {
                        color: white;
                        cursor: pointer;
                        text-shadow: 0px 0px 20px white;
                        transform: translateY(-7px);
                    }
            /* -------------- Products(footer) ---------------- */
            #footer .products {
                display: block;
                position: absolute;
                text-align: left;
                width: 14%;
                height: 50%;
                left: 10%;
                top: 25%;
                line-height: 13px;
                /* background-color: red; */
            }
                /* ------ Product(text) ------ */
                #footer .products h1 {
                    display: block;
                    position: relative;
                    color: whitesmoke;
                    font-weight: 600;
                    font-size: 14.5px;
                    text-transform: uppercase;
                }

                #footer .products p {
                    display: block;
                    position: relative;
                    color: grey;
                    font-size: 14.2px;
                    letter-spacing: 0.3px;
                }

                    #footer .products p:hover {
                        color: powderblue;
                        cursor: pointer;
                        text-shadow: 0px 0px 5px powderblue;
                    }
            /* -------------------------- Brands (footer)------------------------ */
            #footer .brands {
                display: block;
                position: absolute;
                text-align: left;
                width: 12%;
                height: 50%;
                left: 27%;
                top: 25%;
                line-height: 13px;
                /* background-color: red; */
            }
                /* ------ Brands(text) ------ */
                #footer .brands h1 {
                    display: block;
                    position: relative;
                    color: whitesmoke;
                    font-weight: 600;
                    font-size: 14.5px;
                    text-transform: uppercase;
                }

                #footer .brands p {
                    display: block;
                    position: relative;
                    color: grey;
                    font-size: 14.2px;
                    letter-spacing: 0.3px;
                }

                    #footer .brands p:hover {
                        color: powderblue;
                        cursor: pointer;
                        text-shadow: 0px 0px 5px powderblue;
                    }
            /* ----------------------- Contact ----------------------- */
            #footer .contact {
                display: block;
                position: absolute;
                text-align: left;
                width: 21%;
                height: 50%;
                left: 42%;
                top: 25%;
                line-height: 19px;
                /* background-color: red; */
            }

                #footer .contact h1 {
                    display: block;
                    position: relative;
                    color: whitesmoke;
                    font-weight: 600;
                    font-size: 14.5px;
                    text-transform: uppercase;
                }

                #footer .contact p {
                    display: block;
                    position: relative;
                    color: grey;
                    font-size: 14.2px;
                    letter-spacing: 0.3px;
                }

                    #footer .contact p:hover {
                        color: powderblue;
                        cursor: pointer;
                        text-shadow: 0px 0px 5px powderblue;
                    }
            /* ----------------------- Email (Footer) ----------------------- */
            #footer .email {
                display: block;
                position: absolute;
                text-align: left;
                width: 19%;
                height: 50%;
                left: 66%;
                top: 25%;
                line-height: 13px;
                /* background-color: red; */
            }

                #footer .email h1 {
                    display: block;
                    position: relative;
                    color: whitesmoke;
                    font-weight: 600;
                    font-size: 14.5px;
                    text-transform: uppercase;
                }

                #footer .email p {
                    display: block;
                    position: relative;
                    color: grey;
                    font-size: 14.2px;
                    letter-spacing: 0.3px;
                }

                    #footer .email p:hover {
                        color: powderblue;
                        cursor: pointer;
                        text-shadow: 0px 0px 5px powderblue;
                    }
            /* ----------------------- Telephone (Footer) ----------------------- */
            #footer .telephone {
                display: block;
                position: absolute;
                text-align: left;
                width: 13%;
                height: 25%;
                left: 66%;
                top: 45%;
                line-height: 13px;
                /* background-color: red; */
            }

                #footer .telephone h1 {
                    display: block;
                    position: relative;
                    color: whitesmoke;
                    font-weight: 600;
                    font-size: 14.5px;
                    text-transform: uppercase;
                }

                #footer .telephone p {
                    display: block;
                    position: relative;
                    color: grey;
                    font-size: 14.2px;
                    letter-spacing: 0.3px;
                }

                    #footer .telephone p:hover {
                        color: powderblue;
                        cursor: pointer;
                        text-shadow: 0px 0px 5px powderblue;
                    }
            /* ------- Lining in foote -------- */
            #footer span {
                display: block;
                position: relative;
                width: 90%;
                height: 4px;
                border-top: 1px solid #11141D;
                /* border-bottom: 1px solid lightgrey; */
                border-bottom: 1px solid #4e4e4e;
                background-color: #000000;
                border-radius: 30px;
                top: 83%;
            }
            /* ----------- copyright --------------- */
            #footer .copyright {
                display: block;
                position: absolute;
                text-align: center;
                width: 33%;
                height: 10%;
                top: 89%;
                /* background-color: red; */
            }

                #footer .copyright p {
                    display: block;
                    position: relative;
                    color: grey;
                    font-size: 14.5px;
                    letter-spacing: 0.5px;
                }

        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="shopping-cart">
        <h1><i class="glyphicon glyphicon-shopping-cart"></i>Shopping Cart</h1>
        <div class="all-cart-item">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="all-product">
                        <div class="products-card">
                            <img class="image" src='<%# GetImageSrc(Eval("image")) %>' alt="shoes">



                            <div class="product-details">
                                <h2><%# Eval("brand") %> - <%# Eval("category") %></h2>
                                <p class="description"><%# Eval("description") %></p>


                                <p class="price"><span>₹<%# Convert.ToDecimal(Eval("oprice")) * Convert.ToInt32(Eval("quantity")) %></span>&nbsp;&nbsp;₹<%# Convert.ToDecimal(Eval("price")) * Convert.ToInt32(Eval("quantity")) %> </p>


                                <h5 class="size">Size : <%# Eval("size") %></h5>



                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("id") %>' />
                                <h5 class="qtyy">QTY : </h5>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("quantity") %>'></asp:TextBox>
                                <asp:Button ID="btnUpdate" CssClass="btn btn-warning" runat="server" OnClick="btnUpdate_Click" Text="Update" />



                                <h4>| Free Delivery</h4>
                                <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="Remove" />

                                <%--<h4>Available Stock (<%# Eval("stock") %>)</h4>--%>
                                <%--<input type="hidden" name="delete"><a href="shopping_cart.aspx?remove=<%# Eval("id") %>" class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i> Remove</a>--%>
                                <asp:LinkButton ID="RemoveFromCart" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="RemoveFromCart" CssClass="btn btn-danger"><i class="glyphicon glyphicon-trash"></i> Remove</asp:LinkButton>


                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


            <div class="price-detail">
                <h3>Price Details</h3>

                <p>Price : <span>₹<asp:Label ID="TotalLabel" runat="server"></asp:Label></span></p>

                <p>Discount : <span class="discount-txt">- ₹<asp:Label ID="DiscountLabel" runat="server"></asp:Label></span></p>

                <hr style="border-bottom: 1px solid lightgrey;">

                <p class="total-amt">Total Amount : <span>₹<asp:Label ID="GrandTotalLabel" runat="server"></asp:Label></span></p>

                <hr style="border-bottom: 1px solid lightgrey;">

                <p class="save-text">
                    You will save ₹<asp:Label ID="SaveLabel" runat="server"></asp:Label>
                    on this order
                </p>

                <%--<a id="place-order" href="place_order.aspx">
                <button>Place order</button></a>--%>

                <asp:Button ID="btnPlaceOrder" CssClass="button" runat="server" OnClick="PlaceOrder_Click" Text="Place order"/>



            </div>
        </div>
    </section>

    <!-------------------------------------------- contact us ---------------------------------------->
    <section id="contact">
        <h1>Contact Us</h1>
        <span></span>

        <div class="contact-logo reveal">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14876.171737263845!2d72.9018936!3d21.230146!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be0458ad5141465%3A0x9289d379d8ae4d4!2sRise%20On%20Plaza!5e0!3m2!1sen!2sin!4v1694705163711!5m2!1sen!2sin"
                width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" alt="Map Loading Error"></iframe>
        </div>

        <div class="contact-details reveal">
            <h2 class="phone"><i style="color: #000;" class="glyphicon glyphicon-earphone"></i>&nbsp;&nbsp;+91 76900 00989</h2>
            <h2 class="mail"><i style="color: #000;" class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;shoesshop8700@gmail.com</h2>
            <h2 class="address"><i style="color: #000;" class="glyphicon glyphicon-map-marker"></i>&nbsp;&nbsp;A - 101 , Rise On Plaza , Ground Flore ,
                <br>
                &nbsp;&nbsp;Sarthana Jakatnaka , Surat-kamrej Highway
                <br>
                &nbsp;&nbsp;| Gujarat - 395008.</h2>
        </div>

        <div class="working-hours reveal">
            <h3>Working hours</h3>
            <p>Monday - Saturday | 8AM - 9PM <strong>&nbsp;(Sunday closed) </strong></p>
        </div>
    </section>

    <!-------------------------------------------- Footer ---------------------------------------->
    <section id="footer">
        <div class="text">
            <h1>Sign up &</h1>
            <p>Get the latest deals and special offers</p>

            <i class="fa fa-facebook-square icon"></i>
            <i class="fa fa-firefox icon"></i>
            <i class="fa fa-instagram icon"></i>
            <i class="fa fa-pinterest-square icon"></i>
        </div>
        <div class="products">
            <h1>Products</h1>
            <p>For Men's & Women's</p>
            <p>Shoes</p>
            <p>Slider</p>
            <p>Slippers</p>
        </div>
        <div class="brands">
            <h1>Brands</h1>
            <p>Puma</p>
            <p>U.S Polo</p>
            <p>Adidas</p>
            <p>Bata</p>
            <p>Fila</p>
        </div>
        <div class="contact">
            <h1>Get In Touch</h1>
            <p>Address : A - 101 , Rise On Plaza , Ground Flore , Sarthana Jakatnaka , Surat - 395008.</p>
        </div>
        <div class="email">
            <h1>Email</h1>
            <p>shoesshop8700@gmail.com</p>
        </div>
        <div class="telephone">
            <h1>Telephone</h1>
            <p>+(070) 200 260 099</p>
        </div>
        <span></span>
        <div class="copyright">
            <p>Copyright &copy; 2022 - 2023 | All Rights Reserved. </p>
        </div>
    </section>
</asp:Content>

