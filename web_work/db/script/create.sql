CREATE DATABASE online_shop;
use online_shop;
CREATE TABLE users (
                       id INT PRIMARY KEY AUTO_INCREMENT,  -- 用户ID
                       phone VARCHAR(50) NOT NULL,
                       username VARCHAR(50) NOT NULL,      -- 用户名
                       password VARCHAR(255) NOT NULL,     -- 密码
                       role ENUM('Admin', 'StoreOwner', 'Customer') NOT NULL,  -- 用户角色
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 创建时间
                       updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  -- 更新时间
);

CREATE TABLE orders (
                        id INT PRIMARY KEY AUTO_INCREMENT,  -- 订单ID
                        user_id INT NOT NULL,  -- 顾客ID，关联`users`表
                        total_price DECIMAL(10, 2) NOT NULL,  -- 订单总价格
                        order_status ENUM('PendingPayment', 'Paid', 'Shipped', 'Completed', 'Cancelled') DEFAULT 'PendingPayment',  -- 订单状态
                        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 创建时间
                        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- 更新时间
                        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE  -- 外键约束
);

CREATE TABLE shops (
                       id INT PRIMARY KEY AUTO_INCREMENT,  -- 店铺ID
                       name VARCHAR(255) NOT NULL,  -- 店铺名称
                       description TEXT,  -- 店铺描述
                       user_id INT NOT NULL,  -- 店铺所属的用户（店铺管理员）
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 创建时间
                       updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- 更新时间
                       FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE  -- 外键：店铺管理员，关联`users`表
);


CREATE TABLE products (
                          id INT PRIMARY KEY AUTO_INCREMENT,  -- 商品ID
                          shop_id INT NOT NULL,  -- 店铺ID，关联`shops`表
                          name VARCHAR(255) NOT NULL,  -- 商品名称
                          price DECIMAL(10, 2) NOT NULL,  -- 商品价格
                          stock INT DEFAULT 0,  -- 商品库存
                          category ENUM('Electronics', 'Clothing', 'Books', 'HomeAppliance','other') DEFAULT 'Other',  -- 商品分类
                          created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 创建时间
                          updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- 更新时间
                          FOREIGN KEY (shop_id) REFERENCES shops(id) ON DELETE CASCADE  -- 外键约束
);

CREATE TABLE reviews (
                         id INT PRIMARY KEY AUTO_INCREMENT,  -- 评价ID
                         user_id INT NOT NULL,  -- 用户ID，关联`users`表
                         product_id INT,  -- 商品ID，关联`products`表
                         shop_id INT,  -- 店铺ID，关联`shops`表
                         order_id INT,  -- 订单ID，关联`orders`表
                         rating INT NOT NULL CHECK(rating >= 1 AND rating <= 5),  -- 评分，1到5分
                         comment TEXT,  -- 评论内容
                         review_type ENUM('Product', 'Shop', 'Order') NOT NULL,  -- 评价类型（商品、店铺、订单）
                         created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 创建时间
                         updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- 更新时间
                         FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,  -- 外键：用户ID
                         FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,  -- 外键：商品ID
                         FOREIGN KEY (shop_id) REFERENCES shops(id) ON DELETE CASCADE,  -- 外键：店铺ID
                         FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE  -- 外键：订单ID
);
