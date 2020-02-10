<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/exam_common.jsp" %>
<!-- 차트 관련 스크립트 -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script>
            /*$(
                //마우스 우클릭 & 드래그 방지
                function(){
                    document.onselectstart = eventControl;
                    document.oncontextmenu = eventControl;
                }
            );
            function eventControl(){
                return false;
            }

            function onStart(){
                location.href = "bigTest_pop.html"
            }*/

            //성적전체분석
            function getAchievementManagementDetailInfo(examUserKey) {
                var achievementResult = getApi("/exam/getAchievementManagementDetailInfo/", examUserKey);
                if (achievementResult == null) return;
                console.log(achievementResult);
                //상단 정보
                var achievementTopInfo = achievementResult.result.achievementTopInfo;
                if (achievementTopInfo != null) {
                    innerHTML("l_examName", achievementTopInfo.examName);
                    innerHTML("l_subjectName", achievementTopInfo.subjectName);
                    innerHTML("l_examDate", achievementTopInfo.examDate);
                    innerHTML("l_serial", achievementTopInfo.serial);
                    innerHTML("l_examUserName", achievementTopInfo.examUserName);
                    innerHTML("l_compareResultUserName", achievementTopInfo.examUserName);
                }
                //개인성적 종합분석 리스트
                var examSubjectStaticsInfoList = achievementResult.result.examSubjectStaticsInfo;
                if (examSubjectStaticsInfoList.length > 0) {
                    dwr.util.addRows("l_examSubjectStaticsInfoList", examSubjectStaticsInfoList, [
                        function (data) { return "<b>" + data.subjectName + "</b>" },
                        function (data) { return data.answerCnt + "/" + data.questionCnt },
                        function (data) { return data.answerScore + "/" + data.totalAnswerScore },
                        function (data) { return data.topAccumulatePercent },
                        function (data) { return data.userGrade + "/"+ data.totalAnswerCnt },
                        function (data) { return data.isPass }
                    ], {escapeHtml: false});
                }
                //개인성적 종합분석 평균
                var examSubjectTotalInfo = achievementResult.result.examSubjectTotalInfo;
                if (examSubjectTotalInfo != null) {
                    gfn_display("st_result", true);
                    innerHTML("l_staticsAnswerCnt", examSubjectTotalInfo.staticsAnswerCnt);
                    innerHTML("l_staticsTotalAnswerScore", examSubjectTotalInfo.staticsAnswerScore);
                    innerHTML("l_staticsUserGrade", examSubjectTotalInfo.staticsUserGrade + "/" + examSubjectTotalInfo.staticsTotalAnswerCnt);
                }
                //전체평균과 본인 성적 비교 그래프
                var examCompareTotalStaticsInfo = achievementResult.result.examCompareTotalStaticsInfo;
                if (examCompareTotalStaticsInfo.length > 0) {
                    var selList =  examCompareTotalStaticsInfo;
                    dwr.util.addOptions("st_graph", selList, function (data) {
                        return "<div class=\"st_graph_item\"> " +
                                    "<table> " +
                                        "<tbody> " +
                                            "<tr> " +
                                                "<td class=\"st_name\">" + data.subjectName  + "</td> " +
                                            "<td> " +
                                            "<div class=\"st_graph_view\"> " +
                                                "<div class=\"st_graph_bar st_type_01\"> " +
                                                    "<span>" + data.mySubjectScore + "</span> " +
                                                "</div> " +
                                                "<div class=\"st_graph_bar st_type_02\"> " +
                                                    "<span>" + data.totalSubjectScore + "</span> " +
                                                "</div> " +
                                            "</div> " +
                                            "</td> " +
                                            "</tr> " +
                                        "</tbody> " +
                                    "</table> " +
                                "</div>";
                    }, {escapeHtml: false});
                }
                var userStaticsScore = achievementResult.result.userStaticsScore;
                var totalStaticsScore = achievementResult.result.totalStaticsScore;
                innerHTML("l_myStatics", userStaticsScore);
                innerHTML("l_totalStatics", totalStaticsScore);
                //과목별 평균 리스트
                var subjectStaticsInfo = achievementResult.result.subjectStaticsInfo;
                console.log(subjectStaticsInfo);
                if (subjectStaticsInfo.length > 0) {
                    var subjectStaticsInfoLength = subjectStaticsInfo.length;
                    for (var i=0; i<subjectStaticsInfoLength; i++) {
                        var selList = subjectStaticsInfo[i];
                        if (selList.subjectName == "총점") {
                            innerHTML("l_subject5", selList.subjectName);
                            innerHTML("l_topTenScore5", selList.tenPercentScore);
                            innerHTML("l_topThirtyScore5", selList.thirtyPercentScore);
                            innerHTML("l_myScore5", selList.myScore);
                            innerHTML("l_subjectStaticsTotal5", selList.totalScore);
                        } else {
                            innerHTML("l_subject" + i, selList.subjectName);
                            innerHTML("l_topTenScore" + i, selList.tenPercentScore);
                            innerHTML("l_topThirtyScore" + i, selList.thirtyPercentScore);
                            innerHTML("l_myScore" + i, selList.myScore);
                            innerHTML("l_subjectStaticsTotal" + i, selList.totalScore);
                        }
                    }
                }

            }

            $(document).ready(function(){
                getAchievementManagementDetailInfo(36769);

            })
