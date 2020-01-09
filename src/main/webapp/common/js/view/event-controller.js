function eventList(idx) {
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/event/eventList/", bbsMasterKey, data);
    var cnt = infoList.cnt;
    //if (infoList.result.length > 0) {
    var selList = infoList.result;
    paging.count(sPage, cnt, '10', listLimit, comment.blank_list);
    for(var i=0; i < selList.length; i++){
        var cmpList = selList[i];

    }
    dwr.util.addOptions('dataList', selList, formatter, {escapeHtml:false});
    //}
}

function saveEventInfo(eventTitle, eventDesc, eventStartDate, eventEndDate, targetName, thumbnailFileName, targetUrl) {
    var data = {
        eventTitle : eventTitle,
        eventDesc : eventDesc,
        eventStartDate : eventStartDate,
        eventEndDate : eventEndDate,
        targetName : targetName,
        thumbnailFileName : thumbnailFileName,
        targetUrl : targetUrl
    };
    console.log(data);
    var result = postApi("/event/saveEventInfo", data);
    console.log(result);
    return result;
}