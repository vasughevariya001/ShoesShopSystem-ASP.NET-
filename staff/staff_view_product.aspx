<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="staff_view_product.aspx.cs" Inherits="ShoesShopSystem.WebForm39" EnableEventValidation="false" %>

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
        table {
            box-shadow: 0px 0px 27px #000;
            width: 250%;
            border-collapse: collapse;
            top: -380px;
            left: 340px;
            position: relative;
            background-color: transparent;
            border: 1px solid #000;
            border-radius: 4px;
        }

            table th,
            table td {
                padding: 10px;
                line-height: 1.42857143;
                vertical-align: top;
                border-top: 1.5px solid #ddd;
                border-right: 1.5px solid #ddd;
            }

            table th {
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


        .img {
            position: relative;
            width: 170px;
            padding: 10px;
        }

        .alert.alert-info {
            display: flex;
            position: absolute;
            /* background-color: lightgreen; */
            width: 250%;
            height: 9vh;
            align-items: center;
            left: 35.5%;
            top: -464px;
        }

            .alert.alert-info h3 {
                position: relative;
                font-weight: 600;
            }

        /*tr th {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
        }


        tr td {
            padding: 20px 10px;
            text-align: center;
            font-family: 'Times New Roman';
        }

        th {
            background-color: #f2f2f2;
            text-align: center;
            font-size: 13px;
            text-transform: uppercase;
            padding: 10px;
        }

        td {
            border: 1px solid black;
            padding: 10px;
        }*/

        input[type="text"], select {
            width: 100%;
            padding: 8px;
            border: none;
            ;
            border-radius: 4px;
            box-sizing: border-box;
            text-align: center;
            font-size: 16px;
        }

        /* Styles for file upload */
        input[type="file"] {
            
        }

        .image-container {
            position: relative;
        }

            .image-container img {
                position: relative;
                width: 170px;
                padding: 10px;
            }

        /* Styles for buttons */
        .btnproductform {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
        }

            .btnproductform:hover {
                background-color: #45a049;
            }

        .daaa {
            background-color: red;
        }

            .daaa:hover {
                background-color: #fa3838;
            }

        .lblbrand {
            font-size: 15px;
            text-transform: uppercase;
            color: #000;
        }

        .lblcategory {
            font-size: 15px;
            text-transform: uppercase;
            color: #000;
        }

        .drop-down {
            position: relative;
            /*width: 120px;
            height: 40px;*/
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-9">
        <div class="alert alert-info">
            <h3><span class="glyphicon glyphicon-list"></span>Product List</h3>
        </div>
        <%--<form id="form1">
        <asp:GridView ID="GridView3" CssClass="table" runat="server" AutoGenerateColumns="False" GridLines="None" CellPadding="4" ForeColor="#333333">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <img class="image img" src='<%# GetImageSrc(Eval("image")) %>' alt="" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="brand" HeaderText="brand" />
                <asp:BoundField DataField="category" HeaderText="category" />
                <asp:BoundField DataField="gender" HeaderText="gender" />
                <asp:BoundField DataField="stock" HeaderText="stock" />
                <asp:BoundField DataField="description" HeaderText="description" />
                <asp:BoundField DataField="nprice" HeaderText="nprice" />
                <asp:BoundField DataField="size" HeaderText="size" />
                <asp:BoundField DataField="sole_material" HeaderText="sole_material" />
                <asp:BoundField DataField="outer_material" HeaderText="outer_material" />
                <asp:BoundField DataField="occasion" HeaderText="occasion" />
                <asp:BoundField DataField="model_name" HeaderText="model_name" />

                <asp:TemplateField HeaderText="Update">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnUpdate" runat="server" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-edit"></span>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-danger" OnClick="btnDelete_Click">
                            <span class="glyphicon glyphicon-trash"></span>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <EmptyDataTemplate>
                <div class="alert alert-info">No data available</div>
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
    </form>--%>






        <div class="ppp">
            <asp:Repeater ID="ProductRepeater" runat="server" OnItemDataBound="ProductRepeater_ItemDataBound" OnItemCommand="ProductRepeater_ItemCommand">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Id</th>
                            <th>Image</th>
                            <th>brand</th>
                            <th>category</th>
                            <th>Gender</th>
                            <th>Stock</th>
                            <th>Description</th>
                            <th>price</th>
                            <th>size</th>
                            <th>sole_material</th>
                            <th>outer_material</th>
                            <th>occasion</th>
                            <th>model_name</th>
                            <th>update</th>
                            <th>delete</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="ProductIdLabel" runat="server" Text='<%# Eval("id") %>' Visible="true" />
                        </td>

                        <td>
                            <div class="image-container">
                                <asp:Image ID="ProductImage" runat="server" CssClass="img" ImageUrl='<%#GetImageSrc(Eval("image")) %>' />
                                <asp:FileUpload ID="PhotoUpload" runat="server" />
                            </div>
                        </td>

                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("brand") %>' CssClass="lblbrand" Visible="true" />
                            <asp:DropDownList ID="BrandDropDown" runat="server" CssClass="usid drop-down">
                                <asp:ListItem Value="puma">PUMA</asp:ListItem>
                                <asp:ListItem Value="u.s.polo">U.S.POLO</asp:ListItem>
                                <asp:ListItem Value="adidas">ADIDAS</asp:ListItem>
                                <asp:ListItem Value="bata">BATA</asp:ListItem>
                                <asp:ListItem Value="fila">FILA</asp:ListItem>
                            </asp:DropDownList>
                        </td>

                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("category") %>' CssClass="lblcategory" Visible="true" />
                            <asp:DropDownList ID="CategoryDropDown" runat="server" CssClass="usid drop-down">
                                <asp:ListItem Value="sneakers">SNEAKERS</asp:ListItem>
                                <asp:ListItem Value="sports">SPORTS</asp:ListItem>
                                <asp:ListItem Value="running">RUNNING</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgender" runat="server" CssClass="usid" Text='<%# Eval("gender") %>'></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtstock" runat="server" CssClass="usid" Text='<%# Eval("stock") %>'></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtdescript" runat="server" CssClass="usid" Text='<%# Eval("description") %>'></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtprice" runat="server" CssClass="usid" Text='<%# Eval("nprice") %>'></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtsize" runat="server" CssClass="usid" Text='<%# Eval("size") %>'></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtsole_material" runat="server" CssClass="usid" Text='<%# Eval("sole_material") %>'></asp:TextBox>
                        </td>

                        <td>
                            <asp:TextBox ID="txtouter_material" runat="server" CssClass="usid" Text='<%# Eval("outer_material") %>'></asp:TextBox>
                        </td>

                        <td>
                            <asp:TextBox ID="txtoccasion" runat="server" CssClass="usid" Text='<%# Eval("occasion") %>'></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtmodel_name" runat="server" CssClass="usid" Text='<%# Eval("model_name") %>'></asp:TextBox>
                        </td>
                        <td>
                            <%--<asp:Button ID="UpdateButton" runat="server" CssClass="btnproductform" Text="Update" OnClick="UpdateButton_Click" />--%>
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-primary" OnClick="UpdateButton_Click">
                            <span class="glyphicon glyphicon-edit"></span>
                        </asp:LinkButton>

                        </td>
                        <td>
                            <%--<asp:Button ID="DeleteButton" runat="server" CssClass="btnproductform daaa" Text="Delete" OnClick="DeleteButton_Click" />--%>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-danger" OnClick="DeleteButton_Click">
                            <span class="glyphicon glyphicon-trash"></span>
                        </asp:LinkButton>
                        </td>

                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>




    </div>
</asp:Content>
