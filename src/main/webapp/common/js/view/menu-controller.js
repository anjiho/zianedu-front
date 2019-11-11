//좌측 메뉴 리스트 가져오기
function getLeftMenu(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var infoList = getApi("/menu/getLeftMenu/", ctgKey,"");
    if (infoList.result.length > 0) {
        var selList = infoList.result;

        dwr.util.addOptions(tagId, selList, function (data) {
           return "<a href='javascript:getSubjectTeacherInfo("+ data.ctgKey +");'>"+ data.name +"</a>"
        }, {escapeHtml: false});
    }
}

//교수소개 좌측메뉴 가져오기
function getTeacherIntroduceLeftMenu(ctgKey, tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/menu/getTeacherIntroduceLeftMenu/", ctgKey,"");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        for(var i = 0 ; i <  selList.length; i++){
            var teacherList = selList[i].teacherList;
            dwr.util.addOptions(tagId, teacherList, function (data) {
                return "<div>"+
                            "<span class=\"category\">"+ data.subjectName +"</span>"+
                            "<b class=\"name\">"+ data.teacherName +"</b>"+
                            "<span class=\"thumb\"><img src='"+ data.teacherImage + "' alt=\"\"></span>"+
                            "<a href=\"#\" class=\"link_home\">교수홈</a>"+
                        "</div>";
            }, {escapeHtml: false});
        }
    }
}

//기술직동영상 > 지안패스 > 좌측 가져오기
function getTechVodZianPassLeftMenu(tagId) {
    if (ctgKey == null || ctgKey == undefined) return;
    var InfoList = getApi("/menu/getTechVodZianPassLeftMenu/", "","");

    if (InfoList.result.length > 0) {
        var selList = InfoList.result;
        dwr.util.addRows(tagId, selList, [
            //function(data) {return "<img src='"+ data.targetUrl +"'>";}
        ], {escapeHtml:false});
    }
}

function getTeacherMenuCtgKey() {
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    var menuCtgKey = "";
    if(leftMenuInfo == "publicOnline") menuCtgKey = 242;
    else if(leftMenuInfo == "publicAcademy") menuCtgKey = 337;
    else if(leftMenuInfo == "techOnline") menuCtgKey = 457;
    else if(leftMenuInfo == "techAcademy") menuCtgKey = 396;
    else if(leftMenuInfo == "postOnline") menuCtgKey = 591;
    else if(leftMenuInfo == "postAcademy") menuCtgKey = 523;
    else menuCtgKey = 242;
    return menuCtgKey;
}

function getTeacherListCtgKey() {
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    var teacherCtgKey = "";
    if(leftMenuInfo == "publicOnline") teacherCtgKey = 328;
    else if(leftMenuInfo == "publicAcademy") teacherCtgKey = 352;
    else if(leftMenuInfo == "techOnline") teacherCtgKey = 481;
    else if(leftMenuInfo == "techAcademy") teacherCtgKey = 414;
    else if(leftMenuInfo == "postOnline") teacherCtgKey = 632;
    else if(leftMenuInfo == "postAcademy") teacherCtgKey = 562;
    else teacherCtgKey = 328;
    return teacherCtgKey;
}