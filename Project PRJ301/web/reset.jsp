<%-- 
    Document   : changepassword
    Created on : Oct 24, 2022, 2:43:54 PM
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
                        <h1 style="margin-bottom: 40px;">Reset Password</h1>
                        <c:set var="p" value="${requestScope.resete}"/>
                        <h2 style="color:red;">${p}</h2>
                        <form action="reset" method="post">
                            <input name="newpass" type="password" required placeholder="New Password">
                            <input name="confpass" type="password" required placeholder="Confirm New Password">
                            <button type="submit">Change Password</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>

</html>