<%--
  Created by IntelliJ IDEA.
  User: yui
  Date: 2025/1/1
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改店铺信息</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/editShop.css">
</head>
<body>
<div class="container">
    <h1>修改店铺信息</h1>
    <%
        String shopId = request.getParameter("id");
        String shopName = request.getParameter("name");
        String shopDescription = request.getParameter("description");
        if (shopId == null || shopId.isEmpty()) {
    %>
    <p style="color: red;">错误：未传递店铺 ID。</p>
    <%
            return;
        }
        if (shopDescription == null || shopDescription.trim().isEmpty()) {
            shopDescription = "无";
        }
    %>
    <form action="<%= request.getContextPath() %>/shop" method="post">
        <!-- Hidden Fields -->
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= shopId %>">

        <!-- Shop Name -->
        <label for="name">店铺名称：</label>
        <input type="text" id="name" name="name" value="<%= shopName %>" required>

        <!-- Shop Description -->
        <label for="description">店铺描述：</label>
        <textarea id="description" name="description" rows="4" required><%= shopDescription %></textarea>

        <!-- Submit Button -->
        <div class="form-actions">
            <button type="submit">保存</button>
            <button type="button" class="cancel-button" onclick="window.location.href='<%= request.getContextPath() %>/admin'">取消</button>
        </div>
    </form>
</div>
</body>
</html>