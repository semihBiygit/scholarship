<%@ page import="com.semihbiygit.model.Application" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Başvurularım</title>
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

        .applications-container {
            width: 600px;
            margin: 0 auto;
        }

        .applications-container h1 {
            margin-bottom: 20px;
        }

        .applications-container .application-list {
            text-align: left;
        }

        .applications-container .application-list .application-item {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #CCCCCC;
            border-radius: 5px;
        }

        .applications-container .application-list .application-item .title {
            font-weight: bold;
        }

        .applications-container .application-list .application-item .details {
            margin-top: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="applications-container">
        <h1>Başvurularım</h1>
        <div class="application-list">
            <%-- Başvuru listesi burada doldurulacak --%>
            <% for (Application app : (List<Application>) request.getAttribute("applications")) { %>
            <div class="application-item">
                <div class="title">Başvuru No: <%= app.getApplication_id() %>
                </div>
                <div class="details">
                    <p>Ad: <%= app.getFirstName() %>
                    </p>
                    <p>Soyad: <%= app.getLastName() %>
                    </p>
                    <p>Doğum Tarihi: <%= app.getBirthDate() %>
                    </p>
                    <p>Üniversite Adı: <%= app.getUniversityName() %>
                    </p>
                    <p>Adres: <%= app.getAddress() %>
                    </p>
                    <p>CV: <%= app.getCv() %>
                    </p>
                    <p>Durum: <%= app.getStatus() %>
                    </p>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
