package com.web.controller;

import com.web.domain.Shops;
import com.web.domain.User;
import com.web.service.ShopService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createShop")
public class CreateShopServlet extends HttpServlet {
    ShopService shopService = new ShopService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");
        System.out.println(user);
        int id = user.getId();
        String name = user.getName();
        Shops shop = new Shops(String.valueOf(id)+"-"+name,id);
        shopService.createShop(shop);
        Shops shops = shopService.getShopByName(String.valueOf(id)+"-"+name);
        req.getSession().setAttribute("shop",shops);
        req.getRequestDispatcher("jsp/StoreOwner.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
