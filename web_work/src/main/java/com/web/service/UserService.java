package com.web.service;

import com.web.dao.UserDao;
import com.web.domain.User;
import com.web.util.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();
    public void Add(String phone, String username, String password, String role){
        SqlSession sqlSession = factory.openSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        userDao.Add(phone,username,password,role);
        sqlSession.commit();
        sqlSession.close();
    }

    // 验证用户名和密码的方法
    public User authenticate(String username, String password) {
        SqlSession sqlSession = factory.openSession();
        try {
            UserDao userDao = sqlSession.getMapper(UserDao.class);
            // 根据用户名查询用户
            User user = userDao.findByUsername(username);
            System.out.println("11:"+user);
            // 验证密码
            if (user != null && user.getPassword().equals(password)) {
                return user;
            }
            return null;
        } finally {
            sqlSession.close();
        }
    }
    public User findByName(String username){
        SqlSession sqlSession = factory.openSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        User user = userDao.findByUsername(username);
        sqlSession.commit();
        sqlSession.close();
        return user;
    }

    public User findById(int id){
        SqlSession sqlSession = factory.openSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        User user = userDao.getUserById(id);
        sqlSession.commit();
        sqlSession.close();
        return user;
    }

    public List<User> getAllUsers() {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            UserDao userDao = session.getMapper(UserDao.class);
            return userDao.SelectAll();
        }
    }

    public void addUser(User user) {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            UserDao userDao = session.getMapper(UserDao.class);
            userDao.addUser(user);
            session.commit();
        }
    }

    public void updateUser(User user) {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            UserDao userDao = session.getMapper(UserDao.class);
            userDao.updateUser(user);
            session.commit();
        }
    }

    public void deleteUser(int id) {
        try (SqlSession session = SqlSessionFactoryUtils.getSession()) {
            UserDao userDao = session.getMapper(UserDao.class);
            userDao.deleteUser(id);
            session.commit();
        }
    }
}
