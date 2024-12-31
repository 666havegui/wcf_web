package com.web.domain;

public class Product {
//    id INT PRIMARY KEY AUTO_INCREMENT,  -- 商品ID
//    shop_id INT NOT NULL,  -- 店铺ID，关联`shops`表
//    name VARCHAR(255) NOT NULL,  -- 商品名称
//    price DECIMAL(10, 2) NOT NULL,  -- 商品价格
//    stock INT DEFAULT 0,  -- 商品库存
//    category ENUM('Electronics', 'Clothing', 'Books', 'HomeAppliance','other') DEFAULT 'Other',
    private int id;//商品ID
    private int shop_id;//店铺id
    private String name;//商品名
    private byte[] img;//商品图片
    private float price;//价格
    private int stock;//库存
    private String category;//类型

    public Product() {
    }

    public Product(int id, int shop_id, String name, float price, int stock, String category) {
        this.id = id;
        this.shop_id = shop_id;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public String getName() {
        return name;
    }

    public float getPrice() {
        return price;
    }

    public int getStock() {
        return stock;
    }

    public String getCategory() {
        return category;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", shop_id=" + shop_id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", category='" + category + '\'' +
                '}';
    }
}
