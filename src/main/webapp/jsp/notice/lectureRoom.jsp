<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {

        var calendarInfo = [
            {
                title: '강의실배정표',
                start: '2019-11-01'
            },
            {
                title: '강의실배정표',
                start: '2019-11-11'
            }
            // more events here
        ]
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
                var dayOfWeek = moment(startDate).format('dddd'); //요일
                $('#oneRoom').attr('src', '');
                $('#twoRoom').attr('src', '');
                $("#img_box img").remove();
                $("#img_box1 img").remove();
                getLectureRoom(dt_start, dayOfWeek);
                innerValue("yyyymmdd", dt_start);
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
    function getLectureRoom(yyyymmdd, day) {
        var getRoomList = getLectureRoomTableList(yyyymmdd);
        if(getRoomList.result.length > 0){
            var selList = getRoomList.result;
            for (var i = 0; i<selList.length; i++){
                if(selList[i].academyNumber == 1){
                    $('#img_box').prepend('<img id="oneRoom" src="'+ selList[i].fileName +'" style="width:100%;height:50%;"/>');
                    $(".todayDate").html(selList[i].lectureDate+""+day);
                }else if(selList[i].academyNumber == 2){
                    $('#img_box1').prepend('<img id="twoRoom" src="'+ selList[i].fileName +'" style="width:100%;height:50%;"/>');
                    $(".todayDate").html(selList[i].lectureDate+""+day);
                }
            }
        }
        else{
            $(".todayDate").html(yyyymmdd+""+day);
            $("#oneRoom").remove();
            $("#twoRoom").remove();
        }
    }

    function fileInfo(f, val){
        var file = f.files;
        var reader = new FileReader();
        reader.onload = function(rst){
            if(val == 1)  $('#img_box').html('<img src="' + rst.target.result + '">');
            else if(val == 2) $('#img_box1').html('<img src="' + rst.target.result + '">');
        };
        reader.readAsDataURL(file[0]);
    }

    //강의실 배정표 저장하기
    function saveLecRoom(academyNumber) {
        var data = new FormData();
        if(academyNumber == 1){ //1관 저장시
            var filechk = $("#attachFile").val();
            if(filechk == "") {
                alert("1관 배정표 등록된 파일이 없습니다.");
                return false;
            }else{
                $.each($('#attachFile')[0].files, function(i, file) {
                    data.append('file', file);
                });
            }
        }else{ //2관 저장시
            var filechk = $("#attachFile1").val();
            if(filechk == "") {
                alert("2관 배정표 등록된 파일이 없습니다.");
                return false;
            }else{
                $.each($('#attachFile1')[0].files, function(i, file) {
                    data.append('file', file);
                });
            }
        }

        $.ajax({
            url: "http://52.79.40.214:9090/fileUpload/boardFile",
            method: "post",
            dataType: "JSON",
            data: data,
            cache: false,
            processData: false,
            contentType: false,
            success: function (data) {
                if(data.resultCode == 200){
                    var lectureDate = getInputTextValue("yyyymmdd");
                    var fileName = data.keyValue;
                    var result = saveLectureRoomTabel(academyNumber, lectureDate, fileName);
                    if(result.resultCode == 200){
                        alert("성공적으로 등록 완료되었습니다");
                    }
                }
            }
        });
    }
</script>
<style>
    /*달력 토,일 색변경*/
    .fc-sat { color: blue; }
    .fc-sun { color: red; }
</style>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="yyyymmdd" value="">
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
                    <div class="">
                        <div id="calendar"></div>
                    </div>
                    <div id="tableBox">
                        <table>
                            <tr>
                                <th scope="row">[1관] <span class="todayDate"></span> 강의실배정표 입니다.</th>
                                <td class="">
                                    <input type="file" id="attachFile" class="fileBtn noline nobg" onchange="fileInfo(this, 1)">
                                    <input type="button" value="등록" onclick="saveLecRoom(1);">
                                </td>
                            </tr>
                            <tr>
                                <td><div id="img_box"></div><td>
                            <tr>
                            <tr>
                                <th scope="row">[2관] <span class="todayDate"></span> 강의실배정표 입니다.</th>
                                <td class="">
                                    <input type="file" id="attachFile1" class="fileBtn noline nobg" onchange="fileInfo(this, 2)">
                                    <input type="button" value="등록" onclick="saveLecRoom(2);">
                                </td>
                            </tr>
                            <tr>
                                <td><div id="img_box1"></div><td>
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
