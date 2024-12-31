package com.web.controller;

import com.web.domain.Product;
import com.web.domain.Shops;
import com.web.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

@WebServlet("/productAdd")
@MultipartConfig
public class ProductAddServlet extends HttpServlet {
    ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int shop_id = ((Shops)req.getSession().getAttribute("shop")).getId();
        String name = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        int stock = Integer.parseInt(req.getParameter("stock"));
        String category = req.getParameter("category");
        Part img = req.getPart("img");
        InputStream imageInputStream = img.getInputStream();
        byte[] buffer = new byte[1024];
        int bytesRead;
        byte[] imgBytes = new byte[0];
        while ((bytesRead = imageInputStream.read(buffer)) != -1) {
            imgBytes = Arrays.copyOf(imgBytes, imgBytes.length + bytesRead);
            System.arraycopy(buffer, 0, imgBytes, imgBytes.length - bytesRead, bytesRead);
        }
        productService.ProductAdd(shop_id,name,imgBytes,price,stock,category);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
