package com.web.service;

import com.web.dao.ShopDao;
import com.web.dao.UserDao;
import com.web.domain.Shops;
import com.web.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
}
