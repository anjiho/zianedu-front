<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>지안에듀</title>
    <!-- zian css-->
    <link rel="stylesheet" type="text/css" href="/common/zian/css/kiplayer/font.css" />
    <link rel="stylesheet" type="text/css" href="/common/zian/css/kiplayer/base.css" />
    <link rel="stylesheet" type="text/css" href="/common/zian/css/base.css">
    <link rel="stylesheet" type="text/css" href="/common/zian/css/content.css">
    <!-- zian js-->
    <script src="/common/zian/js/kiplayer/jquery.min.js"></script>
    <script src="/common/zian/js/kiplayer/jquery.plugin.js"></script>
    <script src="/common/js/common.js"></script>
    <script src="/common/zian/js/common.js"></script>
    <script src="/common/zian/js/kiplayer/common.js"></script>
    <script src="/common/zian/js/main.js"></script>
    <script src="/common/zian/js/submain.js"></script>

    <!--<script src="/common/assets/jquery/dist/jquery.min.js"></script>-->
    <script src="/common/js/blank-check.js"></script>
    <script src="/common/js/comment.js"></script>
    <!--<script src="/common/js/common.js"></script>-->
    <script src="/common/js/rest-api.js"></script>
    <!--api controller-->
    <script src="/common/js/view/banner-controller.js"></script>
    <script src="/common/js/view/board-controller.js"></script>
    <script src="/common/js/view/book-store-controller.js"></script>
    <script src="/common/js/view/category-controller.js"></script>
    <script src="/common/js/view/exam-controller.js"></script>
    <script src="/common/js/view/file-upload-controller.js"></script>
    <script src="/common/js/view/menu-controller.js"></script>
    <script src="/common/js/view/my-page-controller.js"></script>
    <script src="/common/js/view/order-controller.js"></script>
    <script src="/common/js/view/payment-controller.js"></script>
    <script src="/common/js/view/teacher-controller.js"></script>
    <script src="/common/js/view/user-controller.js"></script>
    <!--//api controller-->
    <!-- dwr -->
    <script type='text/javascript' src='/dwr/engine.js'></script>
    <script type='text/javascript' src='/dwr/util.js'></script>
    <!-- 다음 주소 api -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body onload="init();">
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){ //로그인했을경우,
            var userName = sessionUserInfo.name;
            innerHTML("userName", userName+" 님");
            gfn_display("userName", true);
            gfn_display("logout", true);
            gfn_display("login", false);
            gfn_display("join", false);
        }
    });

    function goLogout() {
        if(confirm("로그아웃 하시겠습니까?")){
            sessionStorage.clear();
            innerHTML("userName", "");
            gfn_display("userName", false);
            gfn_display("logout", false);
            gfn_display("login", true);
            gfn_display("join", true);
            goMain();
        }
    }
</script>
