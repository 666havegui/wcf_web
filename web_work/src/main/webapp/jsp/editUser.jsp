<%--
  Created by IntelliJ IDEA.
  User: yui
  Date: 2025/1/1
  Time: 16:27
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改用户</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/editUser.css">
</head>
<body>
<div class="container">
    <h1>修改用户</h1>
    <form action="<%= request.getContextPath() %>/user" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

        <label for="name">用户名：</label>
        <input type="text" id="name" name="name" value="<%= request.getParameter("name") %>">

        <label for="phone">手机号码：</label>
        <input type="text" id="phone" name="phone" value="<%= request.getParameter("phone") %>">

        <label for="password">密码：</label>
        <input type="password" id="password" name="password">

        <div class="form-actions">
            <button type="submit">保存</button>
            <button type="button" class="cancel-button" onclick="window.location.href='<%= request.getContextPath() %>/admin'">取消</button>
        </div>
    </form>
</div>
</body>
</html>