</script>
<div class="st_exam">
    <form action="/" id="id_frm" method="post" name="name_frm">
        <input id="exam_user_key" name="exam_user_key" type="hidden" value="42902" />
        <div class="st_exam_test" style="overflow-y:auto;width:1152px;">
            <div class="st_test_main" style="background-image: none;">
                <div class="st_top_line"></div>
                <div class="st_content st_analysis" style="">
                    <div class="st_title" id="l_examName"></div>
                    <div class="st_info">
                        <ul>
                            <li>
                                <div></div>
                                <b>응시과목: </b><span id="l_subjectName"></span>
                            </li>
                            <li>
                                <div></div>
                                <b>시험일: </b><span id="l_examDate"></span>
                            </li>
                            <li>
                                <div></div>
                                <b>응시번호: </b><span id="l_serial"></span>
                            </li>
                            <li>
                                <div></div>
                                <b>이름: </b><span id="l_examUserName"></span>
                            </li>
                        </ul>
                    </div>
                    <div class="st_analysis_tab">
                        <ul>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_left.png" alt="left" /></li>
                            <li class="sts_button" data-index="0">
                                <div>
                                    <a href="javascript:goPageNoSubmit('myPage','gradeAllList');"><img src="/common/zian/images/bigimg/img_tabmenu_01_on.png" alt="성적 전체분석" title="성적 전체분석" /></a>
                                </div>
                            </li>
                            <li class="sts_button" data-index="1">
                                <div>
                                    <a href="javascript:goPageNoSubmit('myPage','subjectGradeDetail');"><img src="/common/zian/images/bigimg/img_tabmenu_02_off.png" alt="과목별 성적 상세분석" title="과목별 성적 상세분석" /></a>
                                </div>
                            </li>
                            <li class="sts_button" data-index="2">
                                <div>
                                    <a href="javascript:goPageNoSubmit('myPage','answerNote');"><img src="/common/zian/images/bigimg/img_tabmenu_03_off.png" alt="오답노트" title="오답노트" /></a>
                                </div>
                            </li>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_right.png" alt="right" /></li>
                        </ul>
                    </div>

                    <div class="st_analysis_main">
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 개인성적 종합분석
                            </div>
                            <table id="id_record" style="margin-top: 0px; width: 750px; float: left;">
                                <colgroup>
                                    <col style="width: 150px" />
                                    <col style="width: 120px;" />
                                    <col style="width: 120px;" />
                                    <col style="width: 120px;" />
                                    <col style="width: 120px;" />
                                    <col style="width: *" />
                                </colgroup>
                                <thead>
                                <tr>
                                    <td rowspan="2">과목</td>
                                    <td colspan="3">본인</td>
                                    <td>석차</td>
                                    <td rowspan="2">과락진단</td>
                                </tr>
                                <tr>
                                    <td>정답수</td>
                                    <td>원점수</td>
                                    <td>상위누적%</td>
                                    <td>전체</td>
                                </tr>
                                </thead>
                                <tbody id="l_examSubjectStaticsInfoList"></tbody>
                                <tr class="st_result" id="st_result" style="display: none">
                                    <td><b>평균</b></td>
                                    <td id="l_staticsAnswerCnt"></td>
                                    <td id="l_staticsTotalAnswerScore"></td>
                                    <td></td>
                                    <td id="l_staticsUserGrade"></td>
                                    <td></td>
                                </tr>
                            </table>

                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/Content/image/icon/icon_point_check_0001.png" alt="" /> 전체평균과 본인 성적 비교 그래프
                            </div>
                            <div class="st_graph">
                                <div class="st_graph_02">
                                    <ul id="st_graph">
                                    </ul>
                                    <div class="st_bar_explain">
                                        <img src="/common/zian/images/bigimg/analysis_graph_text.png" alt="" />
                                    </div>
                                </div>
                            </div>
                            <div class="st_total_result">
                                <div class="st_arrow">
                                    <div>
                                        <span id="l_compareResultUserName"></span> 님의<br />
                                        평균 성적과 전체 평균의<br />
                                        비교 분석 결과입니다.
                                    </div>
                                </div>
                                <div class="st_score_board">
                                    <div class="st_title">본인 평균</div>
                                    <div class="st_score" id="l_myStatics"></div>
                                </div>
                                <div class="st_score_vs"></div>
                                <div class="st_score_board">
                                    <div class="st_title">전체 평균</div>
                                    <div class="st_score" id="l_totalStatics"></div>
                                </div>
                            </div>
                        </div>
                        <div class="st_analysis_section" style="margin-top: 20px;">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 과목별 평균
                            </div>

                            <table id="id_record_subject" style="margin-top: 0px; width: 695px; float: left;">
                                <colgroup>
                                    <col style="width: 120px" />
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: 100px;" />
                                    <col style="width: *" />
                                </colgroup>
                                <thead>
                                <tr>
                                    <td>과목</td>
                                    <td id="l_subject0"></td>
                                    <td id="l_subject1"></td>
                                    <td id="l_subject2"></td>
                                    <td id="l_subject3"></td>
                                    <td id="l_subject4"></td>
                                    <td id="l_subject5"></td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>상위10%</td>
                                    <td id="l_topTenScore0"></td>
                                    <td id="l_topTenScore1"></td>
                                    <td id="l_topTenScore2"></td>
                                    <td id="l_topTenScore3"></td>
                                    <td id="l_topTenScore4"></td>
                                    <td id="l_topTenScore5"></td>
                                </tr>
                                <tr>
                                    <td>상위30%</td>
                                    <td id="l_topThirtyScore0"></td>
                                    <td id="l_topThirtyScore1"></td>
                                    <td id="l_topThirtyScore2"></td>
                                    <td id="l_topThirtyScore3"></td>
                                    <td id="l_topThirtyScore4"></td>
                                    <td id="l_topThirtyScore5"></td>
                                </tr>
                                <tr>
                                    <td>내 점수</td>
                                    <td id="l_myScore0"></td>
                                    <td id="l_myScore1"></td>
                                    <td id="l_myScore2"></td>
                                    <td id="l_myScore3"></td>
                                    <td id="l_myScore4"></td>
                                    <td id="l_myScore5"></td>
                                </tr>
                                <tr class="st_result" id="l_subjectStaticsTotal">
                                    <td>전체</td>
                                    <td id="l_subjectStaticsTotal0"></td>
                                    <td id="l_subjectStaticsTotal1"></td>
                                    <td id="l_subjectStaticsTotal2"></td>
                                    <td id="l_subjectStaticsTotal3"></td>
                                    <td id="l_subjectStaticsTotal4"></td>
                                    <td id="l_subjectStaticsTotal5"></td>
                                </tr>
                                </tbody>
                            </table>
                            <div id="id_graph_subject_score" style="width: 362px; float: right;"></div>
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_diagram st_half" id="id_graph_score_one" style="float: left;">
                                <p>점수비교</p>
                            </div>
                            <div class="st_diagram st_half" id="id_graph_score_total" style="float: right;">
                                <p>회차별 점수 비교</p>
                            </div>
                        </div>
                        <div class="st_subject_name">
                            <span>국어</span> 분석 그래프
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 국어 유형별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram st_half" id="id_graph_step_one_102800" style="float: left;">
                                <p>유형별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram st_half" id="id_graph_step_total_102800" style="float: right;">
                                <p>유형별 정답률(누적)</p>
                            </div>
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 국어 패턴별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram st_half" id="id_graph_pattern_one_102800" style="float: left;">
                                <p>패턴별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram st_half" id="id_graph_pattern_total_102800" style="float: right;">
                                <p>패턴별 정답률(누적)</p>
                            </div>
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 국어 패턴별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram" id="id_graph_unit_one_102800">
                                <p>대단원별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram" id="id_graph_unit_total_102800">
                                <p>대단원별 정답률(누적)</p>
                            </div>
                        </div>
                        <div class="st_subject_name">
                            <span>영어</span> 분석 그래프
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 영어 유형별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram st_half" id="id_graph_step_one_102801" style="float: left;">
                                <p>유형별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram st_half" id="id_graph_step_total_102801" style="float: right;">
                                <p>유형별 정답률(누적)</p>
                            </div>
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 영어 패턴별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram st_half" id="id_graph_pattern_one_102801" style="float: left;">
                                <p>패턴별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram st_half" id="id_graph_pattern_total_102801" style="float: right;">
                                <p>패턴별 정답률(누적)</p>
                            </div>
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 영어 패턴별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram" id="id_graph_unit_one_102801">
                                <p>대단원별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram" id="id_graph_unit_total_102801">
                                <p>대단원별 정답률(누적)</p>
                            </div>
                        </div>
                        <div class="st_subject_name">
                            <span>한국사</span> 분석 그래프

                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 한국사 유형별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram st_half" id="id_graph_step_one_102802" style="float: left;">
                                <p>유형별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram st_half" id="id_graph_step_total_102802" style="float: right;">
                                <p>유형별 정답률(누적)</p>
                            </div>
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 한국사 패턴별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram st_half" id="id_graph_pattern_one_102802" style="float: left;">
                                <p>패턴별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram st_half" id="id_graph_pattern_total_102802" style="float: right;">
                                <p>패턴별 정답률(누적)</p>
                            </div>
                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 한국사 패턴별 정답률 분석 그래프
                            </div>
                            <div class="st_diagram" id="id_graph_unit_one_102802">
                                <p>대단원별 정답률(해당 회차별)</p>
                            </div>
                            <div class="st_diagram" id="id_graph_unit_total_102802">
                                <p>대단원별 정답률(누적)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
<script>
    $(document).ready(function(){
        /*
            비효율
            var c01 = $('class01 .st_type_01 span').text();
            var c01_2 = $('class01 .st_type_02 span').text();
            var c02 = $('class02 .st_type_02 span').text();
            var c02_2 = $('class02 .st_type_02 span').text();
            var c03 = $('class02 .st_type_02 span').text();
            var c03_2 = $('class02 .st_type_02 span').text();

            $('.st_type_01').width(n+'%');
            $('.st_type_02').width(n2+'%');
        */

        //성적 값에 따라 그래프 길이조절
        $('.st_graph_item').each(function(){
            var $this = $(this);

            $this.find('.st_graph_bar').each(function(){
                $th = $(this);
                var txt = $th.find('span').text();
                $th.width(0); //왼쪽으로부터 애니메이션 주기 위해 길이값 초기화
                $th.stop().animate({width:txt+'%'},{duration:2000}, 400);
            })
        })
    })
</script>
