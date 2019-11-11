//강사소개 > 학원 강좌 정보
function getTeacherAcademyLecture(teacherKey, stepCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        stepCtgKey: stepCtgKey
    };
    var InfoList = getApi("/teacher/getTeacherAcademyLecture/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사 홈 정보
function getTeacherHomeInfo(teacherKey, device, menuCtgKey, listLimit) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        device : device,
        menuCtgKey : menuCtgKey,
        listLimit : listLimit
    };
    var infoList = getApi("/teacher/getTeacherHomeInfo/", teacherKey, data);
    var result = infoList.result.teacherInfo;
    console.log(result);
    $("#teacherImg").attr("src", result.imageListUrl);
    innerHTML("history", result.history);
    innerHTML("youtube", result.youtubeUrl);
    // innerHTML("teacherName", "");
}

function getTeacherNameSubjectName(teacherKey, menuCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        reqKey : menuCtgKey
    };
    var infoList = getApi("/teacher/getTeacherNameSubjectName/", teacherKey, data);
    console.log(infoList);
    var result = infoList.result;
    innerHTML("subject", result.subjectName);
    innerHTML("teacherName", result.teacherName);
    // console.log(result);
    // $("#teacherImg").attr("src", result.imageListUrl);
    // innerHTML("history", result.history);
    // innerHTML("youtube", result.youtubeUrl);
    // innerHTML("teacherName", "");
}

//직렬별 교수소개 리스트
function getTeacherIntroduceList(ctgKey, pos, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        pos : pos
    };
    var InfoList = getApi("/teacher/getTeacherIntroduceList/", ctgKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 학습 Q/A
function getTeacherLearningQna(teacherKey, sPage, listLimit, searchType, searchText, tagId) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var InfoList = getApi("/teacher/getTeacherLearningQna/", teacherKey, data);
                   //getPageApi 확인필요

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 학습Q/A 상세정보
function getTeacherLearningQnaDetail(teacherKey, bbsKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        bbsKey : bbsKey
    };
    var InfoList = getApi("/teacher/getTeacherLearningQnaDetail/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 수강후기, 온라인 상품 상세 > 회원리뷰
function getTeacherLectureReview(teacherKey, gKey, sPage, listLimit) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        gKey : gKey,
        sPage : sPage,
        listLimit : listLimit
    };
    var InfoList = getPageApi("/teacher/getTeacherLectureReview/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 학습 자료실
function getTeacherReferenceRoom(teacherKey, sPage, listLimit, searchType,  searchText, tagId) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var InfoList = getPageApi("/teacher/getTeacherReferenceRoom/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 학습자료실 상세정보
function getTeacherReferenceRoomDetail(teacherKey, bbsKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        bbsKey : bbsKey
    };
    var InfoList = getApi("/teacher/getTeacherReferenceRoomDetail/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//강사소개 > 수강후기 > 강사의 상품목록 셀렉트박스
function getTeacherVideoAcademyProductList(teacherKey) {
    if (teacherKey == null || teacherKey == undefined) return;

    var InfoList = getApi("/teacher/getTeacherVideoAcademyProductList/", teacherKey, "");
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}


//강사소개 > 동영상 강좌 정보
function getTeacherVideoLecture(teacherKey, stepCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    var data = {
        stepCtgKey : stepCtgKey
    };
    var InfoList = getApi("/teacher/getTeacherVideoLecture/", teacherKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

// 강사 커리큘럼 정보
function getTeacherCurriculum(teacherKey, device, menuCtgKey) {
    if (teacherKey == null || teacherKey == undefined) return;
    if (menuCtgKey == null || menuCtgKey == undefined) return;
    var data = {
        device : device,
        menuCtgKey : menuCtgKey
    };

    var infoList = getResultStrApi("/teacher/getTeacherCurriculum/", teacherKey, data);
    console.log(infoList);
    if (infoList.result != null) {
        var selList = infoList.result;
        innerHTML("curriculum", selList);
    }else{
        innerHTML("curriculum", "");
    }

}