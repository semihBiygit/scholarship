<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Yeni Kullanıcı Ekle</title>
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

        .add-user-form {
            width: 400px;
            margin: 0 auto;
        }

        .add-user-form h1 {
            margin-bottom: 20px;
        }

        .add-user-form .form-group {
            margin-bottom: 20px;
        }

        .add-user-form .form-group label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .add-user-form .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #CCCCCC;
        }

        .add-user-form .form-group .error-message {
            color: #FF0000;
            font-size: 14px;
        }

        .add-user-form .form-group .success-message {
            color: #008000;
            font-size: 14px;
        }

        .add-user-form .form-group .button-container {
            margin-top: 20px;
        }

        .add-user-form .form-group .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #3366CC;
            color: #FFFFFF;
            border: none;
            text-decoration: none;
        }
        .add-user-button{
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #45a049;
            color: #FFFFFF;
            border: none;
            text-decoration: none;
        }
        .add-user-button:hover{
            background-color: #008000;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="add-user-form">
        <h1>Yeni Kullanıcı Ekle</h1>
        <form action="users" method="post">
            <div class="form-group">
                <label for="username">Kullanıcı Adı:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Şifre:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <input type="hidden" name="action" value="addUser">
            <div class="form-group button-container">
                <button class="add-user-button" type="submit">Kaydet</button>
            </div>
        </form>

    </div>
</div>
</body>
</html>
