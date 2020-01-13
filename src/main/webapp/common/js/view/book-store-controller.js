//온라인서점 도서 배너 목록
function getBannerList(ctgKey, listLimit) {
    if (ctgKey == null || ctgKey == undefined) return;
    var data = {
        listLimit : listLimit
    };
    var infoList = getApi("/bookStore/getBannerList/", ctgKey, data);
    console.log(infoList);
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i=0; i<selList.length;i++){
            var returnHtml = "<div class=\"item\"><div>";
            returnHtml += "<img src='"+ selList[i].bookImageUrl +"' alt=\"\">";
            returnHtml += "<span class=\"name\">"+ selList[i].goodsName +"</span>";
            returnHtml += "<span class=\"writer\">김설 | 탑스팟</span>";
            returnHtml += "<span class=\"price\"><b>24,000</b>원 <span>(10% off)</span></span>";
            returnHtml += "</div></div>";
            $("#newBookList").append(returnHtml);
        }
    }
    $(function(){
        $(".mainProductList2").each(function(){
            kiplayer.sliderSlickNew($(this));
        });
    });
}

function getBestBookList() {
    var infoList = getApi("/bookStore/getBestBookList/", '', '');
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i=0; i<selList.length;i++){
            var returnHtml = "<div class=\"item\"><div>";
            returnHtml += "<img src='"+ selList[i].bookImageUrl +"' alt=\"\">";
            returnHtml += "<span class=\"name\">"+ selList[i].goodsName +"</span>";
            returnHtml += "<span class=\"writer\">김설 | 탑스팟</span>";
            returnHtml += "<span class=\"price\"><b>24,000</b>원 <span>(10% off)</span></span>";
            returnHtml += "</div></div>";
            $("#bestBookList").append(returnHtml);
        }
    }
    $(function(){
        $(".mainProductList3").each(function(){
            kiplayer.sliderSlickNew2($(this));
        });
    });
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

            return "<div class=\"item\">" +
                "<img src='"+ data.bookImageUrl +"' alt=''>"+
                "<span class=\"name\">"+ data.goodsName +"</span>"+
                "<span class=\"writer\">"+ data.writer + name +"</span>" +
                "<span class=\"price\"><b>"+ data.price +"</b>원 <span style='color: red;'>"+"("+data.accrualRate+")"+"</span></span>";
        }, {escapeHtml: false});
    }
    $(function(){
        kiplayer.sliderSlick($(".productList"));
    });
}