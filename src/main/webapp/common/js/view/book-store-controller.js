//온라인서점 새로나온 책
function getNewBookList() {
    var infoList = getApi("/bookStore/getNewBookList/", '', '');
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i=0; i<selList.length;i++){
            var returnHtml = "<div class=\"item\"><div>";
            // returnHtml += "<img src='"+ selList[i].bookImageUrl +"' alt=\"\">";
            // returnHtml += "<span class=\"name\">"+ selList[i].goodsName +"</span>";
            returnHtml += "<a href='javascript:goDetailBook("+ selList[i].gkey +");'><img src='"+ selList[i].bookImageUrl +"' alt=\"\"></a>";
            returnHtml += "<a href='javascript:goDetailBook("+ selList[i].gkey +");'><span class=\"name\">"+ selList[i].goodsName +"</span></a>";
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
}

//지안에듀 베스트 도서
function getBestBookList() {
    var infoList = getApi("/bookStore/getBestBookList/", '', '');
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i=0; i<selList.length;i++){
            var returnHtml = "<div class=\"item\"><div>";
            returnHtml += "<a href='javascript:goDetailBook("+ selList[i].gkey +");'><img src='"+ selList[i].bookImageUrl +"' alt=\"\"></a>";
            returnHtml += "<a href='javascript:goDetailBook("+ selList[i].gkey +");'><span class=\"name\">"+ selList[i].goodsName +"</span></a>";
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
    // $(function(){
    //     $(".mainProductList3").each(function(){
    //         kiplayer.sliderSlickNew2($(this));
    //     });
    //     $(".slick-dots").hide();
    // });
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
                " <div>"+
                "<a href='javascript:goDetailBook("+ data.gkey +");'><img src='"+ data.bookImageUrl +"' alt=\"\"></a>"+
                "<span class=\"name\">"+ gfn_substr(data.goodsName, 0, 12) +"</span>"+
                "<span class=\"writer\">"+ data.writer + name +"</span>" +
                "<span class=\"price\"><b>"+ data.sellPrice +"</b>원 <span style='color: red;'>"+"("+data.discountPercent+")"+"</span></span>"+
            " </div>"+
            " </div>";
        }, {escapeHtml: false});
    }
    $(".product1").slick({
        	dots: true,
        	infinite: true,
        	slidesToShow: 4,
        	slidesToScroll: 1,
        	variableWidth: false,
        	arrows: true,
        	autoplay:true,
        	responsive: [
        		{ autoplay:true,
        			breakpoint: 800,
        			settings: {
        				slidesToShow: 3,
        				slidesToScroll: 1,
        			}
        		},
        		{ autoplay:true,
        			breakpoint: 480,
        			settings: {
        				slidesToShow: 2,
        				slidesToScroll: 1
        			}
        		},
        		{autoplay:true,
        			breakpoint: 321,
        			settings: {
        				slidesToShow: 2,
        				slidesToScroll: 1
        			}
        		}
        	]
        });
}

function getSalesBookList(bookMenuType, searchText, orderType, sPage, listLimit, subjectKey) {
    var paging = new Paging();
    dwr.util.removeAllRows("dataList"); //테이블 리스트 초기화
    var data = {
        searchText : searchText,
        orderType : orderType,
        sPage : sPage,
        listLimit : listLimit,
        subjectKey : subjectKey
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
                        function(data) {return '<div><img src="'+ cmpList.bookImageUrl +'" style="width: 120px;height: 170px"></div>'},
                        function(data) {return cmpList.name != null ? '<span class="black small">'+ gfn_isnull(cmpList.subjectName) +'</span><a href="javascript:goDetailBook('+ cmpList.gkey +');" class="learnName">'+ cmpList.goodsName +'</a><span class="learnNum">'+ cmpList.writer +' | '+ cmpList.name +' |  <b class="">'+ cmpList.publishDate +'</b></span>'  : '<span class="black small">'+ cmpList.subjectName +'</span><a href="javascript:goDetailBook('+ cmpList.gkey +');" class="learnName">'+ cmpList.goodsName +'</a><span class="learnNum">'+ cmpList.writer +' | 탑스팟 |  <b class="">'+ cmpList.publishDate +'</b></span>';},
                        function(data) {return '<ul><li class="txt14"><span class="text_red">'+ cmpList.discountPercent +'</span>할인</li></ul>';},
                        //<li class="txt14"><span class="text_red">'+ cmpList.accrualRate +'</span>적립</li>'
                        function(data) {return "<ul class=\"costList\"><li><input type=\"checkbox\" name=\"lecChk\" id='"+  cmpList.priceKey +"' value='"+ cmpList.gkey +"'><b class=\"cost\">"+ cmpList.sellPrice +"원</b><br><a href='javascript:goOneLecCheckedShopBasket("+ cmpList.priceKey +","+ cmpList.gkey +");' class=\"btn_s\">장바구니</a>&nbsp;<a href='javascript:goOneLecCheckedBuy("+ cmpList.priceKey +");' class=\"btn_s on\">바로구매</a></li></ul>";}
                    ];
                    dwr.util.addRows("dataList", [0], cellData, {escapeHtml: false});
                }
            }
      //  }
    }
}

