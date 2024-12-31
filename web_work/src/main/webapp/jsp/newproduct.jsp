<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>上架新品</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .product-form-container {
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        background: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group input[type="number"],
    .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    .form-group input[type="file"] {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    button {
        padding: 10px 20px;
        background-color: #ff0000;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background-color: #cc0000;
    }
    .role {
        display: inline-block;
        margin-right: 10px; /* 可以根据需要调整间距 */
        margin-bottom: 5px;
    }
</style>

<body>
<div class="product-form-container">
    <h1>上架新品</h1>
    <form action="/web_work/productAdd" method="post" enctype="multipart/form-data">
        <div class="form-group">
            店铺名称：${shop.name}
        </div>
        <div class="form-group">
            <label for="productName">商品名称:</label>
            <input type="text" id="productName" name="name" required>
        </div>
        <div class="form-group">
            <label for="productPrice">商品价格:</label>
            <input type="number" id="productPrice" name="price" step="0.1" required>
        </div>
        <div class="form-group">
            <label for="productQuantity">商品数量:</label>
            <input type="number" id="productQuantity" name="stock" min="1" required>
        </div>
        <div class="form-group">
            <label for="productImage">商品图片:</label>
            <input type="file" id="productImage" name="img" accept="image/*" required>
        </div>
        <div class="role">
            <input type="radio" id="option1" name="category" value="Electronics">
            <label for="option1">电子产品</label><br>
        </div >
        <div class="role">
            <input type="radio" id="option2" name="category" value="Clothing">
            <label for="option2">衣物</label><br>
        </div>
        <div class="role">
            <input type="radio" id="option3" name="category" value="Books">
            <label for="option3">书籍</label><br>
        </div>
        <div class="role">
            <input type="radio" id="option4" name="category" value="HomeAppliance">
            <label for="option4">家用电器</label><br>
        </div>
        <div class="role">
            <input type="radio" id="option5" name="category" value="other">
            <label for="option5">其他</label><br>
        </div>
        <div class="form-group">
            <label for="productDescription">商品介绍:</label>
            <textarea id="productDescription" name="productDescription" rows="5" required></textarea>
        </div>
        <div class="form-group">
            <button type="submit">上架商品</button>
        </div>
    </form>
</div>
</body>

</html>