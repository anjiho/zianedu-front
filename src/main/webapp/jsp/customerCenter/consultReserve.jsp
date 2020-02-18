<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2149f737a2468c19787b4ef4a9ea6a2b&libraries=services"></script>
<script>
    $(document).ready(function () {
        $('#a_reservation').val(1).trigger('change');
        $('#academyNumber').val(1).trigger('change');
        innerHTML('reserveTitle', '전화상담예약');
        calendar();

        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo == null){
            alert("로그인을 해주세요.");
            goLoginPage();
        }
        /*다음지도 API 호출*/
        daumMapApi('map1', '서울시 동작구 노량진동 117-2 영빌딩');
        daumMapApi('map2', '서울특별시 동작구 노량진로 196');
        // var a_reservation = getSelectboxValue("a_reservation");
        // if(a_reservation == ""){
        //     $("#consultDiv").hide();
        // }

        $("#a_reservation").change(function(){
            if($(this).val() == 1){
                innerHTML('reserveTitle', '전화상담예약');
            }else{
                innerHTML('reserveTitle', '방문상담예약');
            }
        });

        $("#academyNumber").change(function () {
            $("#morning").empty();
            $("#afternoon").empty();
            var a_reservation = getSelectboxValue("a_reservation");
            var academyNumber = getSelectboxValue("academyNumber");
            if(a_reservation != ""){
                //$("#consultDiv").show();
                calendar();
                var today = getToday();
                var today2 = getToday2();
                innerValue("indate", today);
                innerHTML("selDate", today2);
                innerHTML("academy", $("#academyNumber option:checked").text());
                if(academyNumber != ""){
                    getReserveTime(today, academyNumber);
                }else{
                    $("#consultDiv").hide();
                }
            }else{
                alert("상담유형을 선택해 주세요.");
                $("#academyNumber").val("");
                $("#a_reservation").focus();
                return false;
            }
        });
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(sessionUserInfo != null){
            innerValue("reserveName", sessionUserInfo.name);
            innerValue("phoneNum", sessionUserInfo.telephoneMobile);
            innerValue("email",  sessionUserInfo.email);
            getUserRegSerialList("interestCtgKey0"); //준비직렬
            getUserRegSerialList("interestCtgKey1"); //준비직렬
            getUserRegSerialList("interestCtgKey2"); //준비직렬
        }

        function calendar() {
            var calendarInfo = null;
            //달력 주입 시작
            $('#searchStartDate').fullCalendar({
                viewRender: function(startDate, view, element) {
                    var dt_start = moment( $('#calendar').fullCalendar('getDate') ).format('YYYY-MM-DD');
                    innerValue("indate", dt_start);
                    var reserveLocation = getSelectboxValue("academyNumber");
                        $("#morning").empty();
                        $("#afternoon").empty();
                    getReserveTime(dt_start, reserveLocation);
                    var dt_start1 = moment(startDate).format('YYYY.MM.DD');
                    innerHTML("selDate", dt_start1);
                    var dayOfWeek = moment(startDate).format('dddd'); //요일
                    innerHTML("selDay", dayOfWeek);
                    innerValue("indate", dt_start);
                    innerHTML("academy", $("#academyNumber option:checked").text());
                },
                lang:'ko',
                header: {
                    left: 'prev,next,today',
                    center: 'title',
                    right: ''
                },
                selectable:true,
                defaultView: 'month',
                contentHeight:"auto",
                handleWindowResize:true,
                dayPopoverFormat: 'yyyy-MM-dd',
                select: function (startDate, endDate, jsEvent, view) {
                    var dt_start = moment(startDate).format('YYYY-MM-DD');
                    var dt_start1 = moment(startDate).format('YYYY.MM.DD');
                    innerHTML("selDate", dt_start1);
                    var dayOfWeek = moment(startDate).format('dddd'); //요일
                    innerHTML("selDay", dayOfWeek);
                    innerValue("indate", dt_start);
                    var reserveLocation = getSelectboxValue("academyNumber");
                    if(reserveLocation == ''){
                        alert("학원관을 선택해 주세요.");
                        $("#academyNumber").focus();
                        return false;
                    }
                    $("#morning").empty();
                    $("#afternoon").empty();
                    getReserveTime(dt_start, reserveLocation);
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
        }

       // setTime(1,"09:00");
    });


    function setTime(val, time) {
        if(val == 0 && time == 0){
            alert("이미 상담예약이 완료되었습니다.");
            return false;
        }
        $("#morning li a").each(function () {$(this).removeClass('active');});
        $("#afternoon li a").each(function () {$(this).removeClass('active');});
        $("#"+val).addClass('active');
        innerValue("timer", time);
        innerValue("reserveTimeKey", val);
        var timeStr = "/ " +time;
        innerHTML("selTime", timeStr);
    }
    
    function consultSave() {
        if ($("input:checkbox[name='consentChk']").is(":checked") == false){
            alert('수신동의를 체크해 주세요.');
            return false;
        }
        var check = new isCheck();
        if (check.input("reserveContents", comment.consultContent_info) == false) return;
        if (check.input("indate", comment.consultDate_info) == false) return;
        if (check.input("timer", comment.consultTime_info) == false) return;
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var reserveDate = getInputTextValue("indate");
        var reserveTimeKey = getInputTextValue("reserveTimeKey");
        var reserveType = getSelectboxValue("a_reservation");
        var reserveLocation = getSelectboxValue("academyNumber");
        var reserveName = getInputTextValue("reserveName");
        var mobileNumber = getInputTextValue("phoneNum");
        var email = getInputTextValue("email");
        var interestCtgKey0 = getSelectboxValue("interestCtgKey0");
        var interestCtgKey1 = getSelectboxValue("interestCtgKey1");
        var interestCtgKey2 = getSelectboxValue("interestCtgKey2");
        var reserveContents =  getInputTextValue("consultContent");
        var data = {
            userKey : sessionUserInfo.userKey,
            reserveDate : reserveDate,
            reserveTimeKey: parseInt(reserveTimeKey),
            reserveType : parseInt(reserveType),
            reserveLocation : parseInt(reserveLocation),
            userName : reserveName,
            mobileNumber : mobileNumber,
            emailAddress : email,
            ctgKey1 : parseInt(interestCtgKey0),
            ctgKey2 : parseInt(interestCtgKey1),
            ctgKey3 : parseInt(interestCtgKey2),
            reserveContents : reserveContents
        };
        var result = reserveConsult(data);
        if(result.resultCode == 200){
            alert("상담예약이 완료 되었습니다.");
            return false;
        }
    }

</script>
<style>
    /*달력 토,일 색변경*/
    .fc-sat { color: blue; }
    .fc-sun { color: red; }
</style>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="reserveDate">
    <input type="hidden" id="reserveTimeKey">
    <input type="hidden" id="reserveType">
    <input type="hidden" id="reserveLocation">
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
                        <li><a href="javascript:goPageNoSubmit('customerCenter','saveQuestion');">1:1문의</a></li>
                        <li class="active"><a href="javascript:goPageNoSubmit('customerCenter','consult');">상담예약</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','mobile');">모바일문의</a></li>
                        <li><a href="javascript:goPageNoSubmit('customerCenter','oftenList');">자주하는질문</a></li>
                    </ul>
                </div>
                <br/>
                <div class="customer">
                    <!-- 수강생 안내 -->
                    <div class="customer_inner">
                        <h2>1:1 상담 집중컨설팅</h2>
                        <p class="tit">온라인으로 편리하게 상담예약 이용하세요.<br>
                            원하시는 시간대를 신청하시면 친절히 상담해드리겠습니다.!<br><br>
                            최단기간합격, 지안공무원 학원이 함께 합니다.<br><br><br>
                            이미 상담을 신청하셨나요?<br>
                            마이페이지 > 게시물 관리 > 상담예약내역에서 확인하세요.</p>
                        <a href="#" class="advice_btn">나의 상담내역 확인 &nbsp;</a>
                    </div>
                    <!-- //수강생 안내 -->

                    <!-- 상담선택 -->
                    <div class="advice_select">
                        <div class="advice_input">
                            <select name="a_reservation" class="a_reservation" id="a_reservation" >
                                <option value="" selected>-- 선택 --</option>
                                <option value="1">전화상담예약</option>
                                <option value="2">방문상담예약</option>
                            </select>

                            <select name="a_location" class="a_location" id="academyNumber">
                                <option value="" selected>-- 선택 --</option>
                                <option value="1">지안공무원1관</option>
                                <option value="2">지안공무원2관</option>
                            </select>
                            <div class="l_btn">
                                <a href="#modal1" class="btn_info btn_modalOpen">1관위치</a>
                                <a href="#modal2" class="btn_info btn_modalOpen">2관위치</a>
                            </div>
                        </div>
                        <div class="advice_table" id="consultDiv">
                            <div class="calendar_wrap">
                                <div class="calender_inner">
                                    <div class="calender_api" id="searchStartDate"></div>
                                    <div class="calender_tb">
                                        <div class="calender_input">
                                            <div class="c_date">
                                                <label>날짜</label>
                                                <input type="text" id="indate" placeholder="날짜를 선택해주세요" readonly>
                                            </div>
                                            <div class="c_timeer">
                                                <label>시간</label>
                                                <input type="text" id="timer" name="timer" placeholder="시간을 선택해주세요." readonly>
                                            </div>
                                        </div>
                                        <div class="calender_btn_wrap">
                                            <div class="">
                                                <h6>오전</h6>
                                                <ul id="morning">
                                                </ul>
                                            </div>
                                            <div class="c_afternoon">
                                                <h6>오후</h6>
                                                <ul id="afternoon">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="advice_tit">
                                    <p>당일 상담예약은 불가능합니다.<br>
                                        상담을 원하는 날짜의 신청이 마감되었을 경우, 아래 학원 번호로 연락주시기 바랍니다.<br><br>
                                        지안공무원 1관 02-816-1725 / 지안공무원2관 070-4870-0634 (월-금 09:00~17:30)</p>
                                </div>
                            </div>
                            <div class="table_wrap">
                                <p><span id="selDate"></span> <span id="selDay"></span> <span id="selTime"></span> </p>
                                <p class="t_tit"><span id="academy"></span>에서 <span id="reserveTitle"></span>을 선택하셨습니다.</p>
                                <div class="form_atb">
                                    <h3>예약자정보</h3>
                                    <p><img src="/common/zian/images/common/icon_formChk.png">필수입력</p>
                                    <table class="disnoneM">
                                        <tbody>
                                        <tr>
                                            <th width="25%"><img src="/common/zian/images/common/icon_formChk.png">예약자</th>
                                            <td width="75%"><input type="text" id="reserveName" readonly></td>
                                        </tr>
                                        <tr>
                                            <th class="vt_pt"><img src="/common/zian/images/common/icon_formChk.png">연락처</th>
                                            <td>
                                                <input type="text" id="phoneNum" readonly>
                                                <input type="checkbox" name="consentChk" id="consentChk" class="">
                                                <label style="display:inline-block;" for="consentChk">수신동의</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><img src="/common/zian/images/common/icon_formChk.png">이메일</th>
                                            <td>
                                                <input type="text" id="email" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="vt_pt"><img src="/common/zian/images/common/icon_formChk.png">상담요청직업군</th>
                                            <td>
                                                <select id="interestCtgKey0" name="interestCtgKey0" class="w180">
                                                    <option value="0">선택</option>
                                                </select>
                                                <select id="interestCtgKey1" name="interestCtgKey0" class="w180">
                                                    <option value="0">선택</option>
                                                </select>
                                                <select id="interestCtgKey2" name="interestCtgKey0" class="w180">
                                                    <option value="0">선택</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><img src="/common/zian/images/common/icon_formChk.png">상담요청내용</th>
                                            <td><input type="text" id="consultContent" placeholder="간략하게 적어주세요."></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="btnArea">
                                    <a href="#" class="btn_m gray radius w110">취소</a>
                                    <a href="javascript:consultSave()" id="mybtn" class="btn_m onBlue radius w110">등록</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //상담선택 -->
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
<div id="modal1" class="modalWrap">
    <div class="inner">
        <div class="modalTitle">
            <h2>1관위치</h2>
            <a href="#" class="btn_modalClose">모달팝업닫기</a>
        </div>
        <div id="map1" style="width:700px;height:300px;"></div>
        <div class="modalContent">
            <div class="pop_cont">
                <div class="locationP">
                    <h3>2관 찾아오시는 길</h3>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="40%">
                            <col width="10%">
                            <col width="40%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>주소</th>
                            <td colspan="3">서울시 동작구 노량진동 117-2 영빌딩 2층 (올리브영 맞은편 다이소건물 2층)</td>
                        </tr>
                        <tr>
                            <th>지하철</th>
                            <td colspan="3">1호선 노량진역 1번출구, 9호선 노량진역 3번출구</td>
                        </tr>
                        <tr>
                            <th>버스</th>
                            <td colspan="3">파랑(간선버스) : 152, 500, 504, 654, 751, 752 / 초록(지선버스) : 5535,
                                5536, 5516, 5517</td>
                        </tr>
                        <tr>
                            <th>TEL</th>
                            <td>02-6080-1725</td>
                            <th>FAX</th>
                            <td>02-816-1720</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modal2" class="modalWrap">
    <div class="inner">
        <div class="modalTitle">
            <h2>2관위치</h2>
            <a href="#" class="btn_modalClose">모달팝업닫기</a>
        </div>
        <div id="map2" style="width:700px;height:300px;"></div>
        <div class="modalContent">
            <div class="pop_cont">
                <div class="locationP">
                    <h3>2관 찾아오시는 길</h3>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="40%">
                            <col width="10%">
                            <col width="40%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>주소</th>
                            <td colspan="3">서울시 동작구 노량진동 117-2 영빌딩 2층 (올리브영 맞은편 다이소건물 2층)</td>
                        </tr>
                        <tr>
                            <th>지하철</th>
                            <td colspan="3">1호선 노량진역 1번출구, 9호선 노량진역 3번출구</td>
                        </tr>
                        <tr>
                            <th>버스</th>
                            <td colspan="3">파랑(간선버스) : 152, 500, 504, 654, 751, 752 / 초록(지선버스) : 5535,
                                5536, 5516, 5517</td>
                        </tr>
                        <tr>
                            <th>TEL</th>
                            <td>02-6080-1725</td>
                            <th>FAX</th>
                            <td>02-816-1720</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>