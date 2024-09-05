<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home1.aspx.cs" Inherits="ShoesShopSystem.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            padding: 0;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }

        html {
            scroll-behavior: smooth;
        }
        /* -------------------------------- GoTop Icon ------------------------------- */
        .gotop {
            position: fixed;
            border-radius: 30px;
            width: 35px;
            height: 35px;
            background: black;
            bottom: 15px;
            right: 14px;
            text-align: center;
            line-height: 35px;
            color: white;
            font-size: 18px;
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

        #header {
            width: 100%;
            height: 50vh;
            background: black;
            /* background: url(home_shoes.png); */
            background-position: center;
            background-size: cover;
        }

        .login-btn {
            position: relative;
            left: 175px;
        }

        .reg-btn {
            position: relative;
            left: 200px;
        }
        /* Home Content */
        .home-content {
            display: block;
            position: absolute;
            justify-content: space-between;
            width: 47%;
            height: 40%;
            padding: 25px;
            /* background-color: red; */
            top: 25%;
            left: 1%;
        }

            .home-content h1 {
                display: block;
                position: relative;
                font-size: 8vh;
                color: white;
                font-weight: 600;
            }

            .home-content span {
                color: orangered;
            }

            .home-content p {
                position: relative;
                color: grey;
                font-size: 17px;
                line-height: 25px;
                top: 2%;
            }

            .home-content .btn {
                position: relative;
                top: 9%;
                font-size: 16px;
                background: transparent;
                padding: 7px 20px;
                border: 1.3px solid #fff;
                color: white;
                letter-spacing: 1px;
                /* left: 20%; */
                font-weight: 600;
                transition: all 1.2s ease;
            }

                .home-content .btn:hover {
                    background: #fff;
                    color: #000;
                }

        .image {
            display: block;
            position: absolute;
            top: -25%;
            left: 105%;
        }

            .image img {
                /* transform: rotate(-10deg); */
                animation: img 2s linear infinite;
            }

        @keyframes img {
            0% {
                transform: translateY(1px);
            }

            50% {
                transform: translateY(-1px);
                transform: rotate(-8deg);
            }

            100% {
                transform: translateY(1px);
            }
        }


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
        /* --------------- Cart-icon -------------- */
        .cart-icon {
            position: relative;
            font-size: 22px;
            color: #000;
            left: 17%;
            top: 4px;
        }
            /* ------------------------------------ Cart-Count -------------------------------- */
            .cart-icon span {
                position: absolute;
                height: 20px;
                width: 20px;
                background-color: #000;
                line-height: 22px;
                text-align: center;
                top: -40%;
                font-size: 15px;
                font-weight: 600;
                margin-left: -0.9rem;
                border-radius: 50%;
                color: #fff;
            }

            .cart-icon:hover {
                color: #000;
            }
        /* ----------- user-icon ----------- */
        #user-icon {
            position: relative;
            display: block;
            top: -85px;
            margin-left: 89%;
            cursor: pointer;
        }
        /* --------------------------------------------- Mens shoes --------------------------------------- */
        #men-shoes {
            width: 100%;
            height: 100vh;
            position: relative;
            justify-content: center;
        }

            #men-shoes span {
                width: 4px;
                height: 55px;
                background: red;
                display: block;
                position: absolute;
                left: 44px;
                top: 32px;
            }

            #men-shoes h1 {
                display: block;
                position: absolute;
                font-weight: 600;
                font-size: 38px;
                left: 56px;
                top: 18px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            }

        .men-collection {
            display: flex;
            position: relative;
            justify-content: space-around;
            width: 95%;
            height: 450px;
            top: 18%;
            left: 1.4%;
            /* background-color: red; */
        }

            .men-collection .sports {
                display: flex;
                position: relative;
                width: 360px;
                height: 450px;
                /* background-color: yellow; */
                justify-content: space-between;
                transition: all 0.5s ease;
            }

                .men-collection .sports:hover {
                    transform: translateY(-10px);
                    box-shadow: -6px 6px 30px rgba(10, 10, 30, 20);
                    cursor: pointer;
                }

                .men-collection .sports .btn {
                    display: block;
                    position: absolute;
                    font-size: 17px;
                    font-weight: 600;
                    width: 360px;
                    border: 1.4px solid black;
                    background-color: white;
                    color: black;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    bottom: -67px;
                }

                    .men-collection .sports .btn:hover {
                        background-color: #000;
                        color: #fff;
                        box-shadow: 6px 6px 30px rgba(1, 2, 1, 2);
                        transition: all ease 0.5s;
                    }
        /* --------------------------------------------- Men Slippers --------------------------------------------- */
        #men-slipper {
            width: 100%;
            height: 100vh;
            position: relative;
            justify-content: center;
        }

            #men-slipper span {
                width: 4px;
                height: 55px;
                background: red;
                display: block;
                position: absolute;
                left: 44px;
                top: 32px;
            }

            #men-slipper h1 {
                display: block;
                position: absolute;
                font-weight: 600;
                font-size: 38px;
                left: 56px;
                top: 18px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            }
        /* --------------------------------------------- Men Flipflop --------------------------------------------- */
        #men-flipflop {
            width: 100%;
            height: 100vh;
            position: relative;
            justify-content: center;
        }

            #men-flipflop span {
                width: 4px;
                height: 55px;
                background: red;
                display: block;
                position: absolute;
                left: 44px;
                top: 32px;
            }

            #men-flipflop h1 {
                display: block;
                position: absolute;
                font-weight: 600;
                font-size: 38px;
                left: 56px;
                top: 18px;
                letter-spacing: 1px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            }
        /* -------------------- orange-line ----------------- */
        .grey-line {
            width: 40%;
            background: orange;
            height: 2.5px;
            margin-left: 370px;
            margin-top: 40px;
        }
        /* ----------------------------------------- Womens collections ------------------------------------------- */

        /* ---------------------------------- Women's Shoes -------------------------------- */
        #women-shoes {
            width: 100%;
            height: 100vh;
            position: relative;
            justify-content: center;
        }

            #women-shoes span {
                width: 4px;
                height: 55px;
                background: red;
                display: block;
                position: absolute;
                right: 65px;
                top: 32px;
            }

            #women-shoes h1 {
                display: block;
                position: absolute;
                font-weight: 600;
                font-size: 38px;
                right: 80px;
                top: 18px;
                letter-spacing: 1px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            }

        .women-collection {
            display: flex;
            position: relative;
            justify-content: space-around;
            width: 95%;
            height: 450px;
            top: 18.8%;
            left: 1.4%;
            /* background-color: red; */
        }

            .women-collection .sports {
                display: flex;
                position: relative;
                width: 360px;
                height: 450px;
                /* background-color: yellow; */
                transition: all 0.5s ease;
                justify-content: space-between;
            }

                .women-collection .sports:hover {
                    transform: translateY(-10px);
                    box-shadow: -6px 6px 30px rgba(10, 10, 30, 20);
                    cursor: pointer;
                }

                .women-collection .sports .btn {
                    display: block;
                    position: absolute;
                    font-size: 17px;
                    font-weight: 600;
                    width: 360px;
                    border: 1.4px solid black;
                    background-color: white;
                    color: black;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    bottom: -67px;
                }

                    .women-collection .sports .btn:hover {
                        background-color: #000;
                        color: #fff;
                        box-shadow: 6px 6px 30px rgba(1, 2, 1, 2);
                        transition: all ease 0.3s;
                    }

        /* ---------------------------------- Women's Slider -------------------------------- */

        #women-slider {
            width: 100%;
            height: 100vh;
            position: relative;
            justify-content: center;
        }

            #women-slider span {
                width: 4px;
                height: 55px;
                background: red;
                display: block;
                position: absolute;
                right: 65px;
                top: 32px;
            }

            #women-slider h1 {
                display: block;
                position: absolute;
                font-weight: 600;
                font-size: 38px;
                right: 80px;
                top: 18px;
                letter-spacing: 1px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            }
        /* ---------------------------------- Women's Slipper -------------------------------- */

        #women-slipper {
            width: 100%;
            height: 100vh;
            position: relative;
            justify-content: center;
        }

            #women-slipper span {
                width: 4px;
                height: 55px;
                background: red;
                display: block;
                position: absolute;
                right: 65px;
                top: 32px;
            }

            #women-slipper h1 {
                display: block;
                position: absolute;
                font-weight: 600;
                font-size: 38px;
                right: 80px;
                top: 18px;
                letter-spacing: 1px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            }
        /* ---------------------------------------- Offer ------------------------------------ */
        #offer {
            position: relative;
            width: 100%;
            height: 100vh;
            justify-content: center;
            /* background-color: red;    */
        }

            #offer h1 {
                display: block;
                position: relative;
                font-weight: 600;
                color: orangered;
                text-align: center;
                letter-spacing: 1px;
                font-size: 33px;
                top: 15px;
            }

            #offer span {
                width: 100px;
                height: 2.4px;
                background: #000;
                display: block;
                position: absolute;
                left: 46%;
                top: 56px;
            }

            #offer .img {
                display: flex;
                position: relative;
                border-radius: 50%;
                background: linear-gradient(#f0f0f0,#f0f0f0);
                /* background: black;   */
                width: 35%;
                height: 65%;
                top: 7%;
                left: 5%;
                align-items: center;
                justify-content: center;
                box-shadow: 0px 0px 25px rgba(10, 10, 30, 20);
            }

        .img img {
            display: flex;
            position: absolute;
            width: 540px;
            /* border: 5px solid white; */
            animation: shoes 5s linear infinite;
        }

        @keyframes shoes {
            0% {
                /* transform: translateY(-8px); */
                opacity: 0.5;
                width: 500px;
            }

            50% {
                /* transform: translateY(8px); */
                width: 620px;
                opacity: 1;
            }

            100% {
                /* transform: translateY(-8px); */
                width: 500px;
                opacity: 0;
            }
        }

        .content {
            display: flex;
            position: relative;
            width: 670px;
            height: 500px;
            /* background-color: yellow; */
            top: -380px;
            left: 45%;
        }

            .content h2 {
                display: block;
                position: absolute;
                font-weight: 600;
                font-size: 40px;
                margin: 0;
                left: 1%;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
            }
            /* ---------------- tick mark ----------------- */
            .content .feature {
                display: flex;
                position: absolute;
                align-items: center;
                width: 670px;
                height: 120px;
                /* background-color: grey; */
                top: 17%;
            }

                .content .feature img {
                    left: 2%;
                    width: 55px;
                    position: absolute;
                    display: flex;
                    outline: grey solid 3.4px;
                    outline-offset: 5px;
                    border-radius: 50px;
                    transition: all 1s ease-in-out;
                }

                    .content .feature img:hover {
                        transform: rotate(360deg);
                        cursor: pointer;
                    }

        .feature h4 {
            display: flex;
            position: absolute;
            font-weight: 600;
            color: black;
            left: 16%;
            top: 19px;
            text-shadow: 0.5px 0.5px 20px black;
        }

        .feature p {
            display: flex;
            position: absolute;
            font-weight: 600;
            letter-spacing: 0.6px;
            font-size: 15px;
            color: darkgrey;
            left: 16%;
            top: 59px;
        }
        /* --------------- payment icon ---------------- */
        .content .feature-2 {
            display: flex;
            position: absolute;
            width: 670px;
            height: 120px;
            /* background-color: red; */
            top: 50%;
            align-items: center;
        }

            .content .feature-2 img {
                left: 2%;
                width: 55px;
                position: absolute;
                display: flex;
                outline: grey solid 3.4px;
                outline-offset: 5px;
                border-radius: 50px;
                transition: all 1s ease-in-out;
            }

                .content .feature-2 img:hover {
                    transform: rotate(360deg);
                    cursor: pointer;
                }

        .feature-2 h4 {
            display: flex;
            position: absolute;
            font-weight: 600;
            color: black;
            left: 16%;
            top: 19px;
            text-shadow: 0.5px 0.5px 20px black;
        }

        .feature-2 p {
            display: flex;
            position: absolute;
            font-weight: 600;
            letter-spacing: 0.6px;
            font-size: 15px;
            color: darkgrey;
            left: 16%;
            top: 59px;
        }
        /* --------------------- Text- ---------------------- */
        . {
            position: relative;
            transform: translateY(35px);
            opacity: 0;
            transition: all 1s ease;
        }

            ..active {
                transform: translateY(0px);
                opacity: 1;
            }
        /* --------- preloader --------- */
        #preloader {
            background: #000 url(/images/loader-gif.gif) no-repeat center center;
            height: 100vh;
            width: 100%;
            position: fixed;
            z-index: 100;
        }
        /* iframe */
        .iframe {
            display: none;
        }
        /* ------------------------------------- Discount --------------------------------------- */
        #sale {
            position: relative;
            width: 100%;
            height: 100vh;
            background-color: #c9f0ff;
            padding: 30px;
        }

            #sale h1 {
                display: block;
                position: relative;
                font-weight: 800;
                font-size: 47px;
                text-transform: uppercase;
                font-family: Georgia, 'Times New Roman', Times, serif;
                letter-spacing: 1px;
                top: -20px;
            }

            #sale span {
                color: #ce4257;
            }

            #sale .discount {
                display: flex;
                position: absolute;
                width: 35%;
                height: 55%;
                background: #000;
                box-shadow: 6px 6px 30px #000;
                left: -1%;
                border-radius: 15px;
                margin-left: 2px;
            }

        .discount .top-line {
            display: flex;
            position: relative;
            width: 16%;
            height: 5px;
            background-color: #fff;
            top: 20%;
            left: 10.5%;
            box-shadow: 0.5px 0.5px 30px white;
        }
        /* ---------[ Up to ] text ------------ */
        .discount h2 {
            display: flex;
            position: absolute;
            font-weight: 800;
            font-size: 50px;
            text-transform: uppercase;
            left: 10%;
            top: 16%;
            color: #fff;
        }

        .discount .botton-line {
            display: flex;
            position: relative;
            width: 16%;
            height: 5px;
            background-color: #fff;
            top: 52%;
            left: -5.5%;
            box-shadow: 0.5px 0.5px 30px white;
        }
        /* -------------- 60%  --------------- */
        .discount h3 {
            display: flex;
            position: relative;
            font-size: 150px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-weight: 800;
            top: 32px;
            letter-spacing: -9px;
            left: -15px;
            color: #fff;
            text-shadow: 0.5px 0.5px 20px white;
        }
        /* -------------- ( % )  --------------- */
        .discount p {
            display: flex;
            position: relative;
            font-weight: 800;
            font-size: 85px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            left: 3px;
            top: 53px;
            color: #fff;
            text-shadow: 0.5px 0.5px 30px white;
        }
        /* -------------- ( Off Text )  --------------- */
        .discount h4 {
            display: flex;
            position: absolute;
            font-weight: 800;
            font-size: 32px;
            text-transform: uppercase;
            left: 66%;
            top: 39%;
            color: #fff;
            text-shadow: 0.5px 0.5px 30px white;
        }
        /* -------------- ( some Text )  --------------- */
        .discount h5 {
            display: block;
            position: absolute;
            color: #f0f0f0f0;
            font-size: 15px;
            letter-spacing: 0.6px;
            text-align: center;
            left: 45px;
            top: 63%;
        }
        /* -------------- ( Button / Shop Now )  --------------- */
        .discount a {
            display: flex;
            position: absolute;
            color: white;
            text-decoration: none;
            border: 1.5px solid white;
            padding: 7px 10px;
            left: 35%;
            top: 79%;
            border-radius: 7px;
            font-weight: 600;
            font-size: 15px;
            letter-spacing: 0.8px;
            box-shadow: 0px 0px 13px #fff;
            transition: all 0.5s ease;
        }

            .discount a:hover {
                color: #000;
                background-color: #fff;
            }
        /* ----------- Strait Line ----------- */
        #sale .strait-line {
            display: flex;
            position: relative;
            width: 3px;
            height: 300px;
            background-color: grey;
            left: 40%;
            top: -200px;
        }
        /* --------------- sale-img (shoes) ----------------- */
        #sale .sale-img {
            display: flex;
            position: relative;
            /* background-color: red; */
            width: 45%;
            align-items: center;
            top: -88.5%;
            left: 46%;
        }

        .sale-img img {
            width: 900px;
        }
        /* -------------------- Extra Text ------------------------ */
        #sale .best-site {
            display: block;
            position: absolute;
            width: 43%;
            height: 25%;
            left: 729px;
            top: 380px;
            border-top-left-radius: 80px;
            border-bottom-left-radius: 80px;
            background-color: grey;
        }

            #sale .best-site h6 {
                position: relative;
                font-size: 35px;
                font-weight: 900;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                font-style: italic;
                text-align: center;
                top: 35px;
                color: whitesmoke;
                /* -webkit-text-stroke: 1.5px #fff;
            background-image: linear-gradient(red,black);
            -webkit-background-clip: text;
            color: transparent;   
            background-position: -1250px 0;  
            background-repeat: no-repeat;
            animation: backcolor 4s linear infinite forwards;
            text-shadow: 0.5px 0.5px 30px white; */
            }
        /* ---------------------- Brand collaboration section --------------------------- */
        #collaboration {
            display: block;
            position: relative;
            /* background: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)) , url(/images/background_brand.jpg) ,transparent;
            background-position: center;
            background-size: cover; */
            width: 100%;
            height: 65vh;
            /* background-color: #161a25; */
        }

            #collaboration h1 {
                display: block;
                position: relative;
                text-align: center;
                height: 60px;
                font-weight: 600;
                font-size: 34.5px;
                letter-spacing: 1px;
                color: orangered;
                top: 5%;
                /* background-color: red; */
            }

            #collaboration span {
                display: flex;
                position: relative;
                background-color: #000;
                width: 20%;
                height: 2px;
                left: 39%;
                top: -0.8%;
            }
            /* ----------------- brands ---------------- */
            #collaboration .brands {
                display: flex;
                position: absolute;
                align-items: center;
                justify-content: space-evenly;
                padding: 160px 0px;
                width: 93%;
                left: 3.4%;
                height: 300px;
                top: 20%;
                /* background-color: red; */
            }
        /* ----------------- Logo ------------------ */
        .brands .logo {
            display: flex;
            position: relative;
            align-items: center;
            justify-content: center;
            width: 17%;
            height: 149px;
            left: -0.5%;
            border-radius: 10px;
            /* background-color: lightgrey; */
            border: 1.4px dotted black;
        }

            .brands .logo img {
                width: 150px;
                transition: all 0.4s ease;
            }

                .brands .logo img:hover {
                    width: 185px;
                    cursor: pointer;
                }
        /* ---------------------------------------- Contact Us ---------------------------------------- */
        #contact {
            display: flex;
            position: relative;
            justify-content: center;
            width: 100%;
            height: 100vh;
            padding: 10px;
            /* background-color: lightblue; */
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
        /* -------------------------------------- Footer --------------------------------------- */
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
    <section id="header">

        <div class="home-content">
            <h1>Branded <span>Shoes</span> Collection</h1>
            <p>
                Shoes take you places, literally. They are an essential
                part of everyday life, so it makes sense that quotes about shoes
                and life are easy to find. If you’re looking for the ideal
                shoes caption for Instagram or even walk in my shoe quotes, you’re
                in the right place.
            </p>
            <a href="#">
                <button class="btn" onclick="btnLogin_Click">Shop Now</button></a>


            <div class="image">
                <img src="/images/newbalance_shoes.png" alt="">
            </div>
        </div>
    </section>

    <section id="men-shoes">
        <span></span>
        <h1>Men - Shoes</h1>

        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        <div class="men-collection ">
            <div class="sports">
                <img src="/images/puma_shoes.jpeg" alt="puma">
                <a class="btn" href="/customer/puma_shoes_m_sneaker.aspx">Puma</a>
            </div>
            <div class="sports">
                <img src="/images/us_polo_shoes.jpg" alt="us polo" style="width: 360px;">
                <a class="btn" href="/customer/uspolo_shoes_m_sneaker.aspx">Us polo</a>
            </div>
            <div class="sports">
                <img src="/images/addidas.jpg" alt="addidas" style="width: 360px;">
                <a class="btn" href="/customer/adidas_shoes_m_sneaker.aspx">Adidas</a>
            </div>
        </div>
    </section>

    <!---------------------------------- Men's Slider -------------------------------->
    <%--<section id="men-slipper">
        <span></span>
        <h1>Men - Slider</h1>

        <div class="men-collection ">
            <div class="sports">
                <img src="/images/puma_slider.jpg" alt="puma" style="width: 360px;">
                <a class="btn" href="brands/puma_m_slider.php">Puma</a>
            </div>
            <div class="sports">
                <img src="/images/us_polo_slider.jpg" alt="us polo" style="width: 360px;">
                <a class="btn" href="brands/uspolo_m_slider.php">Us Polo</a>
            </div>
            <div class="sports">
                <img src="/images/addidas_slider.jpg" alt="addidas" style="width: 360px;">
                <a class="btn" href="brands/adidas_m_slider.php">Adidas</a>
            </div>
        </div>
    </section>--%>

    <!---------------------------------- Men's Slipper -------------------------------->
    <%--<section id="men-flipflop">
        <span></span>
        <h1>Men - Slipper</h1>

        <div class="men-collection ">
            <div class="sports">
                <img src="/images/puma_slipper.jpg" alt="puma" style="width: 360px;">
                <a class="btn" href="brands/puma_m_slipper.php">Puma</a>
            </div>
            <div class="sports">
                <img src="/images/us_polo_slipper.jpg" alt="uspolo" style="width: 360px;">
                <a class="btn" href="brands/uspolo_m_slipper.php">us polo</a>
            </div>
            <div class="sports">
                <img src="/images/addidas_slipper.jpg" alt="addidas" style="width: 360px;">
                <a class="btn" href="brands/adidas_m_slipper.php">Adidas</a>
            </div>
        </div>
    </section>--%>

    <p class="grey-line"></p>

    <!---------------------------------- Women's Shoes -------------------------------->

    <section id="women-shoes">
        <span></span>
        <h1>Women - Shoes</h1>

        <div class="women-collection ">
            <div class="sports">
                <img src="/images/puma_shoes_women.jpg" alt="puma" style="width: 360px;">
                <a class="btn" href="/customer/puma_shoes_w_sneaker.aspx">Puma</a>
            </div>
            <div class="sports">
                <img src="/images/us_polo_shoes_women.jpg" alt="uspolo" style="width: 360px;">
                <a class="btn" href="/customer/uspolo_shoes_w_sneaker.aspx">us polo</a>
            </div>
            <div class="sports">
                <img src="/images/addidas_shoes_women.jpg" alt="addidas" style="width: 360px;">
                <a class="btn" href="/customer/adidas_shoes_w_sneaker.aspx">Adidas</a>
            </div>
        </div>
    </section>

    <!---------------------------------- Women's Slider -------------------------------->

   <%-- <section id="women-slider">
        <span></span>
        <h1>Women - Slider</h1>

        <div class="women-collection ">
            <div class="sports">
                <img src="/images//puma_slider_women.jpg" alt="puma" style="width: 360px;">
                <a class="btn" href="brands/puma_w_slider.php">Puma</a>
            </div>
            <div class="sports">
                <img src="/images/fila_slider_women.jpg" alt="fila" style="width: 360px;">
                <a class="btn" href="brands/fila_w_slider.php">Fila</a>
            </div>
            <div class="sports">
                <img src="/images/addidas_slider_women.jpg" alt="addidas" style="width: 360px;">
                <a class="btn" href="brands/adidas_w_slider.php">Adidas</a>
            </div>
        </div>
    </section>--%>

    <!---------------------------------- Women's Slipper -------------------------------->

    <%--<section id="women-slipper">
        <span></span>
        <h1>Women - Slipper</h1>

        <div class="women-collection ">
            <div class="sports">
                <img src="/images/puma_slipper_women.jpg" alt="puma" style="width: 360px;">
                <a class="btn" href="brands/puma_w_slipper.php">Puma</a>
            </div>
            <div class="sports">
                <img src="/images/bata_slipper_women.jpg" alt="slipper" style="width: 360px;">
                <a class="btn" href="brands/bata_w_slipper.php">Bata</a>
            </div>
            <div class="sports">
                <img src="/images/addidas_slipper_women.jpg" alt="addidas" style="width: 360px;">
                <a class="btn" href="brands/adidas_w_slipper.php">Adidas</a>
            </div>
        </div>
    </section>--%>

    <!---------------------------------- Features -------------------------------->
    <section id="offer">
        <h1>Features</h1>
        <span></span>

        <div class="img ">
            <img src="/images/shoes_home.png" alt="shoes">
        </div>

        <div class="content ">
            <h2>Why Choose Us</h2>

            <div class="feature ">
                <img src="/images/tick_icon.png" alt="">
                <h4>Trusted Store</h4>
                <p>More than one thousand people trusted on our store.</p>
            </div>

            <div class="feature-2 ">
                <img src="/images/payment_icon.png" alt="">
                <h4>Secure Payment</h4>
                <p>Our payment system is secured from hacking.</p>
            </div>
        </div>

        <iframe class="iframe" width="560" height="315" src="https://www.youtube.com/embed/63CPQl00khg?si=_TEqle2DvrjgHhkZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>
        <iframe class="iframe" width="560" height="315" src="https://www.youtube.com/embed/63CPQl00khg?si=_TEqle2DvrjgHhkZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>
        <iframe class="iframe" width="560" height="315" src="https://www.youtube.com/embed/63CPQl00khg?si=_TEqle2DvrjgHhkZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>
        <iframe class="iframe" width="560" height="315" src="https://www.youtube.com/embed/63CPQl00khg?si=_TEqle2DvrjgHhkZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>
        <iframe class="iframe" width="560" height="315" src="https://www.youtube.com/embed/63CPQl00khg?si=_TEqle2DvrjgHhkZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>
        <iframe class="iframe" width="560" height="315" src="https://www.youtube.com/embed/63CPQl00khg?si=_TEqle2DvrjgHhkZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>

    </section>

    <!---------------------------------- Sale / Discount -------------------------------->
    <section id="sale">
        <h1 class="">Exclusive
            <br>
            <span>Winter</span>
            <br>
            |Sale</h1>

        <div class="discount ">
            <span class="top-line"></span>
            <h2>Up
                <br>
                To</h2>
            <span class="botton-line"></span>
            <h3>60</h3>
            <p>%</p>
            <h4>Off</h4>
            <h5>Shop Great Brands at an even better price.</h5>

            <a href="#">Shop Now</a>
        </div>

        <span class="strait-line"></span>

        <div class="sale-img ">
            <img src="/images/sale_shoes.png" alt="sale-img">
        </div>

        <div class="best-site ">
            <h6>Best Website to buy
                <br>
                Shoes in Surat !</h6>
        </div>

    </section>

    <!---------------------------------- Brand Collabration -------------------------------->

    <section id="collaboration">
        <h1>Brand Collaboration</h1>
        <span></span>

        <div class="brands ">
            <div class="logo">
                <img src="/images/puma_logoo.png" alt="puma logo">
            </div>
            <div class="logo">
                <img src="/images/us_polo_logo.png" alt="uspolo logo">
            </div>
            <div class="logo">
                <img src="/images/adidas_logo.png" alt="adidas logo">
            </div>
            <div class="logo">
                <img src="/images/bata_logo.png" alt="bata logo">
            </div>
            <div class="logo">
                <img src="/images/fila_logo.png" alt="fila logo">
            </div>

        </div>
    </section>

    <span class="horizontal-contact-line"></span>

    <!-------------------------------------------- contact us ---------------------------------------->
    <section id="contact">
        <h1>Contact Us</h1>
        <span></span>

        <div class="contact-logo ">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14876.171737263845!2d72.9018936!3d21.230146!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be0458ad5141465%3A0x9289d379d8ae4d4!2sRise%20On%20Plaza!5e0!3m2!1sen!2sin!4v1694705163711!5m2!1sen!2sin"
                width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" alt="Map Loading Error"></iframe>
        </div>

        <div class="contact-details ">
            <h2 class="phone"><i style="color: #000;" class="glyphicon glyphicon-earphone"></i>&nbsp;&nbsp;+91 76900 00989</h2>
            <h2 class="mail"><i style="color: #000;" class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;shoesshop8700@gmail.com</h2>
            <h2 class="address"><i style="color: #000;" class="glyphicon glyphicon-map-marker"></i>&nbsp;&nbsp;A - 101 , Rise On Plaza , Ground Flore ,
                <br>
                &nbsp;&nbsp;Sarthana Jakatnaka , Surat-kamrej Highway
                <br>
                &nbsp;&nbsp;| Gujarat - 395008.</h2>
        </div>

        <div class="working-hours ">
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

    <a class="gotop" href="#header"><i class="fas fa-arrow-up"></i></a>
</asp:Content>
