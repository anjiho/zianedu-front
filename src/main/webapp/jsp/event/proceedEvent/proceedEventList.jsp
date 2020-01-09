<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo.authority != 0){
            $("#writeBtn").hide();
        }
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="tabBox">
                    <ul>
                        <li class="active"><a href="javascript:goPageNoSubmit('event','proceedList');">진행중이벤트</a></li>
                        <li><a href="javascript:goPageNoSubmit('event','deadList');">마감된이벤트</a></li>
                        <li><a href="#">담청자발표</a></li>
                    </ul>
                </div>
                <br />
                <!--reviewBoard 진행중이벤트-->
                <div class="boardWrap eventBoard">
                    <div class="boardSearch">
                        <span class="ingevent">총 <span class="text_red">2개</span> 의 진행중인 이벤트가 있습니다.</span>
                        <select name="" class="w90">
                            <option value="">제목</option>
                        </select>
                        <input type="text" name="" value="" class="w240">
                        <a href="#" class="btn_inline on w140 disnoneM">검색</a>
                        <!--html 추가 및 수정-->
                        <div class="btnArea">
                            <a href="javascript:goPageNoSubmit('event','saveProceed')" class="btn_inline w140 write_ico" id="writeBtn">글쓰기</a>
                        </div>
                        <!--//html 추가 -->
                    </div>

                    <div class="colbox">
<%--                        <div class="col">--%>
<%--                            <div class="imgbox2">--%>
<%--                                <a href="javascript:"><img src="../images/content/img02.jpg"></a>--%>
<%--                            </div>--%>
<%--                            <div class="infobox">--%>
<%--                                <a href="javascript:" class="title">리뷰쓰고 포인트 받자!</a>--%>
<%--                                <span class="date">게시일 2019.06.10</span>--%>
<%--                                <ul class="info">--%>
<%--                                    <li><span class="btn_line">기간</span>2019.06.10 ~ 2019.08.30</li>--%>
<%--                                    <li class="pl30"><span class="btn_line">대상</span>온라인학원 수강자</li>--%>
<%--                                </ul>--%>
<%--                                <ul class="list">--%>
<%--                                    <li>리뷰쓰고 최대 1만 포인트까지 혜택을 받으세요</li>--%>
<%--                                    <li>8월까지 마감! 온라인학원 수강생분들 서두르세요~~</li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                    <!-- paging -->
                    <!-- //paging -->
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