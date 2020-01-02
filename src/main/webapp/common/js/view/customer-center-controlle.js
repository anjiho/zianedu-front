//자주하는질문 세부목록 가져오기
function getOftenQuestionDetailList(ctgKey) {
    var infoList = getApi("/customerCenter/getOftenQuestionDetailList/",ctgKey ,"");
    $("#reQuestionSel").empty();
    if (infoList.result.length > 0) {
        var selList = infoList.result;
        for(var i =0; i < selList.length;i++){
            console.log(selList[i]);
            var returnHtml = "<option value='"+ selList[i].bbsKey +"'>"+ selList[i].title +"</option>";
            $("#reQuestionSel").append(returnHtml);
        }
    }
}
