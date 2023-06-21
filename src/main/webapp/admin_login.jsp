<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giriş Yap</title>
    <link rel="stylesheet" type="text/css" href="css/global.css">
    <style>
        body {
            text-align: center;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            width: 400px;
            margin: 0 auto;
        }

        .login-container h1 {
            margin-bottom: 20px;
        }

        .login-container .login-form {
            margin-top: 20px;
        }

        .login-container .login-form input[type="text"],
        .login-container .login-form input[type="password"] {
            margin-bottom: 10px;
            padding: 5px;
            width: 70%;
            border-radius: 5px;
            border: 1px solid #CCCCCC;
        }

        .login-container .login-form input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #3366CC;
            color: #FFFFFF;
            border: none;
        }

        .login-container .error-message {
            color: red;
        }

        .login-container .login-button {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-container">
        <h1>Admin Login</h1>
        <form class="login-form" action="users" method="post">
            <input type="text" name="username" placeholder="Kullanıcı Adı" required>
            <input type="password" name="password" placeholder="Şifre" required>
            <input type="hidden" name="action" value="loginAdmin">
            <div class="login-button">
                <input type="submit" value="Giriş Yap">
            </div>
        </form>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
                out.println("<p class=\"error-message\">" + error + "</p>");
            }
        %>
    </div>
</div>
</body>
</html>
