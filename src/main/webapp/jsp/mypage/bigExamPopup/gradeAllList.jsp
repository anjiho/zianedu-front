<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/exam_common.jsp" %>
<%
    String examUserKey = request.getParameter("examUserKey");
%>
<!-- 차트 관련 스크립트 -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<style type="text/css">
    g.labels{min-height:200px !important;}
    svg{top: 100px;}
    .st_exam_test{overflow-x:hidden !important;overflow-y:initial !important;width:100% !important;}
</style>
<script>
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
        var result = "";
        if (examCompareTotalStaticsInfo.length > 0) {
            var selList =  examCompareTotalStaticsInfo;
            for (var i=0; i<examCompareTotalStaticsInfo.length; i++) {
                result += "<div class=\"st_graph_item\"> " +
                            "<table> " +
                                "<tbody> " +
                                    "<tr> " +
                                        "<td class=\"st_name\">" + selList[i].subjectName  + "</td> " +
                                        "<td> " +
                                            "<div class=\"st_graph_view\"> " +
                                                "<div class=\"st_graph_bar st_type_01\"> " +
                                                    "<span>" + selList[i].mySubjectScore + "</span> " +
                                                "</div> " +
                                                "<div class=\"st_graph_bar st_type_02\"> " +
                                                    "<span>" + selList[i].totalSubjectScore + "</span> " +
                                                "</div> " +
                                            "</div> " +
                                        "</td> " +
                                    "</tr> " +
                                "</tbody> " +
                            "</table> " +
                            "</div>";
            }
            innerHTML("st_graph", result);
        }

        var userStaticsScore = achievementResult.result.userStaticsScore;
        var totalStaticsScore = achievementResult.result.totalStaticsScore;
        innerHTML("l_myStatics", userStaticsScore);
        innerHTML("l_totalStatics", totalStaticsScore);
        //과목별 평균 리스트
        var subjectStaticsInfo = achievementResult.result.subjectStaticsInfo;
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
        //점수비교 그래프
        var subjectStaticsGraphInfo = achievementResult.result.subjectStaticsGraphInfo;
        Highcharts.chart('container', {
            chart: {
                type: 'column'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: '<b>점수비교</b>'
            },
            xAxis: {
                categories: subjectStaticsGraphInfo.categoryName,
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: '점수'
                },
                max: 100
            },

            plotOptions: {
            },
            credits: {
                enabled : false
            },
            series: [{
                name: '상위10%',
                data: subjectStaticsGraphInfo.categoryTopTenData

            }, {
                name: '상위30%',
                data: subjectStaticsGraphInfo.categoryTopThirtyData

            }, {
                name: '내 점수',
                data: subjectStaticsGraphInfo.categoryMyData

            }]
        });
        //점수비교 평균 그래프
        var compareScoreGraphInfo = achievementResult.result.compareScoreGraphInfo;
        Highcharts.chart('container2', {
            chart: {
                type: 'column'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: '<b>점수비교 평균</b>'
            },
            xAxis: {
                categories: ['평균'],
                crosshair: true,
                labels: {
                    enabled:false,//default is true
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '점수'
                }
            },
            plotOptions: {},
            credits: {
                enabled : false
            },
            series: compareScoreGraphInfo.series
        });

        var subjectAnalysisGraphInfo = achievementResult.result.subjectAnalysisGraphInfo;
        if (subjectAnalysisGraphInfo.length > 0) {
            var result = "";
            for (var i = 0; i < subjectAnalysisGraphInfo.length; i++) {
                var cmpList = subjectAnalysisGraphInfo[i]
                result += "<div class=\"st_subject_name\">\n" +
                    "                            <span><b>" + cmpList.subjectName + "</span> 분석 그래프</b>\n" +
                    "                        </div>\n" +
                    "                        <div class=\"st_analysis_section\">\n" +
                    "                            <div class=\"st_sction_title\">\n" +
                    "                                <img src=\"/common/zian/images/bigimg/icon_point_check_0001.png\" alt=\"\" />" + cmpList.subjectName + " 유형별 정답률 분석 그래프\n" +
                    "                            </div>\n" +
                    "                            <div class='st_diagram st_half' id='type_score_graph" + i + "'  style='float: left;'>\n" +
                    "                                <p>유형별 정답률(해당 회차별)</p>\n" +
                    "                            </div>\n" +
                    "                            <div class='st_diagram st_half' id='type_score_total_graph" + i + "' style='float: right;'>\n" +
                    "                                <p>유형별 정답률(누적)</p>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                        <div class=\"st_analysis_section\">\n" +
                    "                            <div class=\"st_sction_title\">\n" +
                    "                                <img src=\"/common/zian/images/bigimg/icon_point_check_0001.png\" alt=\"\" />" + cmpList.subjectName + " 패턴별 정답률 분석 그래프\n" +
                    "                            </div>\n" +
                    "                            <div class='st_diagram st_half' id='pattern_score_graph" + i + "' style='float: left;'>\n" +
                    "                                <p>패턴별 정답률(해당 회차별)</p>\n" +
                    "                            </div>\n" +
                    "                            <div class='st_diagram st_half' id='pattern_score_total_graph" + i + "' style='float: right'>\n" +
                    "                                <p>패턴별 정답률(누적)</p>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                        <div class=\"st_analysis_section\">\n" +
                    "                            <div class=\"st_sction_title\">\n" +
                    "                                <img src=\"/common/zian/images/bigimg/icon_point_check_0001.png\" alt=\"\" />" + cmpList.subjectName + " 패턴별 정답률 분석 그래프\n" +
                    "                            </div>\n" +
                    "                            <div class='st_diagram' id='unit_score_graph" + i + "'>\n" +
                    "                                <p>대단원별 정답률(해당 회차별)</p>\n" +
                    "                            </div>\n" +
                    "                            <div class='st_diagram' id='unit_score_total_graph" + i + "'>\n" +
                    "                                <p>대단원별 정답률(누적)</p>\n" +
                    "                            </div>\n" +
                    "                        </div>\n";

            }
            innerHTML("l_graphInfo", result);

            for (var i = 0; i < subjectAnalysisGraphInfo.length; i++) {
                var cmpList = subjectAnalysisGraphInfo[i];
                //유형별 정답률(해당 회차별)
                Highcharts.chart('type_score_graph'+i, {
                    chart: { type: 'column' },
                    title: { text: '' },
                    subtitle: { text: '<b>유형별 정답률(해당 회차별)</b>' },
                    xAxis: {
                        categories: cmpList.scoreRateByTypeInfo.ctgNames,
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: '개수'
                        }
                    },
                    plotOptions: {},
                    credits: {
                        enabled: false
                    },
                    series: [{
                        name: '맞은 개수',
                        data: cmpList.scoreRateByTypeInfo.scoreCnts

                    }, {
                        name: '출제된 개수',
                        data: cmpList.scoreRateByTypeInfo.problemCnts

                    }]
                });
                //유형별 정답률(누적)
                Highcharts.chart('type_score_total_graph'+i, {
                    chart: { type: 'column'},
                    title: { text: '' },
                    subtitle: { text: '<b>유형별 정답률(누적)</b>' },
                    xAxis: {
                        categories: cmpList.scoreRateByTypeInfo2.ctgNames,
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: { text: '개수' }
                    },
                    plotOptions: {},
                    credits: { enabled: false },
                    series: [{
                        name: '맞은 개수',
                        data: cmpList.scoreRateByTypeInfo2.scoreCnts

                    }, {
                        name: '출제된 개수',
                        data: cmpList.scoreRateByTypeInfo2.problemCnts

                    }]
                });
                //패턴별 정답률(해당 회차별)
                Highcharts.chart('pattern_score_graph'+i, {
                    chart: { type: 'column'},
                    title: { text: '' },
                    subtitle: { text: '<b>패턴별 정답률(해당 회차별)</b>' },
                    xAxis: {
                        categories: cmpList.scoreRateByPatternInfo.ctgNames,
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: { text: '개수' }
                    },
                    plotOptions: {},
                    credits: { enabled: false },
                    series: [{
                        name: '맞은 개수',
                        data: cmpList.scoreRateByPatternInfo.scoreCnts

                    }, {
                        name: '출제된 개수',
                        data: cmpList.scoreRateByPatternInfo.problemCnts

                    }]
                });
                //패턴별 정답률(누적)
                Highcharts.chart('pattern_score_total_graph'+i, {
                    chart: { type: 'column'},
                    title: { text: '' },
                    subtitle: { text: '<b>패턴별 정답률(누적)</b>' },
                    xAxis: {
                        categories: cmpList.scoreRateByPatternInfo2.ctgNames,
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: { text: '개수' }
                    },
                    plotOptions: {},
                    credits: { enabled: false },
                    series: [{
                        name: '맞은 개수',
                        data: cmpList.scoreRateByPatternInfo2.scoreCnts

                    }, {
                        name: '출제된 개수',
                        data: cmpList.scoreRateByPatternInfo2.problemCnts

                    }]
                });

                //대단원별 정답률(해당 회차별)
                Highcharts.chart('unit_score_graph'+i, {
                    chart: { type: 'column'},
                    title: { text: '' },
                    subtitle: { text: '<b>대단원별 정답률(해당 회차별)</b>' },
                    xAxis: {
                        categories: cmpList.scoreRateByUnitInfo.ctgNames,
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: { text: '개수' }
                    },
                    plotOptions: {},
                    credits: { enabled: false },
                    series: [{
                        name: '맞은 개수',
                        data: cmpList.scoreRateByUnitInfo.scoreCnts

                    }, {
                        name: '출제된 개수',
                        data: cmpList.scoreRateByUnitInfo.problemCnts

                    }]
                });
                //대단원별 정답률(누적)
                Highcharts.chart('unit_score_total_graph'+i, {
                    chart: { type: 'column'},
                    title: { text: '' },
                    subtitle: { text: '<b>대단원별 정답률(누적)</b>' },
                    xAxis: {
                        categories: cmpList.scoreRateByUnitInfo2.ctgNames,
                        crosshair: true
                    },
                    yAxis: {
                        min: 0,
                        title: { text: '개수' }
                    },
                    plotOptions: {},
                    credits: { enabled: false },
                    series: [{
                        name: '맞은 개수',
                        data: cmpList.scoreRateByUnitInfo2.scoreCnts

                    }, {
                        name: '출제된 개수',
                        data: cmpList.scoreRateByUnitInfo2.problemCnts

                    }]
                });
            }
        }

    }



    $(document).ready(function(){
        var examUserKey = '<%=examUserKey%>';
        getAchievementManagementDetailInfo(examUserKey);

    })
