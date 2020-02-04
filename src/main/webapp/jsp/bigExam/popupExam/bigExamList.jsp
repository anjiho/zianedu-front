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
    });
</script>
<!DOCTYPE html>
<!-- saved from url=(0013)about:internet -->
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
            });

            /* OMR 메인번호 클릭 이벤트 */
            /* 과목 1 */
            $('#t-1 ul').each(function(){
                var $this = $(this);
                var $sel = $this.index()+1; //클릭시 해당 번호에 맞는 문제지로 넘어가기 위한 세팅값 ID가 1부터 시작해서 +1 수식어 추가
                $this.find('li.st_number').on('click',function(){
                    $('div#tab-1').stop().animate({
                        scrollTop : $('#id_question_' + $sel).position().top
                    }, 400);
                })
            })
            /* 과목 2 */
            $('#t-2 ul').each(function(){
                var $this = $(this);
                var $sel = $this.index()+1;
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
                var $sel = $this.index()+1;
                var $num = $('#tab-2');
                $this.find('li.st_number').on('click',function(){
                    $('div#tab-3').stop().animate({
                        scrollTop : $('#tab-3 #id_question_' + $sel).position().top
                    }, 400);
                })
            })
        })
    </script>
</head>
<body>
<div class="st_exam">
    <div class="st_exam_test">
        <div class="st_test_main">
            <div class="st_top_line"></div>
            <div class="st_content">
                <div class="st_title">2013_국가직_7급_영어기출문제</div>
                <div class="st_info">
                    <ul>
                        <li><div></div><b>응시과목: </b>영어</li>
                        <li><div></div><b>시험일: </b>2019년 12월 03일</li>
                        <li><div></div><b>응시번호: </b>020046068</li>
                        <li><div></div><b>이름: </b>지안에듀</li>
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
                <div>
                    <img src="/common/zian/images/bigimg/button_test_submit.png" alt="" style="cursor:pointer" onClick="">
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
                console.log('done');
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

        if(seconds = 0){
            alert("끝");
        }
    }
</script>
</body>
</html>