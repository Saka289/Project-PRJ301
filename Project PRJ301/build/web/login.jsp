<%-- 
    Document   : login
    Created on : Oct 16, 2022, 9:37:02 PM
    Author     : Saka289
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/loginstyle1.css">
        <title>HeadPhone</title>
    </head>

    <body>
        <div class="parent clearfix">
            <div class="bg-illustration">
                <img src="https://i.ibb.co/Pcg0Pk1/logo.png" alt="logo">

                <div class="burger-btn">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>

            </div>

            <div class="login">
                <div class="container">
                    <div class="login-form">
                        <h1 style="margin-bottom: 40px; color: #D10024">Login</h1>
                        <c:set var="p" value="${requestScope.error}"/>
                        <h2 style="color: green;">${p}</h2>
                        <form action="login" method="post">
                            <input type="text" required id="" name="user" value="${cookie.cuser.value}" placeholder="Username">
                            <input type="password" required id="" name="pass" value="${cookie.cpass.value}" placeholder="Password">
                            <div class="remember-form">
                                <input name="rem" type="checkbox" ${(cookie.crem.value eq 'on')?"checked":""} value="on">
                                <span>Remember me</span>
                            </div>
                            <div class="forget-pass">
                                <a href="forgot">Forgot Password ?</a>
                            </div>
                            <div class="sign">
                                <p class="text-center">Not a member? <a data-toggle="tab" href="signup">Sign Up</a></p>
                            </div>
                            <button type="submit">SIGN-IN</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>

</html>