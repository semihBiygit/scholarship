<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Başvuru Oluştur</title>
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

        .form-container {
            width: 400px;
            margin: 0 auto;
        }

        .form-container h1 {
            margin-bottom: 20px;
        }

        .form-container .application-form {
            margin-top: 20px;
        }

        .form-container .application-form input[type="text"],
        .form-container .application-form input[type="number"],
        .form-container .application-form textarea {
            margin-bottom: 10px;
            padding: 5px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #CCCCCC;
        }

        .form-container .application-form input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #3366CC;
            color: #FFFFFF;
            border: none;
        }
        input[type="date"] {
            margin-bottom: 10px;
            padding: 5px;
            width: 98%;
            border-radius: 5px;
            border: 1px solid #CCCCCC;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h1>Başvuru Oluştur</h1>
        <form class="application-form" action="applications" method="post">
            <input type="hidden" name="action" value="add">
            <div class="form-group">
                <input type="text" id="firstName" name="firstName" required placeholder="Ad">
            </div>
            <div class="form-group">
                <input type="text" id="lastName" name="lastName" required placeholder="Soyad">
            </div>
            <div class="form-group">
                <input type="date" id="birthDate" name="birthDate" required placeholder="Doğum Tarihi">
            </div>
            <div class="form-group">
                <input type="text" id="universityName" name="universityName" required placeholder="Üniversite Adı">
            </div>
            <div class="form-group">
                <textarea id="address" name="address" required placeholder="Adres"></textarea>
            </div>
            <div class="form-group">
                <textarea type="cv" id="cv" name="cv" required placeholder="CV"></textarea>
            </div>
            <div class="form-group" hidden="hidden">
                <label for="status">Başvuru Durumu</label>
                <input type="text" id="status" name="status" value="İnceleniyor" required readonly>
            </div>
            <div class="form-group" hidden="hidden">
                <label for="userId">Kullanıcı ID</label>
                <input type="text" id="userId" name="userId" value="<%= session.getAttribute("userId") %>" required
                       readonly>
            </div>
            <div class="form-group">
                <button class="submit-button" type="submit">Başvuru Oluştur</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
