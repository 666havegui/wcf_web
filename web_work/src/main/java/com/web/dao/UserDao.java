package com.web.dao;

import com.web.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserDao {
    @Select("SELECT * FROM users")
    List<User> SelectAll();

    @Insert("INSERT into users(phone, name, password, role) values (#{phone},#{username},#{password},#{role})")
    void Add(@Param("phone") String phone,@Param("username") String username,@Param("password") String password,@Param("role") String role);

    // 根据用户名查询用户
    @Select("SELECT * FROM users WHERE name = #{username}")
    User findByUsername(@Param("username") String username);

    // 添加用户
    @Insert("INSERT INTO users(phone, name, password, role) VALUES(#{phone}, #{name}, #{password}, #{role})")
    void addUser(User user);

    // 更新用户信息
    @Update("UPDATE users SET name=#{name}, phone=#{phone}, password=#{password}, updated_at=NOW() WHERE id=#{id}")
    void updateUser(User user);

    // 删除用户
    @Delete("DELETE FROM users WHERE id = #{id}")
    void deleteUser(@Param("id") int id);

    // 根据ID查询用户
    @Select("SELECT * FROM users WHERE id = #{id}")
    User getUserById(@Param("id") int id);
}
