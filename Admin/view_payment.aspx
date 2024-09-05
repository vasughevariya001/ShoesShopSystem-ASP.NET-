<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="view_payment.aspx.cs" Inherits="ShoesShopSystem.WebForm17" EnableEventValidation="false" %>

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

        /* .table {
    top: -460px;
    left: 340px;
    position: relative;
}*/
        .col-sm-9 h2 {
            top: -490px;
            font-size: 22px;
            left: 0px;
            position: relative;
            color: black;
            text-transform: uppercase;
            text-align: center;
        }
        /* Bootstrap table styles */
        .table {
            width: 125%;
            max-width: 130%;
            border-collapse: collapse;
            top: -380px;
            left: 340px;
            position: relative;
            background-color: transparent;
            border: 2px solid #ddd;
            border-radius: 4px;
        }

            .table th,
            .table td {
                padding: 8px;
                line-height: 1.42857143;
                vertical-align: top;
                border-top: 1.5px solid #ddd;
                border-right: 1.5px solid #ddd;
            }

            .table th {
                text-transform: uppercase;
                text-align: left;
                background-color: #DBF2DC;
                color: #000;
                font-weight: bold;
            }

        tr:hover {
            background-color: #E6E4E4;
            cursor: pointer;
        }
        /* Custom styles for the heading */
        .gridview-heading {
            margin-bottom: 20px;
            font-size: 22px;
            text-transform: uppercase;
            text-align: center;
            color: black;
        }
        /* ----------------------- View Payment List Text On Top ----------------------- */
        .alert.alert-success {
            display: flex;
            position: absolute;
            /* background-color: lightgreen; */
            width: 130%;
            height: 9vh;
            align-items: center;
            left: 35.5%;
            top: -464px;
        }

        .alert.alert-success h3 {
            position: relative;
            font-weight: 600;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="col-sm-9">
        <div class="alert alert-success">
            <h3><span class="glyphicon glyphicon-usd"></span> View Payments</h3>
        </div>

        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <form id="form1">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" GridLines="None" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="pay_id" HeaderText="payment id" />
                            <asp:BoundField DataField="order_id" HeaderText="order_id" />
                            <asp:BoundField DataField="c_name" HeaderText="customer name" />
                            <asp:BoundField DataField="email" HeaderText="email" />
                            <asp:BoundField DataField="contact" HeaderText="contact" />
                            <asp:BoundField DataField="payment_method" HeaderText="payment method" />
                            <asp:BoundField DataField="total_amount" HeaderText="total amount" />

                            <asp:TemplateField HeaderText="payment status">
                                <ItemTemplate>
                                    <asp:Label ID="lblPaymentStatus" runat="server"
                                        ForeColor='<%# GetPaymentStatusColor(Eval("payment_status").ToString()) %>'
                                        Font-Bold="true"
                                        Text='<%# Eval("payment_status") %>'></asp:Label>
                                    &nbsp;
                                    <asp:DropDownList ID="ddlNewStatus" runat="server" CssClass="p-status" OnSelectedIndexChanged="ddlNewStatus_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="" Selected="True" Disabled="True">Update Status</asp:ListItem>
                                        <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                        <asp:ListItem Value="Incomplete">Incomplete</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnUpdate" runat="server" CommandArgument='<%# Eval("pay_id") %>' CssClass="btn btn-primary" OnClick="btnUpdate_Click">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                        <EmptyDataTemplate>
                            <div class="alert alert-info">NO PAYMENTS YET !</div>
                        </EmptyDataTemplate>

                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>

    </div>
</asp:Content>
