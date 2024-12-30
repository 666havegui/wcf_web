package com.web.dao;

import com.web.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDao {
    @Select("SELECT * FROM users")
    List<User> SelectAll();
    @Insert("INSERT into users(phone, username, password, role) values (#{phone},#{username},#{password},#{role})")
    void Add(@Param("phone") String phone,@Param("username") String username,@Param("password") String password,@Param("role") String role);
}
