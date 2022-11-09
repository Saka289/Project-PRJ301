<%-- 
    Document   : detail
    Created on : Oct 21, 2022, 11:41:51 AM
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
        <link type="text/css" rel="stylesheet" href="css/slick.css" />
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
            function buy(id, releatedcid) {
                document.f.action = "buy?id=" + id + "&releatedcid=" + releatedcid + "&url=3";
                document.getElementById('myform').submit();
                document.f.submit();
            }
            function buy1(id, releatedcid) {
                document.f1.action = "buy?id=" + id + "&releatedcid=" + releatedcid + "&url=3";
//                document.getElementById('myform').submit();
                document.f1.submit();
            }
        </script>
        <script type="text/javascript">
            function increaseValue() {
                var value = parseInt(document.getElementById('number').value, 10);
                value = isNaN(value) ? 0 : value;
                value++;
                document.getElementById('number').value = value;
            }

            function decreaseValue() {
                var value = 1;
                if (value > 1) {
                    value = parseInt(document.getElementById('number').value, 10);
                    value = isNaN(value) ? 0 : value;
                    value < 1 ? value = 1 : '';
                    value--;
                }
                document.getElementById('number').value = value;
            }
            function submitForm() {
                document.getElementById('myform').submit();
            }

        </script>
        <style>
            .value-button {
                display: inline-block;
                border: 1px solid #ddd;
                margin: 0px;
                width: 40px;
                text-align: center;
                vertical-align: middle;
                padding: 11px 0;
                background: #eee;
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                text-align: center;
            }

            .value-button:hover {
                cursor: pointer;
            }

            form #decrease {
                margin-right: -4px;
                border-radius: 8px 0 0 8px;
            }

            form #increase {
                margin-left: -4px;
                border-radius: 0 8px 8px 0;
            }

            form #input-wrap {
                margin: 0px;
                padding: 0px;
            }

            input#number {
                text-align: center;
                border: none;
                border-top: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                margin: 0px;
                width: 40px;
                height: 40px;
            }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <c:set value="${requestScope.detail}" var="d"/>
        <c:set value="${d.category.id}" var="cid"/>
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li class="active">${d.title}</li>
                            <li><a href="#description">Details</a></li>
                            <li><a href="#relatedproducts">Related Products</a></li>
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
                    <!-- Product main img -->
                    <div class="col-md-7">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="${d.image}" alt="">
                            </div>
                        </div>
                    </div>

                    <!-- Product details -->
                    <form name="f" action="buy" method="post">
                        <div class="col-md-5">
                            <div class="product-details">
                                <h2 name="relatecid" value="${cid}" class="product-name">${d.title}</h2>
                                <div>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <a class="review-link" href="#">Add your review</a>
                                </div>
                                <div>
                                    <c:if test="${d.discount == 0}">
                                        <h4 class="product-price">${d.price}0$</h4>
                                    </c:if>
                                    <c:if test="${d.discount != 0}">
                                        <h4 class="product-price">${d.price * (d.discount/100)}0$
                                            <del class="product-old-price">${d.price}0$</del>
                                        </h4>
                                    </c:if>
                                </div>
                                <p>${d.description}</p>
                                <div class="product-options">
                                    <label>
                                        Quantity:
                                        <form action="buy" method="post" id="myform">
                                            <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value">-</div>
                                            <input name="num" readonly type="number" id="number" value="1"/>
                                            <div class="value-button" id="increase" onclick="increaseValue()" value="Increase Value">+</div>
                                        </form>                               
                                    </label>
                                    <label>
                                        Status: ${(d.status ==1)?"InStock":"OutOfStock"}
                                    </label>
                                </div>
                                <div class="add-to-cart">
                                    <button onclick="buy('${d.id}', '${d.category.id}')" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                </div>

                                <ul class="product-btns">
                                    <li><a href=""><i class="fa fa-heart-o"></i> add to wishlist</a></li>
                                </ul>

                                <ul class="product-links">
                                    <li>Share:</li>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                                </ul>

                            </div>
                        </div>
                    </form>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a id="description" data-toggle="tab" href="#tab1">Description</a></li>
                                <!--<li><a data-toggle="tab" href="#tab2">Details</a></li>-->
                                <li><a data-toggle="tab" href="#tab2">Reviews (${sessionScope.reviewSize})</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>${d.description}</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->

                                <!-- tab3  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <!-- Reviews -->
                                        <div class="col-md-6">
                                            <div id="reviews">
                                                <!--<form>-->
                                                <ul class="reviews">
                                                    <c:forEach items="${requestScope.listf}" var="f">
                                                        <li>
                                                            <div class="review-heading">
                                                                <h5 class="name">${f.user.nickname}</h5>
                                                                <p class="date">${f.date}</p>
                                                                <div class="review-rating">
                                                                    <c:forEach begin="1" end="${f.rating}">
                                                                        <i class="fa fa-star"></i>
                                                                    </c:forEach>
                                                                    <c:forEach begin="${f.rating}" end="4">
                                                                        <i class="fa fa-star-o empty"></i>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                            <div class="review-body">
                                                                <p>${f.note}</p>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                                <!--</form>-->
                                                <ul class="reviews-pagination">
                                                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                                                        <li><a href="detail?id=${d.id}&releatedcid=${d.category.id}&page=${i}">${i}</a></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Reviews -->
                                        <!-- Review Form -->
                                        <div class="col-md-6">
                                            <div id="review-form">
                                                <form id="f2" class="review-form" action="detail" method="post">
                                                    <input type="hidden" name="id" value="${d.id}">
                                                    <input type="hidden" name="releatedcid" value="${d.category.id}">
                                                    <textarea class="input" placeholder="Your Review" name="review" id="editor1"></textarea>
                                                    <div class="input-rating">
                                                        <span>Your Rating: </span>
                                                        <div class="stars">
                                                            <input id="star5" name="rating" required="" value="5" type="radio"><label
                                                                for="star5"></label>
                                                            <input id="star4" name="rating" required="" value="4" type="radio"><label
                                                                for="star4"></label>
                                                            <input id="star3" name="rating" required="" value="3" type="radio"><label
                                                                for="star3"></label>
                                                            <input id="star2" name="rating" required="" value="2" type="radio"><label
                                                                for="star2"></label>
                                                            <input id="star1" name="rating" required="" value="1" type="radio"><label
                                                                for="star1"></label>
                                                        </div>
                                                    </div>
                                                    <!--</form>-->
                                                    <button class="primary-btn">Submit</button>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- /Review Form -->
                                    </div>
                                </div>
                                <!-- /tab3  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- Section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div id="relatedproducts" class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">Related Products</h3>
                        </div>
                    </div>
                    <form name="f1" action="buy" method="post">
                        <!-- product -->
                        <c:forEach items="${requestScope.related}" var="r">
                            <div class="col-md-3 col-xs-6">
                                <div class="product">
                                    <div class="product-img">
                                        <img src="${r.image}" alt="">
                                        <div class="product-label">
                                            <c:if test="${r.discount != 0}">
                                                <span class="sale">-${r.discount}%</span>
                                            </c:if>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="detail?id=${r.id}&releatedcid=${r.category.id}">${r.title}</a></h3>
                                            <c:if test="${r.discount == 0}">
                                            <h4 class="product-price">${r.price}0$</h4>
                                        </c:if>
                                        <c:if test="${r.discount != 0}">
                                            <h4 class="product-price">${r.price * (r.discount/100)}0$
                                                <del class="product-old-price">${r.price}0$</del>
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
                                            <button type="button" class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add
                                                    to wishlist</span></button>
                                            <button type="button" class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add
                                                    to compare</span></button>
                                            <button type="button" class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick
                                                    view</span></button>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <button onclick="buy1('${r.id}', '${r.category.id}')" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </form>
                    <div class="clearfix visible-sm visible-xs"></div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <script type="text/javascript">
            CKEDITOR.replace('editor1', {
                filebrowserBrowseUrl: 'ckfinder/ckfinder.html',
                filebrowserUploadUrl: 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'
            });
        </script>
        <jsp:include page="footer.jsp"/>
    </body>

</html>