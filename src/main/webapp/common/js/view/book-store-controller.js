//온라인서점 새로나온 책
function getNewBookList() {
    var infoList = getApi("/bookStore/getNewBookList/", '', '');
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i=0; i<selList.length;i++){
            var returnHtml = "<div class=\"item\"><div>";
            returnHtml += "<a href='javascript:goDetailBook("+ selList[i].gkey +");'><img src='"+ selList[i].bookImageUrl +"' alt=\"\"></a>";
            returnHtml += "<span class=\"name\">"+ selList[i].goodsName +"</span></a>";
            if(selList[i].name != null){
                returnHtml += "<span class=\"writer\">"+ selList[i].writer + " | "+ selList[i].name +"</span>";
            }else{
                returnHtml += "<span class=\"writer\">"+ selList[i].writer +  " | 탑스팟</span>";
            }
            returnHtml += "<span class=\"price\"><b>"+ selList[i].sellPrice +"</b>원 <span>("+ selList[i].discountPercent +" off)</span></span>";
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

//지안에듀 베스트 도서
function getBestBookList() {
    var infoList = getApi("/bookStore/getBestBookList/", '', '');
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i=0; i<selList.length;i++){
            var returnHtml = "<div class=\"item\"><div>";
            returnHtml += "<a href='javascript:goDetailBook("+ selList[i].gkey +");'><img src='"+ selList[i].bookImageUrl +"' alt=\"\"></a>";
            returnHtml += "<span class=\"name\">"+ selList[i].goodsName +"</span>";
            if(selList[i].name != null){
                returnHtml += "<span class=\"writer\">"+ selList[i].writer + " | "+ selList[i].name +"</span>";
            }else{
                returnHtml += "<span class=\"writer\">"+ selList[i].writer +  " | 탑스팟</span>";
            }
            returnHtml += "<span class=\"price\"><b>"+ selList[i].sellPrice +"</b>원 <span>("+ selList[i].discountPercent +" off)</span></span>";
            returnHtml += "</div></div>";
            $("#bestBookList").append(returnHtml);
        }
    }
    $(function(){
        $(".mainProductList3").each(function(){
            kiplayer.sliderSlickNew2($(this));
        });
        $(".slick-dots").hide();
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
                "<a href='javascript:goDetailBook("+ data.gkey +");'><img src='"+ data.bookImageUrl +"' alt=\"\"></a>"+
                "<span class=\"name\">"+ data.goodsName +"</span>"+
                "<span class=\"writer\">"+ data.writer + name +"</span>" +
                "<span class=\"price\"><b>"+ data.sellPrice +"</b>원 <span style='color: red;'>"+"("+data.discountPercent+")"+"</span></span>";
        }, {escapeHtml: false});
    }
    $(function(){
        kiplayer.sliderSlick($(".productList"));
        $('.slick-dots').attr('style', "display:none;");
    });
}

function getSalesBookList(bookMenuType, searchText, orderType, sPage, listLimit) {
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        searchText : searchText,
        orderType : orderType,
        sPage : sPage,
        listLimit : listLimit
    };
    var infoList = getPageApi("/bookStore/getSalesBookList/", bookMenuType, data);
    var cnt = infoList.cnt;
    if(infoList != null){
        //if (infoList.result.length > 0) {
            var selList = infoList.result;
            paging.count(sPage, cnt, '5', listLimit, comment.blank_list);
            for(var i=0; i < selList.length; i++){
                var cmpList = selList[i];
                if (cmpList != undefined) {
                    var cellData = [
                        function(data) {return '<img src="'+ cmpList.bookImageUrl +'" style="width: 120px;height: 170px">'},
                        function(data) {return cmpList.name != null ? '<a href="javascript:goDetailBook('+ cmpList.priceKey +');"><span class="black small">'+ cmpList.subjectName +'</span><a href="javascript:goDetailBook('+ cmpList.gkey +');" class="learnName">'+ cmpList.goodsName +'</a><span class="learnNum">'+ cmpList.writer +' | '+ cmpList.name +' |  <b class="">'+ cmpList.publishDate +'</b></span>'  : '<span class="black small">'+ cmpList.subjectName +'</span><a href="javascript:goDetailBook('+ cmpList.gkey +');" class="learnName">'+ cmpList.goodsName +'</a><span class="learnNum">'+ cmpList.writer +' | 탑스팟 |  <b class="">'+ cmpList.publishDate +'</b></span>';},
                        function(data) {return '<li class="txt14"><span class="text_red">'+ cmpList.discountPercent +'</span>할인</li><li class="txt14"><span class="text_red">'+ cmpList.accrualRate +'</span>적립</li>';},
                        function(data) {return "<ul class=\"costList\"><li><b class=\"cost\">"+ cmpList.sellPrice +"원</b> <input type=\"checkbox\" name=\"lecChk\" id='"+  cmpList.priceKey +"' value='"+ cmpList.gkey +"'><a href='javascript:goOneLecCheckedShopBasket("+ cmpList.priceKey +","+ cmpList.gkey +");' class=\"btn_s\">장바구니</a>&nbsp;<a href='javascript:goOneLecCheckedBuy("+ cmpList.priceKey +");' class=\"btn_s on\">바로구매</a></li></ul>";}
                    ];
                    dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                    //text-align: left;
                    $('#dataList tr').each(function(){
                        var tr = $(this);
                        tr.children().eq(1).attr("style", "text-align: left");
                    });
                }
            }
      //  }
    }
}

//도서 상세정보
function getBookDetailInfo(gKey) {
    if (gKey == null || gKey == undefined) return;

    var infoList = getApi("/bookStore/getBookDetailInfo/", gKey, '');
    return infoList;
}
