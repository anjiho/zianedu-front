<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/content_o.css">
<%@include file="/common/jsp/common.jsp" %>

<script>
    $(document).ready(function () {
        fn_search('new');
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        getUserPointInfo(userKey);


        var tabMenuInfo = sessionStorage.getItem('tabHeader');
        if(tabMenuInfo != null){
            if(tabMenuInfo == "tabMenu1"){
                $("#tabHeader li:eq(0)").addClass('active');
            }else{
                $("#tabHeader li:eq(0)").removeClass('active');
                $("#tabHeader li:eq(1)").addClass('active');
            }
        }

        $("#tabHeader li").click(function() {
            if($(this).index() == 0){
                sessionStorage.setItem("tabHeader", "tabMenu1");
                goPageNoSubmit('myPage', 'coupon');
            }else{
                sessionStorage.setItem("tabHeader", "tabMenu2");
                goPageNoSubmit('myPage', 'mileage');
            }
        });
    });

    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        if(val == "new") sPage = "1";
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;
        getUserPointList(userKey, sPage, 5);
    }

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
                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage">
<%--                    <div class="tab_topContent tabContent">--%>
                        <div class="tabBox review coupon">
                            <ul id="tabHeader">
                                    <li><a href="javascript:void(0);">쿠폰<span></span></a></li>
                                    <li class="active"><a href="javascript:void(0);">마일리지<span></span></a></li>
                            </ul>
                        </div>
<%--                    </div>--%>

                    <!--마일리지-->
                    <div class="reviewBoard">
                        <div class="mileage">
                            <div class="left">
                                <ul>
                                    <li>총 적립된 마일리지 <span id="earnedPoint"></span></li>
<%--                                    <li>총 적립된 마일리지 <span><span id="earnedPoint"></span>점</span></li>--%>
                                    <li>사용된 마일리지 <span id="usedPoint"></span></li>
                                </ul>
                            </div>
                            <div class="right">
                                <ul>
                                    <li>사용가능 마일리지 <span id="usefulPoint"></span></li>
                                    <li>미사용 마일리지 <span id="expirePoint"></span></li>
                                </ul>
                            </div>
                        </div>

                        <div class="tbd_05">
                            <ul class="lectureTotal lectureTotaletc">
                                <li class="left"><a href="#modal1" class="btn_m bgray btn_modalOpen">쿠폰 마일리지 사용안내</a></li>
                                <li class="right"></li>
                            </ul>
                            <table class="coupontbw coupontbw2">
                                <thead>
                                <tr>
                                    <th style="text-align: center">발급일자</th>
                                    <th style="text-align: center">내역</th>
                                    <th style="text-align: center">획득</th>
                                    <th style="text-align: center">사용</th>
                                    <th style="text-align: center">남은마일리지</th>
                                </tr>
                                </thead>
                                <tbody id="dataList">
                                </tbody>
                            </table>
                        </div>
                        <!-- paging -->
                        <%@ include file="/common/inc/com_pageNavi.inc" %>
                        <!-- //paging -->
                    </div>
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
    <!-- modal1-->
    <div id="modal1" class="modalWrap">
        <div class="inner">
            <div class="modalTitle">
                <h2>쿠폰 마일리지 사용 안내사항</h2>
                <a href="#" class="btn_modalClose">모달팝업닫기</a>
            </div>
            <div class="modalContent">
                <div class="pop_cont">
                    <p class="stitle">꼭 확인해 주세요.</p>
                    <ul>
                        <li>- 마일리지 유효기간은 6개월 입니다.</li>
                        <li>- 유효기간이 지난 마일리지는 자동소멸됩니다.</li>
                        <li>- 마일리지 내역에서는 유효기간과 상관없이 내역 확인이 가능합니다.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--// modal1 —>
    </form>
    </body>
    </html>
