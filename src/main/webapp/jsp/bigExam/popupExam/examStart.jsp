<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="/common/zian/css/big_layout.css">
<script src="/common/zian/js/kiplayer/jquery.min.js"></script>
<script src="/common/js/common.js"></script>
<script src="/common/js/rest-api.js"></script>
<script src="/common/js/view/exam-controller.js"></script>
<%
    String examKey = request.getParameter("examKey");
%>
<script>
    var examKey = <%=examKey%>;
    $(document).ready(function(){
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        if(examKey != ""){
            var examInfo = getExamMasterGateInfo(examKey, sessionUserInfo.userKey);
            if(examInfo.result != null){
                innerValue('examUserKey', examInfo.result.examUserKey);
                var basicInfo = examInfo.result.examBasicInfo;
                innerHTML('title', basicInfo.name);
                innerHTML('onlineTime', basicInfo.onlineTime);
                innerHTML('questionCount', basicInfo.questionCount);
                var subjectName = examInfo.result.examSubjectName;
                innerHTML('subjectTitle', subjectName);
            }
        }
    });

    function onStart(examKey){
        var examUserKey = getInputTextValue('examUserKey');
        location.href = "/bigExam?page_gbn=popupExamList&examUserKey="+41234;
    }
</script>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>기출문제</title>
    <title>빅모의고사 팝업시험</title>
    <title></title>
</head>
<body>
<div class="st_exam">
    <form action="/" id="id_frm" method="post" name="name_frm">	<input type="hidden" name="j_curri_key" value="0" />
        <input type='hidden' id="examUserKey" name="examUserKey">
        <div class="st_exam_test">
            <div class="st_start">
                <div class="st_title_box">
                    <div class="st_title_line"></div>
                    <div class="st_title">
                        <div class="st_text" id="title">

                        </div>
                    </div>
                </div>

                <div class="st_subjects">
                    <div class="st_tit_box">
                        <p class="st_subTit" id="subjectTitle"></p>
                        <p class="st_idx">각 <span id="onlineTime"></span>문항</p>
                        <p class="st_time">총 <span id="questionCount"></span>분</p>
                    </div>
                </div>
                <div style="margin: 20px auto">
                    <img src="/common/zian/images/bigimg/button_start.png" alt="시험시작하기" title="시험시작하기" onclick="onStart(<%=examKey%>);" style="cursor: pointer;" />
                </div>
                <div class="st_clip"></div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
