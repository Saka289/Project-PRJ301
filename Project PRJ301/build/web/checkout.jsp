<%-- 
    Document   : checkout
    Created on : Oct 29, 2022, 12:27:46 AM
    Author     : Saka289
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>HeadPhone</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css" />
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                <![endif]-->

    </head>

    <body>
        <!-- HEADER -->
        <jsp:include page="header.jsp"/>
        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Checkout</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="#">Home</a></li>
                            <li class="active">Checkout</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <form action="checkout" method="post">
                        <div class="col-md-7">
                            <!-- Billing Details -->
                            <div class="billing-details">
                                <div class="section-title">
                                    <h3 class="title">Shiping address</h3>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" required="" name="name" placeholder="Full Name">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" required="" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" required="" name="address" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" required="" name="country" placeholder="Country">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="tel" required="" name="phone" placeholder="Telephone">
                                </div>
                                <div class="form-group">
                                    <textarea class="input" name="note" required="" placeholder="Order Notes"></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- Order Details -->
                        <div class="col-md-5 order-details">
                            <c:set var="o" value="${sessionScope.cart}"/>
                            <div class="section-title text-center">
                                <h3 class="title">Your Order</h3>
                            </div>
                            <div class="order-summary">
                                <div class="order-col">
                                    <div><strong>PRODUCT</strong></div>
                                    <div><strong>TOTAL</strong></div>
                                </div>
                                <div class="order-products">
                                    <c:forEach items="${o.items}" var="i">
                                        <div class="order-col">
                                            <div>${i.quantity}x ${i.product.title}</div>
                                            <div>${i.price * i.quantity}0$</div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="order-col">
                                    <div>Shiping</div>
                                    <div><strong>FREE</strong></div>
                                </div>
                                <div class="order-col">
                                    <div><strong>TOTAL</strong></div>
                                    <div><strong class="order-total">${sessionScope.total}0$</strong></div>
                                </div>
                            </div>
                            <div class="input-checkbox">
                                <input required="" type="checkbox" id="terms">
                                <label for="terms">
                                    <span></span>
                                    I've read and accept the <a href="#">terms & conditions</a>
                                </label>
                            </div>
                            <input class="primary-btn order-submit" type="submit" value="Place order">
                        </div>
                    </form>
                    <h5 Style="color: green">${requestScope.check}</h5>
                    <!-- /Order Details -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <jsp:include page="footer.jsp"/>

    </body>

</html>
