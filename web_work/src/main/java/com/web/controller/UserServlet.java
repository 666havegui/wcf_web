package com.web.controller;

import com.web.domain.User;
import com.web.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user") // 配置路径
public class UserServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("list".equals(action)) {
            // 列出所有用户
            List<User> users = userService.getAllUsers();
            req.setAttribute("users", users);
            System.out.println(users);
            req.getRequestDispatcher("/jsp/Administer.jsp").forward(req, resp);

        } else if ("delete".equals(action)) {
            // 删除用户
            int id = Integer.parseInt(req.getParameter("id"));
            userService.deleteUser(id);
            resp.sendRedirect("/web_work/admin");

        } else if ("edit".equals(action)) {
            // 编辑用户
            int id = Integer.parseInt(req.getParameter("id"));
            User user = userService.findById(id);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/editUser.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            // 添加用户

        } else if ("update".equals(action)) {
            // 获取用户 ID
            int id = Integer.parseInt(req.getParameter("id"));

            // 获取要更新的字段
            String name = req.getParameter("name");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");

            // 从数据库中获取原用户信息
            User existingUser = userService.findById(id);

            // 如果某个字段未填写，则使用原本的值
            if (name == null || name.isEmpty()) {
                name = existingUser.getName();
            }
            if (phone == null || phone.isEmpty()) {
                phone = existingUser.getPhone();
            }
            if (password == null || password.isEmpty()) {
                password = existingUser.getPassword();
            }

            // 创建更新后的用户对象
            User updatedUser = new User();
            updatedUser.setId(id);
            updatedUser.setName(name);
            updatedUser.setPhone(phone);
            updatedUser.setPassword(password);
            updatedUser.setRole(existingUser.getRole()); // 保持角色不变

            // 调用 Service 层更新用户信息
            userService.updateUser(updatedUser);

            // 重定向到用户列表页面
            resp.sendRedirect(req.getContextPath() + "/admin");
        }
    }
}
