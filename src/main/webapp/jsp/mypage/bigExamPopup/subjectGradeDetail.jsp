<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String examUserKey = request.getParameter("examUserKey");
%>
<%@include file="/common/jsp/exam_popup_common.jsp" %>
<script>
    $( document ).ready(function() {
        var examUserKey = '<%=examUserKey%>';
        getAchievementManagementDetailInfoBySubject(examUserKey);
    });
</script>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>기출문제</title>
    <title>빅모의고사 팝업시험</title>
    <link type="text/css" rel="stylesheet" href="../css/big_layout.css">
    <script type="text/javascript" src="../js/kiplayer/jquery.min.js"></script>
    <title></title>
    <style type="text/css">
        #id_chart{
            display:		none;
            position:		absolute;
            width:			400px;
            height:			200px;
            left:			0px;
            top:			0px;
            background:		#ffffff;
            border:			1px solid #999999;
            padding-top:	10px;
        }

        .st_exam_test
        {
            overflow-x:	hidden !important;
            overflow-y:	auto !important;
            width:		100% !important;
        }
    </style>
</head>
<body>
<div class="st_exam">
    <form action="" id="frm" method="get" name="frm">
        <input type="hidden" name="page_gbn" id="page_gbn">
        <input id="examUserKey" name="examUserKey" type="hidden" value="<%=examUserKey%>" />
        <div class="st_exam_test">
            <div class="st_test_main" style="background-image: none;">
                <div class="st_top_line"></div>
                <div class="st_content st_analysis">
                    <div class="st_title" id="examName"></div>
                    <div class="st_info">
                        <ul>
                            <li>
                                <div></div>
                                <b>응시과목: </b><span id="subjectName"></span></li>
                            <li><div></div><b>시험일: </b><span id="examDate"></span></li>
                            <li><div></div><b>응시번호: </b><span id="serial"></span></li>
                            <li><div></div><b>이름: </b><span id="userName"></span></li>
                        </ul>
                    </div>
                    <div class="st_analysis_tab">
                        <ul>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_left.png" alt="left" /></li>
                            <li class="sts_button" data-index="0">
                                <div>
                                    <a href="javascript:goPage('myPage','gradeAllList');"><img src="/common/zian/images/bigimg/img_tabmenu_01_off.png" alt="성적 전체분석" title="성적 전체분석" /></a>
                                </div>
                            </li>
                            <li class="sts_button" data-index="1">
                                <div>
                                    <a href="javascript:goPage('myPage','subjectGradeDetail');"><img src="/common/zian/images/bigimg/img_tabmenu_02_on.png" alt="과목별 성적 상세분석" title="과목별 성적 상세분석" /></a>
                                </div>
                            </li>
                            <li><img src="/common/zian/images/bigimg/img_tabbg_right.png" alt="right" /></li>
                        </ul>
                    </div>
                    <div id="id_chart"></div>

                    <div id="dataList"></div>

                </div>
                <div style="height: 300px"></div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
