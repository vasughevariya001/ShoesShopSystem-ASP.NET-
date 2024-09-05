<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="staff_view_cust.aspx.cs" Inherits="ShoesShopSystem.WebForm40" EnableEventValidation="false"%>

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
            width: 96%;
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
                background-color: lightgray;
                color: #333;
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
        /* ----------------------- View Customer Text On Top ----------------------- */
        .alert.alert-info {
            display: flex;
            position: absolute;
            /* background-color: lightgreen; */
            width: 96%;
            height: 9vh;
            align-items: center;
            left: 35.5%;
            top: -464px;
        }

            .alert.alert-info h3 {
                position: relative;
                font-weight: 600;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-9">
        <div class="alert alert-info">
            <h3><span class="glyphicon glyphicon-user"></span>View Customers</h3>
        </div>

        <form id="form1">
            <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" GridLines="None" CellPadding="4" ForeColor="#333333">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" />
                    <asp:BoundField DataField="username" HeaderText="username" />
                    <asp:BoundField DataField="email" HeaderText="email" />
                    <asp:BoundField DataField="contact" HeaderText="contact" />
                    <asp:BoundField DataField="address" HeaderText="address" />
                    <asp:BoundField DataField="city" HeaderText="city" />

                    <%--<asp:TemplateField HeaderText="Remove User">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-danger" OnClick="btnDelete_Click">
                        <span class="glyphicon glyphicon-trash"></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>--%>

                </Columns>
                <EmptyDataTemplate>
                    <div class="alert alert-info">No data available</div>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
        </form>

    </div>
</asp:Content>

