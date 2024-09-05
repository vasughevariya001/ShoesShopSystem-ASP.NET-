<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="staff_update_profile.aspx.cs" Inherits="ShoesShopSystem.WebForm44" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            /*background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url(/images/shoes_sign_up.jpg), transparent;*/
            background-position: center;
            background-size: cover;
        }

        .container {
            background: #222;
            position: relative;
            width: 410px;
            height: 480px;
            border-radius: 10px;
            top: 80px;
            box-shadow: 0px 0px 30px 0px #000;
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
                top: 8px;
                color: #fff;
                font-weight: 500;
                text-align: center;
                left: 22px;
                width: 350px;
                letter-spacing: 0.1em;
            }

            .container .inputbox {
                position: relative;
                top: 32px;
                left: 22px;
                width: 300px;
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
                    color: #23242a;
                    font-size: 1em;
                    letter-spacing: 0.05em;
                    transition: 0.5s;
                    z-index: 10;
                }

                .container .inputbox span {
                    position: absolute;
                    left: 0;
                    top: -7px;
                    padding: 20px 0px 10px;
                    pointer-events: none;
                    color: #8f8f8f;
                    font-size: 1.2em;
                    letter-spacing: 0.05em;
                    transition: 0.5s;
                }

                .container .inputbox input:valid ~ span,
                .container .inputbox input:focus ~ span {
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
                    background: lightgray;
                    border-radius: 4px;
                    overflow: hidden;
                    transition: 0.5s;
                    pointer-events: none;
                }

                .container .inputbox input:valid ~ i,
                .container .inputbox input:focus ~ i {
                    height: 40px;
                }

            .container .btn {
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
                top: 78px;
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-sm-9">
        <div class="container">
            <form id="updateProfileForm">
                <h1>Update Profile</h1>

                <div class="inputbox">
                    <asp:TextBox ID="nameTextBox" runat="server" CssClass="form-control" required></asp:TextBox>
                    <span>Username</span>
                    <i></i>
                </div>

                <div class="inputbox">
                    <asp:TextBox ID="emailTextBox" runat="server" CssClass="form-control" type="email" required></asp:TextBox>
                    <span>Email id</span>
                    <i></i>
                </div>

                <div class="inputbox">
                    <asp:TextBox ID="contactTextBox" runat="server" CssClass="form-control" type="Phone" required MaxLength="10"></asp:TextBox>
                    <span>Contact</span>
                    <i></i>
                </div>


                <div class="inputbox">
                    <asp:TextBox ID="addressTextBox" runat="server" CssClass="form-control" required></asp:TextBox>
                    <span>Address</span>
                    <i></i>
                </div>

                <div class="buttons">
                    <asp:Button ID="updateButton" runat="server" CssClass="btn" Text="Update" OnClick="updateButton_Click" />
                </div>
            </form>
        </div>
    </div>

</asp:Content>
