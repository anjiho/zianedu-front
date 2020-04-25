<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        sessionStorage.setItem("leftMenu", "postOnline");
        $(".slick-dots").hide();
    });
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="bbsKey" name="bbsKey">
<div id="wrap" class="accounting">
    <%@include file="/common/jsp/leftMenu.jsp" %>
    <!--상단-->
    <!--상단-->
    <%@include file="/common/jsp/header.jsp" %>
    <!--//상단-->
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
                        <a href="#"><img src="/common/zian/images/content/img_mainVisual0320_05.jpg" alt=""></a>
                    </div>
                </div>
            </div>
                <div class="mainBannerReview disnone">
                    <div class="inner">
                        <a href="#"><img src="/common/zian/images/content/img_banner0301.jpg" alt=""></a>
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
                            <span class="name">김미진</span>
                            <b>2019 계리직 경인청 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								처음 1년은 지안학원 실강을 들으면서 커리큘럼에 따라 이론 강의를 반복해 들으면서 이해도를 조금씩 높여가고, 특히 기출문제는 끊임없이 반복해서 풀면서 수준을 올리고 감을 유지하려고 노력했습니다. 2년째에는 스스로 어느 정도 이론은 깨우쳤다고 생각해서 인터넷강의로 노선을 바꾸어 요약정리노트 만들기와 기출문제 풀기를 꾸준히 반복했습니다. 특히 지안 계리직반 컴일을 담당하셨던 이성행 선생님께서 알려주신 문제 푸는 요령이나 암기비법이 많은 도움이 되었던 것 같습니다. 대부분 컴일초짜일 계리직 수험생의 눈높이에 맞춰주시는 부분이 가장 마음에 들었습니다.
							</span>
                            <span class="btnArea">
								<a href="#">9급 지방직</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">최윤정</span>
                            <b>2019 계리직 경북청 합격</b>
                            <span class="star count5">별점</span>
                            <span class="desc">
								박태순 샘 강의 기본으로 들었습니다. 강의 중간중간 계속 반복하고 큰그림 보여주는 강의를 하십니다. 기본 강의에 OX문제, 기본 문제있구요. 기출이나 1000제 하면서도 회독 효과 나게끔 해주시고  충분한 문제가 장점이에요. 이해가지 않는 부분이 있을 때 분 강의를  들을수 있다는 점이 좋았고 정보보호론도 들을수 있어서 좋았습니다. 정보보호론은 들을까 말까했는데 덕분에 한문제 맞았어요. 시작을 박태순샘으로해서 쭉 들었지만  이성행 샘 수업도  좋았고 카페에 질문올리면 이성행 샘이 세심한 답변 달아주셔서  좋았습니다.
							</span>
                            <span class="btnArea">
								<a href="#">9급 임업직</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">배현남</span>
                            <b>2019 계리직 경인청 합격</b>
                            <span class="star count5">별점</span>
                            <span class="desc">
								컴퓨터일반도 시험 전에 정리하기 위해 지안에듀에서 2019계리직 대비 컴퓨터일반 적중1000제 예상문제풀이반 수강. 수업 끝날 때마다 이성행 교수님께 질문해서 교수님한테 너무 죄송했습니다.(교수님 직장내 괴롭힘) 질문할 때마다 친절히 설명해 주신 이성행 교수님 감사드립니다.
							</span>
                            <span class="btnArea">
								<a href="#">9급 토목직</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">오세영</span>
                            <b>2019 계리직 경인청 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
								컴일 과목이 제일 취약하여 혼자 준비하기엔 조금 버거웠기 때문에
                                이성행쌤의 컴일과목만 따로 실강으로 신청(1000제 문제풀이, 모의고사)하여
                                일주일에 2번 정도만 학원 수업을 들었고,
                                한국사와 우금은 동영상 강의(타학원)를 신청하여 수업을 들었습니다.
                                저는 거의 오전에는 동영상강의를 듣고, 오후에는 오전에 들었던 강의를 모두 복습하면서
                                하루에 3과목 모두를 공부하려고 노력하였습니다.
							</span>
                            <span class="btnArea">
								<a href="#">계리직 경인청</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">강은영</span>
                            <b>2019 계리직 경인청 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
                                일단 합격할줄 몰라서, 합격자발표전까진 준비를 하지 않았습니다.
                                합격자발표소식에 부랴부랴 오프라인면접스터디를 찾아서 구성하였고,
                                오재우샘 면접특강을 듣기위해 주말마다 노량진에 올라가서 공부하였습니다.
                                공직관에 맞는 사람이라고 최면을 걸어가며, 답변을 준비할 수 있었습니다.
                                또한 김준호샘 면접스터디방에 들어가, 매일매일 사조서 작성연습을 하고 나누어주시는 예상질문에
                                예상질문에 대한 답변도 달아가며 지식을 쌓았습니다.
                                오재우샘께서 마지막에 모의면접해주신것이 많이 도움이되었고, 김준호샘께서 연습시켜주신 사조서 정말 좋았습니다!! 강추!!
							</span>
                            <span class="btnArea">
								<a href="#">계리직 경인청</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">손미혜</span>
                            <b>2019 계리직 제주청 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
                                저는 지안에듀 김준호한국사패스를 수강했습니다. 이번 수험기간은 4개월 정도입니다.
                                김준호 한국사패스는 기본강의, 심화강의, 암기특강, 요약강좌, 모의고사 모든 강의 모두 정말 큰 도움이 되었습니다. 기본 강의는 지루하지 않고 큰 흐름을 알려주셨고 심화강의에서는 조금 더 지엽적인 내용을 공부했습니다. 저는 기본강의를 2회독정도 했습니다. 요약강좌는 막판에 헷갈렸던 부분을 정리하고 복습하는데 정말 유용했습니다. 김준호쌤의 몹쓸암기법은 아주 몹씨 쓸만하고 혼자 복습할 때도 생각나서 웃기기도 했습니다. 열정적이고 즐거운 강의를 해주셔서 수강하면서 항상 좋았습니다. 수업이외에도 짧게 짧게 해주시는 응원의 말씀들이 큰 힘이 되었습니다. 감사합니다!
							</span>
                            <span class="btnArea">
								<a href="#">계리직 제주청</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">김현선</span>
                            <b>2019 계리직 전남청 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
                                김준호 선생님의 공부팁이 어? 이상한데라고 의심이 들 수 있지만 공부하는 법을 연구하시고 합격하셔서 공무원도 하셨던 분이라서 누구보다 공무원 국사의 최적화 되었다고 생각합니다 그래서 선생님 공부팁 익히고 믿고 따라가면 국사는 문제없다 생각합니다!
							</span>
                            <span class="btnArea">
								<a href="#">계리직 전남청</a>
								<a href="#"></a>
							</span>
                        </div></div>
                        <div class="item"><div>
                            <span class="name">염우성</span>
                            <b>2019 계리직 서울청 합격</b>
                            <span class="star count4">별점</span>
                            <span class="desc">
                                제가 오재우 강사님을 선택하게 된 이유는, 먼저 계리직 면접 시험의 특성을 면밀하게 조사하였기 때문입니다. 그러니까, 계리직 면접은 보통 1.3배수이고, 서울청의 경우 85명의 합격자 중 63명,
                                22명은 떨어지는 상황이었습니다. 그리고 공무원시험에서 면접은, 주관적이기 때문에, 그로 인한 잡음을 최대한 배제하기 위하여 형식적으로 면접이 이루어지고, 대부분 필기 점수 위주로 최종 합격, 불합격이 정해진다는 풍문을 들었습니다. (이것은 실제 위험한 오판이었습니다.)
							</span>
                            <span class="btnArea">
								<a href="#">계리직 서울청</a>
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
                    <li><a href="javascript:goPageNoSubmit('lectureOrder', 'single')"><img src="/common/zian/images/common/icon_quickLink2.png" alt=""> 학원실강접수</a></li>
                    <li ><a href="javascript:goOpenMenu();"><img src="/common/zian/images/common/icon_quickLink3.png" alt=""> 학원개강안내</a></li>
                    <li><a href="javascript:goLecRoom();"><img src="/common/zian/images/common/icon_quickLink4.png" alt=""> 강의실배정표</a></li>
                    <li><a href="javascript:goPageNoSubmit('bigExam','examApply');"><img src="/common/zian/images/common/icon_quickLink5.png" alt=""> 모의고사신청</a></li>
                </ul>
            </div>

            <div class="divGroup cols2">
                <div>
                    <div class="mainBoard tabContent">
                        <ul class="tabBar">
                            <li class="active"><a href="#">계리직 시험공고</a></li>
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
                    <div class="mainBoard tabContent red">
                        <ul class="tabBar">
                            <li class="active"><a href="#">계리직 수강후기</a></li>
                            <li><a href="#">계리직 합격수기</a></li>
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

            <!-- 지안에듀 배너 -->
            <div class="mainBanner">
                <div class="inner">
                    <a href="javascript:goPageNoSubmit('bigExam','examApply');"><img src="/common/zian/images/content/img_banner0001.jpg"></a>
                </div>
            </div>

            <div class="mainProduct">
                <div class="titleBar">
                    <h5>계리직 온라인 서점</h5>
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
									1번 학원동영상 상담 및 결제문의<br />
									2번 도서재고 및 배송문의<br />
									3번 동영상 결제 및 환불문의
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
                        <li><a href="javascript:goExamNotice();" class="item1">시험공고</a></li>
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
    activeHeaderBtn("publicHeaderLi_1");
    getMainBigBanner("mainVisualSlider1", 1084, 5);//메인 대 배너
    getMainMiniBanner("mainVisualSlider2", 1085, 5);//대배너 옆 미니 배너
    var teacherMenuCtgKey = getTeacherListCtgKey();
    getTeacherPageList("teacherPage1", 1086, 0, teacherMenuCtgKey);//공통과목 교수진 페이지 리스트
    //getTeacherBannerList("teacherList1", 1086, 0, teacherMenuCtgKey);//공통과목 교수진 리스트
    getMajorTeacherPageList("teacherPage2", 1086, 1, teacherMenuCtgKey);//전공과목 교수진 페이지 리스트
    //getMajorTeacherBannerList("teacherList2", 1086, 1, teacherMenuCtgKey);//전공과목 교수진 리스트
    getEventMiniBanner("", 6289, 5);//이벤트 배너
    getBannerNoticeList2("examNotice", 1, 4, 10010);//시험공고 리스트
    getBannerNoticeList2("openInfo", 1, 4, 10026);//개강안내 리스트
    getBannerNoticeList("lecInfo", 1, 4, 10049);//수강후기 리스트
    getBannerNoticeList("passInfo", 1, 4, 10048);//합격후기 리스트
    getBookList("productList1", 845, 1, 10);//온라인 서점
    getCommunityList(10970, 1, 2);//합격자 영상
    getMainreviewBanner("reviewBanner", 1087, 1);//중앙 소 배너
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
