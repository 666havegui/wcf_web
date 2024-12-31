package com.web;

import com.web.dao.UserDao;
import com.web.domain.User;
import com.web.service.ProductService;
import com.web.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.Blob;
import java.util.List;

public class test {
    public static void main(String[] args) {
        ProductService productService = new ProductService();
        List<Blob> blobs = productService.SelectAllBlob();
        System.out.println(blobs);
    }
}
