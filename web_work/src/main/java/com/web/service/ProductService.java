package com.web.service;

import com.web.dao.ProductDao;
import com.web.dao.ShopDao;
import com.web.domain.Product;
import com.web.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.Blob;
import java.util.List;

public class ProductService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();
    public void ProductAdd(int shop_id,String name,byte[] imgBytes,float price,int stock,String category){
        SqlSession sqlSession = factory.openSession();
        ProductDao productDao = sqlSession.getMapper(ProductDao.class);
        productDao.ProductAdd(shop_id,name,imgBytes,price,stock,category);
        sqlSession.commit();
        sqlSession.close();
    }
    public List<Blob> SelectAllBlob(){
        SqlSession sqlSession = factory.openSession();
        ProductDao productDao = sqlSession.getMapper(ProductDao.class);
        return productDao.SelectAllBlob();
    }
}
