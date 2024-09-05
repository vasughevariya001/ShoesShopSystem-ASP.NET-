<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Razorpay_payment.aspx.cs" Inherits="ShoesShopSystem.customer.Razorpay_payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <form id="form1" runat="server" action="payment_success.aspx">
        <div>
            <%--<button id="rzp-button1">Pay Now</button>--%>
            <script>
                var options = {
                    "key": "<%= RazorpayKey %>",
                    "amount": <%= AmountPaise %>,
                    "currency": "<%= DisplayCurrency %>",
                    "name": "<%= UserName %>",
                    "description": "Shoes Shop Order",
                    "image": "https://example.com/your_logo.jpg",
                    "order_id": "<%= RazorpayOrderId %>",
                    "handler": function (response) {
                        window.location.href = "payment_success.aspx";                        
                    },
                    "prefill": {
                        "name": "<%= UserName %>",
                        "email": "<%= UserEmail %>",
                        "contact": "<%= UserContact %>"
                    },
                    "notes": {
                        "address": "Razorpay Corporate Office"
                    },
                    "theme": {
                        "color": "#3399cc"
                    }
                };
                var rzp1 = new Razorpay(options);
                    rzp1.open();
                    e.preventDefault();
            </script>
        </div>
    </form>
</body>
</html>