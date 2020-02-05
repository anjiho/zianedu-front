<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String examUserKey = request.getParameter("examUserKey");
    String onlineTime = request.getParameter("onlineTime");
%>
<script type="text/javascript">
    var examKey = <%=examUserKey%>;
    var onlineTime = <%=onlineTime%>;
    $(document).ready(function(){
        countdown('st_time', Number(onlineTime)*60);	 // second base
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(examKey != ""){
            getUserExamList(examKey, sessionUserInfo.userKey);
            $("#subjectTab li").eq(0).addClass('active'); //과목 탭 active
            $("#t-1").addClass('current2');//omr currnet
            $("#tab-1").addClass('current');
        }

        var sDate = new Date().getTime();    // 시작 시간
        innerValue("playStartTime", sDate);

    });

    function setTabNum(tabId) {
        innerValue('tabId', tabId);
    }

    function goChangeTabChk() {
        var examChkCnt = 0;
        var tabNum = getInputTextValue('tabId');
        var tabId = "t-"+(Number(tabNum)+1)+" ul";
        $('#'+tabId).each(function(){
            var $this = $(this);
            $this.find('li.st_answer').each(function(){
                var seleted = $(this).hasClass('st_selected');
                if(seleted == true)  examChkCnt = examChkCnt+1;
            })
        });
        if(examChkCnt == 20){
            if($("#subjectTab li").length == Number(tabNum)+1) {
                alert("정말 제출 하시겠습니까?");
                var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
                var arr = new Array();
                for(var i = 0; i < $("#subjectTab li").length; i++){
                    var omrId = "t-"+(i+1)+" ul";
                    $('#'+omrId).each(function(){
                        var score = 0;
                        if($(this).find('li.st_selected').val() == $(this).find('li').eq(0).val()){
                            score = 1;
                        }
                        var data = {
                            examUserKey : <%=examUserKey%>,
                            userKey :sessionUserInfo.userKey,
                            examSbjUserKey : $("#SubjectKey-"+(i+1)).val(),
                            examQuestionBankKey : $(this).find('li').eq(1).attr('id'),
                            userAnswer : $(this).find('li.st_selected').val(),
                            score : score
                        };
                        arr.push(data);
                    });
                }
                var omrList = JSON.stringify(arr);

                var eDate = new Date().getTime();    // 끝나는 시간
                var sDate = getInputTextValue("playStartTime");
                var playTime = (eDate - sDate) / 1000;
                var result = saveExamResult(omrList, roundMarks(playTime));
                if(result.resultCode == 200){
                    alert("제출이 완료 되었습니다.");
                }
                return false;
            }else{
                tabNum1 = Number(tabNum) + 1;
                innerValue("tabId", tabNum1);
                $('.st_tab li').find('div').css('display', 'none');
                $('.st_question_board').removeClass('current');
                $('.st_omr_board').removeClass('current2');

                $('.st_tab li').eq(Number(tabNum) + 1).find('div').css('display', 'block');
                $('#tab-'+ (Number(tabNum1) + 1)).addClass('current');
                $('#t-'+ (Number(tabNum1) + 1)).addClass('current2');
            }
        }else{
            alert('OMR 문제 체크를 해주세요');
            return false;
        }
    }