</script>

<div class="st_exam">
    <form action="" id="frm" method="get" name="frm">
        <input type="hidden" name="page_gbn" id="page_gbn">
        <input id="examUserKey" name="examUserKey" type="hidden" value="<%=examUserKey%>" />
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
                                    <a href="javascript:goPage('myPage','gradeAllList');"><img src="/common/zian/images/bigimg/img_tabmenu_01_on.png" alt="성적 전체분석" title="성적 전체분석" /></a>
                                </div>
                            </li>
                            <li class="sts_button" data-index="1">
                                <div>
                                    <a href="javascript:goPage('myPage','subjectGradeDetail');"><img src="/common/zian/images/bigimg/img_tabmenu_02_off.png" alt="과목별 성적 상세분석" title="과목별 성적 상세분석" /></a>
                                </div>
                            </li>
                            <!--<li class="sts_button" data-index="2">
                                <div>
                                    <a href="userQuestion.html"><img src="../images/bigimg/img_tabmenu_03_off.png" alt="오답노트" title="오답노트" /></a>
                                </div>
                            </li>-->
                            <li><img src="/common/zian/images/bigimg/img_tabbg_right.png" alt="right" /></li>
                        </ul>
                    </div>

                    <div class="st_analysis_main">
                        <div class="st_analysis_section">
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

                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 개인성적 종합분석
                            </div>
                            <table id="id_record" style="margin-top: 0px; width: 1000px; float: left;">
                                <colgroup>
                                    <col style="width: 150px" />
                                    <col style="width: 150px;" />
                                    <col style="width: 150px;" />
                                    <col style="width: 150px;" />
                                    <col style="width: 150px;" />
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
                                    <span id="st_graph"></span>
                                    <div class="st_bar_explain">
                                        <img src="/common/zian/images/bigimg/analysis_graph_text.png" alt="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="st_analysis_section" style="margin-top: 20px;">
                            <div class="st_sction_title">
                                <img src="/common/zian/images/bigimg/icon_point_check_0001.png" alt="" /> 과목별 평균
                            </div>

                            <table id="id_record_subject" style="margin-top: 0px; width: 1000px; float: left;">
                                <colgroup>
                                    <col style="width: 160px" />
                                    <col style="width: 140px;" />
                                    <col style="width: 140px;" />
                                    <col style="width: 140px;" />
                                    <col style="width: 140px;" />
                                    <col style="width: 140px;" />
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
                            <div class="st_diagram st_half" id="container" style="float: left;">
                            </div>
                            <div class="st_diagram st_half" id="container2" style="float: right;">
                            </div>
                        </div>
                        <span id="l_graphInfo"></span>
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
