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

    if (infoList.result.subjectInfo != null) { //과목 리스트
        var result = infoList.result.subjectInfo;
       innerValue("subjectCtgKey", result[0].subjectCtgKey);
        dwr.util.addOptions('playSubject', result, function (data) {
           return "<a href='javascript:playDepthList("+ data.subjectCtgKey +");' id='"+ data.subjectCtgKey +"'>"+ data.subjectName +"</a>"
        }, {escapeHtml: false});
    }

    if(infoList.result.typeInfo != null){ // 유형 리스트
        var result = infoList.result.typeInfo;
        getPlaySubjectList(result[0].ctgKey); // 강좌 리스트 불러오기
        dwr.util.addOptions('playType', result, function (data) {
            return "<a href='javascript:getPlaySubjectList("+ data.ctgKey +");'>"+ data.ctgName +"</a>"
        }, {escapeHtml: false});
    }
}

function changePlayLectureList(userKey, deviceType) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType
    };

    var infoList = getApi("/myPage/getVideoSignUp/", userKey, data);
    if(infoList.result.typeInfo != null){ // 유형 리스트
        var result = infoList.result.typeInfo;
        getPlaySubjectList(result[0].ctgKey); // 강좌 리스트 불러오기
    }
}

//내강의실 > 동영상 > 유형 > 강좌명 리스트 불러오기
function getVideoSignUpLectureNameList(userKey, deviceType, subjectCtgKey, stepCtgKey) {
    if (userKey == null || userKey == undefined) return;

    var data = {
        deviceType : deviceType,
        subjectCtgKey : subjectCtgKey,
        stepCtgKey : stepCtgKey
    };

    var infoList = getApi("/myPage/getVideoSignUpLectureNameList/", userKey, data);
    if (infoList.result != null) {
        var result = infoList.result;
        if(result.length > 0) {
            getTypeLectureDetail(result[0].jlecKey);
            dwr.util.addOptions('typeLectureList', result, function (data) {
                return "<a href='javascript:getTypeLectureDetail(" + data.jlecKey + ");'>" + data.name + "</a>"
            }, {escapeHtml: false});
        }
    }
}

function getVideoSignUpDetailInfo(jLecKey, device) {
    if (jLecKey == null || jLecKey == undefined) return;

    var detailInfo = getApi("/myPage/getVideoSignUpDetailInfo/", jLecKey);

    var data = {
        device : device
    };
    var infoList = getApi("/product/getLectureList/", jLecKey, data);
    if (infoList.result != null) {
        var selList = infoList.result.lectureList;
        innerHTML("lecCount", infoList.result.totalCnt);
        dwr.util.addRows('dataList', selList, [
            function(data) {return data.num;},
            function(data) {return data.name;},
            function(data) {return data.vodTime;},
            function(data) {return "<a href='' class='black small'>일반화질</a>&nbsp;&nbsp;<a href='' class='blue small'>고화질</a>";},

        ], {escapeHtml:false});
    }

    return detailInfo;
}


//강좌 일시정지 요청, 일시정지 해제
function requestVideoStartStop(jLecKey, pauseDay, requestType) {
    var data = {
        jLecKey : jLecKey,
        pauseDay : pauseDay,
        requestType : requestType
    };
    
}
