<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_p.css">
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {

    });
</script>
<form id="id_frm_singleMypage" method="post" name="id_frm_singleMypage">
    <input type="hidden" id="gKeys" name="gKeys">
</form>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="tabBox tBox4">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','saveQuestion');">1:1문의</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','consult');">상담예약</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('customerCenter','mobile');">모바일문의</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','oftenList');">자주하는질문</a></li>
                    </ul>
                </div>
                <br/>
                <div class="customer">
                    <!-- 카카오톡 상담 이미지 -->
                    <div class="customer_inner">
                        <div class="imgd" style="width:800px;margin:auto;position:relative">
                            <img src="http://52.79.40.214/Upload/100/contents/0427_mb_kakao.jpg" alt="" style="border-radius:20px;">
<%--                            <a href="#" class="dragonboll" style="position: absolute;bottom:90px;left:50%;margin-left:-160px;width: 320px;height:44px;background: #000;color:white;line-height:40px;font-weight:800;text-align:center">상담하기</a>--%>
                        </div>
                    </div>
                    <!-- //카카오톡 상담 이미지 -->
                </div>
                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <%@include file="/common/jsp/footer.jsp" %>
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <%@include file="/common/jsp/footerBanner.jsp" %>
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>

