<%@ page import="com.web.domain.Shops" %>
<%@ page import="com.web.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员界面</title>
    <!-- 引入外部 CSS 文件 -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Administer.css">
</head>

<body>
<div class="container">
    <h1>管理员界面</h1>

    <!-- User Management Section -->
    <h2>用户管理</h2>
    <%--    <a href="addUser.jsp" class="add-button">添加用户</a>--%>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>用户名</th>
            <th>电话</th>
            <th>密码</th>
            <th>角色</th>
            <th>创建时间</th>
            <th>更新时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (User user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getPhone() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getRole() %></td>
            <td><%= user.getCreated_at() %></td>
            <td><%= user.getUpdated_at() %></td>
            <td>
                <div class="button-group">
                    <form action="user" method="get" style="display: inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= user.getId() %>">
                        <button type="submit" class="delete-button action-button">删除</button>
                    </form>
                    <a href="<%= request.getContextPath() %>/jsp/editUser.jsp?id=<%= user.getId() %>&name=<%= user.getName() %>&phone=<%= user.getPhone() %>&password=<%= user.getPassword() %>" class="edit-button action-button">修改</a>
                </div>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="8">没有用户数据。</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- Shop Management Section -->
    <h2>商铺管理</h2>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>商铺名称</th>
            <th>描述</th>
            <th>用户ID</th>
            <th>创建时间</th>
            <th>更新时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Shops> shops = (List<Shops>) request.getAttribute("shops");
            if (shops != null && !shops.isEmpty()) {
                for (Shops shop : shops) {
        %>
        <tr>
            <td><%= shop.getId() %></td>
            <td><%= shop.getName() %></td>
            <td><%= (shop.getDescription() != null && !shop.getDescription().isEmpty()) ? shop.getDescription() : "无" %></td>
            <td><%= shop.getUser_id() %></td>
            <td><%= shop.getCreated_at() %></td>
            <td><%= shop.getUpdated_at() %></td>
            <td>
                <div class="button-group">
                    <form action="shop" method="get" style="display: inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= shop.getId() %>">
                        <button type="submit" class="delete-button action-button">删除</button>
                    </form>
                    <a href="<%= request.getContextPath() %>/jsp/editShop.jsp?id=<%= shop.getId() %>&name=<%= shop.getName() %>&description=<%= shop.getDescription() %>&user_id=<%= shop.getUser_id() %>" class="edit-button action-button">修改</a>
                </div>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7">没有商铺数据。</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

</div>
</body>
</html>
