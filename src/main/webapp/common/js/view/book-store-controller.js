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
function getBookList(tagId , leftMenuCtgKey, sPage, listLimit) {
    if (leftMenuCtgKey == null || leftMenuCtgKey == undefined) return;
    var data = {
        sPage : sPage,
        listLimit : listLimit
    };
    var infoList = getApi("/bookStore/getBookList/", leftMenuCtgKey, data);

    if (infoList.result.length > 0) {
        var selList = infoList.result;
        dwr.util.addOptions(tagId, selList, function (data) {
            var name = "";
            if(data.name == null) name = "";
            else name = "|" + data.name;

            return "<div>" +
                "<img src='"+ data.bookImageUrl +"' alt=''>"+
                "<span class=\"name\">"+ data.goodsName +"</span>"+
                "<span class=\"writer\">"+ data.writer + name +"</span>" +
                "<span class=\"price\"><b>"+ data.price +"</b>원 <span>"+"("+data.accrualRate+")"+"</span></span>";
        }, {escapeHtml: false});
    }
    $(function(){
        kiplayer.sliderSlick($(".productList"));
    });
}