<%@ page import="com.semihbiygit.model.Application" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Başvuru Görüntüle</title>
    <link rel="stylesheet" type="text/css" href="css/global.css">
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .applications-container {
            width: 100%;
            margin: 0 auto;
        }

        .applications-container table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .applications-container table th, .applications-container table td {
            padding: 10px;
            border: 1px solid #CCCCCC;
            width: 100%;
        }

        .back-button {
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            background-color: #3366CC;
            color: #FFFFFF;
            border: none;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: darkblue;
        }

        /* This CSS code will align all rows and columns equally with all screens */
        .applications-container table {
            table-layout: fixed;
        }

        .applications-container table td {
            word-wrap: break-word;
        }
        select {
            max-width: 100px;
        }

    </style>

</head>
<body>
<div class="container">
    <div class="applications-container">
        <h1>Başvurular</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Adı</th>
                <th>Soyadı</th>
                <th>Doğum Tarihi</th>
                <th>Üniversite Adı</th>
                <th>Adres</th>
                <th>CV</th>
                <th>Durum</th>
            </tr>
            <% List<Application> applicationListById = (List<Application>) request.getAttribute("applications");
                if (applicationListById != null) {
                    for (Application app : applicationListById) { %>
            <tr>
                <td><%= app.getApplication_id() %>
                </td>
                <td><%= app.getFirstName() %>
                </td>
                <td><%= app.getLastName() %>
                </td>
                <td><%= app.getBirthDate() %>
                </td>
                <td><%= app.getUniversityName() %>
                </td>
                <td><%= app.getAddress() %>
                </td>
                <td><%= app.getCv() %>
                </td>
                <td>
                    <form action="applications?action=changeStatus" method="post">
                        <input type="hidden" name="id" value="<%= app.getApplication_id() %>">
                        <select name="status" id="status" required>
                            <option value="BEKLİYOR" <%= app.getStatus().equals("BEKLİYOR") ? "selected" : "" %>>
                                Bekliyor
                            </option>
                            <option value="ONAYLANDI" <%= app.getStatus().equals("ONAYLANDI") ? "selected" : "" %>>
                                Onaylandı
                            </option>
                            <option value="REDDEDİLDİ" <%= app.getStatus().equals("REDDEDİLDİ") ? "selected" : "" %>>
                                Reddedildi
                            </option>
                        </select>
                        <input style="font-size: 14px; border-radius: 5px" type="submit" value="Değiştir">
                    </form>
                </td>
            </tr>
            <% }
            } %>

        </table>
        <a href="dashboard.jsp" class="back-button">Dashboard Sayfasına Geri Dön</a>
    </div>
</div>
</body>
</html>
