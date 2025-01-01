package com.web;

import com.web.dao.UserDao;
import com.web.domain.User;
import com.web.service.ProductService;
import com.web.service.ShopService;
import com.web.service.UserService;
import com.web.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.Blob;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

public class test {
    public static void main(String[] args) {
//        ProductService productService = new ProductService();
//        List<Blob> blobs = productService.SelectAllBlob();
//        System.out.println(blobs);

        UserService userService = new UserService();
        System.out.println(userService.getAllUsers());
        System.out.println(java.util.TimeZone.getDefault().getID());

        // 检查 Java 时区
        System.out.println("默认时区：" + TimeZone.getDefault().getID());
        System.out.println("当前时间：" + new Date());

        // 打印用户列表
        List<User> users = userService.getAllUsers();
        for (User user : users) {
            System.out.println(user);
        }
    }
}
