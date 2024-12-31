<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%

    String path = request.getRequestURI();

    String basePath = request.getScheme() + "://"

            + request.getServerName() + ":" + request.getServerPort()

            + path;

%>
<base
        href="<%=basePath%>">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/login.css" type="text/css">
    <link rel="stylesheet" href="../css/StoreOwner.css">
</head>
<body>
<div class="content">
    <div class="imfor">
        <div class="owner">
            <img src="永雏塔菲.png" alt="" class="avatar">
            <div class="ownname">你好，${user.name}</div>
            <div class="sale"><a href="newproduct.jsp">上架新品</a></div>
        </div>
    </div>
    <div class="nav">
        <div id="wdsjsp" style="background-color: red;color: white;">我的上架商品</div>
        <div id="gkxdjl" style="background-color: white;color: black;">顾客下单记录</div>
    </div>
    <div class="count" id="count">我正在出售的商品(0)</div>
    <div class="list" id="list">
        <div>
            <img src="">

        </div>
        <div>
            222222
        </div>
    </div>
    <div class="record" id="record">
        <div>
            333333
        </div>
        <div>
            444444
        </div>
    </div>
</div>
<div style="height: 500px;"></div>
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
            202210244131，陈锴202210244132, 衷传广 202210244133）</h4>
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
</body>
<script>
    var count = document.getElementById("count")
    var list = document.getElementById("list")
    var record = document.getElementById("record")
    document.getElementById("wdsjsp").addEventListener('click', function () {
        record.style.display = "none"
        list.style.display = "block"
        document.getElementById("wdsjsp").style.backgroundColor = "red"
        document.getElementById("wdsjsp").style.color = "white"
        count.style.display = "block"
        document.getElementById("gkxdjl").style.backgroundColor = "white"
        document.getElementById("gkxdjl").style.color = "black"
    })
    document.getElementById("gkxdjl").addEventListener('click', function () {
        record.style.display = "block"
        list.style.display = "none"
        count.style.display = "none"
        document.getElementById("wdsjsp").style.backgroundColor = "white"
        document.getElementById("wdsjsp").style.color = "black"
        document.getElementById("gkxdjl").style.backgroundColor = "red"
        document.getElementById("gkxdjl").style.color = "white"
    })
</script>

</html>