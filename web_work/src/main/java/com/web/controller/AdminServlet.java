package com.web.controller;

import com.web.domain.Shops;
import com.web.domain.User;
import com.web.service.ShopService;
import com.web.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private UserService userService = new UserService();
    private ShopService shopService = new ShopService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 加载用户数据
        List<User> users = userService.getAllUsers();
        req.setAttribute("users", users);

        // 加载商铺数据
        List<Shops> shops = shopService.getAllShops();
        req.setAttribute("shops", shops);

        // 转发到 Administer.jsp
        req.getRequestDispatcher("/jsp/Administer.jsp").forward(req, resp);
    }
}

