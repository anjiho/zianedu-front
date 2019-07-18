//온라인서점 도서 배너 목록
function getBannerList(ctgKey, listLimit, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;

    var data = {
        listLimit : listLimit
    };

    var InfoList = getApi("/bookStore/getBannerList/", ctgKey, data);

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}


//온라인서점 도서 목록(페이징)
function getBookList(leftMenuCtgKey, sPage, listLimit) {
    if (leftMenuCtgKey == null || leftMenuCtgKey == undefined) return;

    var data = {
        sPage : sPage,
        listLimit : listLimit
    };

    var InfoList = getApi("/bookStore/getBookList/", leftMenuCtgKey, data);

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}