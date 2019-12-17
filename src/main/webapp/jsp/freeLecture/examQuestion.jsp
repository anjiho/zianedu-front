<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {

    });
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
                            <li><a href="javascript:goPage('freeLecture', 'theory')">이론</a></li>
                            <li class="active"><a href="javascript:void(0);">기출풀이</a></li>
                        </ul>
                        <!--기출풀이 -->
                        <div class="tabPage">
                            <div class="tab_topContent tabContent">
                                <div class="search_result">
                                    <p>총 <span>67개</span>의 무료강좌가 있습니다</p>
                                </div>
                                <div class="ftype">
                                    <ul>
                                        <li><a href="" class="text_blue">신규등록순</a></li>
                                        <li class="bar">ㅣ</li>
                                        <li><a href="">인기순</a></li>
                                    </ul>
                                </div>
                                <ul class="tabBar freetab" style="padding: 35px 79px;">
                                    <li class="active rpurple"><a href="#">기출문제</a></li>
                                    <li class="rorange"><a href="#" >문제풀이</a></li>
                                    <li class="rblue"><a href="#">모의고사</a></li>
                                </ul>
                                <br><br>
                                <!-- 기출문제 -->
                                <div class="tabPaggetLeftMenuCtgKeye active">
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
                                                            <span class="rorange">문제풀이</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 안효선 한달로<br>끝나는 국어 기초특강 1부</a>
                                                        <span>안효선 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm02.png"/></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">영어</span>
                                                            <span class="rorange">문제풀이</span>
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
                                                            <span class="rpurple">기출문제</span>
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
                                                            <span class="rorange">문제풀이</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 안효선 한달로<br>끝나는 국어 기초특강 1부</a>
                                                        <span>안효선 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm02.png"/></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">영어</span>
                                                            <span class="rorange">문제풀이</span>
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
                                                            <span class="rpurple">기출문제</span>
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
                                                            <span class="rorange">문제풀이</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 시험대비 안효선 한달로<br>끝나는 국어 기초특강 1부</a>
                                                        <span>안효선 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="inner">
                                                    <div class="thumb">
                                                        <a href="javascript:"><img class="myarea_poster" src="../images/content/fm02.png"/></a>
                                                    </div>
                                                    <div class="desc">
                                                        <div>
                                                            <span class="rblack">영어</span>
                                                            <span class="rorange">문제풀이</span>
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
                                                            <span class="rpurple">기출문제</span>
                                                            <span class="allnum">총15강</span>
                                                        </div>
                                                        <a href="javascript:" class="tit">2020 행정직 대비 장다훈 지안행정법 <br>최신 3개월 판례 무료특강</a>
                                                        <span>정다훈 교수님</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <!-- paging -->
                                        <div class="paging pt80">
                                            <div class="boardnavi">
                                                <a class="prev" href="#">이전 목록이동</a>
                                                <span>
												<strong class="selected">1</strong>
												<a href="#">2</a>
												<a href="#">3</a>
											</span>
                                                <a class="next" href="#">다음 목록이동</a>
                                            </div>
                                        </div>
                                        <!-- //paging -->
                                    </div>
                                </div>
                                <!-- 문제풀이 -->
                                <div class="tabPage">문제풀이</div>
                                <!-- 모의고사 -->
                                <div class="tabPage">모의고사</div>
                            </div>
                            <!-- //검색결과 나열 -->
                        </div>
                        <!--//기출풀이 -->

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
