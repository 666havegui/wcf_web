package com.web.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.sql.Blob;
import java.util.List;

public interface ProductDao {
    @Insert("INSERT INTO products(shop_id,name,img,price,stock,category) values (#{shop_id},#{name},#{img},#{price},#{stock},#{category})")
    void ProductAdd(@Param("shop_id")int shop_id, @Param("name")String name, @Param("img")byte[] img, @Param("price")float price, @Param("stock")int stock, @Param("category")String category);

    @Select("SELECT img from products")
    List<Blob> SelectAllBlob();
}
