<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="staff_view_feedback.aspx.cs" Inherits="ShoesShopSystem.WebForm43" EnableEventValidation="false" %>

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
            width: 110%;
            max-width: 98%;
            border-collapse: collapse;
            top: -370px;
            left: 330px;
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
        /* ----------------------- View Product List Text On Top ----------------------- */
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
            <h3><span class="glyphicon glyphicon-envelope"></span> Feedback</h3>
        </div>
        <form id="form1">
            <asp:GridView ID="GridView4" CssClass="table" runat="server" AutoGenerateColumns="False" GridLines="None" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="feedback_id" HeaderText="feedback_id" />
                    <asp:BoundField DataField="c_name" HeaderText="c_name" />
                    <asp:BoundField DataField="email" HeaderText="email" />
                    <asp:BoundField DataField="message" HeaderText="message" />

                   <%-- <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("feedback_id") %>' OnClick="btnDelete_Click" CssClass="btn btn-danger">
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