function getSalesBookList2(bookMenuType, searchText, orderType, sPage, listLimit, subjectKey) {
    var paging = new Paging();
    dwr.util.removeAllRows("dataList2"); //테이블 리스트 초기화
    var data = {
        searchText : searchText,
        orderType : orderType,
        sPage : sPage,
        listLimit : listLimit,
        subjectKey : subjectKey
    };

    var infoList = getPageApi("/bookStore/getSalesBookList/", bookMenuType, data);

    var cnt = infoList.cnt;
    if(infoList != null){
        //if (infoList.result.length > 0) {
        var selList = infoList.result;
        paging.count2(sPage, cnt, '5', listLimit, comment.blank_list);
        for(var i=0; i < selList.length; i++){
            var cmpList = selList[i];
            if (cmpList != undefined) {
                var cellData = [
                    function(data) {return '<div><img src="'+ cmpList.bookImageUrl +'" style="width: 120px;height: 170px"></div>'},
                    function(data) {return cmpList.name != null ? '<span class="black small">'+ gfn_isnull(cmpList.subjectName) +'</span><a href="javascript:goDetailBook('+ cmpList.gkey +');" class="learnName">'+ cmpList.goodsName +'</a><span class="learnNum">'+ cmpList.writer +' | '+ cmpList.name +' |  <b class="">'+ cmpList.publishDate +'</b></span>'  : '<span class="black small">'+ cmpList.subjectName +'</span><a href="javascript:goDetailBook('+ cmpList.gkey +');" class="learnName">'+ cmpList.goodsName +'</a><span class="learnNum">'+ cmpList.writer +' | 탑스팟 |  <b class="">'+ cmpList.publishDate +'</b></span>';},
                    function(data) {return '<ul><li class="txt14"><span class="text_red">'+ cmpList.discountPercent +'</span>할인</li></ul>';},
                    //<li class="txt14"><span class="text_red">'+ cmpList.accrualRate +'</span>적립</li>'
                    function(data) {return "<ul class=\"costList\"><li><input type=\"checkbox\" name=\"lecChk\" id='"+  cmpList.priceKey +"' value='"+ cmpList.gkey +"'><b class=\"cost\">"+ cmpList.sellPrice +"원</b><br><a href='javascript:goOneLecCheckedShopBasket("+ cmpList.priceKey +","+ cmpList.gkey +");' class=\"btn_s\">장바구니</a>&nbsp;<a href='javascript:goOneLecCheckedBuy("+ cmpList.priceKey +");' class=\"btn_s on\">바로구매</a></li></ul>";}
                ];
                dwr.util.addRows("dataList2", [0], cellData, {escapeHtml: false});
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


function getBookStoreSelectBoxList(bookStoreType) {
    if (bookStoreType == null || bookStoreType == undefined) return;

    var infoList = getApi("/bookStore/getBookStoreSelectBoxList/", bookStoreType, '');
    if(infoList != null){
        var selList = infoList.result;
        for(var  i=0; i<selList.length;i++){
            var cmpList = selList[i];
            var returnHtml = "<option value='"+ cmpList.key +"'>"+ cmpList.value +"</option>";
            $("#searchType").append(returnHtml);
        }
    }

}