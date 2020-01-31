<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $(document).ready(function () {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null) {
            $(".mainStoryList").each(function(){
                kiplayer.sliderSlick($(this));
            });
            $(".slick-dots").hide();
            fn_search('new');
        }else{
            alert("로그인이 필요합니다.");
            goLoginPage();
        }
    });

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";
        if(val == "new") sPage = "1";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        getMyWriteExamBoard2(sessionUserInfo.userKey, 'EXAM', sPage, 5, searchType, searchText);
    }
    
    function goDetailReview(bbsKey) {
        innerValue("bbsKey", bbsKey);
        goPage('bigExam','detailBigReview');
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
        <div id="container" class="big bigSub">
            <div class="inner">
                <!--서브 컨텐츠-->
                <div class="titleBar">
                    <h5>응시후기</h5>
                    <span>지안에듀 모의고사 완전 정복, 모의고사 응시후기를 작성해주세요!</span>
                </div>

                <div class="review_txt">
                    <p>수강생분들의 모의고사 응시후기를 알려주세요.</p>
                    <span>총<b>5</b>개의 합격자 영상이 있습니다. <br>지안에듀에서 실전 못지않은 모의고사 응시후기를 확인해보세요.</span>
                </div>
                <!--review_point : 응시후기 포인트-->
                <div class="review_point">
                    <p><span class="ico"></span>응시후기 포인트 지급안내</p>
                    <ul>
                        <li>1. 작성 시 무조건 <b>200P</b> 지급 (월 1회까지만 지급되며, 매달 추가 작성 가능)</li>
                        <li>2. BEST 선정 시 무려 <b>1000P </b>추가 지급!</li>
                    </ul>
                </div>

                <!-- 지안에듀 모의고사 BEST 응시후기 -->
                <div class="mainStory mainStorysub">
                    <div class="inner">
                        <div class="titleBar">
                            <h5>지안에듀 모의고사 BEST 응시후기</h5>
                        </div>
                        <br>
                        <div class="mainStoryList">
                            <div class="item"><div>
                                <span class="name">안성진<b>기술직</b></span>
                                <b>학원모의고사(온라인)</b>
                                <span class="desc">
								공대를 재학하며 뒤늦게 공무원 시험에 뛰어들었기 때문에 지안공무원학원 기출문제교재 먼저구입하고 무작정시작했습니다. 기출문제를 거의 다 외웠습니다. 기본이론강의, 기출문제풀이, 빅모의고사
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">김기한<b>전산직</b></span>
                                <b>기출문제</b>
                                <span class="desc">
								전년도에 비해 국어와 한국사가 어려워져서 걱정했지만 빠르고 짧게 필요한 것만 알려주시고 불필요한 내용은 과감히 지워주셨습니다. 기출문제가 매우 중요하여 인강으로 들으면서 시간.…
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">신예은<b>행정직</b></span>
                                <b>학원모의고사(온라인)</b>
                                <span class="desc">
								항상 합격수기를 보면서 나도 빨리 합격하고 싶은 생각을 하였습니다. 정말 기쁩니다. 자격증없이 시작했기 때문에 먼저 자격증을 땄습니다. 기출문제를 풀고 주간 빅모의고사를 통해 약점을 보완하 …
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">안성진<b>기술직</b></span>
                                <b>학원모의고사(온라인)</b>
                                <span class="desc">
								꿈꾸던 합격수기를 쓰게되어 더욱 새롭네요. 최종적인 단어로 요약하자면 ‘꾸준함 ! 실력보단 꾸준함이 중요하고 지안공무원에서 꾸준하게 공부할 수 있도록 도와주셔서 새로운 인생을 맞이하게 되었습니다. 화이팅 하세요
							</span>
                            </div></div>
                            <div class="item"><div>
                                <span class="name">김기한<b>전산직</b></span>
                                <b>기출문제</b>
                                <span class="desc">
								공대를 재학하며 뒤늦게 공무원 시험에 뛰어들었기 때문에 지안공무원학원 기출문제교재 먼저구입하고 무작정시작했습니다. 기출문제를 거의 다 외웠습니다. 기본이론강의, 기출문제풀이, 빅모의고사
							</span>
                            </div></div>
                        </div>
                    </div>
                </div>

                <div class="review_movie_search">
                    <div class="boardSearch">
                        <select id="searchType" class="w100">
                            <option value="title">제목</option>
                        </select>
                        <!--html 추가 및 수정-->
                        <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}">
                        <a href="javascript:fn_search('new');" class="btn_m on w140">검색</a>
                        <div class="btnArea">
                            <a href="javascript:goPageNoSubmit('bigExam','saveBigReview');" class="btn_inline w140 write_ico">글쓰기</a>
                        </div>
                        <!--//html 추가 -->
                    </div>
                    <div class="tableBox2">
                        <table class="disnoneM">
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
                                <th scope="col" style="text-align: center">번호</th>
                                <th scope="col" style="text-align: center">제목</th>
                                <th scope="col" style="text-align: center">작성자</th>
                                <th scope="col" style="text-align: center">등록일</th>
                                <th scope="col" style="text-align: center">조회</th>
                            </tr>
                            </thead>
                            <tbody id="dataList">
<%--                            <tr>--%>
<%--                                <td>5</td>--%>
<%--                                <td class="left"><a href="#">모의고사 사용후기입니다.</a></td>--%>
<%--                                <td>지안에듀</td>--%>
<%--                                <td>2019.08.09</td>--%>
<%--                                <td>31</td>--%>
<%--                            </tr>--%>
                            </tbody>
                        </table>
                    </div>
                    <!-- paging -->
                    <%@ include file="/common/inc/com_pageNavi.inc" %>
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
