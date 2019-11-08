<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        var calendarInfo = null;
        //달력 주입 시작
        $('#calendar').fullCalendar({
            viewRender: function(view, element) {
            var thisMonth = moment( $('#calendar').fullCalendar('getDate') ).format('YYYY-MM');
            alert(thisMonth);
        },
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
                var dayOfWeek = moment(startDate).format('dddd'); //요일
                getLectureRoom(dt_start);
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
            events:calendarInfo
        });
        //달력 주입 끝
    });

    //강의실 배정표 불러오기
    function getLectureRoom(yyyymmdd) {
        var getRoomList = getLectureRoomTableList(yyyymmdd);
        if(getRoomList.result.length > 0){
            var selList = getRoomList.result;
            for (var i = 0; i<selList.length; i++){
                if(selList[i].academyNumber == 1){
                    $("#oneRoom").attr("src", selList[i].fileName);
                    $(".todayDate").html(selList[i].lectureDate);
                }else if(selList[i].academyNumber == 2){
                    $("#twoRoom").attr("src", selList[i].fileName);
                    $(".todayDate").html(selList[i].lectureDate);
                }
            }
        }
        else{
            $(".todayDate").html(yyyymmdd);
            $("#oneRoom").attr("src", "");
            $("#twoRoom").attr("src", "");

        }
    }

    function readURL(input) {
        if (input.files && input.files[0]) {
            alert(2);
            var reader = new FileReader();
            reader.onload = function(e) {
                alert(e.target.result);
                $('#oneRoom').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(document).on('change', '#attachFile', function() {
        alert(1);
        readURL(this);
    });
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
                <div class="calendarWrap">
                    <p>날짜를 선택하시면 강의실배정표를 확인하실 수 있습니다.</p>
                    <div class="calendarBox">
                        <div id="calendar"></div>
                    </div>
                    <div id="tableBox">
                        <table>
                            <tr>
                                <th scope="row">[1관] <span class="todayDate"></span> 강의실배정표 입니다.</th>
                                <td class="">
                                    <input type="file" id="attachFile" class="fileBtn noline nobg">
                                </td>
                            </tr>
                            <tr>
                                <td class="oneRoom"><img src="" id="oneRoom" style="width:100%;height: 50%;"></td>
                            <tr>
                            <tr>
                                <th scope="row">[2관] <span class="todayDate"></span> 강의실배정표 입니다.</th>
                                <td class="">
                                    <input type="file" id="attachFile1" class="fileBtn noline nobg">
                                </td>
                            </tr>
                            <tr>
                                <td class="twoRoom"><img src="" id="twoRoom" style="width:100%;height: 50%;"></td>
                            <tr>
                        </table>
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
<script>
    // $(document).ready(function() {
    //     $('.fc-prev-button').click(function(){
    //
    //     });
    //
    //     $('.fc-next-button').click(function(){
    //         alert('nextis clicked, do something');
    //     });
    // });
</script>
