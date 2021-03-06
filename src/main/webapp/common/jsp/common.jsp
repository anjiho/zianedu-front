<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="shortcut icon" href="/common/zian/images/common/favicon.ico" type="image/x-icon" />
    <title>지안에듀</title>
    <!-- zian js-->
<%--    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>--%>
<%--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="/common/zian/js/kiplayer/jquery.min.js"></script>
    <script src="/common/zian/js/kiplayer/jquery.plugin.js"></script>
    <script src="/common/zian/js/jquery.fileDownload.js"></script>
    <script src="/common/js/common.js"></script>
    <script src="/common/zian/js/common.js"></script>
    <script src="/common/zian/js/kiplayer/common.js"></script>
    <script src="/common/zian/js/kiplayer/jquery.easing.1.3.min.js"></script>
    <script src="/common/zian/js/kiplayer/jquery.simpler-sidebar.min.js"></script>
    <script src="/common/zian/js/main.js"></script>
    <script src="/common/zian/js/submain.js"></script>
    <script src="/common/zian/js/owl.carousel.min.js"></script>
    <script src="/common/zian/js/swiper.min.js"></script>

    <script src="/common/zian/js/ui.js"></script>

    <!-- include libraries(jQuery, bootstrap) -->
    <!-- bootstrp은 필요한 곳만 include하도록 변경 -->
<%--    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">--%>
<%--    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>--%>
    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <!-- zian css-->
    <link rel="stylesheet" type="text/css" href="/common/zian/css/kiplayer/font.css"/>
    <link rel="stylesheet" type="text/css" href="/common/zian/css/kiplayer/base.css"/>
    <link rel="stylesheet" type="text/css" href="/common/zian/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="/common/zian/css/base.css">

    <link rel="stylesheet" type="text/css" id="cssDivsion" href="/common/zian/css/content.css">
    <link rel="stylesheet" type="text/css" href="/common/zian/css/board.css">
    <link rel="stylesheet" type="text/css" href="/common/zian/css/reponsive.css">
    <link rel="stylesheet" type="text/css" href="/common/zian/css/owl.carousel.min.css">

    <link rel="stylesheet" type="text/css" href="/common/calendar/css/fullcalendar.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


    <!--<script src="/common/assets/jquery/dist/jquery.min.js"></script>-->
    <script src="/common/js/blank-check.js"></script>
    <script src="/common/js/comment.js"></script>
    <!--<script src="/common/js/common.js"></script>-->
    <script src="/common/js/rest-api.js"></script>
    <!--paging-->
    <script src="common/js/paging-count-check.js"></script>

    <script type='text/javascript' src="/common/calendar/lib/moment.min.js"></script>
    <script type='text/javascript' src="/common/calendar/js/fullcalendar.js"></script>
    <script src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>

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
    <script src="/common/js/view/product-controller.js"></script>
    <script src="/common/js/view/customer-center-controlle.js"></script>
    <script src="/common/js/view/event-controller.js"></script>
    <!--//api controller-->
    <!-- dwr -->
    <script type='text/javascript' src='/dwr/engine.js'></script>
    <script type='text/javascript' src='/dwr/util.js'></script>
    <!--paging-->
    <script type='text/javascript' src='/common/js/comPage.js'></script>
    <script type='text/javascript' src='/common/js/mobile.js'></script>
    <script src="/common/starplayer/js/starplayer_popup.js"></script>
    <script src="/common/starplayer/js/starplayer_config.js"></script>
    <script src="/common/starplayer/js/starplayer_app.js"></script>
    <script src="/common/starplayer/js/starplayer_ui.js"></script>

    <script src="/common/calendar/lang/ko.js"></script>
</head>
<body>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        var prevLeftMenu = sessionStorage.getItem('prevLeftMenu');//직렬 구분
        if(leftMenuInfo == "bigExam" || leftMenuInfo == "bookStore"){
            leftMenuInfo = prevLeftMenu;
        }
        if(leftMenuInfo == 'publicOnline' || leftMenuInfo == "publicAcademy"){
            $("#cssDivsion").prop('href', '/common/zian/css/publicContent.css');
        }else if(leftMenuInfo == "postOnline" || leftMenuInfo == "postAcademy"){
            $("#cssDivsion").prop('href', '/common/zian/css/postContent.css');
        }else{
            $("#cssDivsion").prop('href', '/common/zian/css/techContent.css');
        }

        $('.desc').each(function(){
            var $this = $(this);
            var len = 150;
            if($this.text().length >= len){
                $this.text($(this).text().substr(0,len)+'…');
            }
        })

    });
</script>
