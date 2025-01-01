package com.web.service;

import com.web.dao.ShopDao;
import com.web.dao.UserDao;
import com.web.domain.Shops;
import com.web.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ShopService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();
    public void createShop(Shops shop){
        SqlSession sqlSession = factory.openSession();
        ShopDao shopDao = sqlSession.getMapper(ShopDao.class);
        shopDao.createShop(shop);
        sqlSession.commit();
        sqlSession.close();
    }
    public Shops getShopByName(String name){
        SqlSession sqlSession = factory.openSession();
        ShopDao shopDao = sqlSession.getMapper(ShopDao.class);
        return shopDao.getShopByName(name);
    }
    public Shops getShopByUserId(int user_id){
        SqlSession sqlSession = factory.openSession();
        ShopDao shopDao = sqlSession.getMapper(ShopDao.class);
        return shopDao.getShopByUserId(user_id);
    }

    public List<Shops> getAllShops() {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            ShopDao shopDao = session.getMapper(ShopDao.class);
            return shopDao.getAllShops();
        }
    }

    public Shops getShopById(int id) {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            ShopDao shopDao = session.getMapper(ShopDao.class);
            return shopDao.getShopById(id);
        }
    }

    public void addShop(Shops shop) {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            ShopDao shopDao = session.getMapper(ShopDao.class);
            shopDao.addShop(shop);
            session.commit();
        }
    }

    public void updateShop(Shops shop) {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            ShopDao shopDao = session.getMapper(ShopDao.class);
            shopDao.updateShop(shop);
            session.commit();
        }
    }

    public void deleteShop(int id) {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            ShopDao shopDao = session.getMapper(ShopDao.class);
            shopDao.deleteShop(id);
            session.commit();
        }
    }
}
