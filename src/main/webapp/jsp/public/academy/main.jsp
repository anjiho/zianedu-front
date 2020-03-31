<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        sessionStorage.setItem("leftMenu", "publicAcademy");
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--본문-->
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <div id="container">
            <div class="inner">
                <div id="mainVisual">
                    <div class="left">
                        <ul id="mainVisualSlider1"></ul>
                    </div>
                    <div class="right">
                        <ul id="mainVisualSlider2"></ul>
                    </div>
                    <div class="mainBannerReview disnonepc">
                        <div class="inner">
                            <a href="#"><img src="/common/zian/images/content/img_mainVisual0320_02.jpg" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="mainBannerReview disnone">
                    <div class="inner">
                        <a href="#"><img src="/common/zian/images/content/img_banner0102.jpg" alt=""></a>
                    </div>
                </div>
                <!-- 지안에듀 합격자 영상 -->
                <div class="mainBanner">
                    <div class="inner">
                        <div class="titleBar">
                            <h5>지안에듀 합격자 영상</h5>
                            <a href="javascript:goPageNoSubmit('review','videoList');" class="btn_more">전체보기</a>
                        </div>
                        <div class="divGroup cols2">
                            <div>
                                <%--                            <a href="#"><img src="" id="movieBanner0" alt=""></a>--%>
                                <iframe width="500" height="280" src="https://www.youtube.com/embed/aeBl2GEuMdA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <div>
                                <%--                            <a href="#"><img src="" id="movieBanner1" alt=""></a>--%>
                                <iframe width="500" height="280" src="https://www.youtube.com/embed/q6Cu1LWNHmc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 지안에듀 합격자 STORY -->
                <div class="mainStory">
                    <div class="inner">
                        <div class="titleBar">
                            <h5>지안에듀 합격자 STORY</h5>
                            <a href="javascript:goPageNoSubmit('review','passList');" class="btn_more">전체보기</a>
                        </div>
                        <div class="mainStoryList">
                            <div class="item"><div>
                                <span class="name">안성진</span>
                                <b>2018 지방직 합격</b>
                                <span class="star count4">별점</span>
                                <span class="desc">
								공대를 재학하며 뒤늦게 공무원 시험에 뛰어들었기 때문에 지안공무원학원 기출문제교재 먼저구입하고 무작정시작했습니다. 기출문제를 거의 다 외웠습니다. 기본이론강의, 기출문제풀이, 빅모의고사
							</span>
                                <span class="btnArea">
								<a href="#">9급 지방직</a>
								<a href="#">365 지안패스</a>
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">김기한</span>
                                <b>2018 국가직 합격</b>
                                <span class="star count5">별점</span>
                                <span class="desc">
								전년도에 비해 국어와 한국사가 어려워져서 걱정했지만 빠르고 짧게 필요한 것만 알려주시고 불필요한 내용은 과감히 지워주셨습니다. 기출문제가 매우 중요하여 인강으로 들으면서 시간.…
							</span>
                                <span class="btnArea">
								<a href="#">9급 국가직</a>
								<a href="#">공통과목이론</a>
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">신예은</span>
                                <b>2018 임업직 합격</b>
                                <span class="star count5">별점</span>
                                <span class="desc">
								항상 합격수기를 보면서 나도 빨리 합격하고 싶은 생각을 하였습니다. 정말 기쁩니다. 자격증없이 시작했기 때문에 먼저 자격증을 땄습니다. 기출문제를 풀고 주간 빅모의고사를 통해 약점을 보완하 …
							</span>
                                <span class="btnArea">
								<a href="#">9급 임업직</a>
								<a href="#">빅모의고사</a>
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">안성진</span>
                                <b>2018 지방직 합격</b>
                                <span class="star count4">별점</span>
                                <span class="desc">
								공대를 재학하며 뒤늦게 공무원 시험에 뛰어들었기 때문에 지안공무원학원 기출문제교재 먼저구입하고 무작정시작했습니다. 기출문제를 거의 다 외웠습니다. 기본이론강의, 기출문제풀이, 빅모의고사
							</span>
                                <span class="btnArea">
								<a href="#">9급 지방직</a>
								<a href="#">365 지안패스</a>
							</span>
                            </div></div>
                        </div>
                    </div>
                </div>

                <!-- 지안에듀 교수진 -->
                <div class="mainTeacher">
                    <h2>지안에듀 교수진</h2>
                    <div class="swiper-container">
                        <div class="swiper-wrapper" id="teacherList">
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <!-- //지안에듀 교수진 -->


                <!-- 지안에듀 바로가기 -->
                <div class="mainQuickLink">
                    <ul>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','consult');"><img src="/common/zian/images/common/icon_quickLink1.png" alt=""> 1:1 학습컨설팅</a></li>
                        <li><a href="javascript:goPageNoSubmit('lectureOrder', 'academy')"><img src="/common/zian/images/common/icon_quickLink2.png" alt=""> 학원실강접수</a></li>
                        <li ><a href="javascript:goOpenMenu();"><img src="/common/zian/images/common/icon_quickLink3.png" alt=""> 학원개강안내</a></li>
                        <li><a href="javascript:goLecRoom();"><img src="/common/zian/images/common/icon_quickLink4.png" alt=""> 강의실배정표</a></li>
                        <li><a href="javascript:goPageNoSubmit('bigExam','examApply');"><img src="/common/zian/images/common/icon_quickLink5.png" alt=""> 모의고사신청</a></li>
                    </ul>
                </div>

                <div class="divGroup cols2">
                    <input type="hidden" id="bbsKey" name="bbsKey">
                    <div>
                        <div class="mainBoard tabContent">
                            <ul class="tabBar">
                                <li class="active"><a href="#">행정직 시험공고</a></li>
                                <li><a href="#">개강안내</a></li>
                            </ul>
                            <div class="tabPage active">
                                <ul id="examNotice"></ul>
                                <a href="javascript:goExamNotice();" class="btn_more">전체보기</a>
                            </div>
                            <div class="tabPage">
                                <ul id="openInfo"></ul>
                                <a href="javascript:goOpenMenu();" class="btn_more">전체보기</a>
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
                                <a href="javascript:goPageNoSubmit('review','lectureList');" class="btn_more">전체보기</a>
                            </div>
                            <div class="tabPage">
                                <ul id="passInfo"></ul>
                                <a href="javascript:goPageNoSubmit('review','passList');" class="btn_more">전체보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 지안에듀 배너 -->
                <div class="mainBanner">
                    <div class="inner">
                        <a href="javascript:goPageNoSubmit('bigExam','examApply');"><img src="/common/zian/images/content/img_banner0001.jpg" alt=""></a>
                    </div>
                </div>

                <div class="mainProduct">
                    <div class="titleBar">
                        <h5>행정직 온라인 서점</h5>
                    </div>
                    <div class="mainProductList">
                        <ul class="product1" id="productList1"></ul>
                    </div>
                </div>
                <!-- 지안에듀 고객센터 -->
                <div class="divGroup">
                    <div class="mainCustomer w45p">
                        <div>
                            <div class="titleBar">
                                <h5>고객센터</h5>
                            </div>
                            <ul>
                                <li>
                                    <span class="title">대표전화</span>
                                    <b class="phone">02-816-1724</b>
                                </li>
                                <li>
                                    <span class="title">2관학원</span>
                                    <b>070-4870-0634</b>
                                    <span class="desc">
									1번 학원동영상 상담 및 결재문의<br />
									2번 도서재고 및 배송문의<br />
									3번 동영상 결재 및 환불문의
								</span>
                                    <span class="desc">
									운영시간 09:00~18:00 (주말,공휴일 제외)<br />
									점심시간 12:00~13:00
								</span>
                                </li>
                            </ul>
                            <a href="javascript:goPageNoSubmit('customerCenter','consult');" class="btn_apply">1:1문의</a>
                        </div>
                    </div>
                    <div class="mainInfo w55p">
                        <ul>
                            <li><a href="javascript:goExamNotice();" class="item1">시험공공</a></li>
                            <li><a href="javascript:goOpenMenu();" class="item2">개강안내</a></li>
                            <li><a href="javascript:goMyPage();" class="item3">교재배송</a></li>
                            <li><a href="javascript:goPageNoSubmit('customerCenter','mobile');" class="item4">모바일 문의</a></li>
                            <li><a href="javascript:goPageNoSubmit('customerCenter','oftenList');" class="item5">자주하는 질문</a></li>
                            <li><a href="javascript:goPageNoSubmit('customerCenter','saveQuestion');" class="item6">1:1 고객상담</a></li>
                        </ul>
                    </div>
                </div>
                <!--고객센터//-->
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
<script>
$( document ).ready(function() {
    activeHeaderBtn("publicHeaderLi_2");
    getMainBigBanner("mainVisualSlider1", 786, 5);//메인 대 배너
    getMainMiniBanner("mainVisualSlider2", 787, 5);//대배너 옆 미니 배너
    var teacherMenuCtgKey = getTeacherListCtgKey();
    getTeacherPageList("teacherPage1", 788, 0, teacherMenuCtgKey);//공통과목 교수진 페이지 리스트
    //getTeacherBannerList("teacherList1", 788, 0, teacherMenuCtgKey);//공통과목 교수진 리스트
    getMajorTeacherPageList("teacherPage2", 788, 1, teacherMenuCtgKey);//전공과목 교수진 페이지 리스트
    //getMajorTeacherBannerList("teacherList2", 788, 1, teacherMenuCtgKey );//전공과목 교수진 리스트
    getBannerNoticeList2("examNotice", 1, 4, 10010);//행정직 시험공고 리스트
    getBannerNoticeList2("openInfo", 1, 4, 10001);//행정직 개강안내 리스트
    getBannerNoticeList("lecInfo", 1, 4, 10014);//행정직 수강후기 리스트
    getBannerNoticeList("passInfo", 1, 4, 10013);//행정직 합격후기 리스트
    getEventMiniBanner("", 6285, 5);//이벤트 배너
    getBookList("productList1", 843, 1, 10);//행정직 온라인 서점
    getCommunityList(10970, 1, 2);//합격자 영상
    getMainreviewBanner("reviewBanner", 789, 1);//중앙 소 배너
});

//행정직 수강후기 > 상세보기
function detailReview(bbsKey, tagId) {
    innerValue('bbsKey', bbsKey);
    if(tagId == 'lecInfo'){
        goPage('review','detailLecture');
    }else if(tagId == 'passInfo'){
        goPage('review','detailPass');
    }
}

//교수 상세페이지 이동
function goTeacherDetail(teacherKey, reqKey) {
    innerValue("teacherKey", teacherKey);
    innerValue("reqKey", reqKey);
    location.href = "/teacher?page_gbn=detail&teacherKey="+teacherKey+"&reqKey="+reqKey;
}

function goDetailBook(gkey) {
    goPage('bookStore', 'detail');
    location.href = "/bookStore?page_gbn=detail&bbsKey="+gkey;
}

function goPassReview() {
    var leftMenuInfo = sessionStorage.getItem('leftMenu');
    if(leftMenuInfo == 'bookStore') {
        sessionStorage.setItem("leftMenu", "publicOnline");
    }
    goPageNoSubmit('review', 'videoList');
}

</script>
