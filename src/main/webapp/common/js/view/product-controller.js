//학원별 학원수강신청 상품 리스트
function getAcademyLectureListFromCategoryMenu(ctgKey, stepCtgKey, teacherKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        stepCtgKey: stepCtgKey,
        teacherKey : teacherKey
    };
    var InfoList = getApi("/product/getAcademyLectureListFromCategoryMenu/", ctgKey, data);
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

//학원수강 상품 상세정보
function getAcademyProductDetail(gKey) {
    if (gKey == null || gKey == undefined) return;
    var InfoList = getApi("/product/getAcademyProductDetail/", gKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//학원별 무료 동영상강의 상품 리스트
function getFreeVideoLectureListFromCategoryMenu(ctgKey, device, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        device: device
    };
    var InfoList = getApi("/product/getFreeVideoLectureListFromCategoryMenu/", ctgKey, data);
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

//모의고사 상품 리스트
function getMockExamListFromCategoryMenu(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/product/getMockExamListFromCategoryMenu/", ctgKey);
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

//특별 패키지 상품 상세정보
function getAcademyProductDetail(gKey) {
    if (gKey == null || gKey == undefined) return;
    var InfoList = getApi("/product/getAcademyProductDetail/", gKey);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}

//특별 패키지 상품 리스트
function getSpecialPackageList(tagId) {
    var InfoList = getApi("/product/getSpecialPackageList/", "","");
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

//학원별 동영상강의 상품 리스트
function getVideoLectureListFromCategoryMenu(ctgKey, stepCtgKey, teacherKey) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        stepCtgKey : stepCtgKey,
        teacherKey : teacherKey,
    };
    var InfoList = getApi("/product/getVideoLectureListFromCategoryMenu/", ctgKey, data);
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

//동영상 강좌 상품 상세정보
function getVideoProductDetail(gKey, device) {
    if (gKey == null || gKey == undefined) return;
    var data = {
        device : device
    };
    var InfoList = getApi("/product/getVideoProductDetail/", gKey, data);
    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
    }
}