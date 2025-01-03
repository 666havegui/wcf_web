<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册界面</title>
    <link rel="stylesheet" href="../css/enroll_style.css">
    <link rel="stylesheet" href="../css/test.css/iconfont.css">
</head>

<body>
<div class="back">
    <a href="home.html" class="reback"><i class="iconfont icon-fanhui"></i></a>
</div>
<div class="container">
    <div class="enroll">
        <div class="header">注册</div>
        <div class="input">
            <form action="/web_work/register" method="post">
                <input type="text" name="username" placeholder="用户名" class="input">
                <input type="text" placeholder="手机号" name="phone" class="username input">
                <span class="name ensure"></span>
                <input type="password" placeholder="设置密码" name="password" class="password input">
                <span class="pass ensure"></span>
                <input type="password" placeholder="验证密码" class="enpassword input">
                <span class="enpass ensure"></span>
                <div class="role">
                    <input type="radio" id="option1" name="role" value="Customer">
                    <label for="option1">顾客</label><br>

                </div >
                <div class="role">
                    <input type="radio" id="option2" name="role" value="StoreOwner">
                    <label for="option2">商家</label><br>
                </div>
                <div class="role">
                    <input type="radio" id="option3" name="role" value="Admin">
                    <label for="option3">运营商</label><br>
                </div>
                <div class="Captcha">
                    <input type="text" placeholder="验证码" class="captcha input">
                    <span class="encaptcha ensure"></span>
                    <button class="getcaptcha">获取验证码</button>
                </div>
                <input class="btn" type="submit" value="注册">
<%--                <button class="btn">注册</button>--%>
                <span class="enenroll ensure"></span>
            </form>

        </div>
        <div class="login">已有账号？去<a href="login.jsp">登录</a></div>
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
<script>
    // 验证手机号
    let flagname = false
    const username = document.querySelector(".username");
    const regname = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;///^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$/
    username.addEventListener('change', verifyName)
    function verifyName() {
        const name = document.querySelector(".name");
        if (!regname.test(username.value)) {
            name.innerText = "请输入正确的手机号"
            flagname = false
            return false
        }
        else {
            name.innerText = ""
            flagname = true
            return true
        }
    }
    //验证密码
    let flagpassword = false
    const password = document.querySelector(".password");
    const regpassword = /^[0-9]{6,9}$/;
    const pass = document.querySelector(".pass");
    password.addEventListener('change', verifyPassword)
    function verifyPassword() {
        if (!regpassword.test(password.value)) {
            pass.innerText = "请输入由数字组成的6-9位密码";
            flagpassword = false
            return false
        }
        else {
            pass.innerText = "";
            flagpassword = true
            return true
        }
    }
    // 再次验证密码
    let flagenpassword = false
    const enpassword = document.querySelector(".enpassword");
    const enpass = document.querySelector(".enpass");
    enpassword.addEventListener('change', verifyEnpassword);
    function verifyEnpassword() {
        if (enpassword.value == password.value) {
            enpass.innerText = "";
            flagenpassword = true
            return true
        }
        else {
            enpass.innerText = "与所设置密码不一致"
            flagenpassword = false
            return false
        }
    }
    // 获取验证码
    const getcaptcha = document.querySelector(".getcaptcha");
    let word = 0;
    getcaptcha.addEventListener("click", function () {
        let num = 5;
        let timer;
        console.log(111);
        getcaptcha.disabled = true;
        getcaptcha.innerText = num + "秒后重新获取";
        word = parseInt(Math.random() * (100000 - 10000) + 10000)
        alert("验证码:" + word);
        timer = setInterval(function () {
            if (num == 0) {
                num = 5;
                getcaptcha.innerText = "重新获取验证码"
                clearInterval(timer);
                getcaptcha.disabled = false;
            }
            else {
                num--;
                getcaptcha.innerText = num + "秒后重新获取";
            }
        }, 1000)
    })
    // 验证验证码
    let flagcaptcha = false
    const captcha = document.querySelector(".captcha");
    const encaptcha = document.querySelector(".encaptcha");
    captcha.addEventListener('change', verifyCaptcha)
    function verifyCaptcha() {
        if (captcha.value == word) {
            encaptcha.innerText = "";
            flagcaptcha = true
            return true
        }
        else {
            encaptcha.innerText = "验证码输入有误"
            flagcaptcha = false
            return false
        }
    }
    const btn = document.querySelector(".btn")
    const enenroll = document.querySelector(".enenroll")
    btn.addEventListener('click', Enroll)
    function Enroll() {
        if (flagname && flagpassword && flagenpassword && flagcaptcha) {
            enenroll.innerText = ""
            alert("注册成功")
            window.location.href = "home.html"
        }
        else {
            enenroll.innerText = "请正确完成所有信息填写"
        }
    }
</script>
</body>

</html>