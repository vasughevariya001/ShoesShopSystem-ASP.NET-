<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adidas_shoes_m_running.aspx.cs" Inherits="ShoesShopSystem.WebForm26" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            padding: 0;
            margin: 0;
            /* font-family: 'Poppins', sans-serif; */
        }

        html {
            scroll-behavior: smooth;
        }
        /* -------------------------------- GoTop Icon ------------------------------- */
        .gotop {
            position: fixed;
            border-radius: 30px;
            width: 31px;
            height: 31px;
            background: black;
            bottom: 15px;
            right: 12px;
            text-align: center;
            line-height: 32px;
            color: white;
            font-size: 16px;
            animation: gotop 5s linear forwards;
        }

        @keyframes gotop {
            0% {
                opacity: 0;
            }

            50% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        .gotop:hover {
            color: white;
        }
        /* ------------------------------------- header ---------------------------------------- */
        #header {
            width: 100%;
            height: 50vh;
            /* position: fixed; */
            /* background: linear-gradient(rgba(0.7,0,1,0.8),rgba(0.7,0,1,0.8)),url(images/puma_background.jpg),transparent; */
            background-position: center;
            background-size: cover;
        }

            #header .img {
                display: block;
                position: fixed;
                width: 670px;
                left: 46%;
                top: 36%;
            }

        .navbar {
            position: relative;
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
        }
        /* --------------- Drop Down ---------------- */
        .dropdown-menu {
            /* background-color: red; */
            position: absolute;
            height: 160px;
            width: 20px;
            top: 40px;
        }

            .dropdown-menu li a {
                margin: -20px;
            }

        #effect li a {
            color: black;
        }

            #effect li a:hover {
                background-color: black;
                color: white;
            }
        /* ------------------- puma-shoes(Men) / [ Home text ]------------------------ */
        #header .puma-shoes {
            display: flex;
            position: absolute;
            justify-content: center;
            width: 42%;
            height: 180px;
            /* top: 34%; */
            top: 30%;
            left: -3%;
            border-radius: 9px;
            /* background-color: white; */
            background: linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.3)),transparent;
        }

        .puma-shoes h1 {
            display: block;
            position: absolute;
            font-size: 7.5vh;
            top: 7%;
            color: white;
            font-weight: 600;
        }

        .puma-shoes span {
            color: black;
            text-transform: uppercase;
            font-size: 6.6vh;
        }

        #header .text {
            display: block;
            position: absolute;
            width: 44%;
            height: 100px;
            font-size: 15.9px;
            padding: 15px;
            letter-spacing: 0.4px;
            font-weight: 600;
            top: 60%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            /* background-color: lightgrey; */
        }
        /* --------------- Cart-icon -------------- */
        .cart-icon {
            position: relative;
            font-size: 22px;
            color: white;
            left: 17%;
            top: 4px;
        }
            /* ------------------------------------ Cart-Count -------------------------------- */
            .cart-icon span {
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

            .cart-icon:hover {
                color: white;
            }
        /* ----------- user-icon ----------- */
        #user-icon {
            position: relative;
            display: block;
            top: -85px;
            margin-left: 89%;
            cursor: pointer;
        }
        /* ------------------------------------ Categories --------------------------------------------- */
        #categories-row-1 {
            width: 100%;
            height: 10vh;
            background-color: lightgrey;
            position: relative;
            display: flex;
            padding: 20px;
            border-top: 1px solid black;
        }
        /* --------------------- Dropdown for Categories --------------------- */
        .dropbtn {
            position: relative;
            background-color: #000;
            color: white;
            padding: 10px 15px;
            font-size: 16px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            border: 1.5px solid grey;
            left: 1040px;
            transition: all 0.4s ease;
        }

        .dropdown:hover .dropbtn {
            background-color: darkgrey;
            border: 1.5px solid #000;
            color: black;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            left: 1040px;
            letter-spacing: 0.6px;
            font-size: 15px;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

                .dropdown-content a:hover {
                    background-color: #ddd;
                }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        /* ----------------------------------------- Categories-row-2 ------------------------------------------ */
        /* -------- H1 Tag latest product  ---------- */
        .heading {
            display: flex;
            position: absolute;
            text-transform: uppercase;
            font-size: 32.5px;
            font-weight: 600;
            padding: 12px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: black;
            /* background-color: red; */
        }

            .heading span {
                display: block;
                position: relative;
                background-color: orangered;
                width: 3px;
                height: 47px;
                top: -6px;
            }

        #categories-row-2 {
            width: 100%;
            height: 200vh;
            background-color: lightgrey;
            position: relative;
            display: flex;
            padding: 20px;
            /* border-top: 1px solid black; */
        }

        .container-2 {
            display: grid;
            grid-template-columns: repeat(auto-fit, 29rem);
            gap: 1.6rem;
            padding: 10px;
            justify-content: center;
            width: 96%;
            height: 75vh;
            top: 8%;
            position: absolute;
        }
        /* ------------------------------------ Product Card ---------------------------------------- */
        .card {
            border-radius: .5rem;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4);
            max-width: 300px;
            margin: auto;
            font-family: arial;
            /* padding: 30px 25px; */
            padding: 30px 12px;
            background-color: white;
            text-align: left;
        }

            .card:hover {
                border: 1.2px solid black;
            }

        .carousel-inner .item img {
            position: relative;
            width: 95%;
            height: 120px;
        }
        /* ------- Shoes brand name -puma (h1)------- */
        .card h1 {
            position: relative;
            font-size: 15px;
            text-transform: uppercase;
            font-weight: 600;
            color: grey;
        }
        /* --------- Description-(for shoes) -------------- */
        .card .description {
            font-size: 15px;
            letter-spacing: 0.4px;
        }
        /* -------- price -------- */
        .price {
            color: #000;
            font-size: 17px;
            font-weight: 600;
        }

        .card span {
            position: relative;
            color: grey;
            left: 2%;
            font-size: 15.5px;
            font-weight: 500;
            text-decoration: line-through;
        }
        /* -------- Sale text ---------- */
        .card h5 {
            display: block;
            position: relative;
            color: whitesmoke;
            font-weight: 600;
            text-align: right;
            top: -240px;
            left: 79.5%;
            background-color: grey;
            width: 25%;
            padding: 9px;
        }
        /* ------ size ------ */
        .card .size {
            position: relative;
            text-align: left;
            font-size: 15px;
            top: -38px;
        }
        /* ---------------------- Product details (collapsible) --------------------- */
        .collapsible {
            position: relative;
            background-color: #777;
            color: white;
            cursor: pointer;
            padding: 8px;
            width: 100%;
            border: none;
            text-align: left;
            font-size: 14.6px;
            top: -30px;
            letter-spacing: 0.5px;
            border-radius: 4px;
        }

            .act, .collapsible:hover {
                background-color: #555;
            }

            .collapsible:after {
                content: '\002B';
                color: white;
                font-weight: bold;
                float: right;
                margin-left: 5px;
            }

        .act:after {
            content: "\2212";
        }

        .content {
            position: relative;
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            background-color: lightgrey;
            font-size: 13.7px;
            letter-spacing: 0.5px;
            top: -37px;
        }
        /* ----------------- Add to cart ----------------- */
        /* -------- cart icon --------- */
        #addcart {
            position: relative;
            color: white;
            font-size: 16px;
            left: -5%;
        }

        .card button {
            position: relative;
            border: none;
            padding: 11px;
            color: white;
            background-color: #000;
            cursor: pointer;
            width: 100%;
            text-transform: uppercase;
            font-size: 15px;
            letter-spacing: 0.3px;
            font-weight: 600;
            top: -12px;
            border-radius: 6px;
        }

            .card button:hover {
                opacity: 0.7;
            }
        /* -------------------------------- Text (After all products) ------------------------------- */
        #text {
            position: relative;
            width: 100%;
            height: 65vh;
            padding: 45px;
            background-color: transparent;
        }

            #text .info {
                display: block;
                position: absolute;
                padding: 20px;
                text-align: center;
                text-transform: uppercase;
                top: 19%;
                color: #000;
                font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                /* background-color: red; */
            }

            #text h1 {
                display: block;
                position: relative;
                font-weight: 700;
                font-size: 42px;
                text-shadow: 0px 0px 65px black;
            }

            #text h2 {
                display: block;
                position: relative;
                font-size: 27px;
            }

            #text .btn-explore {
                position: relative;
                text-decoration: none;
                font-size: 16px;
                margin-top: 15px;
                padding: 7px 20px;
                font-weight: 600;
                border: none;
                background-color: #000;
                text-transform: uppercase;
                letter-spacing: 0.4px;
            }

                #text .btn-explore:hover {
                    opacity: 0.7;
                }

                #text .btn-explore a {
                    color: #fff;
                    text-decoration: none;
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

        .form-control {
            display: flex;
            position: relative;
            max-width: 150px;
            height: 30px;
            font-size: 14px;
            text-align: center;
            top: -20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="header">
        <img src="/images/adidas_men's/adidas_running_background.jpg" class="img">

        <div class="puma-shoes">
            <h1>Adidas
                <br>
                <span>Men's - Running</span></h1>
        </div>
        <div class="text">
            <p>
                Adidas running shoes for women motivate you to begin your training
                story - or break through to the next level.
            </p>
        </div>
    </section>

    <!--------------------------------------------- categories ------------------------------------------------>
    <section id="categories-row-1">
        <div class="dropdown">
            <button class="dropbtn">Categories &nbsp;<span class="caret"></span></button>
            <div class="dropdown-content">
                <a href="adidas_shoes_m_sneaker.aspx">Sneakers</a>
                <a href="#categories-row-1">Running</a>
                <a href="adidas_shoes_m_sports.aspx">Sports</a>
            </div>
        </div>
    </section>

    <section id="categories-row-2">
        <h1 class="heading"><span></span>&nbsp;New Arrivals</h1>

        <div class="container-2">
            <asp:Repeater ID="ProductRepeater" runat="server">
                <ItemTemplate>
                    <div class="card">

                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="image" src='<%# GetImageSrc(Eval("image")) %>' alt="shoes">
                            </div>
                        </div>

                        <h1><%# Eval("brand") %> - <%# Eval("category") %></h1>

                        <p class="description"><%# Eval("description") %></p>

                        <p class="price">₹<%# Eval("nprice") %> <span>₹<%# Eval("oprice") %></span></p>

                        <h5>SALE !</h5>

                        <h6 class="size">Size :
        <input type="number" step="1" min="6" max="11" name="size" value="6" size="4" style="padding: 3px;"></h6>


                        <h2 class="collapsible">Product Details :</h2>

                        <div class="content">
                            <p><strong>Sole Material &nbsp;&nbsp;: </strong><%# Eval("sole_material") %></p>
                            <p><strong>Outer Material : </strong><%# Eval("outer_material") %></p>
                            <p><strong>Occasion &emsp;&emsp;&nbsp;: </strong><%# Eval("occasion") %></p>
                            <p><strong>Model Name &emsp;: </strong><%# Eval("model_name") %></p>
                        </div>

                        <p>
                            <%--<button ID="addtocartbtn" type="submit" name="cart" onclick="Click()"><a href="#"><span id="addcart" class="glyphicon glyphicon-shopping-cart"></span></a>Add to Cart</button>--%>

                            <asp:HiddenField ID="DefaultQuantity" Value="1" runat="server" />
                            <asp:TextBox ID="Quantity" placeholder="Enter quantity" CssClass="form-control" Text="" runat="server" />

                            <asp:Button ID="addtocartbtn" runat="server" Text="Add To Cart" CssClass="btn btn-primary" OnClick="addtocartbtn_Click" CommandArgument='<%# Eval("id") %>' />
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </section>

    <!---------------------------------------- Some Text after all products ------------------------------------>
    <section id="text">
        <div class="info">
            <h1>Find large range of styles</h1>
            <h2>Exclusive adiclub</h2>
            <button type="submit" class="btn-explore" name=""><a href="#categories-row-2">Explore Running shoes &nbsp;<span class="glyphicon glyphicon-arrow-right"></span></a></button>
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

    <!-------------------------------- Go to top icon ---------------------------->
    <a class="gotop" href="#header"><i class="fas fa-arrow-up"></i></a>

    <!------------------------------- Script for product details (Bootstrap) -------------------------->
    <script>
        var coll = document.getElementsByClassName("collapsible");
        var i;

        for (i = 0; i < coll.length; i++) {
            coll[i].addEventListener("click", function () {
                this.classList.toggle("act");
                var content = this.nextElementSibling;
                if (content.style.maxHeight) {
                    content.style.maxHeight = null;
                } else {
                    content.style.maxHeight = content.scrollHeight + "px";
                }
            });
        }
    </script>
</asp:Content>
