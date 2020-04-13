<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        sessionStorage.setItem("leftMenu", "techAcademy");
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
<div id="wrap" class="skill">
    <%@include file="/common/jsp/leftMenu.jsp" %>
    <!--상단-->
    <%@include file="/common/jsp/header.jsp" %>
    <!--//상단-->
    <!--본문-->
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
                        <a href="#"><img src="/common/zian/images/content/img_mainVisual0320_03.jpg" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="mainBannerReview disnone">
                <div class="inner">
                    <a href="#"><img src="/common/zian/images/content/img_banner0201.jpg" alt=""></a>
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
                            <iframe width="500" height="280" src="https://www.youtube.com/embed/aeBl2GEuMdA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        <div>
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
                            <span class="name">정영한</span>
                            <b>2019 지방직 건축직9급 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								김창훈 교수님 강의는 정말 추천드립니다. 예전에 기사공부하던 시절 이해하지 않고 무작정 공부했던 구조 내용들이 교수님 강의 듣고 하나하나 정리되어 가는게 너무나 신기했습니다. 즉 어렵기도 어렵고 필수적인 내용들을 아주 쉽게 설명해주십니다. 앞서 언급했듯 전 비전공자입니다. 또한 이번에 김창훈 교수님이 만드신 10개년 구조기출문제 또한 결정적이었습니다.
							</span>
                            <span class="btnArea">
								<a href="#">지방직 건축직9급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">김성규</span>
                            <b>2019 군무원 전산직7급 합격</b>
                            <span class="star count5">별점</span>
                            <span class="desc">
								조현준 교수님이 제공하는 기본이론, 심화이론, 문제풀이, 모의고사 전과정으로 진행했습니다. 정보보호론은 이론이 계속 바뀌는데 그런 바뀌는 부분들 까지도 놓치지 않고 교재에 잘 정리해주십니다. 조현준 교수님이 잘 가르쳐 주셔서 그런진 몰라도 학원내에 공무원이나 군무원 합격하신 분들은 모두 정보보호론은 평균적으로 90점 정도로 고득점 하셨습니다.
							</span>
                            <span class="btnArea">
								<a href="#">군무원 전산직7급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">이정민</span>
                            <b>2019 지방직 농업직9급 합격</b>
                            <span class="star count5">별점</span>
                            <span class="desc">
								지안에듀 김동이 교수님이 농업직에서 제일 유명하고 꼼꼼히 잘 가르쳐주신다고 해서 2018년, 2019년 모두 김동이 교수님 강의를 들었습니다. 국가직 시험에서 나왔던 부분은 지방직에서도 나올 확률이 크다고 해서 국가직에 나왔던 부분들은 김동이 교수님 해설지를 참고해서 더 완벽히 보고 가려고 했습니다. 이렇게 해서 재배학 100점을 받을 수 있었습니다. 김동이 교수님의 도움을 많이 받은 것 같습니다! 농업직 교수님 강추!!
							</span>
                            <span class="btnArea">
								<a href="#">지방직 농업직9급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">오승현</span>
                            <b>2019 지방직 방송통신직9급 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								 양윤석 교수님의 강의의 최대 장점은 압축성이라 생각합니다. 오답노트나 요약노트를 작성하는데도 반영되어 크게 도움되었습니다. 그래서 몰라도 되는 이론에 신경 쓰거나 스트레스를 받지 않도록 해주셔서 전공을 공부하는데 덜 부담이 되었습니다. 교재는 지안에듀 학원 교제로 진행하였고 챕터를 끝날 때마다 관련 문제은행이 있었습니다. 그 문제들을 1회독하면서 풀었고 또한 과년도 문제풀이에서 시간을 절약할 수 있는 노하우와 최신 경향 기술도 알려주셔서 처음 보는 이론도 당황하지 않고 풀이할 수 있었습니다
							</span>
                            <span class="btnArea">
								<a href="#">지방직 방송통신직9급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">임경민</span>
                            <b>2019 지방직 임업직9급 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								 임업직렬에는 김동이쌤의 수업이 필수로 들어야 하는거 같습니다. 제 지인 중 같이 시험을 봤는데 구지 강의 들을 필요가 뭐 있냐며 책만 사고 독학하다가 떨어졌습니다.  강의를 들으신 분들은 아시겠지만 중요한 부분을 계속 강조해 주시고 반복을 계속 해주셔서 강의 듣다보면 저절로 암기가 됩니다. 또한 출제유형을 분석을 해주셔서 이번에 출제빈도가 높다는 것을 찍어 주시기 때문에 믿고 따라만 간다면 고득점 하실 수 있습니다.
							</span>
                            <span class="btnArea">
								<a href="#">지방직 임업직9급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">조원기</span>
                            <b>2019 지방직 전산직9급 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								 컴퓨터일반은 박태순 선생님을 들었습니다. 1년차때 점수가 터무니없이 나와서 카페에서 정보를 알아보다가 합격생들이 박태순 선생님꺼를 많이 듣는다고 하더라고요. 일단 기본서가 두꺼운 만큼 정말 상세하게 풀이되어있습니다. 저는 비전공자임에도 불구하고 정말 이 기본서 하나로 고득점을 받을 수 있었습니다. 박태순 선생님의 가장 큰 장점이라면 비공개 문제까지도 전부 가지고 계시다는 겁니다. 또한 카페에 질문을 올리면 적어도 2일 이내에 바로 답변을 달아주셔서 정말 많은 도움이 되었습니다.
							</span>
                            <span class="btnArea">
								<a href="#">지방직 전산직9급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">신새봄</span>
                            <b>2019 지방직 방송통신직9급 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								비전공이였던 저는 인터넷 강의가 꼭 필요했습니다. 선생님의 얇은 기본서를 보면서 시험 때까지 이 한 권을 통째로 외우지 못하면 시험에 떨어진다는 생각으로 책을 통째로 외우려 노력했습니다. 선생님의 기본 이론편과 기출+모고 수업을 듣고 시험까지 남은 일수가 70일 정도였을 때쯤 책 10회독을 목표로 잡았습니다. 선생님의 강의가 개설되지 않았더라면 도전할 생각조차 못했을텐데 컴팩트한 교재와 다양한 보충자료를 제공해주셔서 공부하기 훨씬 수월했습니다.
							</span>
                            <span class="btnArea">
								<a href="#">지방직 방송통신직9급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">이성민</span>
                            <b>2019 지방직 토목직9급 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								갓갓 이학민 교수님! 비전공자로서 정말 막막하였고 강의를 2번씩 들어야 간신히 이해가 되었습니다. 하지만 강의를 들으면 이학민 교수님이 늘 이야기를 해주는 것이 있습니다. 인강으로 듣고 계신 분들처럼 모두 어렵고 모두가 힘들어 한다고 또 비전공자들도 정말 많고 1월에 가장 많이들 시작한다고 여러분도 가능하다고 좀만 힘내보자고 늘 한강의에 한번씩은 말씀해 주시는 것 같습니다. 그게 정말 큰 도움이 되었고 하기 싫고 포기하고 싶어도 자리에 앉아있는 힘이 되었습니다. 이학민 교수님께 정말 감사합니다
							</span>
                            <span class="btnArea">
								<a href="#">지방직 토목직9급</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">이경환</span>
                            <b>2019 지방직 화공직9급 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								이병관 교수님은 시험에 필요한 부분을 딱딱 정리해주셨으며 비전공자도 쉽게 따라올 수 있도록 자세히 설명해주셔서 공부하기에 편했습니다. 공무원 문제는 계산이나 내용이 쉽기 때문에 기사문제나 7급 문제도 적절히 섞으셔서 어려운 문제에 대비할 수 있도록 하였습니다. 비전공자 같은 경우 화공직에 대해 진입장벽이 높다고 겁먹고 도전 못하시는 분이 많다고 생각합니다. 하지만 이병관 교수님의 커리큘럼을 타면 무리없이 합격할 수 있다고 생각합니다.
							</span>
                            <span class="btnArea">
								<a href="#">지방직 화공직9급</a>
								<a href="#"></a>
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
                            <li class="active"><a href="#">기술직 시험공고</a></li>
                            <li><a href="#">개강안내</a></li>
                        </ul>
                        <div class="tabPage active">
                            <ul id="examNotice">
                            </ul>
                            <a href="javascript:goExamNotice();" class="btn_more">전체보기</a>
                        </div>
                        <div class="tabPage">
                            <ul id="openInfo">
                            </ul>
                            <a href="javascript:goOpenMenu();" class="btn_more">전체보기</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="mainBoard tabContent yellow">
                        <ul class="tabBar">
                            <li class="active"><a href="#">기술직 수강후기</a></li>
                            <li><a href="#">기술직 합격수기</a></li>
                        </ul>
                        <div class="tabPage active">
                            <ul id="lecInfo">
                            </ul>
                            <a href="javascript:goPageNoSubmit('review','lectureList');" class="btn_more">전체보기</a>
                        </div>
                        <div class="tabPage">
                            <ul id="passInfo">
                            </ul>
                            <a href="javascript:goPageNoSubmit('review','passList');" class="btn_more">전체보기</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 지안에듀 배너 -->
            <div class="mainBanner">
                <div class="inner">
                    <a href="javascript:goPageNoSubmit('bigExam','examApply');"><img src="/common/zian/images/content/img_banner0001.jpg"></a>
                </div>
            </div>
            <div class="mainProduct">
                <div class="titleBar">
                    <h5>기술직 온라인 서점</h5>
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
<script>
$( document ).ready(function() {
    activeHeaderBtn("publicHeaderLi_2");
    getMainBigBanner("mainVisualSlider1", 821, 5);//메인 대 배너
    getMainMiniBanner("mainVisualSlider2", 822, 5);//대배너 옆 미니 배너
    var teacherMenuCtgKey = getTeacherListCtgKey();
    getTeacherPageList("teacherPage1", 823, 0, teacherMenuCtgKey);//공통과목 교수진 페이지 리스트
    //getTeacherBannerList("teacherList1", 823, 0, teacherMenuCtgKey);//공통과목 교수진 리스트
    getMajorTeacherPageList("teacherPage2", 823, 1, teacherMenuCtgKey);//전공과목 교수진 페이지 리스트
    //getMajorTeacherBannerList("teacherList2", 823, 1, teacherMenuCtgKey);//전공과목 교수진 리스트
    getEventMiniBanner("", 6286, 5);//이벤트 배너
    getBannerNoticeList2("examNotice", 1, 4, 10030);//행정직 시험공고 리스트
    getBannerNoticeList2("openInfo", 1, 4, 10026);//행정직 개강안내 리스트
    getBannerNoticeList("lecInfo", 1, 4, 10033);//행정직 수강후기 리스트
    getBannerNoticeList("passInfo", 1, 4, 10032);//행정직 합격후기 리스트
    getBookList("productList1", 844, 1, 10);//행정직 온라인 서점
    getCommunityList(10970, 1, 2);//합격자 영상
    getMainreviewBanner("reviewBanner", 824, 1);//합격자영상
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
