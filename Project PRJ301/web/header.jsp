<%-- 
    Document   : header
    Created on : Oct 26, 2022, 11:26:02 AM
    Author     : Saka289
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link type="text/css" rel="stylesheet" href="./css/slick.css" />
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="./css/style.css" />
        <script src="./ckeditor/ckeditor.js"></script>
        <script>
            function tai_lai_trang() {
                location.reload();
            }
        </script>
    </head>

    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +096-167-7176</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> saka289@icloud.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> 234 Los Angeles</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li style="font-size: 14px;"><a href="#"><i class="fa fa-facebook-official"></i></a></li>
                        <li style="font-size: 14px;"><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li style="font-size: 14px;"><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                        <li style="font-size: 14px;"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="home" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="store1">
                                    <select class="input-select">
                                        <option value="0">Head Phone</option>
                                    </select>
                                    <input name="key" class="input" placeholder="Search here">
                                    <button class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- My Account -->
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-user-o"></i>
                                        <span>My Account</span>
                                    </a>
                                    <!-- <a href="#" class="text-uppercase">Login</a> / <a href="#" class="text-uppercase">Join</a> -->
                                    <div style="width: 195px" class="cart-dropdown">
                                        <ul class="custom-menu">
                                            <c:if test="${sessionScope.account != null}">
                                                <li><a href="imageuser">
                                                        <div class="icon"><i class="fa fa-user"></i> </div>${sessionScope.account.nickname}
                                                    </a></li>
                                                </c:if>
                                                <c:if test="${sessionScope.account == null}">
                                                <li><a href="login">
                                                        <div class="icon"><i class="fa fa-user"></i> </div> Hello Customer !!!
                                                    </a></li>
                                                </c:if>
                                            <li><a href="crud">
                                                    <div class="icon"><i class="fa fa-tachometer"></i> </div> Manage Product
                                                </a></li>
                                            <li><a href="managecategory">
                                                    <div class="icon"><i class="fa fa-tachometer"></i> </div> Manage Category
                                                </a></li>
                                            <li><a href="login">
                                                    <div class="icon"><i class="fa fa-unlock-alt"></i> </div> Login
                                                </a></li>
                                            <li><a href="signup">
                                                    <div class="icon"><i class="fa fa-user-plus"></i> </div> Create An
                                                    Account
                                                </a></li>
                                            <li><a href="logout">
                                                    <div class="icon"><i class="fa fa-sign-out"></i> </div> Log out
                                                </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- My Account -->

                                <!-- Cart -->
                                <c:set var="size" value="${sessionScope.size}"/>
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div id="cart_size" class="qty">${size}</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <img src="${i.product.image}" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="#">${i.product.title}</a></h3>
                                                        <h4 class="product-price"><span class="qty">${i.quantity}x</span>${i.quantity * i.price}0$</h4>
                                                    </div>
                                                    <hr></hr>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="cart-summary">
                                            <h5>SUBTOTAL: ${sessionScope.total}0$</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="cart">View Cart</a>
                                            <a href="checkout">Checkout <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li><a href="home">Home</a></li>
                        <li><a href="store">Shop</a></li>
                        <li><a href="cart">Cart</a></li>
                        <li><a href="checkout">Check Out</a></li>
                        <li><a href="statistics">Statistics Page</a></li>
                        <!-- <li><a href="#">Accessories</a></li> -->
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->
        <!--        <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/slick.min.js"></script>
                <script src="js/nouislider.min.js"></script>
                <script src="js/jquery.zoom.min.js"></script>
                <script src="js/main.js"></script>-->
    </body>
</html>
