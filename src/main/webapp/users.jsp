<%@ page import="com.semihbiygit.model.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kullanıcılar</title>
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

        .users-container {
            width: 600px;
            margin: 0 auto;
        }

        .users-container h1 {
            margin-bottom: 20px;
        }

        .users-container table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .users-container table th, .users-container table td {
            padding: 10px;
            border: 1px solid #CCCCCC;
        }

        .users-container .add-user-button {
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            background-color: #45a049;
            color: #FFFFFF;
            border: none;
            text-decoration: none;
        }

        .add-user-button:hover {
            background-color: darkgreen;
        }

        .view-application-button {
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            background-color: #3366CC;
            color: #FFFFFF;
            border: none;
            text-decoration: none;
        }

        .view-application-button:hover {
            background-color: darkblue;
        }

        .delete-user-button {
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            background-color: #CC3333;
            color: #FFFFFF;
            border: none;
            text-decoration: none;
        }

        .delete-user-button:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="users-container">
        <h1>Kullanıcılar</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Kullanıcı Adı</th>
                <th>İşlem</th>
            </tr>
            <% for (User user : (List<User>) request.getAttribute("users")) { %>
            <tr>
                <td><%= user.getUser_id() %>
                </td>
                <td><%= user.getUsername() %>
                </td>
                <td>
                    <form action="applications?action=getApplicationsByUserId?id=<%= user.getUser_id() %>" method="post"
                          style="display: inline;">
<%--                        <input type="hidden" name="id" value="<%= user.getUser_id() %>">--%>
                        <button class="view-application-button" type="submit">Başvuruyu Görüntüle</button>
                    </form>
                    <%--    <button class="application-button"--%>
                    <%--            onclick="location.href='applications?action=getApplicationsByUserId?id=<%= user.getUser_id() %>'">--%>
                    <%--        Başvurular--%>
                    <%--    </button>--%>

                    <form action="user_delete.jsp" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="<%= user.getUser_id() %>">
                        <button class="delete-user-button" type="submit">Sil</button>
                    </form>
                </td>

            </tr>
            <% } %>
        </table>
        <a href="add_user.jsp" class="add-user-button">Yeni Kullanıcı Ekle</a>
    </div>
</div>
</body>
</html>
