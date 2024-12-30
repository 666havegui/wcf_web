package com.web.service;

import com.web.dao.UserDao;
import com.web.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.SQLException;

public class UserService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();
    public void Add(String phone, String username, String password, String role){
        SqlSession sqlSession = factory.openSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        userDao.Add(phone,username,password,role);
        sqlSession.commit();
        sqlSession.close();
    }
}
