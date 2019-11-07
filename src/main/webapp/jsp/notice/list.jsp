<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>

<script>
    $( document ).ready(function() {
        var leftMenuInfo = sessionStorage.getItem('noticeHeader');
        if(leftMenuInfo == null){
            $("#noticeMenu li:eq(0)").addClass('active');
            sessionStorage.setItem("noticeHeader", "openMenu");
        }
        fn_search('new');
        //달력 주입 시작
        $('#calendar').fullCalendar({
            lang:'ko',
            header: {
                left: 'prev,next,today',
                center: 'title',
                right: ''
            },
            selectable:true,
            //editable: true,
            defaultView: 'month',
            dayPopoverFormat: 'yyyy-MM-dd',
            select: function (startDate, endDate, jsEvent, view) {
                var dt_start = moment(startDate).format('YYYY-MM-DD');
                alert(dt_start)
                $(".fc-body").unbind('click');
                $(".fc-body").on('click', 'td', function (e) {
                    $("#contextMenu")
                        .addClass("contextOpened")
                        .css({
                            display: "block",
                            left: e.pageX,
                            top: e.pageY
                        });
                    return false;
                });
            },
            // put your options and callbacks here
            eventDrop: function(event, delta, revertFunc) {
                //alert(event.id);
                alert("강의달력은 변경할수 없습니다.");
                revertFunc();
                /*
                 if (!confirm("change??")) {
                 revertFunc();
                 }
                 */
            },
            eventRender: function (event, element, view) {
                return (event.ranges.filter(function (range) {
                    return (event.start.isBefore(range.end) &&
                        event.end.isAfter(range.start));
                }).length) > 0;
            },
           // events:calendarInfo
        });
        //달력 주입 끝
    });

    //상세보기
    function goDetailNotice(bbsKey) {
        innerValue("bbsKey", bbsKey);
        goPage("notice", "detail");
    }

    //검색
    function fn_search(val) {
        var sPage = getInputTextValue("sPage");
        var searchType = getSelectboxValue("searchType");
        var searchText = getInputTextValue("searchText");
        if(searchType == undefined) searchType = "";
        if(searchText == undefined) searchText = "";

        if(val == "new") sPage = "1";

        var bbsmasterKey = "";
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        var noticeHeaderInfo = sessionStorage.getItem('noticeHeader');//공지사항 메뉴 구분

        if(leftMenuInfo == "publicOnline" || leftMenuInfo == "publicAcademy"){//행정직 온라인, 행정직학원
            if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10001";//개강안내
            else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10007";//학원소식
            else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10010";//시험공고
            else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";//강의실배정표
            else bbsmasterKey = "10057";//온라인서점
        }else if(leftMenuInfo == "techOnline" || leftMenuInfo == "techAcademy"){//기술직 온라인. 기술직학원
            if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10026";
            else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10027";
            else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10030";
            else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
            else bbsmasterKey = "10057";
        }else if(leftMenuInfo == "postOnline" || leftMenuInfo == "postAcademy"){//계리직 온라인. 계리직 학원
            if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10041";
            else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10042";
            else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10044";
            else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";
            else bbsmasterKey = "10057";
        }else{
            if(noticeHeaderInfo == "openMenu")         bbsmasterKey = "10001";//개강안내
            else if(noticeHeaderInfo == "acaNotice")   bbsmasterKey = "10007";//학원소식
            else if(noticeHeaderInfo == "examNotice")  bbsmasterKey = "10010";//시험공고
            else if(noticeHeaderInfo == "lectureRoom") bbsmasterKey = "10008";//강의실배정표
            else bbsmasterKey = "10057";//온라인서점
        }
        getNoticeList(sPage, 10, bbsmasterKey, searchType, searchText);
    }
</script>
<style>
    /*달력 토,일 색변경*/
    .fc-sat { color: blue; }
    .fc-sun { color: red; }
</style>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <div id="header">
            <div class="inner">
                <h1><a href="#"><img src="/common/zian/images/common/logo.png" alt="지안에듀"></a></h1>
                <%@include file="/common/jsp/topHeader.jsp" %>
            </div>
            <!--주메뉴-->
            <div id="gnb">
                <div class="inner">
                    <ul class="cols7">
                        <li><a href="#">내강의실</a></li>
                        <li><a href="#">교수소개</a></li>
                        <li><a href="#">학원수강신청</a></li>
                        <li><a href="#">1:1 관리반</a></li>
                        <li><a href="#">무료강좌</a></li>
                        <li><a href="#">빅모의고사</a></li>
                        <li><a href="#">합격수기</a></li>
                    </ul>
                </div>
            </div>
            <!--//주메뉴-->
        </div>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->
                <%@include file="/common/jsp/noticeHeader.jsp" %>
                <div class="boardWrap">
                    <input type="hidden" id="bbsKey" name="bbsKey">
                    <input type="hidden" id="sPage">
                    <div class="boardSearch">
                        <select id="searchType" class="w90">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" id="searchText" onkeypress="if(event.keyCode==13) {fn_search('new'); return false;}" class="w240">
                        <a href="javascript:fn_search('new');" class="btn_inline on w140">검색</a>
                        <div class="btnArea">
                            <a href="javascript:goPage('notice','write')" class="btn_inline w140">글쓰기</a>
                        </div>
                    </div>
                    <div class="tableBox">
                        <table class="list">
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
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">등록일</th>
                                <th scope="col">조회</th>
                            </tr>
                            </thead>
                            <tbody id="dataList"></tbody>
                        </table>
                    </div>
                    <%@ include file="/common/inc/com_pageNavi.inc" %>
                </div>
                <div id="calendar"></div>
                <!--//서브 컨텐츠-->

                <div id="calendar"></div>
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

<%--<script src="/common/calendar/js/jquery3.min.js"></script>--%>
