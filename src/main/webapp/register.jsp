<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hesap Oluştur</title>
    <link rel="stylesheet" type="text/css" href="css/global.css">
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            text-align: center;
        }

        .register-container h1 {
            margin-bottom: 20px;
        }

        .register-container .form-group {
            margin-bottom: 15px;
        }

        .register-container .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .register-container .form-group input[type="text"],
        .register-container .form-group input[type="password"] {
            width: 200px;
            padding: 5px;
            border: 1px solid #CCCCCC;
            border-radius: 5px;
        }

        .register-container .form-group .submit-button {
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #3366CC;
            color: #FFFFFF;
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="register-container">
        <h1>Hesap Oluştur</h1>
        <form action="register-process.jsp" method="post">
            <div class="form-group">
                <label for="username">Kullanıcı Adı:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Şifre:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button class="submit-button" type="submit">Hesap Oluştur</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
