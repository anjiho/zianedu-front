<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        if(leftMenuInfo == "publicOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
        }else if(leftMenuInfo == "publicAcademy") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").show();
        }else if(leftMenuInfo == "techOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
        }else if(leftMenuInfo == "techAcademy") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").show();
        }else if(leftMenuInfo == "postOnline") {
            $(".onlineTopMenu").show();
            $(".acaTopMenu").hide();
        }else if(leftMenuInfo == "postAcademy") {
            $(".onlineTopMenu").hide();
            $(".acaTopMenu").show();
        }
    });
</script>
<div id="gnb" class="acaTopMenu" style="display: none;">
    <div class="inner">
        <ul class="deaph1 cols7">
            <li><a href="javascript:goPage('myLecRoom', 'main')">내강의실</a></li>
            <li><a href="javascript:goPage('teacher', 'main')">교수소개</a></li>
            <li><a href="#">학원수강신청</a></li>
            <li><a href="#">연간관리반</a></li>
            <li><a href="#">무료강좌</a></li>
            <li><a href="#">빅모의고사</a></li>
            <li><a href="#">합격수기</a></li>
        </ul>
    </div>
</div>

<div id="gnb" class="onlineTopMenu" style="display: none;">
    <div class="inner">
        <ul class="deaph1 cols7">
            <li><a href="javascript:goPage('myLecRoom', 'main')">내강의실</a></li>
            <li><a href="javascript:goPage('teacher', 'main')">교수소개</a></li>
            <li><a href="#">수강신청</a></li>
            <li><a href="#">지안패스</a></li>
            <li><a href="#">무료강좌</a></li>
            <li><a href="#">빅모의고사</a></li>
            <li><a href="#">합격수기</a></li>
        </ul>
    </div>
</div>