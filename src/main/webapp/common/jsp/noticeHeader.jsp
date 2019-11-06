<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    $(document).ready(function () {
        var leftMenuInfo = sessionStorage.getItem('noticeHeader');
        if(leftMenuInfo != null){
            if(leftMenuInfo == "openMenu"){
               $("#noticeMenu li:eq(0)").addClass('active');
            }else if(leftMenuInfo == "acaNotice"){
                $("#noticeMenu li:eq(1)").addClass('active');
            }else if(leftMenuInfo == "lectureRoom"){
                $("#noticeMenu li:eq(2)").addClass('active');
            }else if(leftMenuInfo == "examNotice"){
                $("#noticeMenu li:eq(3)").addClass('active');
            }else if(leftMenuInfo == "examGuide"){
                $("#noticeMenu li:eq(4)").addClass('active');
            }else{
                $("#noticeMenu li:eq(5)").addClass('active');
            }
        }

        /* header메뉴 클릭시 class active처리*/
        $("#noticeMenu li").click(function() {
            $("#noticeMenu li").removeClass('active');
            if($(this).index() == 0){
                sessionStorage.setItem("noticeHeader", "openMenu");
                $("#noticeMenu li:eq(0)").addClass('active');
               // fn_search('new');
                goPage('notice', 'list');
            }else if($(this).index() == 1){
                sessionStorage.setItem("noticeHeader", "acaNotice");
                $("#noticeMenu li:eq(1)").addClass('active');
                // fn_search('new');
                goPage('notice', 'list');
            }else if($(this).index() == 2){
                sessionStorage.setItem("noticeHeader", "lectureRoom");
                $("#noticeMenu li:eq(2)").addClass('active');
                goPage('notice', 'list');
                //goPage('notice', 'lecRoom');
            }else if($(this).index() == 3){
                sessionStorage.setItem("noticeHeader", "examNotice");
                $("#noticeMenu li:eq(3)").addClass('active');
                // fn_search('new');
                goPage('notice', 'list');
            }else if($(this).index() == 4){
                sessionStorage.setItem("noticeHeader", "examGuide");
                $("#noticeMenu li:eq(4)").addClass('active');
                goPage('notice', 'examGuide');
            }else if($(this).index() == 5){
                sessionStorage.setItem("noticeHeader", "onlineStore");
                $("#noticeMenu li:eq(5)").addClass('active');
                // fn_search('new');
                goPage('notice', 'list');
            }
        });
    });
</script>
<div class="tabBox">
    <ul id="noticeMenu">
        <li><a href="javascript:void(0);" >개강안내</a></li>
        <li><a href="javascript:void(0);" >학원소식</a></li>
        <li><a href="javascript:void(0);" >강의실배정표</a></li>
        <li><a href="javascript:void(0);" >시험공고</a></li>
        <li><a href="javascript:void(0);" >수험가이드</a></li>
        <li><a href="javascript:void(0);" >온라인서점안내</a></li>
    </ul>
</div>
<br />