<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ShoesShopSystem.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration page</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
        integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <style>
        * {
            margin: 0px;
            padding: 0px;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url(images/shoes_sign_up.jpg), transparent;
            /* background: yellow; */
            background-position: center;
            background-size: cover;
        }

        .navbar {
            position: absolute;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 70px;
            background: #fff;
            display: inline-block;
            text-align: center;
            top: 0;
        }

        .logo {
            display: flex;
            align-items: center;
            position: absolute;
            width: 100px;
            padding: 7px;
            top: -30%;
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
                color: black;
                padding: 7px 12px;
                transition: all 0.6s ease;
                left: 28px;
            }

                .navbar ul li a:hover {
                    border-radius: 30px;
                    background-color: black;
                    color: white;
                }

        .container {
            background: #222;
            position: relative;
            width: 430px;
            height: 550px;
            border-radius: 10px;
            left: 1%;
            top: 30px;
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
                    top: -30px;
                    color: #fff;
                    font-weight: 500;
                    text-align: center;
                    /* font-size: 28px; */
                    left: 20px;
                    letter-spacing: 0.1em;
                }

                .container form .inputbox {
                    position: relative;
                    top: -45px;
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
                        font-size: 1.1em;
                        letter-spacing: 0.05em;
                        transition: 0.5s;
                        z-index: 10;
                    }

                    .container form .inputbox span {
                        position: absolute;
                        left: 0;
                        top: 3px;
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
                    width: 109%;
                    left: 10px;
                    padding: 9px;
                    top: -15px;
                    border: none;
                    outline: none;
                    background: #fff;
                    color: #000;
                    cursor: pointer;
                    font-size: 1.1em;
                    font-weight: 600;
                    border-radius: 30px;
                }

                .container form p {
                    display: flex;
                    position: relative;
                    top: 8px;
                    font-size: 14.5px;
                    justify-content: space-between;
                    color: #fff;
                }

                    .container form p a {
                        color: lightblue;
                    }
                .container form .otp-btn {
                    text-align: center;
                    text-decoration: none;
                    position: relative;
                    width: 28%;
                    left: 85%;
                    top: -35px;
                    padding: 9px;
                    height: 30px;
                    border: none;
                    outline: none;
                    background: #fff;
                    color: #000;
                    cursor: pointer;
                    font-size: 0.8em;
                    font-weight: 600;
                    border-radius: 30px;
                }
    </style>

</head>
<body>
    <div class="container">
        <div class="sss">
        <form id="form1" runat="server" action="" method="post">
        
            <h1>Sign up</h1>

            <div class="inputbox">
                <asp:TextBox ID="uname" runat="server" required></asp:TextBox>
                <span>Username</span>
                <i></i>
            </div>

            <div class="inputbox">
                <asp:TextBox ID="email" runat="server" CssClass="form-control" required></asp:TextBox>
                <span>Email id</span>
                <i></i>
            </div>

            <div class="inputbox">
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" required></asp:TextBox>
                <span>Password</span>
                <i></i>
            </div>

            <div class="inputbox">
                <asp:TextBox ID="confirm_password" runat="server" TextMode="Password" CssClass="form-control" required></asp:TextBox>
                <span>Confirm password</span>
                <i></i>
            </div>
           
            <asp:Button ID="reg" runat="server" CssClass="btn" Text="Register" OnClick="reg_Click" />

                  
            <p>Already have an account? <a href="login_demo.aspx">Log in</a></p>
        </form>
            </div>
    </div>

</body>
</html>
