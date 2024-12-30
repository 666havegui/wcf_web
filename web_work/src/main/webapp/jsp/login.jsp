
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录界面</title>
    <link rel="stylesheet" href="../css/login_style.css">
    <link rel="stylesheet" href="test.css/iconfont.css">
    <!-- <link rel="stylesheet" href="home_style.css"> -->

</head>

<body>
<div class="back">
    <a href="home.html" class="reback"><i class="iconfont icon-fanhui"></i></a>
</div>
<div class="container">
    <div class="login1">
        <!-- 标题 -->
        <div class="header">登录</div>
        <!-- 登录界面 -->
        <div class="input1">
            <form method="post" action="/web_work/login">
                <input type="text" id="username" name="username" class="username input1" placeholder="用户名">
                <input type="password" class="password input1" placeholder="密码">
                <input class="btn" type="submit" value="登录">
            </form>
            <div>${username}</div>
            <div class="btn">登录</div>
            <div class="mistake"></div>
        </div>
        <!-- 注册界面链接 -->
        <div class="enroll1">
            还没有账号？<a href="enroll.html">点击注册</a>
        </div>
    </div>

</div>

<div class="footer_bottom">
    <div class="footer_bottom_txt">
        <ul>
            <li><a href="">关于我们</a></li>
            <li><a href="">商家服务大厅</a></li>
            <li><a href="">开放平台</a></li>
            <li><a href="">诚聘英才</a></li>
            <li><a href="">联系我们</a></li>
            <li><a href="">网站合作</a></li>
            <li><a href="">法律声明</a></li>
            <li><a href="">隐私权政策</a></li>
            <li><a href="">知识产权</a></li>
            <li><a href="">廉正举报</a></li>
            <li><a href="">不当竞争举报</a></li>
        </ul>

    </div>
    <div class="footer_bottom_txt">
        <h4 style="color: white;font-size: 12px;">版权所有：个人信息（计算机221 黄健泓 202210244127，吴楚发
            202210244131，陈锴202210244132）</h4>
        <p class="p">
            增值电信业务经营许可证：浙B2-20110446 出版物网络交易平台服务经营备案证：新出发浙备字第2022003号 营业性演出许可证：浙演经20213300000101
            集邮市场开办者备案：杭集邮备005
            互联网违法和不良信息举报电话：0571-81683755 jubao.tb@service.taobao.com 中国互联网举报中心 中国扫黄打非网 全国文化和旅游市场网上举报投诉处理系统
            全国12315平台
            浙江省互联网违法和不良信息举报中心 全网举报 互联网药品信息服务资质证书编号：浙-（经营性）-2021-0139
            药品网络交易第三方平台备案信息：（浙）网药平台备字〔2023〕第000013-000号 浙公网安备 33010002000120号
            医疗器械网络交易服务第三方平台备案：（浙）网械平台备字[2018]第00002号 网络文化经营许可证：浙网文 [2021]1668-073号
            浙江省网络食品销售第三方平台提供者备案：浙网食A33010002 12318举报 浙B2-20110446-1
            © 2003-现在 TMALL.COM 版权所有
        </p>
    </div>
</div>
<script>
    const user = [{ username: 13430050185, password: 123456 },
        { username: 13682767866, password: 123457 },
        { username: 13521179380, password: 123458 }]
    const username = document.querySelector(".username")
    const password = document.querySelector(".password")
    const mistake = document.querySelector(".mistake")
    let flag = -1
    let mis = 0
    username.addEventListener('change', function () {
        for (let i = 0; i < user.length; i++) {
            if (user[i].username == username.value) {
                flag = i;
            }
        }
    })
    password.addEventListener('change', function () {
        if (flag == -1) {
            return
        }
        else if (user[flag].password == password.value) {
            mis = 0
            return
        }
        else {
            mis = 1
        }
    })
    const btn = document.querySelector(".btn")
    btn.addEventListener('click', function () {
        if (mis == 1 || flag == -1) {
            mistake.innerText = "用户不存在或密码错误"
        }
        else {
            mistake.innerText = ""
        }
        if (mis == 0 && flag != -1) {
            alert("登录成功")
            window.location.href = "home.html"
        }
    })

</script>
</body>

</html>