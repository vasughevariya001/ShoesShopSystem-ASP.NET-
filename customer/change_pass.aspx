<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="change_pass.aspx.cs" Inherits="ShoesShopSystem.customer.change_pass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>

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

        body {
            display: block;
            height: 100vh;
            justify-content: center;
            align-items: center;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url(/images/shoes_sign_up.jpg), transparent;
            background-position: center;
            background-size: cover;
        }

        /* On small screens, set height to 'auto' for the grid */
        @media screen and (max-width: 767px) {
            .row.content {
                height: auto;
            }
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

        .container {
            background: #222;
            position: relative;
            width: 430px;
            height: 450px;
            border-radius: 10px;
            top: 25px;
            box-shadow: 0px 0px 20px 0px #fff;
        }

            .container form {
                position: absolute;
                padding: 50px 30px;
                border-radius: 8px;
                display: flex;
                flex-direction: column;
            }

                .container form h1 {
                    position: relative;
                    top: -18px;
                    color: #fff;
                    font-weight: 500;
                    text-align: center;
                    left: -5px;
                    width: 350px;
                    letter-spacing: 0.1em;
                }

                .container form .inputbox {
                    position: relative;
                    top: -26px;
                    width: 300px;
                    margin-top: 35px;
                }

                    .container form .inputbox input {
                        position: relative;
                        width: 100%;
                        padding: 20px 10px 10px;
                        background: transparent;
                        outline: none;
                        border: none;
                        box-shadow: none;
                        color: #23242a;
                        font-size: 1em;
                        letter-spacing: 0.05em;
                        transition: 0.5s;
                        z-index: 10;
                    }

                    .container form .inputbox span {
                        position: absolute;
                        left: 0;
                        top: -11px;
                        padding: 20px 0px 10px;
                        pointer-events: none;
                        color: #8f8f8f;
                        font-size: 1.2em;
                        letter-spacing: 0.05em;
                        transition: 0.5s;
                    }

                    .container form .inputbox input:valid ~ span,
                    .container form .inputbox input:focus ~ span {
                        color: #fff;
                        font-size: 0.85em;
                        transform: translateY(-40px);
                    }

                    .container form .inputbox i {
                        position: absolute;
                        left: 0;
                        bottom: 0;
                        width: 115%;
                        height: 2px;
                        background: lightgray;
                        border-radius: 4px;
                        overflow: hidden;
                        transition: 0.5s;
                        pointer-events: none;
                    }

                    .container form .inputbox input:valid ~ i,
                    .container form .inputbox input:focus ~ i {
                        height: 40px;
                    }

                .container form .btn {
                    text-align: center;
                    text-decoration: none;
                    position: relative;
                    width: 100%;
                    padding: 7px;
                    border: none;
                    outline: none;
                    background: #fff;
                    color: #000;
                    cursor: pointer;
                    font-size: 1.3em;
                    font-weight: 600;
                    border-radius: 30px;
                    top: 12px;
                }

        .profile-card {
            position: relative;
            display: flex;
            width: 100%;
            height: 80px;
            top: 47px;
            background-color: transparent;
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
            /* --------- Customer Logo ------- */
            .profile-card .cust-logo {
                display: block;
                position: relative;
                width: 75px;
                height: 75px;
                border-radius: 60%;
                border: 1.5px solid white;
                box-shadow: 0px 0px 20px #fff;
            }
        /* ------------------------------- profile Update (camera icon) ------------------------------------ */
        .change-photo {
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
        }
        /* ------------- change-btn ---------------- */
        .change-btn {
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
            }
        /* ------------------- hr ---------------------- */
        .line-after-photo {
            position: relative;
            top: 25px;
        }
        /* --------------------------------- Image - Upload ------------------------------- */
        .image-upload {
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
            }
        /* ------------- Upload-btn ---------------- */
        button {
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
            }
        /* ------------- Upload-icon ---------------- */
        #upload-icon {
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
                <!-------------- Shop text / Email ------------->
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
                        <li><a href="my_order.aspx"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp; My Orders</a></li>
                        <li><a href="update_profile.aspx"><span class="glyphicon glyphicon-edit"></span>&nbsp; Update Profile</a></li>
                        <li class="active"><a href="change_pass.php"><span class="glyphicon glyphicon-lock"></span>&nbsp; Change Password</a></li>
                        <li><a href="feedback.aspx"><span class="glyphicon glyphicon-envelope"></span>&nbsp; Feedback</a></li>
                        <hr>
                        <li><a href="Logout.aspx"><span class="glyphicon glyphicon-off"></span>&nbsp; Logout</a></li>
                    </ul>
                </div>

            </div>
            <br>
            <div class="col-sm-9">
                <div class="container">
                    <form id="changePasswordForm" runat="server">
                        <h1>Change Password</h1>

                        <div class="inputbox">
                            <asp:TextBox ID="oldpassTextBox" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                            <span>Old password</span>
                            <i></i>
                        </div>

                        <div class="inputbox">
                            <asp:TextBox ID="newpassTextBox" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                            <span>New Password</span>
                            <i></i>
                        </div>

                        <div class="inputbox">
                            <asp:TextBox ID="confirmpassTextBox" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                            <span>Confirm Password</span>
                            <i></i>
                        </div>

                        <asp:Button ID="change_password" runat="server" CssClass="btn" Text="Save" OnClick="change_password_Click" />
                    </form>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
