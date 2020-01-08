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
        function formatter(cmpList) {
            return ""+
                "<a href=\"javascript:\"><img src='"+ cmpList.fileUrl +"'  style='width: 250px;height: 122px'/></a>"+
                "<a href='javascript:detailReview("+ cmpList.bbsKey +");'><sapn class='thumb'>"+ gfn_substr(cmpList.title,0,17) +"</span></a>"+
                "";
        }
    }
    dwr.util.addOptions('dataList', selList, formatter, {escapeHtml:false});
    //}

}