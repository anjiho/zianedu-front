<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $(document).ready(function () {
        var leftMenuInfo = sessionStorage.getItem('myPageHeader');

        if(leftMenuInfo != null){
            if(leftMenuInfo == "orderList"){
                $("#myPageMenu li:eq(0)").addClass('active');
            }else if(leftMenuInfo == "cart"){
                $("#myPageMenu li:eq(1)").addClass('active');
            }else if(leftMenuInfo == "memberInfo"){
                $("#myPageMenu li:eq(2)").addClass('active');
            }else if(leftMenuInfo == "cupon"){
                $("#myPageMenu li:eq(3)").addClass('active');
            }else if(leftMenuInfo == "board"){
                $("#myPageMenu li:eq(4)").addClass('active');
            }else if(leftMenuInfo == "gradeManage"){
                $("#myPageMenu li:eq(5)").addClass('active');
            }
        }

        /* header메뉴 클릭시 class active처리*/
        $("#myPageMenu li").click(function() {
            $("#myPageMenu li").removeClass('active');
            if($(this).index() == 0){
                sessionStorage.setItem("myPageHeader", "orderList");
                $("#myPageMenu li:eq(0)").addClass('active');
                goPageNoSubmit('myPage', 'orderList');
            }else if($(this).index() == 1){
                sessionStorage.setItem("myPageHeader", "cart");
                $("#myPageMenu li:eq(1)").addClass('active');
                goPageNoSubmit('myPage', 'cart');
            }else if($(this).index() == 2){
                sessionStorage.setItem("myPageHeader", "memberInfo");
                $("#myPageMenu li:eq(2)").addClass('active');
                goPageNoSubmit('myPage', 'memberMain');
            }else if($(this).index() == 3){
                sessionStorage.setItem("myPageHeader", "cupon");
                sessionStorage.setItem("tabHeader", "tabMenu1");
                $("#myPageMenu li:eq(3)").addClass('active');
                goPageNoSubmit('myPage', 'coupon');
            }else if($(this).index() == 4){
                sessionStorage.setItem("myPageHeader", "board");
                sessionStorage.setItem("tabHeader", "tabMenuQuestion");
                $("#myPageMenu li:eq(4)").addClass('active');
                goPageNoSubmit('myPage', 'questionList');
            }else if($(this).index() == 5){
                sessionStorage.setItem("myPageHeader", "gradeManage");
                sessionStorage.setItem("tabHeader", "tabMenu1");
                $("#myPageMenu li:eq(5)").addClass('active');
                goPageNoSubmit('myPage', 'gradeList');
            }
        });
    });
</script>
<div class="tabBox">
    <ul id="myPageMenu">
        <li><a href="javascript:void(0);">주문내역조회</a></li>
        <li><a href="javascript:void(0);">장바구니</a></li>
        <li><a href="javascript:void(0);">회원정보관리</a></li>
        <li><a href="javascript:void(0);">쿠폰마일리지</a></li>
        <li><a href="javascript:void(0);">게시물관리</a></li>
        <li><a href="javascript:void(0);">성적관리</a></li>
    </ul>
</div>
<br />