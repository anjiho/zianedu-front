<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
            fn_search('new');
    });

    function fn_search(val) {
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";

        var bbsMasterKey = getReviewMasterKey();
        getPasserVideoListFromReview(bbsMasterKey, sPage, 8, searchType, searchText);
    }
    
    function detailReview(bbsKey) {
        innerValue('bbsKey', bbsKey);
        goPage('review','detailVideo');
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="sPage">
    <input type="hidden" id="sPage2">
    <input type="hidden" name='bbsKey' id="bbsKey">
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
                        <li class="active"><a href="javascript:goPageNoSubmit('review','videoList');">합격자영상</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','passList');">합격수기</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','lectureList');">수강후기</a></li>
                        <li><a href="javascript:goPageNoSubmit('review','bookList');">도서후기</a></li>
                    </ul>
                </div>
                <br/>
                <!--reviewBoard 합격자영상-->
                <div class="boardWrap reviewBoard">
                    <div class="review_txt">
                        <p>수강생분들의 합격을 축하드립니다.</p>
                        <span>총<b id="reviewCnt">5</b>개의 합격자 영상이 있습니다. <br> 지안에듀에서만 가능한 합격비법을 확인해 보세요</span>
                    </div>
                    <!--review_point : 합격수기 포인트-->
                    <div class="review_point">
                        <p><span class="ico"></span>합격수기 포인트 지급안내</p>
                        <ul>
                            <li>1. 작성 시 무조건 <b>200P</b> 지급 (월 1회까지만 지급되며, 매달 추가 작성 가능)</li>
                            <li>2. BEST 선정 시 무려 <b>1000P </b>추가 지급!</li>
                            <li>3. 매월 연속 작성 시 마다 추가 100P 지급 (단, 연속 6회까지는 추가 지급 )</li>
                        </ul>
                    </div>
                    <!--//review_point : 합격수기 포인트-->

                    <!--review_movie_list : 합격자영상-->
                    <div class="review_movie_list">
                        <p>BEST 합격자영상</p>

                        <!-- 컨텐츠 들어가는 자리 -->
                        <div class="myarea_main">
                            <div class="myarea_list_wrap">
                                <div class="inner">
                                    <ul class="owl-carousel">
                                        <li class="item">
                                            <div class="inner">
                                                <div class="thumb">
                                                    <img class="myarea_poster" src="/common/zian/images/ex/m02.png" />
                                                </div>
                                                <span class="desc">2020 국가직국가직 합격생 문재황님의</span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="inner">
                                                <div class="thumb">
                                                    <img class="myarea_poster" src="/common/zian//images/ex/m01.png" />
                                                </div>
                                                <span class="desc">2020 국가직국가직 합격생 문재황님의</span>
                                            </div>
                                        </li>
                                        <li class="item">
                                            <div class="inner">
                                                <div class="thumb">
                                                    <img class="myarea_poster" src="../images/ex/m02.png" />
                                                </div>
                                                <span class="desc">2020 국가직국가직 합격생 문재황님의</span>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- 컨텐츠 들어가는 자리 -->

                    </div>
                    <!--//review_movie_list : 합격자영상-->

                    <!--review_movie_search : 합격자영상 검색-->
                    <div class="review_movie_search">
                        <div class="boardSearch">
                            <select id="searchType" class="w90">
                            <option value="">선택</option>
                            <option value="title">제목</option>
                            </select>
                            <!--html 추가 및 수정-->
                            <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" class="w240">
                            <a href="javascript:fn_search('new');" class="btn_inline on w140 disnoneM">검색</a>
                            <div class="btnArea">
                                <a href="javascript:goPageNoSubmit('review','saveVideo');" class="btn_inline w140 write_ico">글쓰기</a>
                            </div>
                            <!--//html 추가 -->
                        </div>

                        <div class="list">
                            <ul id="dataList">
<%--                                <li>--%>
<%--                                    <img src="../images/content/m01.png" alt="">--%>
<%--                                    <span class="thumb">2020국가직 합격생 문재황님의 합격 영상</span>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <img src="../images/content/m02.png" alt="">--%>
<%--                                    <span class="thumb">2020국가직 합격생 문재황님의 합격 영상</span>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <img src="../images/content/m03.png" alt="">--%>
<%--                                    <span class="thumb">2020국가직 합격생 문재황님의 합격 영상</span>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <img src="../images/content/m04.png" alt="">--%>
<%--                                    <span class="thumb">2020국가직 합격생 문재황님의 합격 영상</span>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <img src="../images/content/m03.png" alt="">--%>
<%--                                    <span class="thumb">2020국가직 합격생 문재황님의 합격 영상</span>--%>
<%--                                </li>--%>
                            </ul>
                        </div>
                        <!-- paging -->
                        <%@ include file="/common/inc/com_pageNavi.inc" %>
                        <!-- //paging -->
                    </div>
                    <!--//review_movie_search : 합격자영상 검색-->
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
                    320:{items:2, stagePadding : 0, margin:10 },
                    375:{items:2, stagePadding : 0, margin:20 },
                    414:{items:3, stagePadding : 0, margin:20 },
                    550:{items:3, stagePadding : 0, margin:20 },
                    654:{items:3, stagePadding : 0, margin:20},
                    667:{items:3, stagePadding : 0, margin:20},
                    768:{items:3, stagePadding : 0, margin:20},
                    769:{items:3, stagePadding : 0, margin:20},
                    875:{items:4, stagePadding : 0, margin:20},
                    900:{items:4, stagePadding : 0, margin:20},
                    950:{items:4, stagePadding : 0, margin:20},
                    1000:{items:4, stagePadding :0, margin:20},
                    1050:{items:4, stagePadding :0, margin:20},
                    1100:{items:4, stagePadding :0, margin:20},
                    1150:{items:3, stagePadding :0, margin:20},
                    1200:{items:4}
                }
            });

        });
    </script>
</form>
</body>
</html>
