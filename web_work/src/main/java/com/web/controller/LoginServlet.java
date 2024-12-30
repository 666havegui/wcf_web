package com.web.controller;

import com.web.service.UserService;
import com.web.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取请求中的用户名和密码
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // 使用服务层验证用户名和密码
        User user = userService.authenticate(username, password);

        if (user != null) {
            // 如果验证成功，将用户信息存入会话，并重定向到首页
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("index.jsp");
        } else {
            // 如果验证失败，将错误信息设置到请求中并跳转回登录页面
            req.setAttribute("errorMessage", "用户名或密码错误");
            req.getRequestDispatcher("./jsp/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 处理 POST 请求，实际上是调用 doGet 方法
        this.doGet(req, resp);
    }
}
