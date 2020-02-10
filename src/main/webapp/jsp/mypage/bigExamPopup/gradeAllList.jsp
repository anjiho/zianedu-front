<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script src="/common/zian/js/kiplayer/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/common/zian/css/big_layout.css">
<script src="/common/js/common.js"></script>
<script src="/common/zian/js/common.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>기출문제</title>
    <title>빅모의고사 팝업시험</title>
    <%--    <link type="text/css" rel="stylesheet" href="../css/big_layout.css">--%>
    <%--    <script type="text/javascript" src="../js/kiplayer/jquery.min.js"></script>--%>
    <title></title>
    <%--    <link href="/lib/UI/Nwagon/Nwagon.css" rel="stylesheet" type="text/css"/>--%>
<%--    <script type="text/javascript" src="/lib/UI/Nwagon/Nwagon.js"></script>--%>
    <style type="text/css">
        g.labels{min-height:200px !important;}
        svg{top: 100px;}
        .st_exam_test{overflow-x:hidden !important;overflow-y:initial !important;width:100% !important;}
    </style>
    <script type="text/javascript">
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
</head>
<body>
<div class="st_exam">
    <form action="/" id="id_frm" method="post" name="name_frm">
        <input id="exam_user_key" name="exam_user_key" type="hidden" value="42902" />
        <div class="st_exam_test" style="overflow-y:auto;width:1152px;">
            <div class="st_test_main" style="background-image: none;">
                <div class="st_top_line"></div>
                <div class="st_content st_analysis" style="">
                    <div class="st_title">빅주간(전범위)모의고사_공통과목_16회</div>
                    <div class="st_info">
                        <ul>
                            <li>
                                <div></div>
                                <b>응시과목: </b>국어, 영어, 한국사
                            </li>
                            <li>
                                <div></div>
                                <b>시험일: </b>2020년 01월 02일
                            </li>
                            <li>
                                <div></div>
                                <b>응시번호: </b>02042827
                            </li>
                            <li>
                                <div></div>
                                <b>이름: </b>지안에듀
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
                                <tbody>
                                <tr>
                                    <td><b>국어</b></td>
                                    <td>0/20</td>
                                    <td>0/100</td>
                                    <td></td>
                                    <td>30/53</td>
                                    <td>
                                        <span class="">과락</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>영어</b></td>
                                    <td>3/20</td>
                                    <td>15/100</td>
                                    <td>78.3</td>
                                    <td>29/53</td>
                                    <td>
                                        <span class="">과락</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>한국사</b></td>
                                    <td>0/20</td>
                                    <td>0/100</td>
                                    <td>85.7%</td>
                                    <td>46/53</td>
                                    <td>
                                        <span class="">과락</span>
                                    </td>
                                </tr>
                                <tr class="st_result">
                                    <td><b>평균</b></td>
                                    <td>1.2</td>
                                    <td>6</td>
                                    <td></td>
                                    <td>45/53</td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                        <div class="st_analysis_section">
                            <div class="st_sction_title">
                                <img src="/Content/image/icon/icon_point_check_0001.png" alt="" /> 전체평균과 본인 성적 비교 그래프
                            </div>
                            <div class="st_graph">
                                <div class="st_graph_02">
                                    <div class="st_graph_item">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="st_name">국어</td>
                                                <td>
                                                    <div class="st_graph_view">
                                                        <div class="st_graph_bar st_type_01">
                                                            <span>100</span>
                                                        </div>
                                                        <div class="st_graph_bar st_type_02">
                                                            <span>56.93</span>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="st_graph_item">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="st_name">영어</td>
                                                <td>
                                                    <div class="st_graph_view">
                                                        <div class="st_graph_bar st_type_01">
                                                            <span>5</span>
                                                        </div>
                                                        <div class="st_graph_bar st_type_02">
                                                            <span>38.6</span>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="st_graph_item">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="st_name">한국사</td>
                                                <td>
                                                    <div class="st_graph_view" >
                                                        <div class="st_graph_bar st_type_01">
                                                            <span>0</span>
                                                        </div>
                                                        <div class="st_graph_bar st_type_02">
                                                            <span>62.13</span>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="st_bar_explain">
                                        <img src="/common/zian/images/bigimg/analysis_graph_text.png" alt="" />
                                    </div>
                                </div>
                            </div>
                            <div class="st_total_result">
                                <div class="st_arrow">
                                    <div>
                                        <span>지안에듀</span> 님의<br />
                                        평균 성적과 전체 평균의<br />
                                        비교 분석 결과입니다.
                                    </div>
                                </div>
                                <div class="st_score_board">
                                    <div class="st_title">본인 평균</div>
                                    <div class="st_score">11.67</div>
                                </div>
                                <div class="st_score_vs"></div>
                                <div class="st_score_board">
                                    <div class="st_title">전체 평균</div>
                                    <div class="st_score">52.56</div>
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
                                    <td>국어</td>
                                    <td>영어</td>
                                    <td>한국사</td>
                                    <td></td>
                                    <td></td>
                                    <td>총점</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>상위10%</td>
                                    <td>90</td>
                                    <td>79.3</td>
                                    <td>95</td>
                                    <td></td>
                                    <td></td>
                                    <td>264.3</td>
                                </tr>
                                <tr>
                                    <td>상위30%</td>
                                    <td>84.5</td>
                                    <td>69.5</td>
                                    <td>88.9</td>
                                    <td></td>
                                    <td></td>
                                    <td>242.9</td>
                                </tr>
                                <tr>
                                    <td>내 점수</td>
                                    <td>30</td>
                                    <td>5</td>
                                    <td>0</td>
                                    <td></td>
                                    <td></td>
                                    <td>35</td>
                                </tr>
                                <tr class="st_result">
                                    <td>전체</td>
                                    <td>56.9</td>
                                    <td>38.6</td>
                                    <td>62.1</td>
                                    <td></td>
                                    <td></td>
                                    <td>157.7</td>
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
