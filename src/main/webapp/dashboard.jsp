<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
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

        .dashboard-container {
            width: 400px;
            margin: 0 auto;
        }

        .dashboard-container h1 {
            margin-bottom: 20px;
        }

        .dashboard-container p {
            margin-bottom: 30px;
        }

        .dashboard-container .admin-button {
            margin-right: 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #3366CC;
            color: #FFFFFF;
            border: none;
        }

        .dashboard-container .application-button {
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
    <div class="dashboard-container">
        <h1>Dashboard</h1>
        <p>Giriş başarılı! Hoş geldiniz.</p>
        <button class="admin-button" onclick="location.href='users?action=list'">Kullanıcılar</button>
        <button class="application-button" onclick="location.href='applications?action=list'">Başvurular</button>
    </div>
</div>
</body>
</html>
