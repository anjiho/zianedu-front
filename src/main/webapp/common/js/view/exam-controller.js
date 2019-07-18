//진단평가 > 성적관리 리스트
function getDiagnosisAchievementManagementList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/exam/getDiagnosisAchievementManagementList/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//진단평가 > 진단평가 리스트
function getDiagnosisEvaluationExamList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/exam/getDiagnosisEvaluationExamList/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//기출문제 > 성적관리 리스트
function getGichulAchievementManagementList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/exam/getGichulAchievementManagementList/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//기출문제 > 기출문제 리스트
function getGichulProblemList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/exam/getGichulProblemList/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}

//주간모의고사 > 빅모의고사(온라인) 리스트
function getWeekBigExamList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/exam/getGichulProblemList/", userKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            /*
                TODO : addoption 추가
             */
            //function(data) {return data.fullFileUrl;}
        ], {escapeHtml:false});
    }
}