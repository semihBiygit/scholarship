<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hoş Geldiniz</title>
    <link rel="stylesheet" type="text/css" href="css/global.css">
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .welcome-container {
            text-align: center;
        }

        .welcome-container h1 {
            margin-bottom: 20px;
        }

        .welcome-container p {
            margin-bottom: 30px;
        }

        .welcome-container .admin-button {
            margin-right: 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #3366CC;
            color: #FFFFFF;
            border: none;
        }

        .welcome-container .application-button {
            margin-right: 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #FF9933;
            color: #FFFFFF;
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="welcome-container">
        <h1>Hoş Geldiniz</h1>
        <p>Burs başvurularına hoş geldiniz.</p>
        <button class="admin-button" onclick="location.href='admin_login.jsp'">Admin Girişi</button>
        <button class="application-button" onclick="location.href='user_login.jsp'">Başvuru Ekranı</button>
    </div>
</div>
</body>
</html>
