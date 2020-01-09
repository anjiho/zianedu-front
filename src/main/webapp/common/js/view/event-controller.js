function eventList(eventType, sPage, listLimit, searchType, searchText) {
    var paging = new Paging();

    var data = {
        sPage : sPage,
        listLimit : listLimit,
        searchType : searchType,
        searchText : searchText
    };
    var infoList = getPageApi("/event/eventList/", eventType, data);
    var cnt = infoList.cnt;
    innerHTML('evenCnt', cnt+'개');
    //if (infoList.result.length > 0) {
    var selList = infoList.result;
    paging.count(sPage, cnt, '10', listLimit, comment.blank_list);
    for(var i=0; i < selList.length; i++){
        var cmpList = selList[i];
        var returnHtml = "<div class=\"col\">";
        returnHtml += "<div class=\"imgbox2\">";
        returnHtml += "<a href=\"javascript:\"><img src='"+ cmpList.thumbnailPath +"'></a>";
        returnHtml += "</div>";
        returnHtml += "<div class=\"infobox\">";
        returnHtml += "<a href='javascript:detailEvent("+ cmpList.idx +");' class=\"title\">"+ cmpList.eventTitle +"</a>";
        returnHtml += "<span class=\"date\">게시일 "+ cmpList.createDate +"</span>";
        returnHtml += "<ul class=\"info\">";
        returnHtml += "<li><span class=\"btn_line\">기간</span>"+ cmpList.eventTerm +"</li>";
        returnHtml += "<li class=\"pl30\"><span class=\"btn_line\">대상</span>"+ cmpList.targetName +"</li>";
        returnHtml += "</ul>";
        returnHtml += "<ul class=\"list\">";
        returnHtml += "<li>"+ cmpList.eventDesc +"</li>";
       // returnHtml += "<li>8월까지 마감! 온라인학원 수강생분들 서두르세요~~</li>";
        returnHtml += " </ul>";
        returnHtml += " </div>";
        returnHtml += "</div>";
        $("#eventDiv").append(returnHtml);
    }
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
    var result = postApi("/event/saveEventInfo", data);
    return result;
}

function eventDetailInfo(idx) {
    if (idx == null || idx == undefined) return;

    var infoList = getApi("/event/eventDetailInfo/", idx, '');
    if (infoList != null) {
        var selList = infoList.result;
        var eventDate = selList.eventStartDate + " ~ " + selList.eventEndDate;
        innerHTML('eventDate', eventDate);
        innerHTML('eventTitle', selList.eventDesc);
        $("#eventImg").attr("src", selList.targetUrl);

        window.location = selList.targetUrl + "&idx=" + idx;
        //window.location = selList.targetUrl;
            return infoList;
    }
}

function eventUpdateDetailInfo(idx) {
    if (idx == null || idx == undefined) return;

    var infoList = getApi("/event/eventDetailInfo/", idx, '');
    if (infoList != null) {
        var selList = infoList.result;
        var eventDate = selList.eventStartDate + " ~ " + selList.eventEndDate;
        innerHTML('eventDate', eventDate);
        innerHTML('eventTitle', selList.eventDesc);
        $("#eventImg").attr("src", selList.targetUrl);

        //window.location = selList.targetUrl + "&idx=" + idx;
        //window.location = selList.targetUrl;
        return infoList;
    }
}

function updateEventInfo(idx, eventTitle, eventDesc, eventStartDate, eventEndDate, targetName, thumbnailFileName, targetUrl) {
    var data = {
        idx: idx,
        eventTitle : eventTitle,
        eventDesc : eventDesc,
        eventStartDate : eventStartDate,
        eventEndDate : eventEndDate,
        targetName : targetName,
        thumbnailFileName : thumbnailFileName,
        targetUrl : targetUrl
    };
    var result = postApi("/event/updateEventInfo", data);
    return result;
    
}