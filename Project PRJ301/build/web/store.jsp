<%-- 
    Document   : store
    Created on : Oct 17, 2022, 2:45:05 PM
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
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="./css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!--        <script type="text/javascript">
                    function buy(id) {
                        axios.post('buy-async', {
                            params: {
                                id: id
                            }
                        }).then((response) => {
                            //lay data thanh cong 
                            console.log(response);
                            document.getElementById("cart_size").innerHTML = response.data
                            // cap nhap view
                        })
                    }
                </script>-->
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <!-- /Header -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <c:set var="cid" value="${requestScope.cid}"/>
                            <li><a class="${cid==0?"active":""}" href="store1?cid=${0}">ALL</a></li>
                                <c:forEach items="${requestScope.category}" var="c">
                                <li><a class="${c.id == cid?"active":""}" href="store1?cid=${c.id}">${c.name}</a></li>
                                </c:forEach>
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
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <form id="f1" action="store1">
                            <div class="aside">
                                <h3 class="aside-title">Categories</h3>
                                <div class="checkbox-filter">

                                    <c:set var="cat" value="${requestScope.category}"/>
                                    <c:set var="cate" value="${requestScope.cate}"/>
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="c0" name="cidd" ${cate[0]?"checked":""} value="${0}" onclick="setCheck(this)"/>
                                        <label for="c0">
                                            <span></span>
                                            All
                                        </label>
                                    </div>
                                    <c:forEach begin="0" end="${cat.size()-1}" var="i">
                                        <div class="input-checkbox">
                                            <input type="checkbox" id="category-${cat.get(i).getId()}" name="cidd" ${cat.get(i).getId()==cid?"checked":""} value="${cat.get(i).getId()}" ${cate[i+1]?"checked":""} onclick="setCheck(this)"/>
                                            <label for="category-${cat.get(i).getId()}">
                                                <span></span>
                                                ${cat.get(i).getName()}
                                            </label>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                            <!-- /aside Widget -->

                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Price</h3>
                                <div class="checkbox-filter">
                                    <!--<form id="f1" action="store1">-->
                                    <c:set var="pp" value="${requestScope.pp}"/>
                                    <c:set var="pb" value="${requestScope.pb}"/>
                                    <c:forEach begin="0" end="${4}"  var="i">
                                        <div class="input-checkbox">
                                            <input type="checkbox" id="price-${i}" name="price" ${pb[i+1]?"checked":""} value="${(i+1)}" onclick="setCheck(this)"/>
                                            <label for="price-${i}">
                                                <span></span>
                                                ${pp[i]}
                                            </label>
                                        </div>
                                    </c:forEach>
                                    <!--</form>-->
                                </div>
                            </div>
                            <!-- /aside Widget -->
                        </form>

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Brand</h3>
                            <div class="checkbox-filter">
                                <form id="f3" action="store1">
                                    <c:set var="brand1" value="${requestScope.brand}"/>
                                    <c:set var="brands" value="${requestScope.brands}"/>
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="b0" name="brand" ${brands[0]?"checked":""} value="${0}" onclick="setCheck2(this)">
                                        <label for="b0">
                                            <span></span>
                                            All
                                        </label>
                                    </div>
                                    <c:forEach begin="0" end="${brand1.size()-1}" var="b">
                                        <div class="input-checkbox">
                                            <input type="checkbox" id="brand-${brand1.get(b).getId()}" name="brand" ${brands[b+1]?"checked":""} value="${brand1.get(b).getId()}" onclick="setCheck2(this)">
                                            <label for="brand-${brand1.get(b).getId()}">
                                                <span></span>
                                                ${brand1.get(b).getName()}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </form>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Top selling</h3>
                            <c:forEach items="${requestScope.sale3}" var="s">
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${s.image}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${s.category.name}</p>
                                        <h3 class="product-name"><a href="detail?id=${s.id}&releatedcid=${s.category.id}">${s.title}</a></h3>
                                            <c:if test="${s.discount == 0}">
                                            <h4 class="product-price">${s.price}0$</h4>
                                        </c:if>
                                        <c:if test="${s.discount != 0}">
                                            <h4 class="product-price">${s.price - (s.price * (s.discount/100))}0$
                                                <del class="product-old-price">${s.price}0$</del>
                                            </h4>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div> 
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <form name="f" action="buyasync" method="get">
                            <div class="row">
                                <!-- product -->
                                <c:if test="${requestScope.products.size() == 0}">
                                    <h1 style="text-align: center; color: red">No Product</h1>
                                </c:if>
                                <c:if test="${requestScope.products.size() != 0}">
                                    <c:forEach items="${requestScope.products}" var="p">
                                        <div class="col-md-4 col-xs-6">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${p.image}" alt="">
                                                    <div class="product-label">
                                                        <c:if test="${p.discount != 0}">
                                                            <span class="sale">-${p.discount}%</span>
                                                        </c:if>
                                                        <!--<span class="new">NEW</span>-->
                                                    </div>
                                                </div>
                                                <div class="product-body">
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
                                                        <button type="button" class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button type="button" class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button type="button" class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button type="button" onclick="buy(${p.id})" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <!-- /product -->
                            </div>
                        </form> 
                        <!-- store products -->
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <c:set var="page" value="${requestScope.page}"/>
                        <div class="store-filter clearfix">
                            <!-- <span class="store-qty">Showing 20-100 products</span> -->
                            <ul class="store-pagination">
                                <!--<li class="active">1</li>-->
                                <!--store-->
                                <c:forEach begin="1" end="${requestScope.num}" var="i">
                                    <li><a href="store?page=${i}">${i}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
        <script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
        <script>
                                                        function buy(id) {
                                                            axios.get('buyasync', {
                                                                params: {
                                                                    id: id
                                                                }
                                                            }).then((response) => {
                                                                //lay data thanh cong 
                                                                console.log(response);
                                                                document.getElementById("cart_size").innerHTML = response.data
                                                                // cap nhap view
                                                            })
                                                        }
        </script>
        <jsp:include page="footer.jsp"/>

    </body>
</html>
