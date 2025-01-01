package com.web.dao;

import com.web.domain.Shops;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ShopDao {
    @Insert("INSERT INTO shops(name,user_id) values (#{name},#{user_id})")
    void createShop(Shops shop);

    @Select("SELECT * from shops where name = #{name}")
    Shops getShopByName(String name);

    @Select(("SELECT * from shops where user_id = #{user_id}"))
    Shops getShopByUserId(int user_id);

    // 查询所有商铺
    @Select("SELECT * FROM shops")
    List<Shops> getAllShops();

    // 添加商铺
    @Insert("INSERT INTO shops(name, description, user_id) VALUES(#{name}, #{description}, #{userId})")
    void addShop(Shops shop);

    // 更新商铺
    @Update("UPDATE shops SET name = #{name}, description = #{description} WHERE id = #{id}")
    void updateShop(Shops shop);


    // 删除商铺
    @Delete("DELETE FROM shops WHERE id = #{id}")
    void deleteShop(@Param("id") int id);

    // 根据ID查询商铺
    @Select("SELECT * FROM shops WHERE id = #{id}")
    Shops getShopById(@Param("id") int id);
}
