//내 강의실 > 학원수강내역
function getAcademySignUp(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/myPage/getAcademySignUp/", userKey);
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

//내 강의실 > 수강중인강좌 > 수강중인강좌 상세정보 > 회원리뷰
function getGoodsReview(jLecKey, sPage, listLimit, tagId) {
    if (jLecKey == null || jLecKey == undefined) return;

    var data = {
        sPage : sPage,
        listLimit : listLimit
    };

    var InfoList = getApi("/myPage/getGoodsReview/", jLecKey, data);
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

//내 강의실 > 수강중인강좌 > 수강중인강좌 상세정보
function getOnlineLectureDetail(jLecKey, tagId) {
    if (jLecKey == null || jLecKey == undefined) return;
    var InfoList = getApi("/myPage/getOnlineLectureDetail/", jLecKey);
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

//내 강의실 > 수강중인강좌 > 수강중인강좌 상세정보 > 강좌목차
function getOnlineLectureSubjectList(jLecKey, tagId) {
    if (jLecKey == null || jLecKey == undefined) return;
    var InfoList = getApi("/myPage/getOnlineLectureSubjectList/", jLecKey);
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

//내 강의실 > 수강완료강좌 리스트
function getOnlineVideoEndList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/myPage/getOnlineVideoEndList/", userKey);
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

//내 강의실 > 일시정지강좌 리스트
function getOnlineVideoPauseList(userKey, tagId) {
    if (userKey == null || userKey == undefined) return;
    var InfoList = getApi("/myPage/getOnlineVideoPauseList/", userKey);
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

//내 강의실 > 수강중인강좌(프로모션)
function getPromotionSignUp(userKey, deviceType, tagId) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType
    };

    var InfoList = getApi("/myPage/getPromotionSignUp/", userKey, data);
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

//내 강의실 > 수강중인강좌 > 동영상 수강중인강좌 > 일시정지 버튼 클릭 팝업 데이터
function getVideoPauseRequestPopup(jLecKey, tagId) {
    if (jLecKey == null || jLecKey == undefined) return;
    var InfoList = getApi("/myPage/getVideoPauseRequestPopup/", jLecKey);
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

//내 강의실 > 수강중인강좌(동영상)
function getVideoSignUp(userKey, deviceType) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType
    };

    var infoList = getApi("/myPage/getVideoSignUp/", userKey, data);

    if (infoList.result.subjectInfo != null) {
        var result = infoList.result.subjectInfo;
        console.log(result);
        dwr.util.addOptions('playSubject', result, function (data) {
           return "<a href='javascript:playDepthList("+ data.subjectCtgKey +");'>"+ data.subjectName +"</a>"
        }, {escapeHtml: false});
    }
}

//내 강의실 > 수강중인강좌(동영상) > 유형불러오기
function getVideoTypeList(userKey, deviceType, ctgKey) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType
    };

    var infoList = getApi("/myPage/getVideoSignUp/", userKey, data);

    if (infoList.result.subjectInfo != null) {
        var result = infoList.result.typeInfo;
        console.log(result);
        dwr.util.addOptions('playType', result, function (data) {
            return "<a href='javascript:getPlaySubjectList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
        }, {escapeHtml: false});
    }
}



//강좌 일시정지 요청, 일시정지 해제
function requestVideoStartStop(jLecKey, pauseDay, requestType) {
    var data = {
        jLecKey : jLecKey,
        pauseDay : pauseDay,
        requestType : requestType
    };
    
}
