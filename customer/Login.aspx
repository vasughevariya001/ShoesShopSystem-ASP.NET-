<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoesShopSystem.WebForm5" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        * {
            margin: 0px;
            padding: 0px;
            font-family: 'Poppins', sans-serif;
        }

        .bodyb {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #000;
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
                transition: all 0.1s ease;
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
            width: 423px;
            height: 470px;
            border-radius: 10px;
            left: 12%;
            top: 29px;
            box-shadow: 0px 0px 20px 0px #fff;
        }

            .container .abc {
                display: block;
                position: absolute;
                padding: 50px 40px;
                border-radius: 8px;
                display: flex;
                flex-direction: column;
            }

                .container .abc h1 {
                    position: relative;
                    top: -22px;
                    color: #fff;
                    font-weight: 500;
                    text-align: center;
                    /* font-size: 28px; */
                    left: 16px;
                    letter-spacing: 0.1em;
                }

                .container .abc .inputbox {
                    position: relative;
                    top: -25px;
                    width: 290px;
                    margin-top: 35px;
                }

                    .container .abc .inputbox input {
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

                    .container .abc .inputbox span {
                        position: absolute;
                        left: 0;
                        top: 3px;
                        padding: 20px 0px 10px;
                        pointer-events: none;
                        color: #8f8f8f;
                        font-size: 1.1em;
                        letter-spacing: 0.05em;
                        transition: 0.5s;
                    }

                    .container .abc .inputbox input:valid ~ span,
                    .container .abc .inputbox input:focus ~ span {
                        color: #fff;
                        font-size: 0.85em;
                        transform: translateY(-40px);
                    }

                    .container .abc .inputbox i {
                        position: absolute;
                        left: 0;
                        bottom: 0;
                        width: 106%;
                        height: 2px;
                        background: lightgray;
                        border-radius: 4px;
                        overflow: hidden;
                        transition: 0.5s;
                        pointer-events: none;
                    }

                    .container .abc .inputbox input:valid ~ i,
                    .container .abc .inputbox input:focus ~ i {
                        height: 40px;
                    }

                .container .abc .links {
                    display: flex;
                    justify-content: space-between;
                    top: 6px;
                    position: relative;
                }

                    .container .abc .links a {
                        margin: 10px 0;
                        font-size: 0.93em;
                        color: #8f8f8f;
                        text-decoration: none;
                        text-decoration: underline;
                    }

                        .container .abc .links a:hover {
                            color: #fff;
                        }

                .container .abc .btn {
                    text-align: center;
                    text-decoration: none;
                    position: relative;
                    width: 107%;
                    padding: 9px;
                    border: none;
                    outline: none;
                    background: #fff;
                    color: #000;
                    cursor: pointer;
                    font-size: 1.3em;
                    font-weight: 600;
                    border-radius: 30px;
                    top: 26px;
                }

                .container .abc p {
                    display: flex;
                    position: relative;
                    top: 30px;
                    left: 19px;
                    font-size: 14.5px;
                    justify-content: center;
                    color: #fff;
                }

                    .container .abc p a {
                        position: relative;
                        color: lightblue;
                        top: 10px;
                    }

            .container abc p a:hover {
                color: lightcyan;
            }

        .shoes {
            position: absolute;
            left: 5%;
        }

            .shoes img {
                position: relative;
                width: 370px;
                top: -12px;
                animation: shoes 1.3s linear infinite;
            }

        @keyframes shoes {
            0% {
                transform: translateY(-5px);
            }

            50% {
                transform: translateY(5px);
            }

            100% {
                transform: translateY(-5px);
            }
        }

        .container .admin-login-link {
            position: relative;
            top: 30px;
            display: flex;
        }
    </style>

    <script type="text/javascript">
        function disableBackButton() {
            history.pushState(null, null, document.URL);
            window.addEventListener('popstate', function () {
                history.pushState(null, null, document.URL);
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bodyb">
        <div class="shoes">
            <img src="/images/login_shoes_3.png" alt="shoes" />
        </div>

        <div class="container">
            <div class="abc">
                <form>
                    <h1>Login</h1>

                    <div class="inputbox">
                        <asp:TextBox ID="username" runat="server" CssClass="input" required></asp:TextBox>
                        <span>Username</span>
                        <i></i>
                    </div>

                    <div class="inputbox">
                        <asp:TextBox ID="password" runat="server" CssClass="input" TextMode="Password" required></asp:TextBox>
                        <span>Password</span>
                        <i></i>
                    </div>

                    <div class="links">
                        <a href="forgot_password.aspx">Forgot Password ?</a>
                        <a href="Registration.aspx">Sign up</a>
                    </div>

                    <asp:Button ID="login" runat="server" Text="Login" CssClass="btn" OnClick="login_Click" />

                </form>
            </div>
        </div>
    </div>
</asp:Content>
