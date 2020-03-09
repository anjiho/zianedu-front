<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script>
    $( document ).ready(function() {
        //팝업 이미지 업로드
        var $fileBox = $('.filetype');

        $fileBox.each(function() {
            var $fileUpload = $(this).find('.input-file'),
                $fileText = $(this).find('.file-text')
            $fileUpload.on('change', function() {
                var fileName = $(this).val();
                $fileText.attr('disabled', 'disabled').val(fileName);
            })
        })
        var calendarInfo = null;
        //달력 주입 시작
        $('#calendar').fullCalendar({
            viewRender: function(view, element) {
            var dt_start = moment( $('#calendar').fullCalendar('getDate') ).format('YYYY-MM-DD');
            innerValue("yyyymmdd", dt_start);
            var dayOfWeek = moment( $('#calendar').fullCalendar('getDate') ).format('dddd');
            getLectureRoom(dt_start, dayOfWeek);
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
        $("#img_box div").remove();
        $("#img_box1 div").remove();
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
        } else{
            $(".todayDate").html(yyyymmdd+""+day);
            $('#img_box').prepend('<div class="cNull"><p>아직 강의실배정표가 없습니다.</p></div>');
            $('#img_box1').prepend('<div class="cNull"><p>아직 강의실배정표가 없습니다.</p></div>');
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
                        if(academyNumber == 1)  $("#uploadModal").hide();
                        else $("#uploadModal1").hide();
                    }
                }
            }
        });
    }

    function upLoadPop(){
        var uModal = $('#uploadModal');
        var mClose = $('.btn_modalClose');
        /* modal */
        uModal.css('display','block');
        mClose.click(function(){
            $('.file-text').val('');
            uModal.css('display','none');
        });
    }

    function upLoadPop1() {
        var uModal = $('#uploadModal1');
        var mClose = $('.btn_modalClose');
        /* modal */
        uModal.css('display','block');
        mClose.click(function(){
            $('.file-text').val('');
            uModal.css('display','none');
        });
    }

    function upLoadPop2(){
        var uModal = $('#uploadModal2');
        var mClose = $('.btn_modalClose');
        /* modal */
        uModal.css('display','block');
        mClose.click(function(){
            var $this = $('#uploadModal2 table tr td a');
            $this.parent().parent().remove();
            $('.file-text').val('');
            uModal.css('display','none');
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
        <!-- 안내 모달창 -->
        <div id="uploadModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <div class="mTit">
                    <h2>시간표 업로드</h2>
                    <!-- <a href="javascript:" class="btn_modalClose">닫기</a>-->
                </div>
                <div class="mCont">
                    <div class="ta_center">
                        <div class="box">
                        <span class="filetype">
                            <input type="text" class="file-text" disabled>
                            <span class="file-btn">찾아보기</span>
                            <span class="file-select"><input type="file" id="attachFile" class="input-file" size="3" onchange="fileInfo(this, 1)"></span>
                        </span>
                        </div>
                    </div>
                    <div class="btnArea">
                        <a href="javascript:" class="btn_m cgray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:" class="btn_m cblue radius w110" onclick="saveLecRoom(1);">등록</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- //안내 모달창 -->
        <!-- 안내 모달창 -->
        <div id="uploadModal1" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <div class="mTit">
                    <h2>시간표 업로드</h2>
                    <!-- <a href="javascript:" class="btn_modalClose">닫기</a>-->
                </div>
                <div class="mCont">
                    <div class="ta_center">
                        <div class="box">
                        <span class="filetype">
                            <input type="text" class="file-text" disabled>
                            <span class="file-btn">찾아보기</span>
                            <span class="file-select"><input type="file" id="attachFile1" class="input-file" size="3" onchange="fileInfo(this, 2)"></span>
                        </span>
                        </div>
                    </div>
                    <div class="btnArea">
                        <a href="javascript:" class="btn_m cgray radius w110">취소</a> &nbsp;&nbsp;&nbsp;
                        <a href="javascript:" class="btn_m cblue radius w110" onclick="saveLecRoom(2);">등록</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- //안내 모달창 -->
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <%@include file="/common/jsp/noticeHeader.jsp" %>
                <div class="calendarWrap">
                    <p>날짜를 선택하시면 강의실배정표를 확인하실 수 있습니다.</p>
                    <div class="calendarTable">
                        <div id="calendar"></div>
                    </div>
                </div>
                <div class="calendarInfo">
                    <div class="branch01 cCom">
                        <p>[1관] <span><b><span class="todayDate"></span></b> 강의실배정표입니다.</span></p>
                        <a href="javascript:upLoadPop()"><img src="/common/zian/images/common/t_upload.jpg" alt=""></a>
                        <div id="img_box"></div>
                    </div>
                    <div class="branch02 cCom">
                        <p>[2관] <span><b><span class="todayDate"></span></b> 강의실배정표입니다.</span></p>
                        <a href="javascript:upLoadPop1()"><img src="/common/zian/images/common/t_upload.jpg" alt=""></a>
                        <div id="img_box1"></div>
                    </div>
                </div>
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