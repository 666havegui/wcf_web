package com.web.controller;

import com.web.domain.Shops;
import com.web.service.ShopService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/shop") // 配置路径
public class ShopServlet extends HttpServlet {
    private ShopService shopService = new ShopService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("list".equals(action)) {
            // 列出所有商铺
            List<Shops> shops = shopService.getAllShops();
            req.setAttribute("shops", shops);
            System.out.println(shops);
            req.getRequestDispatcher("/jsp/Administer.jsp").forward(req, resp);

        } else if ("delete".equals(action)) {
            // 删除商铺
            int id = Integer.parseInt(req.getParameter("id"));
            shopService.deleteShop(id);
            resp.sendRedirect("/web_work/admin");

        } else if ("edit".equals(action)) {
            // 编辑商铺
            System.out.println(req.getParameter("id"));
            int id = Integer.parseInt(req.getParameter("id"));
            Shops shop = shopService.getShopById(id);
            req.setAttribute("shop", shop);
            req.getRequestDispatcher("/editShop.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            // 添加商铺

        } else if ("update".equals(action)) {
            // 获取表单参数
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String description = req.getParameter("description");

            // 确保参数有效
            if (name == null || name.trim().isEmpty() || description == null || description.trim().isEmpty()) {
                req.setAttribute("error", "店铺名称和描述不能为空！");
                req.getRequestDispatcher("/jsp/editShop.jsp").forward(req, resp);
                return;
            }

            // 创建 Shops 对象
            Shops shop = new Shops();
            shop.setId(id);
            shop.setName(name);
            shop.setDescription(description);

            // 调用 Service 更新数据
            shopService.updateShop(shop);

            // 重定向到管理员界面
            resp.sendRedirect(req.getContextPath() + "/admin");
        }
    }
}
