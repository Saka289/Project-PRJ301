<%-- 
    Document   : login
    Created on : Oct 16, 2022, 9:37:02 PM
    Author     : Saka289
--%>

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
        <style>
            .rf{
                display: flex;
            }
            .remember-form{
                margin-right: 373px;
            }
            .remember-form span{
                width: 145px;
            }

            .forgot {
                margin-top: 6px;
            }
            .forgot a{
                color: pink;
            }
        </style>
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
                        <h1 style="margin-bottom: 40px; color: pink">Sign Up</h1>
                        <c:set var="p" value="${requestScope.userExisted}"/>
                        <h2 style="color:red;">${p}</h2>
                        <form action="signup" method="post">
                            <input name="fullname" required id="" type="text" placeholder="Full name">
                            <input name="username" required id="" type="text" placeholder="Username">
                            <input name="pass" required id="" type="password" placeholder="Password">
                            <input name="email" required id="" type="email" placeholder="Email">
                            <input name="phone" required id="" type="text" placeholder="Phone number">
                            <input name="address" required id="" type="text" placeholder="Address">
                            <div class="submit">
                                <button type="submit">SIGN-IN</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>