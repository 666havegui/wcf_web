package com.web;

import com.web.dao.UserDao;
import com.web.domain.User;
import com.web.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class test {
    public static void main(String[] args) {
        SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();
        SqlSession sqlSession = factory.openSession();
        UserDao mapper = sqlSession.getMapper(UserDao.class);
        List<User> users = mapper.SelectAll();
        sqlSession.close();
        System.out.println(users);
    }
}
