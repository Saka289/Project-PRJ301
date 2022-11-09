<%-- 
    Document   : index
    Created on : Oct 9, 2022, 2:10:48 PM
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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                <![endif]-->
        <script type="text/javascript">
            function buy(id) {
                document.f.action = "buy?id=" + id + "&url=1";
                document.f.submit();
            }
            function buy1(id) {
                document.f1.action = "buy?id=" + id + "&url=1";
                document.f1.submit();
            }
        </script>

    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <!-- /Header -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <c:forEach items="${requestScope.category}" var="c">
                        <div class="col-md-4 col-xs-6">
                            <div class="shop">
                                <div class="shop-img">
                                    <img src="${c.image}" alt="">
                                </div>
                                <div class="shop-body">
                                    <h3>${c.name}</h3>
                                    <a href="store1?cid=${c.id}" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./images/cat6.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>VIEW ALL</h3>
                                <a href="store1?cid=${0}" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <form name="f" action="buy" method="post">  
                                        <div class="products-slick" data-nav="#slick-nav-1">
                                            <!-- product -->
                                            <c:forEach items="${requestScope.NewP}" var="p">
                                                <div class="product">
                                                    <div class="product-img">
                                                        <img src="${p.image}" alt="">
                                                        <div class="product-label">
                                                            <c:if test="${p.discount != 0}">
                                                                <span class="sale">-${p.discount}%</span>
                                                            </c:if>
                                                            <span class="new">NEW</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category">${p.category.name}</p>
                                                        <p class="product-category"></p>
                                                        <h3 class="product-name"><a href="detail?id=${p.id}&releatedcid=${p.category.id}">${p.title}</a></h3>
                                                            <c:if test="${p.discount == 0}">
                                                            <h4 class="product-price">${p.price}0$</h4>
                                                        </c:if>
                                                        <c:if test="${p.discount != 0}">
                                                            <h4 class="product-price">${p.price-(p.price * (p.discount/100))}0$
                                                                <del class="product-old-price">${p.price}0$</del>
                                                            </h4>
                                                        </c:if>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="product-btns">
                                                            <button type="button" class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                                    class="tooltipp">add to wishlist</span></button>
                                                            <button type="button" class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                                    class="tooltipp">add to compare</span></button>
                                                            <button type="button" class="quick-view"><i class="fa fa-eye"></i><span
                                                                    class="tooltipp">quick view</span></button>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <button onclick="buy('${p.id}')" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
                                                            cart</button>
                                                    </div>
                                                </div>
                                            </c:forEach> 
                                        </div>
                                    </form>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="store">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Top Sale</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <form name="f1" action="buy" method="post">
                                        <div class="products-slick" data-nav="#slick-nav-2">
                                            <!-- product -->
                                            <c:forEach items="${requestScope.sale12}" var="s" >
                                                <div class="product">
                                                    <div class="product-img">
                                                        <img src="${s.image}" alt="">
                                                        <div class="product-label">
                                                            <c:if test="${s.discount != 0}">
                                                                <span class="sale">-${s.discount}%</span>
                                                            </c:if>
                                                            <!--<span class="new">NEW</span>-->
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category">${s.category.name}</p>
                                                        <h3 class="product-name"><a href="detail?id=${s.id}&releatedcid=${s.category.id}">${s.title}</a></h3>
                                                            <c:if test="${s.discount == 0}">
                                                            <h4 class="product-price">${s.price}0$</h4>
                                                        </c:if>
                                                        <c:if test="${s.discount != 0}">
                                                            <h4 class="product-price">${s.price-(s.price * (s.discount/100))}0$
                                                                <del class="product-old-price">${s.price}0$</del>
                                                            </h4>
                                                        </c:if>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="product-btns">
                                                            <button type="button" class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                                    class="tooltipp">add to wishlist</span></button>
                                                            <button type="button" class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                                    class="tooltipp">add to compare</span></button>
                                                            <button type="button" class="quick-view"><i class="fa fa-eye"></i><span
                                                                    class="tooltipp">quick view</span></button>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <button onclick="buy1('${s.id}')" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
                                                            cart</button>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </form>  
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <jsp:include page="footer.jsp"/>
    </body>

</html>
