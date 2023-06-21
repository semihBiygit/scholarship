<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kullanıcıyı Sil</title>
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

        .delete-container {
            width: 400px;
            margin: 0 auto;
        }

        .delete-container h1 {
            margin-bottom: 20px;
        }

        .delete-container .delete-form {
            margin-top: 20px;
        }

        .delete-container .delete-form .confirmation {
            margin-bottom: 10px;
            font-weight: bold;
        }

        .delete-container .delete-form .button-container {
            margin-top: 20px;
        }

        .delete-container .delete-form .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #FF0000;
            color: #FFFFFF;
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="delete-container">
        <h1>Kullanıcıyı Sil</h1>
        <form class="delete-form" action="users" method="post">
            <input type="hidden" name="action" value="delete">
            <p class="confirmation">Kullanıcıyı silmek istediğinize emin misiniz?</p>
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
            <div class="button-container">
                <button type="submit">Sil</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
