<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="staff_change_password.aspx.cs" Inherits="ShoesShopSystem.WebForm37" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            background: #222;
            position: relative;
            width: 430px;
            height: 450px;
            border-radius: 10px;
            left: 34%;
            top: -410px;
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
                top: 16px;
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
                    top: -13px;
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-9">
        <form id="form1">
            <div class="container">
                <h1>Change Password</h1>
                <br class="Apple-interchange-newline">

                <div class="inputbox">
                    <asp:TextBox ID="oldpass" runat="server" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
                    <span>Old password</span>
                    <i></i>
                </div>

                <div class="inputbox">
                    <asp:TextBox ID="newpass" runat="server" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
                    <span>New Password</span>
                    <i></i>
                </div>

                <div class="inputbox">
                    <asp:TextBox ID="confirmpass" runat="server" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
                    <span>Confirm Password</span>
                    <i></i>
                </div>
                <asp:Button ID="staff_password" runat="server" Text="save" CssClass="btn" OnClick="staff_password_Click" />
                <%--<asp:Button ID="save" runat="server" Text="Savejhvfjhvdhvbdhbvdjhvbdhvbfhdbfjhbfdbfvjhfbvdefved" CssClass="btn" />--%>
            </div>
        </form>
    </div>
</asp:Content>

