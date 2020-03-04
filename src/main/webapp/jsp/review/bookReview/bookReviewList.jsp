<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<%@ page import="com.zianedu.front.utils.Util" %>
<%
    String bookType = Util.isNullValue(request.getParameter("bookType"), "");
%>
<script>
    $( document ).ready(function() {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo == null) {
            $("#writeBtn").hide();
        }
        fn_search('new');
    });

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        var bookType = '<%=bookType%>';
        if(bookType == '') {
            var bbsMasterKey = getBookReviewMasterKey();
        }else{
            if(bookType == 'COMMON'){
                var bbsMasterKey = 10035;
            }else if(bookType == 'PUBLIC'){
                var bbsMasterKey =  10016;
            }else if(bookType == 'TECH'){
                var bbsMasterKey = 10035;
            }else if(bookType == 'POST'){
                var bbsMasterKey = 10050;
            }else if(bookType == 'CERT'){
                var bbsMasterKey = 10035;
            }
        }
        var reviewCnt =  getReviewBoardCount(bbsMasterKey);
        innerHTML('reviewCnt', reviewCnt);
        getReviewBoardList(bbsMasterKey, sPage, 10, searchType, searchText);
    }

    function detailReview(bbsKey) {
        innerValue('bbsKey', bbsKey);
        goPage('review','detailBook');
    }

</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="bbsKey" name="bbsKey">
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
                        <li><a href="javascript:goPageNoSubmit('review','videoList');">합격자영상</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','passList');">합격수기</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','lectureList');">수강후기</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('review','bookList');">도서후기</a></li>
                    </ul>
                </div>
                <br />
                <!--도서후기-->
                <div class="boardWrap reviewBoard">
                    <div class="review_txt">
                        <p>수강생분들의 도서후기를 알려주세요</p>
                        <span>총<b id="reviewCnt"></b>개의 도서후기가 있습니다. <br> 지안에듀 온라인서점에서 제공하는 교재후기를 확인하세요</span>
                    </div>
                    <!--review_point : 합격수기 포인트-->
                    <div class="review_point">
                        <p><span class="ico"></span>도서후기 마일리지 지급안내</p>
                        <ul>
                            <li>1. 작성 시 무조건 <b>100점</b> 지급 (월 1회까지만 지급되며, 매달 추가 작성 가능)</li>
                            <li>2. BEST 선정 시 무려 <b>1000점 </b>추가 지급!</li>
                            <li>월 5회 이상 작성 시 추가 <b>100점</b> 지급!</li>
                        </ul>
                    </div>
                    <!--//review_point : 합격수기 포인트-->

                    <!--review_movie_list :지안에듀 BEST 도서후기-->
                    <div class="review_movie_list">
                        <p>지안에듀 BEST 도서후기</p>
                        <!-- 지안에듀 BEST 도서후기 : index페이지 사용했떤 코드 그대로 사용함  -->
                        <div class="mainStory">
                            <div class="inner">
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
                                        <span class="name">이재권</span>
                                        <b>2018 토목직 합격</b>
                                        <span class="star count5">별점</span>
                                        <span class="desc">
											꿈꾸던 합격수기를 쓰게되어 더욱 새롭네요. 최종적인 단어로 요약하자면 ‘꾸준함 ! 실력보단 꾸준함이 중요하고 지안공무원에서 꾸준하게 공부할 수 있도록 도와주셔서 새로운 인생을 맞이하게 되었습니다. 화이팅 하세요
										</span>
                                        <span class="btnArea">
											<a href="#">9급 토목직</a>
											<a href="#">365 지안패스</a>
										</span>
                                    </div></div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="tabContent Bookreview">
                        <!-- 수강중 -->
                        <div class="tabPage  active">
                            <div class="boardSearch">
                                <ul class="searchArea">
                                    <li class="left">
                                        <select id="searchType" class="w90">
                                            <option value="">선택</option>
                                            <option value="title">제목</option>
                                            <option value="content">내용</option>
                                        </select>
                                        <!--html 추가 및 수정-->
                                        <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" class="w240">
                                        <input type="button" onclick="javascript:fn_search('new');" value="검색" class="btn_m on">
                                        <a href="javascript:fn_search('new');" class="search_ico">검색</a>
                                    </li>
                                    <li class="right">
<%--                                    <div class="btnArea">--%>
                                        <a href="javascript:goPage('review','saveBook');" class="btn_inline w140 write_ico" id="writeBtn">글쓰기</a>
<%--                                    </div>--%>
                                    </li>
                                    <!--//html 추가 -->
                                </ul>
                            </div>

                            <div class="tableWrap">
                                <table class="tBoard acceptanceList2">
                                    <caption></caption>
                                    <colgroup>
                                        <col class="w100">
                                        <col>
                                        <col class="w140">
                                        <col class="w140">
                                        <col class="w100">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center;">번호</th>
                                        <th scope="col" style="text-align: center;">제목</th>
                                        <th scope="col" style="text-align: center;">작성자</th>
                                        <th scope="col" style="text-align: center;">등록일</th>
                                        <th scope="col" style="text-align: center;">조회</th>
                                    </tr>
                                    </thead>
                                    <tbody id="dataList">
<%--                                    <tr>--%>
<%--                                        <td>1</td>--%>
<%--                                        <td>기술직</td>--%>
<%--                                        <td class="left"><a href="#">2019 국가직 합격후기</a></td>--%>
<%--                                        <td>지안에듀</td>--%>
<%--                                        <td>2019.08.09</td>--%>
<%--                                        <td>31</td>--%>
<%--                                    </tr>--%>
                                    </tbody>
                                </table>
                            </div>
                            <!-- paging -->
                            <%@ include file="/common/inc/com_pageNavi.inc" %>
                            <!-- //paging -->
                        </div>

<%--                        <div class="tabPage">공통과목</div>--%>
<%--                        <div class="tabPage">행정직군</div>--%>
<%--                        <div class="tabPage">기술직군</div>--%>
<%--                        <div class="tabPage">계리직군</div>--%>
<%--                        <div class="tabPage">자격증</div>--%>
                    </div>

                </div>
                <!--//reviewBoard -->
                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <%@include file="/common/jsp/footer.jsp" %>
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <%@include file="/common/jsp/footerBanner.jsp" %>
    </div>
    <div id="overlay"></div>
    <script>
        $(function(){
            var owl1 = $('.myarea_main .owl-carousel');

            owl1.owlCarousel({
                nav : true,
                items:4,
                stagePadding :0,
                margin:0,
                loop : true,
                dots:false,
                responsive:{
                    0:{items:2},
                    320:{items:2},
                    360:{items:2, stagePadding : 22, margin:0 },
                    507:{items:3, stagePadding : 0, margin:0 },
                    550:{items:3, stagePadding : 24, margin:0 },
                    654:{items:3, stagePadding : 50, margin:0},
                    700:{items:4, stagePadding : 0, margin:0},
                    768:{items:4, stagePadding : 24, margin:0},
                    769:{items:2, stagePadding : 0, margin:0},
                    850:{items:2, stagePadding : 0, margin:0},
                    900:{items:2, stagePadding : 32, margin:0},
                    950:{items:2, stagePadding : 64, margin:0},
                    1000:{items:3, stagePadding :0, margin:0},
                    1050:{items:3, stagePadding :32, margin:0},
                    1100:{items:3, stagePadding :64, margin:0},
                    1150:{items:3, stagePadding :75, margin:0},
                    1200:{items:4}
                }
            });

        });
    </script>
</form>
</body>
</html>
