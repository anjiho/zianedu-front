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

//좌측 메뉴 카테고리 키 목록 가져오기
function getUserRegSerialList(tagId) {
    var infoList = getApi("/category/getUserRegSerialList","" ,"");

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        var arr = new Array();
        for(var i=0; i<selList.length;i++){
            var data = {
                name : selList[i].name,
                id : selList[i].ctgKey
            };
            arr.push(data);
        }
        dwr.util.addOptions(tagId, arr, "id", "name");
    }
}