</script>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>기출문제</title>
    <title>빅모의고사 팝업시험</title>
    <script type="text/javascript">
        $(document).ready(function(){
            /* tab메뉴 */
            $('.st_tab li').click(function(){
                var $this = $(this).attr('data-tab');
                var $th = $(this).attr('data-name');

                $('.st_tab li').find('div').css('display','none');
                $('.st_question_board').removeClass('current');
                $('.st_omr_board').removeClass('current2');

                $(this).find('div').css('display','block');
                $('#'+$this).addClass('current');
                $('#'+$th).addClass('current2');
            })
            /* OMR 객관식 번호 클릭 이벤트 */
            /* 과목 1 */
            $('#t-1 ul').each(function(){
                var $this = $(this);
                $this.find('li.st_answer').each(function(){
                    var $th = $(this);
                    var $sel = $th.parent().index()+2; //클릭시 다음 문제지로 넘어가기 위한 세팅값
                    $th.on('click',function(){
                        $th.parent().find('li').removeClass('st_selected');
                        $th.addClass('st_selected');
                        $('div#tab-1').stop().animate({
                            scrollTop : $('#id_question_' + $sel).position().top
                        }, 400);
                    })
                })
            })
            /* 과목 2 */
            $('#t-2 ul').each(function(){
                var $this = $(this);
                $this.find('li.st_answer').each(function(){
                    var $th = $(this);
                    var $sel = $th.parent().index()+2;
                    $th.on('click',function(){
                        $th.parent().find('li').removeClass('st_selected');
                        $th.addClass('st_selected');
                        $('#tab-2').stop().animate({
                            scrollTop : $('#tab-2 #id_question_' + $sel).position().top
                        }, 400);
                    })
                })
            })
            /* 과목 3 - 과목 추가당 코드 추가 & id값에 +1씩 */
            $('#t-3 ul').each(function(){
                var $this = $(this);
                $this.find('li.st_answer').each(function(){
                    var $th = $(this);
                    var $sel = $th.parent().index()+2;
                    $th.on('click',function(){
                        $th.parent().find('li').removeClass('st_selected');
                        $th.addClass('st_selected');
                        $('#tab-3').stop().animate({
                            scrollTop : $('#tab-3 #id_question_' + $sel).position().top
                        }, 400);
                    })
                })
            });  /* 과목 3 - 과목 추가당 코드 추가 & id값에 +1씩 */
            $('#t-4 ul').each(function(){
                var $this = $(this);
                $this.find('li.st_answer').each(function(){
                    var $th = $(this);
                    var $sel = $th.parent().index()+2;
                    $th.on('click',function(){
                        $th.parent().find('li').removeClass('st_selected');
                        $th.addClass('st_selected');
                        $('#tab-3').stop().animate({
                            scrollTop : $('#tab-4 #id_question_' + $sel).position().top
                        }, 400);
                    })
                })
            });
            /* 과목 3 - 과목 추가당 코드 추가 & id값에 +1씩 */
            $('#t-5 ul').each(function(){
                var $this = $(this);
                $this.find('li.st_answer').each(function(){
                    var $th = $(this);
                    var $sel = $th.parent().index()+2;
                    $th.on('click',function(){
                        $th.parent().find('li').removeClass('st_selected');
                        $th.addClass('st_selected');
                        $('#tab-3').stop().animate({
                            scrollTop : $('#tab-5 #id_question_' + $sel).position().top
                        }, 400);
                    })
                })
            });

            /* OMR 메인번호 클릭 이벤트 */
            /* 과목 1 */
            $('#t-1 ul').each(function(){
                var $this = $(this);
                var $sel = $this.index(); //클릭시 해당 번호에 맞는 문제지로 넘어가기 위한 세팅값 ID가 1부터 시작해서 +1 수식어 추가
                $this.find('li.st_number').on('click',function(){
                    $('div#tab-1').stop().animate({
                        scrollTop : $('#id_question_' + $sel).position().top
                    }, 400);
                })
            })
            /* 과목 2 */
            $('#t-2 ul').each(function(){
                var $this = $(this);
                var $sel = $this.index();
                var $num = $('#tab-2');
                $this.find('li.st_number').on('click',function(){
                    $('div#tab-2').stop().animate({
                        scrollTop : $('#tab-2 #id_question_' + $sel).position().top
                    }, 400);
                })
            })
            /* 과목 3 - 과목 추가당 코드 추가 & id값에 +1씩 */
            $('#t-3 ul').each(function(){
                var $this = $(this);
                var $sel = $this.index();
                var $num = $('#tab-2');
                $this.find('li.st_number').on('click',function(){
                    $('div#tab-3').stop().animate({
                        scrollTop : $('#tab-3 #id_question_' + $sel).position().top
                    }, 400);
                })
            })
            $('#t-4 ul').each(function(){
                var $this = $(this);
                var $sel = $this.index();
                var $num = $('#tab-2');
                $this.find('li.st_number').on('click',function(){
                    $('div#tab-3').stop().animate({
                        scrollTop : $('#tab-4 #id_question_' + $sel).position().top
                    }, 400);
                })
            })
            $('#t-5 ul').each(function(){
                var $this = $(this);
                var $sel = $this.index();
                var $num = $('#tab-2');
                $this.find('li.st_number').on('click',function(){
                    $('div#tab-3').stop().animate({
                        scrollTop : $('#tab-5 #id_question_' + $sel).position().top
                    }, 400);
                })
            })
        })
    </script>
</head>
<body>
<div class="st_exam">
    <input type="hidden" id="tabId">
    <input type="hidden" id="playStartTime">
    <input type="hidden" id="playEndTime">
    <div class="st_exam_test">
        <div class="st_test_main">
            <div class="st_top_line"></div>
            <div class="st_content">
                <div class="st_title" id="examName"></div>
                <div class="st_info">
                    <ul>
                        <li><div></div><b>응시과목: </b><span id="subjectNameList"></span></li>
                        <li><div></div><b>시험일: </b><span id="examDate"></span></li>
                        <li><div></div><b>응시번호: </b>0<span id="serial"></span></li>
                        <li><div></div><b>이름: </b><span id="userName"></span></li>
                    </ul>
                </div>
                <div class="st_tab">
                    <ul id="subjectTab"></ul>
                </div>
                <div class="st_position"></div>
            </div>
            <div class="st_answer_board">
                <div class="st_time_board">
                    시험시간
                    <div id="st_time" class="st_time"></div>
                </div>
                <div class="st_position2"></div> <!--omr카드-->
                <div id="chkBtn">
                    <img src="/common/zian/images/bigimg/button_test_submit.png" alt="" style="cursor:pointer" onClick="goChangeTabChk();" id="examBtn">
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* Timer */
    function countdown( elementId, seconds ){
        var element, endTime, hours, mins, msLeft, time;
        function updateTimer(){
            msLeft = endTime - (+new Date);
            if ( msLeft < 0 ) {
                alert("시험시간이 종료되었습니다.");
                $("#examBtn").hide();
            } else {
                time = new Date( msLeft );
                hours = time.getUTCHours();
                mins = time.getUTCMinutes();
                element.innerHTML = (hours ? hours + ':' + ('0' + mins).slice(-2) : mins) + ':' + ('0' + time.getUTCSeconds()).slice(-2);
                setTimeout( updateTimer, time.getUTCMilliseconds());
                // if you want this to work when you unfocus the tab and refocus or after you sleep your computer and come back, you need to bind updateTimer to a $(window).focus event^^
            }
        }
        element = document.getElementById( elementId );
        endTime = (+new Date) + 1000 * seconds;
        updateTimer();
    }
</script>
</body>
</html>