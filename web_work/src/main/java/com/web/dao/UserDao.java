package com.web.dao;

import com.web.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDao {
    @Select("SELECT * FROM user")
    List<User> SelectAll();
}
