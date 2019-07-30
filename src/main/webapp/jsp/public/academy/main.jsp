<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <%@include file="/common/jsp/public/header.jsp" %>
        <!--본문-->
        <script>
            function init() {
                activeHeaderBtn("publicHeaderLi_2");
                activeLeftMenu("item1");
                getMainBigBanner("mainVisualSlider1", 5);//메인 대 배너
                getPublicOnlineMainMiniBanner("mainVisualSlider2", 787, 5);//대배너 옆 미니 배너
                getTeacherBannerList("teacherList1", 823, 0);//공통과목 교수진
                getMajorTeacherBannerList("teacherList2", 823, 1);//전공과목 교수진
                getBannerNoticeList("examNotice", 1, 4, 10010);//행정직 시험공고 리스트
                getBannerNoticeList("openInfo", 1, 4, 10001);//행정직 개강안내 리스트
                getBannerNoticeList("lecInfo", 1, 4, 10015);//행정직 수강후기 리스트
                getBannerNoticeList("passInfo", 1, 4, 10013);//행정직 합격후기 리스트
                getEventMiniBanner("", 6285, 5);//이벤트 배너
                getBookList("productList1", 843, 1, 10);//행정직 온라인 서점
            }
        </script>
        <div id="container">
            <div class="inner">
                <div id="mainVisual">
                    <div class="left">
                        <ul id="mainVisualSlider1"></ul>
                    </div>
                    <div class="right">
                        <ul id="mainVisualSlider2"></ul>
                    </div>
                </div>
                <div class="mainBannerReview">
                    <div class="inner">
                        <a href="#"><img src="/common/zian/images/content/img_banner0104.jpg" alt=""></a>
                    </div>
                </div>
                <div class="mainTaecher">
                    <div class="titleBar">
                        <h5>지안에듀 행정직 교수진</h5>
                        <a href="#" class="btn_more">전체보기</a>
                    </div>
                    <div class="divGroup cols2">
                        <div>
                            <h6>공통과목</h6>
                            <ul class="teacherList" id="teacherList1"></ul>
                        </div>
                        <div>
                            <h6>전공과목</h6>
                            <ul class="teacherList" id="teacherList2"></ul>
                        </div>
                    </div>
                </div>
                <div class="divGroup cols2">
                    <div>
                        <div class="mainBoard tabContent">
                            <ul class="tabBar">
                                <li class="active"><a href="#">행정직 시험공고</a></li>
                                <li><a href="#">개강안내</a></li>
                            </ul>
                            <div class="tabPage active">
                                <ul id="examNotice"></ul>
                                <a href="#" class="btn_more">전체보기</a>
                            </div>
                            <div class="tabPage">
                                <ul id="openInfo"></ul>
                                <a href="#" class="btn_more">전체보기</a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="mainBoard tabContent blue">
                            <ul class="tabBar">
                                <li class="active"><a href="#">행정직 수강후기</a></li>
                                <li><a href="#">행정직 합격수기</a></li>
                            </ul>
                            <div class="tabPage active">
                                <ul id="lecInfo"></ul>
                                <a href="#" class="btn_more">전체보기</a>
                            </div>
                            <div class="tabPage">
                                <ul id="passInfo"></ul>
                                <a href="#" class="btn_more">전체보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mainBanner divGroup cols2">
                    <div><a href="#"><img src="" id="eventBanner0" alt=""></a></div>
                    <div><a href="#"><img src="" id="eventBanner1" alt=""></a></div>
                </div>
                <div class="mainQuickLink">
                    <ul>
                        <li class="item1"><a href="#">1:1 학습컨설팅</a></li>
                        <li class="item2"><a href="#">학원실강접수</a></li>
                        <li class="item3"><a href="#">학원개강안내</a></li>
                        <li class="item4"><a href="#">강의실배정표</a></li>
                        <li class="item5"><a href="#">모의고사신청</a></li>
                    </ul>
                </div>
                <div class="divGroup cols2">
                    <div class="mainApply">
                        <div>
                            <p>
                                <b>초시생<br />맞춤컨설팅 & 상담</b>
                                공무원 준비가 처음이신가요?<br />
                                수험생 여러분이 궁금해 하는 공무원  시험에 관한 궁금증과 고민을 지안에듀 전문 컨설턴트가 해결 해 드립니다
                            </p>
                            <a href="#" class="btn_apply1">1:1컨설팅 <br />상담 예약</a>
                            <a href="#" class="btn_apply2">전화상담 <br />예약</a>
                        </div>
                    </div>
                    <div class="mainGuide">
                        <div>
                            <b>지안에듀<br />수험가이드</b>
                            <ul>
                                <li><a href="#">행정직</a></li>
                                <li><a href="#">계리직</a></li>
                                <li><a href="#">전산직</a></li>
                                <li><a href="#">토목직</a></li>
                                <li><a href="#">임업직</a></li>
                                <li><a href="#">농업직</a></li>
                                <li><a href="#">건축직</a></li>
                                <li><a href="#">환경직</a></li>
                                <li><a href="#">운전직</a></li>
                                <li><a href="#">통신직</a></li>
                                <li><a href="#">전기직</a></li>
                                <li><a href="#">군수직</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="mainShop">
                    <div class="titleBar">
                        <h5>행정직 온라인 서점</h5>
                    </div>
                    <ul class="productList" id="productList1"></ul>
                </div>
                <div class="mainCustomer full">
                    <h5>고객센터</h5>
                    <div class="divGroup cols3">
                        <div>
                            <ul>
                                <li>
                                    <span class="title">대표전화</span>
                                    <b class="phone">02-816-1724</b>
                                </li>
                                <li>
                                    <span class="title">2관학원</span>
                                    <b>070-4870-0634</b>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <p class="desc">
                                1번 학원동영상 상담 및 결재문의<br />
                                2번 도서재고 및 배송문의<br />
                                3번 동영상 결재 및 환불문의
                            </p>
                        </div>
                        <div>
                            <p class="desc">
                                운영시간 09:00~18:00 (주말,공휴일 제외)<br />
                                점심시간 12:00~13:00
                                <a href="#" class="btn_apply">1:1문의</a>
                            </p>
                        </div>
                    </div>
                </div>
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

