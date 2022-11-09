<%-- 
    Document   : cart
    Created on : Oct 26, 2022, 2:23:28 PM
    Author     : Saka289
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HeadPhone</title>
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link href="css/ui.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/all.min.css" rel="stylesheet">
        <style>
            .card-body {
                flex: 1 1 auto;
                padding: 1.25rem;
            }
            .border-top {
                border-top: 1px solid #e4e4e4 !important;
            }
            .float-md-right {
                float: right !important;
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 0.37rem;
            }
            .btn-light {
                color: #212529;
                background-color: #e4e4e4;
                border-color: #e4e4e4;
            }
            .btn-light:hover {
                color: #212529;
                background-color: #d1d1d1;
                border-color: #cbcbcb;
            }
            .btn-light:focus, .btn-light.focus {
                box-shadow: 0 0 0 0.2rem rgba(199, 199, 200, 0.5);
            }
            .btn-light.disabled, .btn-light:disabled {
                color: #212529;
                background-color: #e4e4e4;
                border-color: #e4e4e4;
            }
            .btn-light:not(:disabled):not(.disabled):active, .btn-light:not(:disabled):not(.disabled).active, .show > .btn-light.dropdown-toggle {
                color: #212529;
                background-color: #cbcbcb;
                border-color: #c4c4c4;
            }
            .btn-light:not(:disabled):not(.disabled):active:focus, .btn-light:not(:disabled):not(.disabled).active:focus, .show > .btn-light.dropdown-toggle:focus {
                box-shadow: 0 0 0 0.2rem rgba(199, 199, 200, 0.5);
            }

            .btn-dark {
                color: #fff;
                background-color: #212529;
                border-color: #212529;
            }
            .btn-dark:hover {
                color: #fff;
                background-color: #101214;
                border-color: #0a0c0d;
            }
            .btn-dark:focus, .btn-dark.focus {
                box-shadow: 0 0 0 0.2rem rgba(66, 70, 73, 0.5);
            }
            .btn-dark.disabled, .btn-dark:disabled {
                color: #fff;
                background-color: #212529;
                border-color: #212529;
            }
            .btn-dark:not(:disabled):not(.disabled):active, .btn-dark:not(:disabled):not(.disabled).active, .show > .btn-dark.dropdown-toggle {
                color: #fff;
                background-color: #0a0c0d;
                border-color: #050506;
            }
            .btn-dark:not(:disabled):not(.disabled):active:focus, .btn-dark:not(:disabled):not(.disabled).active:focus, .show > .btn-dark.dropdown-toggle:focus {
                box-shadow: 0 0 0 0.2rem rgba(66, 70, 73, 0.5);
            }

            .btn-primary-light {
                color: #fff;
                background-color: #5f89f0;
                border-color: #5f89f0;
            }
            .btn-primary-light:hover {
                color: #fff;
                background-color: #3d70ec;
                border-color: #3167eb;
            }
            .btn-primary-light:focus, .btn-primary-light.focus {
                box-shadow: 0 0 0 0.2rem rgba(119, 155, 242, 0.5);
            }
            .btn-primary-light.disabled, .btn-primary-light:disabled {
                color: #fff;
                background-color: #5f89f0;
                border-color: #5f89f0;
            }
            .btn-primary-light:not(:disabled):not(.disabled):active, .btn-primary-light:not(:disabled):not(.disabled).active, .show > .btn-primary-light.dropdown-toggle {
                color: #fff;
                background-color: #3167eb;
                border-color: #255eea;
            }
            .btn-primary-light:not(:disabled):not(.disabled):active:focus, .btn-primary-light:not(:disabled):not(.disabled).active:focus, .show > .btn-primary-light.dropdown-toggle:focus {
                box-shadow: 0 0 0 0.2rem rgba(119, 155, 242, 0.5);
            }
            .quantity input[type="text"] {
                width: 25%;
            }
        </style>
        <script type="text/javascript">
            function remove(id) {
                document.r.action = "cart?id=" + 12;
                document.r.submit();
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Shopping Card</h3>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->
        <section class="section-content padding-y">
            <div class="container">

                <div class="row">
                    <main class="col-md-9">
                        <div class="card">
                            <table class="table table-borderless table-shopping-cart">
                                <thead class="text-muted">
                                    <tr class="small text-uppercase">
                                        <th scope="col">Product</th>
                                        <th scope="col" width="150">Quantity</th>
                                        <th scope="col" width="120">Price</th>
                                        <th scope="col" width="120">Total Price</th>
                                        <th scope="col" class="text-right" width="140"> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="o" value="${sessionScope.cart}"/>
                                    <c:forEach items="${o.items}" var="i">
                                        <tr>
                                            <td>
                                                <figure class="itemside">
                                                    <div class="aside"><img src="${i.product.image}" class="img-sm">
                                                    </div>
                                                    <figcaption class="info">
                                                        <a href="#" class="title text-dark">${i.product.title}</a>
                                                        <p class="text-muted small">Category: ${i.product.category.name}
                                                    </figcaption>
                                                </figure>
                                            </td>
                                            <td class="quantity">
                                                <button class="btn btn-light"><a href="process?num=-1&id=${i.product.id}">-</a></button>
                                                <input type="text" readonly  value="${i.quantity}"/>
                                                <button class="btn btn-light"><a href="process?num=1&id=${i.product.id}">+</a></button>  
                                            </td>
                                            <td>
                                                <div class="price-wrap">
                                                    <var class="price">${i.price}0$</var>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="price-wrap">
                                                    <var class="price">${i.price * i.quantity}0$</var>
                                                </div>
                                            </td>
                                            <td class="text-right">
                                                <form name="r" action="process" method="post">
                                                    <input type="hidden" name="id" value="${i.product.id}"/>
                                                    <input class="btn btn-light" type="submit" value="Remove"/>   
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="card-body border-top">
                                <a href="checkout" class="btn btn-primary float-md-right"> Make Purchase <i
                                        class="fa fa-chevron-right"></i> </a>
                                <a href="store" class="btn btn-light"> <i class="fa fa-chevron-left"></i> Continue shopping </a>
                            </div>
                        </div> <!-- card.// -->
                    </main> <!-- col.// -->
                    <aside class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <dl class="dlist-align">
                                    <dt>Total price:</dt>
                                    <dd class="text-right">${sessionScope.total}0$</dd>
                                </dl>
                                <dl class="dlist-align">
                                    <dt>Total:</dt>
                                    <dd class="text-right  h5"><strong>${sessionScope.total}0$</strong></dd>
                                </dl>
                                <hr>
                                <p class="text-center mb-3">
                                    <img width="100%" height="50px" src="./images/pay.png" height="26">
                                </p>

                            </div> <!-- card-body.// -->
                        </div> <!-- card .// -->
                    </aside> <!-- col.// -->
                </div>
            </div> <!-- container .//  -->
        </section>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
