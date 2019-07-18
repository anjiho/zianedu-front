//좌측 메뉴 카테고리 키 목록 가져오기
function getLeftMenuCtgKey(tagId) {
    var InfoList = getApi("/category/getLeftMenuCtgKey","" ,"");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}