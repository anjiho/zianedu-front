<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        // var ctgKey = getFreeLectureCtgKey();
        // var typeResult
        var ctgKey = getFreeLectureCtgKey();
        getFreeVideoLectureStepList(ctgKey);//이론 유형 가져오기
    });

    //학원별 이론 상품 가져오기
    function getFreeVideoListForm(ctgKey) {
        var ctgKey = getFreeLectureCtgKey();
        alert(ctgKey);
    }
</script>
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
                <div class="free">
                    <div class="tab_topContent tabContent">
                        <ul class="tabBox tBox2">
                            <li class="active"><a href="javascript:void(0);">이론</a></li>
                            <li><a href="javascript:goPage('freeLecture', 'examQuestion')">기출풀이</a></li>
                        </ul>
                        <!-- 이론 -->
                        <div class="tabPage">
                            <!-- 검색결과 나열 -->
                            <div class="tab_topContent tabContent">
                                <div class="search_result">
                                    <p>총 <span>67개</span>의 무료강좌가 있습니다</p>
                                </div>

                                <ul class="tabBar freetab" id="typeList">
<%--                                    <li class="active rgreen"><a href="#">이론</a></li>--%>
<%--                                    <li class="rsky"><a href="#" >단과특강</a></li>--%>
<%--                                    <li class="rblue"><a href="#">아침특강</a></li>--%>
<%--                                    <li class="rblue"><a href="#" >필기대비</a></li>--%>
                                </ul>
                                <br><br>
                                <!-- 이론 -->
                                <div class="tabPage active">
                                    <div class="myarea_list_wrap">
                                        <ul class="list">
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm01.png" /></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">국어</span>
                                                            <span class="rsky">단어특강</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 안효선 한달로 <br> 끝나는 국어 기초특강 1부</a>
                                                        <span>안효선 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <img class="myarea_poster" src="../images/content/fm02.png" />
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">영어</span>
                                                            <span class="rgreen">이론</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 얼리버드 조재권 <br>실전에 통하는 기초영어 특강 끝</a>
                                                        <span>조재권 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm03.png" /></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">행정법</span>
                                                            <span class="rsky">단과특강</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 행정직 대비 장다훈 지안행정법 <br>최신 3개월 판례 무료특강</a>
                                                        <span>정다훈 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="list pt80">
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm01.png" /></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">국어</span>
                                                            <span class="rsky">단어특강</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 안효선 한달로 <br> 끝나는 국어 기초특강 1부</a>
                                                        <span>안효선 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <img class="myarea_poster" src="../images/content/fm02.png" />
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">영어</span>
                                                            <span class="rgreen">이론</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 얼리버드 조재권 <br>실전에 통하는 기초영어 특강 끝</a>
                                                        <span>조재권 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm03.png" /></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">행정법</span>
                                                            <span class="rsky">단과특강</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 행정직 대비 장다훈 지안행정법 <br>최신 3개월 판례 무료특강</a>
                                                        <span>정다훈 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="list pt80">
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm01.png" /></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">국어</span>
                                                            <span class="rsky">단어특강</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 안효선 한달로 <br> 끝나는 국어 기초특강 1부</a>
                                                        <span>안효선 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <img class="myarea_poster" src="../images/content/fm02.png" />
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">영어</span>
                                                            <span class="rgreen">이론</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 얼리버드 조재권 <br>실전에 통하는 기초영어 특강 끝</a>
                                                        <span>조재권 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm03.png" /></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">행정법</span>
                                                            <span class="rsky">단과특강</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 행정직 대비 장다훈 지안행정법 <br>최신 3개월 판례 무료특강</a>
                                                        <span>정다훈 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <!-- paging -->
                                    </div>
                                </div>
                                <!-- 단과특강 -->
                                <div class="tabPage">단과특강</div>
                                <!-- 아침특강 -->
                                <div class="tabPage">아침특강</div>
                                <!-- 필기대비 -->
                                <div class="tabPage">필기대비</div>
                            </div>
                            <!-- //검색결과 나열 -->
                        </div>
                        <!--//이론 -->
                    </div>
                </div>
                <!--//서브 컨텐츠-->
            </div>
        </div>


        <!--//본문-->
        <!--하단-->
        <%@include file="/common/jsp/footer.jsp" %>
        <!--//하단-->
        <!--우측따라다니는영역-->
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <!--//우측따라다니는영역-->
        <!--하단고정식배너-->
        <%@include file="/common/jsp/footerBanner.jsp" %>
        <!--//하단고정식배너-->
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>
