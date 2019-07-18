//좌측 메뉴 리스트 가져오기
function getLeftMenu(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/menu/getLeftMenu/", ctgKey,"");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//교수소개 좌측메뉴 가져오기
function getTeacherIntroduceLeftMenu(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/menu/getTeacherIntroduceLeftMenu/", ctgKey,"");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

//기술직동영상 > 지안패스 > 좌측 가져오기
function getTechVodZianPassLeftMenu(tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/menu/getTechVodZianPassLeftMenu/", "","");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}