<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="staff_add_product.aspx.cs" Inherits="ShoesShopSystem.WebForm38" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .row.content {
            height: 550px;
        }


        /* On small screens, set height to 'auto' for the grid */
        @media screen and (max-width: 767px) {
            .row.content {
                height: auto;
            }
        }


        /* ---------------------------- Add Product Text --------------------- */
        .col-sm-9 {
            display: flex;
            position: relative;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

            .col-sm-9 h1 {
                display: block;
                position: relative;
                text-align: center;
                justify-content: center;
                font-size: 28px;
                text-transform: uppercase;
                font-weight: 600;
                top: -35px;
                left: -22%;
            }
        /* ---------------------- Form-box | for add product -------------------------- */
        #form1 {
            display: block;
            position: absolute;
            top: 110px;
            left: 30%;
            width: 67%;
            height: 170vh;
            padding: 22px;
            border: 1.5px solid grey;
            border-radius: 8px;
            background-color: whitesmoke;
            box-shadow: -3px 7px 27px #000;
        }

            #form1 label {
                display: block;
                position: relative;
                font-size: 16px;
                font-weight: 600;
                letter-spacing: 0.5px;
                margin: 5px;
                left: -76%;
            }
        /* ---- Image - Upload ------  */
        .image-upload {
            position: absolute;
            display: flex;
            left: 39%;
            top: 10%;
            width: 65vh;
            height: 15vh;
            padding: 0px;
            align-items: center;
            border-radius: 5px;
            border: 1px dashed orangered;
            box-shadow: 0px 0px 30px #FFE5E5;
        }

            .image-upload:hover {
                background-color: #FBEEE9;
            }

        .lbladd_product {
            position: relative;
            top: -70%;
            width: 125%;
        }
        /* ------------------ drop down --------------- */
        /* --------- category ------ */
        #form1 .category {
            position: relative;
            font-size: 14px;
            width: 45%;
            padding: 4px;
            left: -61%;
        }

        #form1 .stock {
            display: flex;
            position: absolute;
            top: 12%;
        }
        /* --------- brand ------ */
        #form1 .brand {
            position: relative;
            font-size: 14px;
            width: 45%;
            padding: 4px;
            left: -61%;
        }
        /* --------- gender ------ */
        #form1 .gender {
            position: relative;
            left: -61%;
            font-size: 14px;
            width: 45%;
            padding: 4px;
        }

        #form1 input {
            position: relative;
            font-size: 14.5px;
            width: 100%;
            padding: 4px;
            left: -35%;
        }
        /* ------------- Enter Product Details ----------- */
        #form1 h4 {
            display: block;
            position: relative;
            top: -160px;
            left: -170px;
            text-align: center;
            font-size: 19px;
            text-transform: uppercase;
            font-weight: 700;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        /* -------- btn btn-primary (Add Product) ----------- */
        .btn.btn-primary {
            padding: 7px;
            font-size: 17px;
            top: -120px;
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

        .upload-box {
            position: relative;
            display: block;
            left: -100px;
            top: -162px;
            width: 95vh;
            height: 30vh;
            justify-content: center;
        }



        h2 {
            top: -490px;
            font-size: 22px;
            left: -20px;
            position: relative;
            color: black;
            text-transform: uppercase;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<h2><span class="glyphicon glyphicon-plus"></span>&nbsp; Add Product</h2>--%>
    <div class="col-sm-9">

        <h1>Add Products</h1>

        <form id="form1" method="post" enctype="multipart/form-data">

            <asp:Label runat="server" AssociatedControlID="brand">Brand :</asp:Label>
            <asp:DropDownList ID="brand" runat="server" class="brand" OnSelectedIndexChanged="brand_SelectedIndexChanged1">
                <asp:ListItem Value="" Selected="True" Disabled>Select Brand</asp:ListItem>
                <asp:ListItem Value="puma">PUMA</asp:ListItem>
                <asp:ListItem Value="u.s.polo">U.S.POLO</asp:ListItem>
                <asp:ListItem Value="adidas">ADIDAS</asp:ListItem>
                <asp:ListItem Value="bata">BATA</asp:ListItem>
                <asp:ListItem Value="fila">FILA</asp:ListItem>
            </asp:DropDownList><br>
            <br>

            <asp:Label runat="server" AssociatedControlID="category">Category :</asp:Label>
            <asp:DropDownList ID="category" runat="server" CssClass="category">
                <asp:ListItem Value="" Selected="True" Disabled>Select Category</asp:ListItem>
                <asp:ListItem Value="sneakers">SNEAKERS</asp:ListItem>
                <asp:ListItem Value="loafer">LOAFER</asp:ListItem>
                <asp:ListItem Value="sports">SPORTS</asp:ListItem>
                <asp:ListItem Value="running">RUNNING</asp:ListItem>
            </asp:DropDownList><br>
            <br>

            <asp:Label runat="server" AssociatedControlID="gender">Gender :</asp:Label>
            <asp:DropDownList ID="gender" runat="server" class="gender">
                <asp:ListItem Value="" Selected="True" Disabled>Select gender</asp:ListItem>
                <asp:ListItem Value="man">MAN</asp:ListItem>
                <asp:ListItem Value="women">WOMEN</asp:ListItem>
            </asp:DropDownList><br>
            <br>

            <div class="upload-box">
                <div class="image-upload">
                    <asp:Label runat="server" class="lbladd_product" Style="color: orangered; left: -2px;" AssociatedControlID="p_image">Add Product Image :</asp:Label>
                    <asp:FileUpload ID="p_image" name="p_image" runat="server" accept="image/png, image/jpg, image/jpeg" required /><br>
                </div>
            </div>

            <div cssclass="stock" style="position: relative; width: 100%; top: -180px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="stock">Enter Stock :</asp:Label>
                <asp:TextBox ID="stock" runat="server" InputType="Number" required></asp:TextBox>
            </div>

            <div style="position: relative; width: 100%; top: -180px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="descript">Description :</asp:Label>
                <asp:TextBox ID="descript" runat="server" required></asp:TextBox>
            </div>

            <div style="position: relative; width: 100%; top: -180px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="newprice">Sell Price :</asp:Label>
                <asp:TextBox ID="newprice" runat="server" InputType="tel" required></asp:TextBox>
            </div>

            <div style="position: relative; width: 100%; top: -180px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="oldprice">MRP :</asp:Label>
                <asp:TextBox ID="oldprice" runat="server" InputType="tel" required></asp:TextBox>
            </div>

            <div style="position: relative; width: 100%; top: -180px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="size">Size :</asp:Label>
                <asp:TextBox ID="size" runat="server" InputType="number" step="1" min="6" max="11" value="6" size="4" Style="padding: 3px;"></asp:TextBox>
            </div>

            <hr style="background-color: grey; position: relative; left: -20%; top: -160px; width: 135%; height: 1.3px;">

            <h4>Enter Product Details :</h4>

            <div style="position: relative; width: 100%; top: -150px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="sole_Material">Sole Material :</asp:Label>
                <asp:TextBox ID="sole_Material" runat="server" required></asp:TextBox>
            </div>

            <div style="position: relative; width: 100%; top: -150px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="outer_Material">Outer Material :</asp:Label>
                <asp:TextBox ID="outer_Material" runat="server" required></asp:TextBox>
            </div>

            <div style="position: relative; width: 100%; top: -150px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="occasion">Occasion :</asp:Label>
                <asp:TextBox ID="occasion" runat="server" required></asp:TextBox>
            </div>

            <div style="position: relative; width: 100%; top: -150px;">
                <asp:Label runat="server" Style="position: relative; left: -205px;" AssociatedControlID="model_name">Model Name :</asp:Label>
                <asp:TextBox ID="model_name" runat="server" required></asp:TextBox>
            </div>

            <asp:Button ID="submit" runat="server" Text="Add product" CssClass="btn btn-primary" OnClick="submit_Click" />
        </form>
    </div>

    <!----------------------- Ajax For the drpdown ------------------->
    <script>
        $(document).ready(function () {
            $('#brand').on('change', function () {
                var brand = $(this).val();
                $.ajax({
                    type: 'POST',
                    url: 'fetch_categories.php', // PHP script to handle the AJAX request
                    data: { brand: brand },
                    success: function (response) {
                        $('#category').html(response);
                    }
                });
            });
        });
    </script>
</asp:Content>

