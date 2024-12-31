package com.web.dao;

import com.web.domain.Shops;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ShopDao {
    @Insert("INSERT INTO shops(name,user_id) values (#{name},#{user_id})")
    void createShop(Shops shop);

    @Select("SELECT * from shops where name = #{name}")
    Shops getShopByName(String name);

    @Select(("SELECT * from shops where user_id = #{user_id}"))
    Shops getShopByUserId(int user_id);
}
