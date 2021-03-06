/**
 * 페이지 이동
 * @param mapping_value
 * @param page_value
 * @param obj
 * @returns {boolean}
 */
function goPage(mapping_value, page_value) {
    with (document.frm) {
        if (mapping_value != "" && page_value != "") {
            page_gbn.value = page_value;
        }
        action = "/" + mapping_value;
        submit();
    }
}

function goPayPage(mapping_value, page_value) {
    with (document.frm1) {
        if (mapping_value != "" && page_value != "") {
            page_gbn.value = page_value;
        }
       // $("#frm1").submit(function (e) {
        var data = $(this).serializeArray();
        var formURL = $(this).attr("action");
        $.ajax({
            url : "/" + mapping_value +"?page_gbn="+page_value,
            type : "POST",
            data : data ,
            success : function (data, textStatus, jqXHR) {
                alert(1);
            }
        });
    }
}

function goPageNoSubmit(mapping_value, page_value) {
    if (mapping_value != "" && page_value != "") {
        $("#page_gbn").val(page_value);
    }
    location.href = "/" + mapping_value + "?page_gbn=" + page_value;
}

function goMain() {
    location.href = "/";
}

// 공통 스크립트 파일
var tot = "0";
var webRoot = "";

//--------------------------------------------------
// 빈 결과값 메인 리스트  처리
//--------------------------------------------------
function gfn_emptyView(gubun, str) {
    if (gubun == "H") {
        emptys.innerHTML = "<td colspan='30'></td>";
        emptys.style.height = "0";
        emptys.style.visibility = "hidden";
        emptys.style.display = "none";
    } else {
        emptys.style.display = "";
        emptys.style.visibility = "visible";
        emptys.style.height = "100px";
        emptys.innerHTML = "<b>" + str + "</b>";
    }
}

// 파일 패스 제거후 파일명 추출
function fn_clearFilePath(val) {
    var tmpStr = val;

    var cnt = 0;
    while (true) {
        cnt = tmpStr.indexOf("/");
        if (cnt == -1) break;
        tmpStr = tmpStr.substring(cnt + 1);
    }
    while (true) {
        cnt = tmpStr.indexOf("\\");
        if (cnt == -1) break;
        tmpStr = tmpStr.substring(cnt + 1);
    }

    return tmpStr;
}

//--------------------------------------------------
//빈 결과값 메인 리스트  처리
//--------------------------------------------------
function gfn_emptyView2(gubun, str) {
    if (gubun == "H") {
        emptys2.innerHTML = "<td colspan='30'></td>";
        emptys2.style.height = "0";
        emptys2.style.visibility = "hidden";
        emptys2.style.display = "none";
    } else {
        emptys2.style.display = "";
        emptys2.style.visibility = "visible";
        emptys2.style.height = "125px";
        emptys2.innerHTML = "<b>" + str + "</b>";
    }
}

//--------------------------------------------------
//빈 결과값 메인 리스트  처리
//--------------------------------------------------
function gfn_emptyView3(gubun, str) {
    if (gubun == "H") {
        emptys3.innerHTML = "<td colspan='30'></td>";
        emptys3.style.height = "0";
        emptys3.style.visibility = "hidden";
        emptys3.style.display = "none";
    } else {
        emptys3.style.display = "";
        emptys3.style.visibility = "visible";
        emptys3.style.height = "125px";
        emptys3.innerHTML = "<b>" + str + "</b>";
    }
}

//--------------------------------------------------
//빈 결과값 메인 리스트  처리
//--------------------------------------------------
function gfn_emptyView4(gubun, str) {
    if (gubun == "H") {
        emptys4.innerHTML = "<td colspan='30'></td>";
        emptys4.style.height = "0";
        emptys4.style.visibility = "hidden";
        emptys4.style.display = "none";
    } else {
        emptys4.style.display = "";
        emptys4.style.visibility = "visible";
        emptys4.style.height = "125px";
        emptys4.innerHTML = "<b>" + str + "</b>";
    }
}

//--------------------------------------------------
//빈 결과값 메인 리스트  처리
//--------------------------------------------------
function gfn_emptyView5(gubun, str) {
    if (gubun == "H") {
        emptys5.innerHTML = "<td colspan='30'></td>";
        emptys5.style.height = "0";
        emptys5.style.visibility = "hidden";
        emptys5.style.display = "none";
    } else {
        emptys5.style.display = "";
        emptys5.style.visibility = "visible";
        emptys5.style.height = "125px";
        emptys5.innerHTML = "<b>" + str + "</b>";
    }
}

//--------------------------------------------------
// 빈 결과값 메인 리스트  처리 (한페이지에 두개의 리스트가 같이 나올경우 )
//--------------------------------------------------
function gfn_emptyView_new(gubun, str) {
    if (gubun == "H") {
        emptys.innerHTML = "<td colspan='30'></td>";
        emptys.style.height = "0";
        emptys.style.visibility = "hidden";
        emptys.style.display = "none";
    } else {
        emptys.style.display = "";
        emptys.style.visibility = "visible";
        emptys.style.height = "150px";
        emptys.innerHTML = "<b>" + str + "!</b>";
    }
}

function gfn_emptyView_alarm(gubun, str) {
    if (gubun == "H") {
        emptys_alarm.innerHTML = "<td colspan='30'></td>";
        emptys_alarm.style.height = "0";
        emptys_alarm.style.visibility = "hidden";
        emptys_alarm.style.display = "none";
    } else {
        emptys_alarm.style.display = "";
        emptys_alarm.style.visibility = "visible";
        emptys_alarm.style.height = "200px";
        emptys_alarm.innerHTML = "<b>" + str + "!</b>";
    }
}

function gfn_emptyView_kanje(gubun, str) {
    if (gubun == "H") {
        emptys_kanje.innerHTML = "<td colspan='30'></td>";
        emptys_kanje.style.height = "0";
        emptys_kanje.style.visibility = "hidden";
        emptys_kanje.style.display = "none";
    } else {
        emptys_kanje.style.display = "";
        emptys_kanje.style.visibility = "visible";
        emptys_kanje.style.height = "150px";
        emptys_kanje.innerHTML = "<b>" + str + "!</b>";
    }
}

function gfn_emptyView_set(gubun, str) {
    if (gubun == "H") {
        emptys_set.innerHTML = "<td colspan='30'></td>";
        emptys_set.style.height = "0";
        emptys_set.style.visibility = "hidden";
        emptys_set.style.display = "none";
    } else {
        emptys_set.style.display = "";
        emptys_set.style.visibility = "visible";
        emptys_set.style.height = "120px";
        emptys_set.innerHTML = "<b>" + str + "!</b>";
    }
}

function gfn_emptyView_name(gubun, str) {
    if (gubun == "H") {
        emptys_name.innerHTML = "<td colspan='30'></td>";
        emptys_name.style.height = "0";
        emptys_name.style.visibility = "hidden";
        emptys_name.style.display = "none";
    } else {
        emptys_name.style.display = "";
        emptys_name.style.visibility = "visible";
        emptys_name.style.height = "480px";
        emptys_name.innerHTML = "<b>" + str + "!</b>";
    }
}


function gfn_setTot(str) {
    tot = str;
}

//--------------------------------------------------
// 빈 결과값 서브 리스트  처리
//--------------------------------------------------
function gfn_emptySubView(gubun, str) {
    if (gubun == "H") {
        emptysSub.innerHTML = "<td colspan='13'></td>";
        emptysSub.style.visibility = "hidden";
        emptysSub.style.height = "0";
    } else {
        emptysSub.style.visibility = "visible";
        emptysSub.innerHTML = "<b>" + str + "!</b>";
        emptysSub.style.height = "80";
    }
}

//--------------------------------------------------
//문자열 자르기 - 시작과 끝 지정
//--------------------------------------------------
function gfn_substr(str, start, end) {
    if (str != "") {
        substr = str.substring(start, end);
    }
    var result = "";
    if(str.length > 28){
        result = substr+"...";
    }else{
        result = substr
    }
    return result;
}

//--------------------------------------------------
// 구분자로 문장 자르기 - 단일문장
//--------------------------------------------------
function gfn_split(str, delim) {
    var array = new Array();
    var len = str.lastIndexOf(delim);
    array[0] = str.substring(0, len);
    array[1] = str.substring(len + 1, str.length);
    return array;
}

//--------------------------------------------------
// 구분자로 문장 자르기 - 복수문장
//--------------------------------------------------
function gfn_csplit(str, delim) {
    var array = new Array();
    if (str == "") return "";

    array = str.split(delim);
    return array;
}

//--------------------------------------------------
// 파라미터 자르기
//--------------------------------------------------
function gfn_strcut(str, len) {
    if (str == "") {
        return "";
    } else {
        return str.substring(len);
    }
}

//--------------------------------------------------
//  문자치환
//--------------------------------------------------
function gfn_replaceStr(str, fromStr, toStr) {
    var idx;
    var dst = "";
    if (str == "") return str;
    if (!str.substring) return str;
    while ((idx = str.indexOf(fromStr)) >= 0) {
        dst += str.substring(0, idx) + toStr;
        str = str.substring(idx + fromStr.length);
    }
    return dst + str;
}

//--------------------------------------------------
//  문자 존재 여부 체크
//--------------------------------------------------
function gfn_CheckStr(str, fromStr) {
    var idx;
    if (str == "" || str == null) return true;
    idx = str.indexOf(fromStr);
    if (idx == "-1") {
        return true;
    } else {
        return false;
    }
}

//--------------------------------------------------
// 로딩 이미지 처리
//--------------------------------------------------
function gfn_Loading(str) {
    if (str == "Y") {
        try {
            loading.style.visibility = "visible";
            loading.style.width = "230";
            loading.style.height = "66";
        } catch (e) {
            parent.loading.style.visibility = "visible";
            parent.loading.style.width = "230";
            parent.loading.style.height = "66";
        }
    } else {
        try {
            loading.style.visibility = "hidden";
            loading.style.width = "0";
            loading.style.height = "0";
        } catch (e) {
            parent.loading.style.visibility = "hidden";
            parent.loading.style.width = "0";
            parent.loading.style.height = "0";
        }
    }
}

//--------------------------------------------------
// 팝업 처리
//--------------------------------------------------
function gfn_winPop(xs, ys, urls, param) {
    var targeturl = urls + param;
    var winX = 0;
    var winY = 0;
    if (screen.width < 1025) {
        winX = 0;
        winY = 0;
    } else {
        winX = (screen.width) ? (screen.width - xs) / 2 : 100;
        winY = (screen.height) ? (screen.height - ys) / 2 : 100;
    }
    var features = 'width=' + xs + ',height=' + ys + ',left=' + winX + ',top=' + winY + ',location=no,toolbar=no,scrollbars=no,resizable=yes,status=yes';
    var winda = window.open(targeturl, 'winc', features);
    winda.focus();
}

function gfn_winPops(xs, ys, urls, param, sid) {
    var targeturl = urls + param;
    var winX = 0;
    var winY = 0;
    if (screen.width < 1025) {
        winX = 0;
        winY = 0;
    } else {
        winX = (screen.width) ? (screen.width - xs) / 2 : 100;
        winY = (screen.height) ? (screen.height - ys) / 2 : 100;
    }
    var features = 'width=' + xs + ',height=' + ys + ',left=' + winX + ',top=' + winY + ',location=no,toolbar=no,scrollbars=auto,resizable=yes,status=yes';
    //var winda = window.open(targeturl,sid,features);
    window.open(targeturl, sid, features);
    //winda.focus();
}

function gfn_winScrollPops(xs, ys, urls, param, sid) {
    var targeturl = urls + param;
    var winX = 0;
    var winY = 0;
    if (screen.width < 1025) {
        winX = 0;
        winY = 0;
    } else {
        winX = (screen.width) ? (screen.width - xs) / 2 : 100;
        winY = (screen.height) ? (screen.height - ys) / 2 : 100;
    }
    var features = 'width=' + xs + ',height=' + ys + ',left=' + winX + ',top=' + winY + ',location=no,toolbar=no,scrollbars=yes,resizable=yes,status=yes';
    //var winda = window.open(targeturl,sid,features);
    window.open(targeturl, sid, features);
    //winda.focus();
}

function gfn_winResizeNoPops(xs, ys, urls, param, sid) {
    var targeturl = urls + param;
    var winX = 0;
    var winY = 0;
    if (screen.width < 1025) {
        winX = 0;
        winY = 0;
    } else {
        winX = (screen.width) ? (screen.width - xs) / 2 : 100;
        winY = (screen.height) ? (screen.height - ys) / 2 : 100;
    }
    var features = 'width=' + xs + ',height=' + ys + ',left=' + winX + ',top=' + winY + ',location=no,toolbar=no,scrollbars=no,resizable=no,status=yes';
    var winda = window.open(targeturl, sid, features);
    winda.focus();
}


//--------------------------------------------------
//  문자 존재 여부 체크  - str의 빈값 제외
//--------------------------------------------------
function gfn_CheckNullStr(str, fromStr) {
    var idx = "-1";
    if (str != "") {
        idx = str.indexOf(fromStr);
    }
    if (idx == "-1") {
        return false;
    } else {
        return true;
    }
}

//--------------------------------------------------
//  null 을 빈값으로처리
//--------------------------------------------------
function gfn_isnull(str) {
    if (str == null) {
        return "";
    } else {
        return str;
    }
}

//--------------------------------------------------
//null 을 문자 치환
//--------------------------------------------------
function gfn_isnullvalue(str, fromStr) {
    if (str == null || str == "") {
        return fromStr;
    } else {
        return str;
    }
}

//--------------------------------------------------
//  숫자 여부 체크
//--------------------------------------------------
function gfn_isnum(str) {
    if (str == "") {
        return true;
    } else {
        return !isNaN(Number(str));
    }
}

//--------------------------------------------------
//  좌우측여백삭제
//--------------------------------------------------
function gfn_trim(str) {
    return gfn_ltrim(gfn_rtrim(str));
}

//--------------------------------------------------
//  좌측여백삭제
//--------------------------------------------------
function gfn_ltrim(str) {
    var s = new String(str);
    if (s.substr(0, 1) == " ") {
        return gfn_ltrim(s.substr(1));
    } else {
        return s;
    }
}

//--------------------------------------------------
//  우측여백삭제
//--------------------------------------------------
function gfn_rtrim(str) {
    var s = new String(str);
    if (s.substr(s.length - 1, 1) == " ") {
        return gfn_rtrim(s.substring(0, s.length - 1));
    } else {
        return s;
    }
}

//--------------------------------------------------
// 소수점 이하 삭제
//--------------------------------------------------
function roundMarks(pval) {
    var rval = parseInt(pval);
    return rval;
}

//--------------------------------------------------
// 팝업 윈도우 닫기
//--------------------------------------------------
function gfn_close() {
    self.close();
}

//--------------------------------------------------
//날자 포맷 변경처리
//--------------------------------------------------
function gfn_dateFormat(str, len, gu) {
    var rdate = "";
    if (len == "8") {
        rdate = str.substring(0, 4) + "." + str.substring(4, 6) + "." + str.substring(6, 8);
    } else if (len == "10") {
        if (gu == "C") {
            rdate = str.substring(0, 4) + "년" + str.substring(5, 7) + "월" + str.substring(8, 10) + "일";
        } else {
            rdate = str.substring(0, 10);
        }
    } else if (len == "14") {
        if (gu == "C") {
            rdate = str.substring(0, 4) + "." + str.substring(4, 6) + "." + str.substring(6, 8);
        } else if (gu == "F") {
            rdate = str.substring(0, 4) + "-" + str.substring(4, 6) + "-" + str.substring(6, 8);
        } else {
            rdate = str.substring(0, 4) + "." + str.substring(4, 6) + "." + str.substring(6, 8);
            rdate += " " + str.substring(8, 10) + ":" + str.substring(10, 12) + ":" + str.substring(12, 14);
        }
    } else if (len == "18") {
        rdate = str.substring(0, 4) + str.substring(5, 7) + str.substring(8, 10);
        rdate += str.substring(11, 13) + str.substring(14, 15) + str.substring(17, 18);
    } else {
        rdate = str.substring(0, 4) + "-" + str.substring(5, 7) + "-" + str.substring(8, 10) + " ";
        rdate += str.substring(11, 13) + ":" + str.substring(14, 16) + ":" + str.substring(17, 19);
    }
    return rdate;
}


//--------------------------------------------------
// 동일 문자 체크   : 길이만큼의 동일문자 존제시 true 없을시 false
//--------------------------------------------------
function gfn_strCheck(str, len) {
    var rdate = false;
    if (str.length < len) {
        return str;
    } else {
        for (var i = 0; i < str.length; i++) {
            var astr = str.substring(i, i + len);
            var bstr = str.substring(i, i + 1);
            var cstr = "";
            for (var j = 0; j < len; j++) {
                cstr = cstr + bstr;
            }

            if (cstr == astr) {
                rdate = true;
                return rdate;
                break;
            }
        }
        rdate = false;
        return rdate;
    }
}


//검색 프로그레스 호출 및 숨기기
function loadSearch(topPadding) {
    if (document.getElementById) {
        document.getElementById('progress').style.left = document.body.clientWidth / 2 - 150 + "px";
        //document.getElementById('progress').style.top = document.body.scrollTop + (document.body.clientHeight/2) + "px";
        document.getElementById('progress').style.top = document.body.scrollTop + topPadding + "px";  //320
        document.getElementById('progress').style.visibility = 'visible';
    } else {
        if (document.layers) {
            document.progress.left = document.body.clientWidth / 2 - 150;
            document.progress.visibility = 'visible';
        } else {
            document.all.progress.style.left = document.body.clientWidth / 2 - 150;
            document.all.progress.style.top = document.body.scrollTop + (document.body.clientHeight / 2);
            document.all.progress.style.visibility = 'visible';
        }
    }
}


//검색 프로그레스 호출 및 숨기기
function loadSearch2() {
    if (document.getElementById) {
        document.getElementById('progress').style.left = document.body.clientWidth / 2 - 150 + "px";
        document.getElementById('progress').style.top = document.body.scrollTop + (document.body.clientHeight / 2) + "px";
        document.getElementById('progress').style.visibility = 'visible';
    } else {
        if (document.layers) {
            document.progress.left = document.body.clientWidth / 2 - 150;
            document.progress.visibility = 'visible';
        } else {
            document.all.progress.style.left = document.body.clientWidth / 2 - 150;
            document.all.progress.style.top = document.body.scrollTop + (document.body.clientHeight / 2);
            document.all.progress.style.visibility = 'visible';
        }
    }
}

function HideSearch() {
    if (document.getElementById) {
        document.getElementById('progress').style.visibility = 'hidden';
    } else {
        if (document.layers) {
            document.progress.visibility = 'hidden';
        } else {
            document.all.progress.style.visibility = 'hidden';
        }
    }
}

// 전화번호 구분별 입력
function fnSetPhoneNo(obj1, obj2, obj3, phoneNo) {
    if (phoneNo == null) {
        return;
    }
    if (phoneNo.length == 0) {
        return;
    }

    var chkHandPhone = phoneNo.substring(0, 2);

    var phoneNo1 = "";
    var phoneNo2 = "";
    var phoneNo3 = "";

    if (chkHandPhone == "02") {
        phoneNo1 = chkHandPhone;
        phoneNo2 = phoneNo.substring(2, phoneNo.length - 4);
        phoneNo3 = phoneNo.substring(phoneNo.length - 4);
    } else {
        phoneNo1 = phoneNo.substring(0, 3);
        phoneNo2 = phoneNo.substring(3, phoneNo.length - 4);
        phoneNo3 = phoneNo.substring(phoneNo.length - 4);
    }

    dwr.util.setValue(obj1, phoneNo1);
    dwr.util.setValue(obj2, phoneNo2);
    dwr.util.setValue(obj3, phoneNo3);
}

//사업자 번호 자르기
function fn_business_cut(obj1, obj2, obj3, business_no) {
    if (business_no == null) {
        return;
    }
    if (business_no.length == 0) {
        return;
    }

    var business_no1 = business_no.substring(0, 3);
    var business_no2 = business_no.substring(3, 5);
    var business_no3 = business_no.substring(5, 10);

    dwr.util.setValue(obj1, business_no1);
    dwr.util.setValue(obj2, business_no2);
    dwr.util.setValue(obj3, business_no3);
}

//이메일 자르기
function fn_mail_cut(obj1, obj2, email) {
    if (email == null) {
        return;
    }

    if (email.length == 0) {
        return;
    }

    var mail = email.split("@");

    dwr.util.setValue(obj1, mail[0]);
    dwr.util.setValue(obj2, mail[1]);
}

//전화번호 태그 붙이기
function fn_tel_tag(tel_no) {
    if (tel_no == "") {
        tel_no = null;
    }
    if (tel_no == null) {
        return "";
    }
    if (tel_no.length == 0) {
        return "";
    }

    var chkHandPhone = tel_no.substring(0, 2);

    var phoneNo1 = "";
    var phoneNo2 = "";
    var phoneNo3 = "";

    if (chkHandPhone == "02") {
        phoneNo1 = chkHandPhone;
        phoneNo2 = tel_no.substring(2, tel_no.length - 4);
        phoneNo3 = tel_no.substring(tel_no.length - 4);
    } else {
        phoneNo1 = tel_no.substring(0, 3);
        phoneNo2 = tel_no.substring(3, tel_no.length - 4);
        phoneNo3 = tel_no.substring(tel_no.length - 4);
    }

    var rtnTel = phoneNo1 + "-" + phoneNo2 + "-" + phoneNo3;

    return rtnTel;
}

//주민번호 태그 붙이기
function fn_res_tag(res_no) {
    if (res_no == null) {
        return;
    }
    if (res_no.length == 0) {
        return;
    }
    var res1 = res_no.substring(0, 6);
    var res2 = "*******";
    var rtnRes = res1 + " - " + res2;

    return rtnRes;
}

//사업자번호 태그 붙이기
function fn_business_tag(business_no) {
    if (business_no == null) {
        return;
    }
    if (business_no.length == 0) {
        return;
    }

    var business_no1 = business_no.substring(0, 3);
    var business_no2 = business_no.substring(3, 5);
    var business_no3 = business_no.substring(5, 10);

    var rtnBusiness = business_no1 + "-" + business_no2 + "-" + business_no3;

    return rtnBusiness;

}

// 파일 확장자 체크
function fileCheck(file_gubun, file_nm) {
    // 허용 가능 확장자 선택
    if (file_gubun == "service" && /.*\.(gif)|(jpeg)|(jpg)|(png)$/.test(file_nm.toLowerCase())) {
        return false;
    }
    if (file_gubun == "ctn" && /.*\.(text)|(txt)$/.test(file_nm.toLowerCase())) {
        return false;
    }
    if (file_gubun == "bbs" && /.*\.(text)|(txt)$/.test(file_nm.toLowerCase())) {
        return false;
    }
    if (file_gubun == "frmwr" && /.*\.(text)|(txt)|(exe)|(bin)|(zip)$/.test(file_nm.toLowerCase())) {
        return false;
    }
    if (file_gubun == "test" && /.*\.(xls)$/.test(file_nm.toLowerCase())) {
        return false;
    }
    return true;
}

function checkv4(obj) {
    var IPvalue = obj.value;
    errorString = "";
    theName = "IPaddress";

    var ipPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
    var ipArray = IPvalue.match(ipPattern);

    if (IPvalue == "0.0.0.0")
        errorString = errorString + theName + ': ' + IPvalue + '는 특수IP로 사용할 수 없습니다.';
    else if (IPvalue == "255.255.255.255")
        errorString = errorString + theName + ': ' + IPvalue + '는 특수IP로 사용할 수 없습니다.';

    if (ipArray == null)
        errorString = errorString + theName + ': ' + IPvalue + '는 올바른 IP가 아닙니다.';
    else {
        for (var i = 0; i < 4; i++) {
            thisSegment = ipArray[i];
            if (thisSegment > 255) {
                errorString = errorString + theName + ': ' + IPvalue + '는 올바른 IP가 아닙니다.';
                i = 4;
            }
            if ((i == 0) && (thisSegment > 255)) {
                errorString = errorString + theName + ': ' + IPvalue + '는 특수IP로 사용할 수 없습니다.';
                i = 4;
            }
        }
    }

    extensionLength = 3;
    if (errorString == "") {
        //alert ("That is a valid IP address.");
        return true;
    } else {
        alert(errorString);
        obj.select();
        return false;
    }
}

function checkv6(elem) {
    var v6Expression = /^(([A-Fa-f0-9]{1,4}:){7}[A-Fa-f0-9]{1,4})$|^([A-Fa-f0-9]{1,4}::([A-Fa-f0-9]{1,4}:){0,5}[A-Fa-f0-9]{1,4})$|^(([A-Fa-f0-9]{1,4}:){2}:([A-Fa-f0-9]{1,4}:){0,4}[A-Fa-f0-9]{1,4})$|^(([A-Fa-f0-9]{1,4}:){3}:([A-Fa-f0-9]{1,4}:){0,3}[A-Fa-f0-9]{1,4})$|^(([A-Fa-f0-9]{1,4}:){4}:([A-Fa-f0-9]{1,4}:){0,2}[A-Fa-f0-9]{1,4})$|^(([A-Fa-f0-9]{1,4}:){5}:([A-Fa-f0-9]{1,4}:){0,1}[A-Fa-f0-9]{1,4})$|^(([A-Fa-f0-9]{1,4}:){6}:[A-Fa-f0-9]{1,4})$/;
    if (elem.value.match(v6Expression)) {
        return true;
    } else {
        alert("올바른 IP가 아닙니다. ");
        return false;
    }
}

/*
' ------------------------------------------------------------------
' Function    : fc_chk_byte(aro_name)
' Description : 입력한 글자수를 체크
' Argument    : Object Name(글자수를 제한할 컨트롤)
' Return      :
' ------------------------------------------------------------------
*/
function fc_chk_byte(aro_name, ari_max) {

    var ls_str = aro_name.value; // 이벤트가 일어난 컨트롤의 value 값
    var li_str_len = ls_str.length;  // 전체길이

    // 변수초기화
    var li_max = ari_max; // 제한할 글자수 크기
    var i = 0;  // for문에 사용
    var li_byte = 0;  // 한글일경우는 3 그밗에는 1을 더함
    var li_len = 0;  // substring하기 위해서 사용
    var ls_one_char = ""; // 한글자씩 검사한다
    var ls_str2 = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.

    for (i = 0; i < li_str_len; i++) {
        // 한글자추출
        ls_one_char = ls_str.charAt(i);

        // 한글이면 3을 더한다.
        if (escape(ls_one_char).length > 4) {
            li_byte = li_byte + 3;
        }
        // 그외의 경우는 1을 더한다.
        else {
            li_byte++;
        }

        // 전체 크기가 li_max를 넘지않으면
        if (li_byte <= li_max) {
            li_len = i + 1;
        }
    }

    // 전체길이를 초과하면
    if (li_byte > li_max) {
        alert(li_max + " 글자를 초과 입력할수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ");
        ls_str2 = ls_str.substr(0, li_len);
        aro_name.value = ls_str2;
        return true;
    } else {
        return false;
    }
    aro_name.focus();
}


//문자의 갯수 리턴
function fn_charChk(pw) {
    var cnt = 0;
    var pass_regx = /^[a-zA-Z]/;

    for (var i = 0; i < pw.length; i++) {
        if (pass_regx.test(pw.charAt(i))) {
            cnt = cnt + 1;
        }
    }
    return cnt;
}

//숫자의 갯수 리턴
function fn_numberChk(pw) {
    var cnt = 0;
    var pass_regx = /^[0-9]/;

    for (var i = 0; i < pw.length; i++) {
        if (pass_regx.test(pw.charAt(i))) {
            cnt = cnt + 1;
        }
    }
    return cnt;
}

//특수 문자의 갯수리턴
function fn_speChk(pw) {
    var cnt = 0;
    var pass_regx = /[^a-zA-Z0-9]/;

    for (var i = 0; i < pw.length; i++) {
        if (pass_regx.test(pw.charAt(i))) {
            cnt = cnt + 1;
        }
    }
    return cnt;
}

//비밀번호 체크
function fn_chkUserPw(pw) {
    var n_char = fn_charChk(pw);
    var n_num = fn_numberChk(pw);
    var n_spe = fn_speChk(pw);
    var n_cnt = 0;
    if (n_char > 0) {
        n_cnt = n_cnt + 1;
    }
    if (n_num > 0) {
        n_cnt = n_cnt + 1;
    }
    if (n_spe > 0) {
        n_cnt = n_cnt + 1;
    }

    if (n_cnt < 2) {
        alert("문자 종류(영문, 숫자, 특수문자) 중 최소 2종류를 포함하고 있어야 합니다.");
        return false;
    }
    if (pw.length < 10) {
        alert("자리수가 최소 10자리 이상이어야 합니다.");
        return false;
    }
    return true;
}

//문자열 byte 체크
function gfn_getByteLength(str) {
    var len = 0;

    if (str == null) {
        return 0;
    }

    for (var i = 0; i < str.length; i++) {
        var c = escape(str.charAt(i));

        if (c.length == 1) {
            len++;
        } else if (c.indexOf("%u") != -1) {
            len += 2;
        } else if (c.indexOf("%") != -1) {
            len += c.length / 3;
        }
    }

    return len;
}

//문자열 길이 확인
function gfn_chkStrLen(str, len) {
    var strLen = str.length;
    if (strLen > len) {
        alert("최대" + len + "자까지 입력가능합니다.");
    }
}

/**
 * BASE64 암호화
 * @param str
 */
function gfn_base64Encode(str) {
    var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

    var output = "";
    var chr1, chr2, chr3;
    var enc1, enc2, enc3, enc4;
    var i = 0;

    do {
        chr1 = str.charCodeAt(i++);
        chr2 = str.charCodeAt(i++);
        chr3 = str.charCodeAt(i++);

        enc1 = chr1 >> 2;
        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
        enc4 = chr3 & 63;

        if (isNaN(chr2)) {
            enc3 = enc4 = 64;
        } else if (isNaN(chr3)) {
            enc4 = 64;
        }

        output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2) + keyStr.charAt(enc3) + keyStr.charAt(enc4);
    } while (i < str.length);

    return output;
}

/**
 * 문자를 길이만큼 끝자리를 *로 변환한다.
 * @param str : 변환할 문자열
 * @param len : 변환할 길이
 */
function gfn_stringTrans(str, len) {
    if (str.length < 1) {
        return str;
    } else {
        var strLen = str.length;
        var rtnStr = str.substring(0, (strLen - len));

        for (var i = strLen; i > (strLen - len); i--) {
            rtnStr += "*";
        }

        return rtnStr;
    }
}

/**
 * 자바 스크립트 MAP 생성자
 * @returns {Map}
 */
Map = function () {
    this.map = new Object();
};

/**
 * 자바 스크립트 MAP 함수
 * 사용법
 * var map = new Map();
 * map.put(key, value);
 * map.get(key);
 */
Map.prototype = {
    put: function (key, value) {
        this.map[key] = value;
    },
    get: function (key) {
        return this.map[key];
    },
    containsKey: function (key) {
        return key in this.map;
    },
    containsValue: function (value) {
        for (var prop in this.map) {
            if (this.map[prop] == value) return true;
        }
        return false;
    },
    isEmpty: function (key) {
        return (this.size() == 0);
    },
    clear: function () {
        for (var prop in this.map) {
            delete this.map[prop];
        }
    },
    remove: function (key) {
        delete this.map[key];
    },
    keys: function () {
        var keys = new Array();
        for (var prop in this.map) {
            keys.push(prop);
        }
        return keys;
    },
    values: function () {
        var values = new Array();
        for (var prop in this.map) {
            values.push(this.map[prop]);
        }
        return values;
    },
    size: function () {
        var count = 0;
        for (var prop in this.map) {
            count++;
        }
        return count;
    }
};

function fn_clear(val1, val2) {
    document.getElementById(val1).value = "";
    document.getElementById(val2).value = "";
}

function fn_CheckStrLength(sourceID, cnt, str) {

    //변수의 초기화
    var obj = document.getElementById(sourceID);
    var now_str = obj.value;                     //이벤트가 발생한 컨트롤의 value값
    var now_len = obj.value.length;              //현재 value값의 글자 수

    var max_len = cnt;                           //제한할 최대 글자 수
    var i = 0;                                   //for문에서 사용할 변수
    var cnt_byte = 0;                            //한글일 경우 2 그외에는 1바이트 수 저장
    var chk_letter = "";                         //현재 한/영 체크할 letter를 저장

    for (i = 0; i < now_len; i++) {
        //1글자만 추출
        chk_letter = now_str.charAt(i);

        // 체크문자가 한글일 경우 2byte 그 외의 경우 1byte 증가
        if (escape(chk_letter).length > 4) {
            //한글인 경우 2byte (UTF-8인 경우 3byte로...)
            cnt_byte += 2;
        } else {
            //그외의 경우 1byte 증가
            cnt_byte++;
        }
    }

    // 만약 전체 크기가 제한 글자 수를 넘으면
    if (cnt_byte > max_len) {
        alert(str + " " + max_len + "자 이내로 입력하세요.");
        obj.focus();
        return true;
    }
}

//숫자인지 체크
function fn_numberCheck(ids, str) {
    var temp = document.getElementById(ids).value;

    if (isNaN(temp) == true) {
        alert(str + "는 숫자만 입력하세요.");
        document.getElementById(ids).focus();
        return true;
    }
}

// 이메일 형식체크
function fn_isemail(str) {
    var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

    if (!str.match(regExp)) {
        alert("지원되지 않는 이메일 형식입니다. 다시 입력해 주세요.");
        focusInputText("email");
        return true;
    }
}

// 비밀번호 정귝식
function fn_pwdcheck(str) {
    var refExp = /([a-zA-Z0-9].*[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"])|([\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"].*[a-zA-Z0-9])/;
    if (str.length < 8 || str.length > 16) {
        alert("8~16자리로 입력해주세요.");
        return true;
    }
    if (!str.match(refExp)) {
        alert("패스워드는 영문자,숫자,특수문자 조합으로 8~16자리로 입력해주세요.");
        return true;
    }
}

/**
 * 특수문자 인코딩
 * @param str
 * @returnsd
 */
function gfn_htmlEntityEnc(str) {
    if (str == "" || str == null) {
        return str;
    } else {
        return str.replace("&", "&amp;").replace("#", "&#35;").replace("<", "&lt;").replace(">", "&gt;").replace(/"/g, "&quot;").replace('\\', "&#39;").replace('%', "&#37;").replace('(', "&#40;").replace(')', "&#41;").replace('+', "&#43;").replace('/', "&#47;").replace('.', "&#46;");
    }
}

/**
 * 특수문자 디코딩
 * @param str
 * @returns
 */
function gfn_htmlEntityDec(str) {
    if (str == "" || str == null) {
        return str;
    } else {
        return str.replace(/&amp;/gi, "&").replace(/&#35;/gi, "#").replace(/&lt;/gi, "<").replace(/&gt;/gi, ">").replace(/&quot;/gi, "'").replace(/&#39;/gi, '\\').replace(/&#37;/gi, '%').replace(/&#40;/gi, '(').replace(/&#41;/gi, ')').replace(/&#43;/gi, '+').replace(/&#47;/gi, '/').replace(/&#46;/gi, '.').replace(/&#59;/g, ";");
    }
}

/**
 * 숫자에 천단위 콤마 찍기
 * @param num
 * @returns
 */
function addThousandSeparatorCommas(num) {
    var str;
    if (num == null) num = "0";
    if ((num != "0")) {
        str = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    } else {
        str = "0";
    }
    return str;
}


function genderTrans(sex) {
    var str = "";
    if (sex != "") {
        if (sex == "MALE") {
            str = "남성";
        } else if (sex == "FEMALE") {
            str = "여성";
        }
    }
    return str;
}

/**
 * 체크박스 전체 체크및 삭제
 * @param tagName
 */
function checkall(checkBoxId) {
    alert(checkBoxId);
    if ($("#" + checkBoxId).prop("checked")) {
        $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    }
}

/**
 * 체크박스 전체 체크및 삭제 ( 회원가입 - 약관동의)
 * @param tagName
 */
function checkallJoinAgree(allCheckBoxId, checkBoxId) {
    for(var i=0; i<3; i++){
        if ($("#" + allCheckBoxId).prop("checked")) {
            $("input:checkbox[id=" + "'" + checkBoxId + i + "'" + "]").prop("checked", true);
        } else {
            $("input:checkbox[id=" + "'" + checkBoxId + i + "'" + "]").prop("checked", false);
        }
    }
}

function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}

/**
 * 텍스트 수 줄이기
 * @param text
 * @param length
 * @returns
 */
function ellipsis(text, length) {

    var ellipsisString = "....";
    var outputString = text;

    if (text.length > 0 && length > 0) {
        if (text.length > length) {
            outputString = text.substring(0, length);
            outputString += ellipsisString;
        }
    }
    return outputString;
}

/**
 * 이미지 미리보기
 * @param input
 * @param imageId
 * @param tagId
 */
function preViewImage(input, imageId, tagId) {
    if (tagId != "")
        $("#" + tagId).show();

    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#" + imageId).attr("src", e.target.result);
        },
            reader.readAsDataURL(input.files[0]);
    }
}

/**
 * time만큼 시간 추가
 * @param dateTime
 * @param time
 * @returns {String}
 */
function addTime(dateTime, time) {
    var dt = new Date(dateTime);
    var krTime = new Date(Date.parse(dt) + (time * 1000) * 60 * 60);

    var year = parseInt(krTime.getFullYear());
    var month = parseInt(krTime.getMonth() + 1);
    var day = parseInt(krTime.getDate());
    var hour = parseInt(krTime.getHours());
    var minutes = parseInt(krTime.getMinutes());
    var second = parseInt(krTime.getSeconds());

    if (month <= 9) month = "0" + month;
    if (day <= 9) day = "0" + day;
    if (hour <= 9) hour = "0" + hour;
    if (minutes == "0") minutes += "0";
    if (second == "0") second += "0";

    var makeKorDateTime = year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + second;

    return makeKorDateTime;

}

function dateSub(day) {
    var d = new Date();
    var dt = d - day * 24 * 60 * 60 * 1000;
    var nd = new Date(dt);
    var year = nd.getFullYear();
    var month = nd.getMonth() + 1;
    var day = nd.getDate();
    if (month < 10) {
        month = "0" + month;
    }
    var yyyymmdd = year + month + day;
    return yyyymmdd;
}

/**
 * @author 안지호
 * @desc 나이계산(birhDay 입력형식 : yyyy-mm-dd hh:mm:ss)
 */
function getAge(birthDay) {
    var age = "";

    if (birthDay != "") {
        var checkNull = birthDay.indexOf("");
        if (checkNull == 0) {
            var preBirth = birthDay.split(" ");
            var birth = preBirth[0].split("-");
            var d1 = new Date(birth[0], birth[1] - 1, birth[2]);
            var d2 = new Date();
            var diff = d2.getTime() - d1.getTime();
            var daysPast = Math.floor(diff / (1000 * 60 * 60 * 24));
            var age = Math.floor(daysPast / 365.25) + 1;
        }
    }
    return age;
}

/**
 * @author 안지호
 * @param date(yyyy-mm-dd)
 * @desc 요일 계산
 * @returns
 */
function getInputDayLabel(date) {
    var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');

    var today = new Date(date).getDay();
    var todayLabel = week[today];
    return todayLabel;
}

/**
 * @author 안지호
 * @param val(yyyy-m-d)
 * @desc 날짜형식 재정의
 * @returns {String}
 */
function makeYYYY_MM_DD(val) {
    var yyyy_mm_dd = "";
    if (val != "") {
        var valSplit = val.split("-");
        var year = valSplit[0];
        var month = valSplit[1];
        var day = valSplit[2];
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        yyyy_mm_dd = year + "-" + month + "-" + day;
        return yyyy_mm_dd;
    }
}

function makeYYYY_MM(year, month) {
    var yyyy_mm = "";
    if (year != "" && month != "") {
        if (month < 10) {
            month = "0" + month;
        }
        yyyy_mm = year + "-" + month;
        return yyyy_mm;
    }
}

function today() {
    var date = new Date();

    var year = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day = date.getDate();

    if (("" + month).length == 1) {
        month = "0" + month;
    }
    if (("" + day).length == 1) {
        day = "0" + day;
    }

    return year + "-" + month + "-" + day;
}

function getYYYYMM() {
    var date = new Date();

    var year = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day = date.getDate();

    if (("" + month).length == 1) {
        month = "0" + month;
    }
    if (("" + day).length == 1) {
        day = "0" + day;
    }

    return year + month;
}

function getYear() {
    var date = new Date();
    var year = date.getFullYear();
    return year
}

function getMonth() {
    var date = new Date();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    return month;
}

function getMonthCount(count) {
    var date = new Date();
    var month = date.getMonth() + 1 + count; // 0부터 시작하므로 1더함 더함
    if (month < 10) {
        month = "0" + month;
    }
    return month;
}

function getDayCount(count) {
    var date = new Date();

    var day = date.getDate() + count;
    if (day < 10) {
        day = "0" + day;
    }
    return day;
}

function findYearMonthKor(count) {
    return getYear() + "년" + getMonthCount(count) + "월";
}

/**
 * 숫자만 입력받기
 * @param evt
 * @returns {Boolean}
 */
function digit_check(evt) {
    var code = evt.which ? evt.which : event.keyCode;
    if (code < 48 || code > 57) {
        alert("숫자만 입력가능합니다.");
        return false;
    }
}

/**
 * date_time값 끝 "." 붙었을 때 처리
 * @param date_time
 * @returns
 */
function getDateTimeSplitComma(date_time) {
    var date = "";
    if (date_time == null) date_time = "";
    if (date_time != "") {
        date = gfn_csplit(date_time, ".");
    }
    return date[0];
}

function innerHTML(tagId, val) {
    if (tagId != "") {
        $("#" + tagId).html(val);
    }
}

function innerHTMLAddColor(tagId, color) {
    if ((tagId != "") && (color != "")) {
        $("#" + tagId).css("color", color);
    }
}

function innerValue(tagId, val) {
    if (tagId != "") {
        $("#" + tagId).val(val);
    }
}

/**
 * 체크박스 체크상태 변경하기
 * @param checkbox_id
 * @param boolean(true:체크상태로, false:체크안한 상태로)
 */
function isCheckbox(checkbox_id, boolean) {
    if (checkbox_id != "") {
        $("#" + checkbox_id).attr("checked", boolean);
    }
}

/**
 * 체크박스 체크상태 변경하기
 * @param checkbox_id
 * @param boolean(true:체크상태로, false:체크안한 상태로)
 */
function isCheckboxByNumber(checkbox_id, number) {
    var boolean = false;
    if (number == "1" || number == "2") boolean = true; //number2 = 모의고사(온라인)

    if (checkbox_id != "") {
        $("#" + checkbox_id).attr("checked", boolean);
    }
}

/**
 * 페이지 새로고침 하기
 * @param boolean(true:새로고침, false:새로고침 안하기)
 */
function isReloadPage(boolean) {
    window.location.reload(boolean);
}

/**
 * 부모페이지 새로고침
 */
function isReloadParentPage() {
    parent.document.location.reload();
}

/**
 * 체크박스 체크여부 확인
 * @param checkboxId
 * @returns {Boolean}
 */
function isCheckedCheckbox(checkboxId, type) {
    var boolean = false;
    if (checkboxId != "") {
        if (type == "ID") {
            if ($("#" + checkboxId).is(":checked")) {
                boolean = true;
            }
        } else if (type == "NAME") {
            if ($("input[name=" + checkboxId + "]").is(":checked")) {
                boolean = true;
            }
        }
    }
    return boolean;
}

function getSelectboxValue(tagId) {
    var selectedvalue = "";
    if (tagId != "") {
        selectedvalue = $("#" + tagId + " option:selected").val();
    }
    return selectedvalue;
}

function getInputTextValue(tagId) {
    var inputValue = "";
    if (tagId != "") {
        inputValue = $("#" + tagId).val();
    }
    return inputValue;
}

function getInnerHtmlValue(tagId) {
    var innerHtmlValue = "";
    if (tagId != "") {
        innerHtmlValue = $("#" + tagId).html();
    }
    return innerHtmlValue;
}

function focusInputText(tagId) {
    if (tagId != "") {
        $("#" + tagId).focus();
    }
}

/**
 * 테이블 리스트 데이터 표현시 0값을 "0"로 변환
 * @param val
 * @param plusVal
 * @returns {String}
 */
function gfn_zeroToZero(val, plusVal) {
    var str;
    if (val == undefined) val = "0";
    if (plusVal == undefined) plusVal = "";

    if (val == "0" && plusVal == "") {
        str = "0";
    } else {
        if (plusVal != "") {
            str = val += plusVal;
        } else {
            str = val;
        }
    }
    return str;
}

/**
 * 테이블 리스트 데이터 표현시 0값을 "-"로 변환
 * @param val
 * @param plusVal
 * @returns {String}
 */
function gfn_zeroToPipe(val, plusVal) {
    var str;
    if (plusVal == undefined) plusVal = "";
    if (val == "0") {
        str = "-";
    } else {
        if (plusVal != "") {
            str = val += plusVal;
        } else {
            str = val;
        }
    }
    return str;
}

function gfn_leftZeroLeave(val) {
    var str = "";
    if (val != "") {
        str = val.replace(/(^0+)/, "");
    }
    return str;
}

/**
 * 값 비교해서 원하는 값 리턴
 * @param val(비교할 값)
 * @param if_data (조건 값)
 * @param true_data (참일 떄 값)
 * @param false_data (거짓일 때 값)
 * @returns {String}
 */
function gfn_isData(val, if_data, true_data, false_data) {
    var str = "";
    /*
    if (val == if_data) str = true_data;
    else str = false_date;
    return str;
    */
    return str = (val == if_data ? true_data : false_data);

}

function form_submit(form_id, action_url) {
    $("#" + form_id).attr("action", action_url);
    $("#" + form_id).submit();
}

function convertUnixTime(YYYY_MM_DD_HH_MM_SS) {
    var match = YYYY_MM_DD_HH_MM_SS.match(/^(\d+)-(\d+)-(\d+) (\d+)\:(\d+)\:(\d+)$/)
    var date = new Date(match[1], match[2] - 1, match[3], match[4], match[5], match[6])
    return date;
}

function compareTime(now, afterTime) {
    var boolean = true;
    if (now > afterTime) {
        boolean = false;
    }
    return boolean;
}

function compareTime_startend(now, start, end) {
    var boolean = false;
    if ((now >= start) && (now <= end)) {
        boolean = true;
    }
    return boolean;
}

/**
 * 오늘보다 입력날자가 오늘보다 미래의 날짜면 true
 * @param today
 * @param compareTime
 * @returns {Boolean}
 */
function isAfterToday(today, compareTime) {
    if (today < compareTime) {
        return true;
    }
    return false;
}

function gfn_display(tagId, showYn) {
    if (showYn == true) {
        $("#" + tagId).show();
    } else if (showYn == false) {
        $("#" + tagId).hide();
    }
}

/**
 * 글자수 입력 제한 (onkeyup 속성에 사용)
 * @param inputId(입력할 태그 아이디)
 * @param strLen(제한길이 수)
 */
function gfn_chkStrLength(inputId, strLen) {
    if ($("#" + inputId).val().length > strLen) {
        alert("알림 내용은 " + strLen + "자까지 입력가능합니다.");
        $("#" + inputId).val($("#" + inputId).val().substring(0, strLen));
        return;
    }
}

//주별일때 주별 날짜 계산
var getStartDayAndEndDay = function (val1, val2) {
    var str;

    if (40 <= val2 && val2 <= 52) {
        val1 = val1 - 1;
    }
    if (val2 >= 1 && val2 <= 12) {
        val2 = val2 - 1;
    }

    var startDate = makeYYYY_MM_DD(find_start_week(val1, val2));
    var splitStartDate = startDate.split("-");
    var startDay = splitStartDate[1] + "-" + splitStartDate[2];

    var endDate = makeYYYY_MM_DD(find_end_week(val1, val2));
    var splitEndDate = endDate.split("-");
    var endDay = splitEndDate[1] + "-" + splitEndDate[2]
    str = startDay + " ~ " + endDay;
    return str;
}

/**
 * html 디스플레이 상태 변경
 * @example
 * <pre>
 * var display = new Display();
 * display.show("html id");        html영역 보여주기
 * display.hide("html id");        html영역 숨기기
 * </pre>
 */
var Display = function () {
    this.show = function (tagId) {
        $("#" + tagId).show();
    };
    this.hide = function (tagId) {
        $("#" + tagId).hide();
    };
}

function getClassValues(className) {
    var values = [];
    if (className != "") {
        $("." + className).each(function () {
            values.push($(this).val());
        });
    }
    return values;
}

function getClassValue(className) {
    var value;
    if (className != "") {
        $("." + className).each(function () {
            value = $(this).val();
        });
    }
    return value;
}

//dwr 로딩 이미지 호출
function viewLoadingMessage() {
    dwr.util.useLoadingMessage(comment.load_data);
}

//input file 값 받아오기
function getFileData(fileId) {
    var data = new FormData();
    $.each($("#" + fileId)[0].files, function (i, file) {
        data.append(fileId, file);
    });
    return data;
}

//input file 배열값 받아오기
function getFileDatas(tagName) {
    var data = new FormData();
    var cnt = $("input[name=" + tagName + "]").length;
    for (var i = 0; i < cnt; i++) {
        data.append(fileId + "-" + i, $("input[name=" + tagName + "]")[i].files[0]);
    }
    return data;
}

//ajax 파일 전송
function ajaxFileUpload(callUrl, fileData, pageReloadYn) {
    $.ajax({
        url: callUrl,
        method: "post",
        dataType: "json",
        data: fileData,
        cache: false,
        processData: false,
        contentType: false,
        success: function (data) {
            if (data.result == "1") {
                alert(comment.success_process);
                if (pageReloadYn == true) {
                    isReloadPage(pageReloadYn);
                }
            } else {
                alert(comment.error);
            }
        },
        error: function (request, status, error) {
            alert(comment.error);
            return;
        }
    });
}

////////////////////////////////////////////////////////////////////////////////
//HashMap Class Section
////////////////////////////////////////////////////////////////////////////////
/**
 * key:value 를 사용하는 HashMap
 * @example
 * <pre>
 * var map = new SOFOHashMap();
 * map.put("key","value");
 * map.get("key");
 * map.length;            길이 반환
 * map.keys();            모든 키 객체반환
 * map.values():            모든 값 객체반환
 * map.toQuaryString([option]);   key=value[option] 문자열반환
 * map.clear();            초기화
 * map.next();            다음 객체 반환
 * map.indexValue(index);위치로 값 찾기
 * map.splice(key);        key 삭제
 * map.point(key);        key 의 위치반환
 * </pre>
 */
var SOFOHashMap = function () {
    this.obj = [];
    this.length = 0;

    this.put = function (key, value) {
        if (this.obj[key] == null) this.length++;
        this.obj[key] = value;
    };

    this.get = function (key) {
        return this.obj[key];
    };

    this.keys = function () {
        var keys = [];
        for (var property in this.obj) keys.push(property);
        return keys;
    };

    this.values = function () {
        var values = [];
        for (var property in this.obj) values.push(this.obj[property]);
        return values;
    };

    this.toQueryString = function (divMark) {
        var divMark = (typeof divMark == "undefined") ? "&" : divMark;
        var quaryString = "";
        var key = this.keys();
        var value = this.values();
        if (this.length < 1) return "";

        for (var i = 0; i < this.length; i++) {
            if (quaryString != "")
                quaryString += divMark;
            quaryString += key[i] + "=" + value[i];
        }
        return quaryString;
    };

    this.remove = function (index) {
        var keys = this.keys();
        keys.splice(index, 1);
        var temp = [];
        for (var i = 0; i < keys.length; i++) {
            temp[keys[i]] = this.obj[keys[i]];
        }
        this.obj = temp;
        this.length = keys.length;
        index--;
    };

    this.indexOf = function (key) {
        var cnt = 0;
        for (var i in this.obj) {
            if (key == i) return cnt;
            cnt++;
        }
    };

    this.splice = function (spliceIndex) {
        var keys = this.keys();
        keys.splice(spliceIndex, 1);
        var temp = [];
        for (var i = 0; i < keys.length; i++) {
            temp[keys[i]] = this.obj[keys[i]];
        }
        this.obj = temp;
        this.length = keys.length;
        index--;
    };


    this.point = function (key) {
        var cnt = 0;
        for (var i in this.obj) {
            if (key == i) return cnt;
            cnt++;
        }
    };

    this.clear = function () {
        this.obj = [];
        this.length = 0;
    };

    var index = 0;
    this.next = function () {
        if (index == this.length) {
            index = 0;
            return -1;
        }
        var values = this.values();
        var currentValue = values[index];
        index++;
        return currentValue;
    };

    this.indexValue = function (Idx) {
        var keys = this.keys();
        return this.obj[keys[Idx]];
    };
};

//핸드폰번호 text자동넘김
function js_tab_order(arg, tag_id, len) {
    if (arg.value.length == len) {
        $("#" + tag_id).focus();
        return;
    } else if (arg.value.length > len) {
        alert("입력할수 있는 수가 초과되었습니다.");
        var sub_value = arg.value.substring(0, len);
        arg.value = sub_value;
        return;
    }
}

//핸드폰번호 붙이기
function phoneNumber_sum(phone1, phone2, phone3) {
    var phone1 = $("#" + phone1).val();
    var phone2 = $("#" + phone2).val();
    var phone3 = $("#" + phone3).val();
    var allPhoneNum = phone1+"-"+ phone2+"-"+phone3;
    return allPhoneNum;

}

//라디오버튼 값가져오기
function get_radio_value(name) {
    var radio_value = $(":input:radio[name= " + name + " ]:checked").val();
    return radio_value;
}

//폰번호 가져오기
function get_allphonenum(phone1, phone2, phone3) {
    var phonenum1 = $("#" + phone1).val();
    var phonenum2 = $("#" + phone2).val();
    var phonenum3 = $("#" + phone3).val();
    var all_phonenum = phonenum1 + phonenum2 + phonenum3;
    return all_phonenum;
}



//쌍따옴표 제거
function remove_double_quotation(val) {
    var removed_str = val.replace(/"/g, "");
    return removed_str;
}

function get_month_lastday(year, month) {
    return new Date(year, month, 0).getDate();
}

//콤마 제거
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

//태그 네임 배열의 마지막값 가져오기
function get_array_last_value_by_name(type, name) {
    var val = "";
    if (type == "select") {
        val = $("select[name=" + '"' + name + '"' + "]").last().val();
    } else if (type == "input") {
        val = $("input[name=" + '"' + name + '"' + "]").last().val();
    }
    return val;
}

//태그 네임 배열 값 가져오기
function get_array_values_by_name(type, name) {
    var array = new Array();
    if (type == "select") {
        $("select[name=" + '"' + name + '"' + "]").each(function () {
            array.push($(this).val());
        });
    } else if (type == "input") {
        $("input[name=" + '"' + name + '"' + "]").each(function () {
            array.push($(this).val());
        });
    } else if (type == "span") {
        $("span[name=" + '"' + name + '"' + "]").each(function () {
            array.push($(this).val());
        });
    }
    return array;
}



//브라우저 종류 값 가져오기
function get_browser_type() {
    var browser = "";
    var ua = window.navigator.userAgent;
    if (ua.indexOf('MSIE') > 0 || ua.indexOf('Trident') > 0)
        browser = "IE";
    else if (ua.indexOf('Opera') > 0 || ua.indexOf('OPR') > 0)
        browser = "Opera";
    else if (ua.indexOf('Firefix') > 0)
        browser = "Firefox";
    else if (ua.indexOf('Safari') > 0) {
        if (ua.indexOf('Chrome') > 0)
            browser = "Chrome";
        else
            browser = "Safari";
    }
    return browser;
    //document.write(b);
}

function close_popup(popupLayerId) {
    gfn_display(popupLayerId, false);
    $(".bg-layer").hide();
}


/* 한글/영어만 입력가능한 기능 */
function check_key() {
    var char_ASCII = event.keyCode;

    //숫자
    if (char_ASCII >= 48 && char_ASCII <= 57)
        return 1;
    //영어
    else if ((char_ASCII >= 65 && char_ASCII <= 90) || (char_ASCII >= 97 && char_ASCII <= 122))
        return 2;
    //특수기호
    else if ((char_ASCII >= 33 && char_ASCII <= 47) || (char_ASCII >= 58 && char_ASCII <= 64)
        || (char_ASCII >= 91 && char_ASCII <= 96) || (char_ASCII >= 123 && char_ASCII <= 126))
        return 4;
    //한글
    else if ((char_ASCII >= 12592) || (char_ASCII <= 12687))
        return 3;
    else
        return 0;
}

/* 한글 & 영어만 입력가능한 기능 */
function nonHangulSpecialKey() {
    if (check_key() != 2) {
        event.returnValue = false;
        return;
    }
}

function reset_value(tag_id) {
    if (tag_id != null) {
        $("#" + tag_id).val("");
    }
}

function reset_html(tag_id) {
    if (tag_id != null) {
        $("#" + tag_id).html("");
    }
}

function getTimeStamp(name, check_mode) {
    var d = new Date();
    var time = leadingZeros(d.getHours(), 2) + ':' +
        leadingZeros(d.getMinutes(), 2);

    $("input[name='" + name + "']:checked").each(function () {
        var inputValue = $(this).val();

        if ($("#class_" + check_mode + "_" + inputValue).val() == "") {
            $("#class_" + check_mode + "_" + inputValue).val(time);
        }
    });
}

// 몇일전 날짜 구하기
function getDayAgo(dayCount) {
    var today = new Date();
    var oldday = new Date(today - (3600000 * 24 * dayCount));
    var year = oldday.getFullYear();
    var month = oldday.getMonth() + 1;
    var day = oldday.getDate();

    if (("" + month).length == 1) {
        month = "0" + month;
    }
    if (("" + day).length == 1) {
        day = "0" + day;
    }

    return year + "-" + month + "-" + day;
}

//시분초 자른 날짜 구하기
function split_minute_getDay(day) {
    var Reday = "";
    if(day != null){
        day = day.split(" ");
        Reday = day[0];
    }else{
        Reday = "-";
    }
    return Reday;
}


//현재날짜기준으로 연차 구하기
function getAnnual(registerDate) {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    if (dd < 10) dd = '0' + dd;
    if (mm < 10) mm = '0' + mm;
    var todeyDate = yyyy + '-' + mm + '-' + dd;

    var arr1 = registerDate.split('-');
    var arr2 = todeyDate.split('-');
    var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
    var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

    var diff = dat2 - dat1;
    var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
    var currMonth = currDay * 30;// 월 만듬
    var currYear = currMonth * 12; // 년 만듬

    var driver_year = parseInt(diff / currYear);

    return parseInt(diff / currYear);
}

// 날짜 구하기 == 년도만
function getYearAgo(dayCount) {
    var today = new Date();
    var oldday = new Date(today - (3600000 * 24 * dayCount));
    var year = oldday.getFullYear();
    var month = oldday.getMonth() + 1;
    var day = oldday.getDate();

    if (("" + month).length == 1) {
        month = "0" + month;
    }
    if (("" + day).length == 1) {
        day = "0" + day;
    }

    return year;
}

// 날짜 구하기 = 년도 & 월
function getYearMonthAgo(dayCount) {
    var today = new Date();
    var oldday = new Date(today - (3600000 * 24 * dayCount));
    var year = oldday.getFullYear();
    var month = oldday.getMonth() + 1;
    var day = oldday.getDate();

    if (("" + month).length == 1) {
        month = "0" + month;
    }
    if (("" + day).length == 1) {
        day = "0" + day;
    }

    return year+"년"+month+"월";
}

// 10년후 날짜 구하기
function getYearAfter(dayCount) {
    var today = new Date();
    var year  = today.getFullYear() + 11;

    return year;
}

// 쿠키 생성
function setCookie(cName, cValue, cDay) {
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if (typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}

// 쿠키 가져오기
function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if (start != -1) {
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1) end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}

function setCookieMobile ( name, value, expiredays ) {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function getCookieMobile () {
    var cookie = getCookie("todayCookie");
    if ( cookie == 'done' ){
        gfn_display("quickBar", false);
    } else {
        $("#quickBar").show();
    }
}

//이메일 만들기
function make_email(emailStr, emailDomain) {
    var email;
    if (emailStr != "" && emailDomain != "") {
        email = emailStr + "@" + emailDomain;
    }
    return email;
}

//이메일의 도메인명 구하기
function get_email_domain(email) {
    if (email == null) {
        return;
    }

    if (email.length == 0) {
        return;
    }

    var mail = email.split("@");
    return mail[1];
}

//마우스가 클릭되었을때 초기 메시지를 클리어
function clearMessage(input_id) {
    if (input_id == null) return;
    var clearChk = true;
    if (clearChk) {
        $("#" + input_id).val("");
        clearChk = false;
    }
}

//입력된 문자의 바이트 수를 체크 후 출력하기
function checkByte(input_id, byte_message_id, limitByte) {
    var totalByte = 0;
    var message = $("#" + input_id).val();
    for (var i = 0; i < message.length; i++) {
        var currentByte = message.charCodeAt(i);
        if (currentByte > 128) totalByte += 2;
        else totalByte++;
    }
    $("#" + byte_message_id).html(totalByte);
    if (totalByte > limitByte) {
        var memolimit = message.substring(0, limitByte);
        $("#" + input_id).val(memolimit);
    }
}

/**
 * 값 공백 체크 클래스
 * @example
 * <pre>
 * var check = new check();
 * if (check.input(val1, val2) == false) return;
 * if (check.selectbox(val1, val2) == false) return;
 * if (check.value(val1, val2) == false) return;
 * if (check.value_compare_row_check(val1, val2, val3) == false) return;
 * </pre>
 */
var check = function () {
    //input type=text 공백 체크
    this.input = function (tagId, alertContent) {
        if ($("#" + tagId).val() == "") {
            alert(alertContent, tagId);
            focusInputText(tagId);
            return false;
        }
    };
    //input type=select 공백 체크
    this.selectbox = function (tagId, alertContent) {
        if ($("#" + tagId + " option:selected").val() == "") {
            alert(alertContent, tagId);
            focusInputText(tagId);
            return false;
        }
    };
    // 입력받은 변수의 공백 체크
    this.value = function (val, alertContent) {
        if (val == "" || val == undefined) {
            alert(alertContent);
            return false;
        }
    };
    //값 비교 체크
    this.compare = function (compareVal1, compareVal2, alertContent) {
        if (Number(compareVal1) < Number(compareVal2)) {
            alert(alertContent);
            return false;
        }
    };
}

function value_compare_row_check(val, compare_val, alert_content) {
    if (val < compare_val) {
        alert(alert_content);
        return false;
    }
}

/**
 * var paging = new paging();
 * DWR 페이징 개수 체크 후 공통 로직
 * sPage : 현재 페이지 넘버(초기 값)
 * cnt : 메서드에서 가져온 데이터 개수
 * list_count : 리스트 개수
 * empty_comment : 개수가 없을때 보여질 멘트
 */
var paging = function () {
    this.count = function (sPage, cnt, paging_count, list_count, empty_comment) {
        if (cnt == "0") {
            gfn_printPageNum_new('0', paging_count, list_count, '1');
            gfn_emptyView("V", empty_comment);
        } else {
            if (new Number(cnt) < (list_count * sPage)) {
                if (new Number(cnt) < (list_count * (sPage - 1))) {
                    sPage = 1;
                    innerValue("sPage", sPage);
                }
            }
            gfn_printPageNum_new(cnt, paging_count, list_count, sPage);
        }
    };

    this.count2 = function (sPage, cnt, paging_count, list_count, empty_comment) {
        if (cnt == "0") {
            gfn_printPageNum_new2('0', paging_count, list_count, '1');
            gfn_emptyView2("V", empty_comment);
        } else {
            if (new Number(cnt) < (list_count * sPage)) {
                if (new Number(cnt) < (list_count * (sPage - 1))) {
                    sPage = 1;
                    innerValue("sPage2", sPage);
                }
            }
            gfn_printPageNum_new2(cnt, paging_count, list_count, sPage);
        }
    };

    this.count3 = function (sPage, cnt, paging_count, list_count, empty_comment) {
        if (cnt == "0") {
            gfn_printPageNum_new3('0', paging_count, list_count, '1');
            gfn_emptyView3("V", empty_comment);
        } else {
            if (new Number(cnt) < (list_count * sPage)) {
                if (new Number(cnt) < (list_count * (sPage - 1))) {
                    sPage = 1;
                    innerValue("sPage3", sPage);
                }
            }
            gfn_printPageNum_new3(cnt, paging_count, list_count, sPage);
        }
    };

    this.count4 = function (sPage, cnt, paging_count, list_count, empty_comment) {
        if (cnt == "0") {
            gfn_printPageNum_new4('0', paging_count, list_count, '1');
            gfn_emptyView4("V", empty_comment);
        } else {
            if (new Number(cnt) < (list_count * sPage)) {
                if (new Number(cnt) < (list_count * (sPage - 1))) {
                    sPage = 1;
                    innerValue("sPage4", sPage);
                }
            }
            gfn_printPageNum_new4(cnt, paging_count, list_count, sPage);
        }
    };

}

function getJsonObjectFromDiv(divId) {
    var formdata = serializeDiv($('#' + divId), 'serializeArray');
    var data = {};
    $(formdata).each(function (index, obj) {
        data[obj.name] = obj.value;
    });
    return data;
}

function pagingListCount() {
    return "10";
}

/*원은정 추가*/
function serializeDiv( $div, serialize_method ) {
    // Accepts 'serialize', 'serializeArray'; Implicit 'serialize'
    serialize_method = serialize_method || 'serialize';

    // Unique selector for wrapper forms
    var inner_wrapper_class = 'any_unique_class_for_wrapped_content';

    // Wrap content with a form
    $div.wrapInner( "<form class='"+inner_wrapper_class+"'></form>" );

    // Serialize inputs
    var result = $('.'+inner_wrapper_class, $div)[serialize_method]();

    // Eliminate newly created form
    $('.script_wrap_inner_div_form', $div).contents().unwrap();

    // Return result
    return result;
}

function menuActive(mainMenuId, index) {

    $('.sidebar-item').on('click', 'li', function(e) {
        var subMenu = $('.collapse');

        subMenu.find('li').removeClass('active');
        subMenu.find('li').find('a').removeClass('active');

        var $this = $(this);
        $this.parent().find('li').removeClass('active');
        $this.find('a').addClass('active');

        var checkElement = $this.next();
        checkElement.parent("li").removeClass('active');

    });
    $("#" + mainMenuId).addClass('selected');
    $("#" + mainMenuId).find("a").eq(index).addClass('active');
    $("#" + mainMenuId).find("ul").addClass('in');

}

//모의고사 - 년도자르고 HH 구하기
function split_HH_getTime(day, id, index) {
    var day = day.split(" ");
    if(day[1]){
        var HH =  day[1].split(":");
    }
    $("select[name="+id+"]").eq(index).val(HH[0]);
}

//모의고사 - 년도자르고 MM 구하기
function split_MM_getTime(day, id, index) {
    var day = day.split(" ");
    if(day[1]){
        var MM = day[1].split(":");
    }
    $("select[name="+id+"]").eq(index).val(MM[1]);
}

//달력 - 기간별조회
function getFormatDate(date){
    var year = date.getFullYear();
    var month = (1 + date.getMonth());
    month = month >= 10 ? month : '0' + month;
    var day = date.getDate();
    day = day >= 10 ? day : '0' + day;
    return  year +'-'+ month +'-'+ day;
}

//달력 - 기간별조회
function setSearchDate(start, startId, endId){
    var num = start.substring(0,1);
    var str = start.substring(1,2);

    var today = new Date();

    var endDate = getFormatDate(today);

    $('#'+endId).val(endDate);

    if(str == 'd'){
        today.setDate(today.getDate() - num);
    }else if (str == 'w'){
        today.setDate(today.getDate() - (num*7));
    }else if (str == 'm'){
        today.setMonth(today.getMonth() - num);
        today.setDate(today.getDate() + 1);
    }

    var startDate = getFormatDate(today);

    if(start == 'all'){
        $('#'+startId).val("");
        $('#'+endId).val("");
    }else{
        $('#'+startId).val(startDate);
    }
}
function allChk(obj, chkId){
    var chkObj = document.getElementsByName(chkId);
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
          for (var i=0; i<=rowCnt; i++){
              if(chkObj[i].type == "checkbox")
                  chkObj[i].checked = true;
          }
    } else {
        for (var i=0; i<=rowCnt; i++) {
            if(chkObj[i].type == "checkbox"){
                chkObj[i].checked = false;
            }
        }
    }
}


function deleteTableRow(tableId, className) {
    $("#"+tableId).on("click", "."+className, function(){
        var clickedRow = $(this).parent().parent();
        var cls = clickedRow.attr("class");
        // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
        if( clickedRow.find("td:eq(0)").attr("rowspan") ){
            if( clickedRow.next().hasClass(cls) ){
                clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
            }
        }
        clickedRow.remove();
        // rowspan 조정
        resizeRowspan(cls);
    });
    // cls : rowspan 을 조정할 class ex) item1, item2, ...
    function resizeRowspan(cls){
        var rowspan = $("."+cls).length;
        $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
    }
}

function execDaumPostcode() {
    var width = 500; //팝업의 너비
    var height = 600; //팝업의 높이
    new daum.Postcode({
        width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
        height: height,
        autoClose: true,
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }

            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }

            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("addressRoad").value = roadAddr;
            document.getElementById("addressNumber").value = data.jibunAddress;

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            self.close();
        }
    }).open({
        left: (window.screen.width / 2) - (width / 2),
        top: (window.screen.height / 2) - (height / 2)
    });
}

//textarea Byte수 제한하기
function pubByteCheckTextarea(oid, tid, maxlength){
    var isKorean = $(oid).val();
    var strlength = 0;

    for(var i = 0; i < isKorean.length; i++){
        if(escape(isKorean.charAt(i)).length == 6){
            strlength++;
        }
        strlength++;
    }

    if(parseInt(maxlength-strlength) <= 0){
        alert(maxlength +"자 이상 입력 할 수 없습니다.");
        return false;
    }else{
        //SET
        $(tid).html( strlength +"/"+ maxlength);
    }
}

function  InputPhoneNumCheck(phoneNum) {
    return phoneNum.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
}


/* input text onkeyup 금액표시 */
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');

}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
/* input text onkeyup 금액표시 */

// 콤마제거
function removeComma(n) {
    if ( typeof n == "undefined" || n == null || n == "" ) {
        return "";
    }
    var txtNumber = '' + n;
    return txtNumber.replace(/(,)/g, "");
}

//회원 상세정보
function goMemberDetail(val) {
    innerValue('param_key', val);
    innerValue('param_key2', getInputTextValue('searchStartDate'));
    innerValue('param_key3', getInputTextValue('searchEndDate'));
    innerValue('param_key4', getSelectboxValue('memberGradeSel'));
    innerValue('param_key5', getSelectboxValue('sel_1'));
    innerValue('param_key6', getSelectboxValue('memberSel'));
    innerValue('param_key7', getInputTextValue('searchText'));
    innerValue('param_key8', 'detail');

    goPage('memberManage', 'memberManage');
}


//금액 컴마표시
function format(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//원단위 절사하기
function roundingDownWon(val) {
    var roundingDownWon = "";
    if (val == '' || val != undefined) {
        roundingDownWon = Math.floor(val / 10) * 10;
    }
    return Number(roundingDownWon);
}

function getContextPath() {
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

jQuery.download = function(url, data, method){
    // url과 data를 입력받음
    if( url && data ){
        // data 는  string 또는 array/object 를 파라미터로 받는다.
        data = typeof data == 'string' ? data : jQuery.param(data);
        // 파라미터를 form의  input으로 만든다.
        var inputs = '';
        jQuery.each(data.split('&'), function(){
            var pair = this.split('=');
            inputs+='<input type="hidden" name="'+ pair[0] +'" value="'+ pair[1] +'" />';
        });
        // request를 보낸다.
        jQuery('<form action="'+ url +'" method="'+ (method||'post') +'">'+inputs+'</form>')
            .appendTo('body').submit().remove();
    };
};

//pc,mobile 구분
function divisionPcMobile() {
    var filter = "win16|win32|win64|mac|macintel";
    var result = "";
    if ( navigator.platform ) {
        if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
            result = "MOBILE";
        } else {
            result = "PC";
        }
        return result;
    }

}

function addFavorite() {
    //var title = "Lael's World";
    //var url = "https://blog.lael.be";
    var title = document.title; //현재 보고 있는 페이지의 Title
    var url = location.href; //현재 보고 있는 페이지의 Url
    if (window.sidebar && window.sidebar.addPanel) { //firefox
        window.sidebar.addPanel(title, url, "");
    } else if (window.opera && window.print) { //opera
        var elem = document.createElement('a');
        elem.setAttribute('href', url);
        elem.setAttribute('title', title);
        elem.setAttribute('rel', 'sidebar');
        elem.click();
    } else if (document.all) { //msie
        window.external.AddFavorite(url, title);
    } else {
        alert("해당브라우저는 즐겨찾기 추가기능이 지원되지 않습니다.\n\n수동으로 즐겨찾기에 추가해주세요.");
        return true;
    }
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function fnAppendHidden(p_form, p_nm, p_val){
    if(!p_form) return;
    //Hidden 항목을 생성합니다.
    var o_hidden = document.createElement("input");
    o_hidden.type = "hidden";
    o_hidden.name = p_nm;
    o_hidden.value = p_val;
    //폼에 히든항목을 붙입니다.
    p_form.appendChild(o_hidden);
}

function goBack() {
    history.back();
}

//기능준비중입니다 알림함수
function readyFunctionAlert() {
    alert(comment.ready_function);
    return;
}

//로그인 페이지 이동하기
function goLoginPage() {
    fnAppendHidden(document.frm, "target_url", "");
    with (document.frm) {
        var targetUrl = window.location.href;
        page_gbn.value = "login";
        target_url.value = targetUrl;
        action = "/user";
        submit();
    }
}

//로그인하기
// function login() {
//     /**
//      * TODO 로그인 로직 추가
//      */
//     var targetUrl = getParameterByName("target_url");
//     location.href = targetUrl;
// }

//아이디 6~12자 영문+숫자 조합여부 체크
function validationUserId(userId) {
    var isDuplicate = checkDuplicate(userId);
    var reg1 = /^[a-z0-9]{5,12}$/;
    var reg2 = /[a-z]/g;
    var reg3 = /[0-9]/g;
    if (isDuplicate == 902) {
        gfn_display("idCaption", true);
        innerHTML("idCaption","아이디 중복");
    } else if (!reg1.test(userId) || !reg2.test(userId) || !reg3.test(userId)) {
        gfn_display("idCaption", true);
        innerHTML("idCaption","아이디는 6~12자 영문+숫자조합이여야 합니다.");
        innerValue("idValidation", 0); // 0 : 실패 , 1 : 성공
    } else{
        gfn_display("idCaption", false);
        innerValue("idValidation", 1); // 0 : 실패 , 1 : 성공
    }
}

//비밀번호 8자이상 특수문자+영문+숫자 조합여부 체크
function validationPassword(pwd) {
    if (pwd.length > 0){
        var check = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,30}/;
        if (!check.test(pwd)) {
            gfn_display("pwdCaption", true);
            innerValue("pwdValidation", 0); // 0 : 실패 , 1 : 성공
            innerHTML("pwdCaption","비밀번호는 특수문자+영문+숫자 8자 이상으로 조합이여야 합니다.");
        } else {
            gfn_display("pwdCaption", false);
            innerValue("pwdValidation", 1); // 0 : 실패 , 1 : 성공
        }
    }
}

//비밀번호 8자이상 특수문자+영문+숫자 조합여부 체크
function validationChkPassword(pwd) {
    if (pwd.length > 0){
        var check = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,30}/;
        if (!check.test(pwd)) {
            //gfn_display("pwdCaption", true);
            innerValue("pwdValidation", 0); // 0 : 실패 , 1 : 성공
            innerHTML("pwdCaption","");
           // innerHTML("pwdCaption","비밀번호는 특수문자+영문+숫자 8자 이상으로 조합이여야 합니다.");
        } else {
            //gfn_display("pwdCaption", false);
            innerValue("pwdValidation", 1); // 0 : 실패 , 1 : 성공
            innerHTML("pwdCaption","가능");
        }
    }
}



//이메일 주소 셀렉트박스 선택 :  tagId (emailAddress)
function selEmail(val) {
    if(val == ""){
        innerValue("emailAddress", "");
    }else{
        innerValue("emailAddress", val);
    }
}

function fnNicePopup() {
    var win = window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
    document.frm.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
    document.frm.target = "popupChk";
    document.frm.submit();
}

//휴대전화번호 하이픈 붙이기
function getPhoneNumHypen(val) {
    var phoneNum = "";
    phoneNum = val.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
    return phoneNum;
}

function toStrFileName(arr){
    var result = "";
    var str = "";
    for (var i=0; i<arr.length; i++) {
        str += '"' + arr[i] + '",';
    }
    var str2 = str.substr(0, str.length -1);

    result = "[" + str2 + "]";
    return result;
}

function daumMapApi(id, str) {
    var mapContainer = document.getElementById(id), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

    var geocoder = new kakao.maps.services.Geocoder();

    geocoder.addressSearch(str, function(result, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords,
                image: markerImage
            });
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
                map.relayout();
        }
    });
}

function setTimeOutDaumMapApi(id, str) {
    setTimeout(function() {
        var mapContainer = document.getElementById(id), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다
            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

        var geocoder = new kakao.maps.services.Geocoder();

        geocoder.addressSearch(str, function(result, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords,
                    image: markerImage
                });

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다

                map.setCenter(coords);
                map.relayout();


            }
        });
    }, 10);

}

//체크박스 장바구니 담기
function goCheckedShopBasket() {
    var arr = new Array();
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    if(sessionUserInfo != undefined){
        var userKey = sessionUserInfo.userKey;
        if($("input:checkbox[name=lecChk]:checked").length == 0 ){
            alert("체크된 상품이 없습니다.");
            event.returnValue = false;
        }
        $('input[name=lecChk]:checked').each(function() {
            var priceKey = $(this).attr('id');
            var gkey = $(this).val();
            var data = {
                userKey : userKey,
                gKey : gkey,
                priceKey : priceKey,
                gCount : 1
            };
            arr.push(data);
        });

        var saveCartInfo = JSON.stringify(arr);
        var result = saveCart(saveCartInfo);
        if(result.resultCode == 200){
            alert("장바구니에 담겼습니다.");
            isReloadPage(true);
        }
    }else{
        alert("로그인을 해주세요");
        goLoginPage();
    }
}

//바로구매
function goCheckedBuy() {
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    if(sessionUserInfo != undefined) {
        if($("input:checkbox[name=lecChk]:checked").length == 0 ){
            alert("체크된 상품이 없습니다.");
            return false;
        }
        if (confirm("바로 구매 하시겠습니까?")) {
            sessionStorage.removeItem('cartNum');
            sessionStorage.removeItem('gKeys');
            sessionStorage.removeItem('goodsInfo');
            sessionStorage.removeItem('resultData');
            var arr = new Array();
            var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
            var userKey = sessionUserInfo.userKey;
            $('input[name=lecChk]:checked').each(function () {
                //var gkey = $(this).val();
                 var priceKey = $(this).attr('id');
                arr.push(priceKey);
            });
            var data = toStrFileName(arr);
            innerValue("gKeys", data);

            $("#id_frm_singleMypage").attr("action", "/myPage?page_gbn=write");
            $("#id_frm_singleMypage").submit();
        }
    }else{
        alert("로그인을 해주세요");
        goLoginPage();
    }

}

function goPackageCheckedBuy() {
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    if(sessionUserInfo != undefined) {
        if($("input:checkbox[name=lecChk]:checked").length == 0 ){
            alert("체크된 상품이 없습니다.");
            return false;
        }
        if (confirm("바로 구매 하시겠습니까?")) {
            sessionStorage.removeItem('cartNum');
            sessionStorage.removeItem('gKeys');
            sessionStorage.removeItem('goodsInfo');
            sessionStorage.removeItem('resultData');
            var arr = new Array();
            $('input[name=lecChk]:checked').each(function () {
                var priceKey = $(this).attr('id');
                var gkey = $(this).val();
                var data = {
                    gKey: gkey,
                    priceKey: priceKey
                };
                arr.push(data);
            });
            var data = JSON.stringify(arr);
            innerValue("goodsInfo", data);
            $("#id_frm_pacakgeMypage").attr("action", "/myPage?page_gbn=write");
            $("#id_frm_pacakgeMypage").submit();
            //goPage("myPage","write");
        }
    }else{
        alert("로그인을 해주세요");
        goLoginPage();
    }
}

//단일 장바구니
function goOneLecCheckedShopBasket(priceKey, gkey) {
    var arr = new Array();
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    if(sessionUserInfo != undefined){
        var userKey = sessionUserInfo.userKey;
        var data = {
            userKey : userKey,
            gKey : gkey,
            priceKey : priceKey,
            gCount : 1
        };
        arr.push(data);
        var saveCartInfo = JSON.stringify(arr);
        var result = saveCart(saveCartInfo);
        if(result.resultCode == 200){
            alert("장바구니에 담겼습니다.");
        }
    }else{
        alert("로그인을 해주세요");
        goLoginPage();
    }
}

//단일 장바구니
function goOneLecCheckedBookStoreBasket(priceKey, gkey, gCount) {
    var arr = new Array();
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    if(sessionUserInfo != undefined){
        var userKey = sessionUserInfo.userKey;
        var data = {
            userKey : userKey,
            gKey : gkey,
            priceKey : priceKey,
            gCount : gCount
        };
        arr.push(data);
        var saveCartInfo = JSON.stringify(arr);
        var result = saveCart(saveCartInfo);
        if(result.resultCode == 200){
            alert("장바구니에 담겼습니다.");
            return false;
        }
    }else{
        alert("로그인을 해주세요");
        goLoginPage();
    }
}



//단일 바로구매
function goOneLecCheckedBuy(gkey) {
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    if(sessionUserInfo != undefined) {
        if (confirm("바로 구매 하시겠습니까?")) {
            sessionStorage.removeItem('cartNum');
            sessionStorage.removeItem('gKeys');
            sessionStorage.removeItem('goodsInfo');
            sessionStorage.removeItem('resultData');
            var arr = new Array();
            var userKey = sessionUserInfo.userKey;
            arr.push(gkey);

            var data = toStrFileName(arr);
            innerValue("gKeys", data);
            $("#id_frm_singleMypage").attr("action", "/myPage?page_gbn=write");
            $("#id_frm_singleMypage").submit();
        }
    }else{
        alert("로그인을 해주세요");
        goLoginPage();
    }
}

function goCheckBuy(gkey) {
    var keyArr = new Array();
    keyArr.push(gkey);
    var data = toStrFileName(keyArr);
}

function getToday(){
    var date = new Date();

    var year = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day = date.getDate();

    if (("" + month).length == 1) {
        month = "0" + month;
    }
    if (("" + day).length == 1) {
        day = "0" + day;
    }

    return year + "-" + month + "-" + day;
}

function getToday2(){
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    var date = now.getDate();

    if (("" + month).length == 1) {
        month = "0" + month;
    }
    if (("" + date).length == 1) {
        date = "0" + date;
    }
    return year+"."+ month +"."+ date;
}

function locationPop(num){
    var uModal = $('#lo_'+num);
    var mClose = $('.btn_modalClose');
    /* modal */
    uModal.css('display','block');
    mClose.click(function(){
        uModal.css('display','none');
    });
}

function deleteFileList(bbsFileKey) {
    if(confirm('파일을 삭제하시겠습니까?')){
        var result = deleteBoardFile(bbsFileKey);
        $("#"+bbsFileKey).remove();
    }
}

function blur(num) {
    num = num.replace(/[^0-9]/g, '');
    var tmp = '';
    tmp += num.substr(0, 3);
    tmp += '-';
    tmp += num.substr(3, 4);
    tmp += '-';
    tmp += num.substr(7);
    return tmp;
}
//강의실 배정표
function goLecRoom() {
    sessionStorage.setItem("noticeHeader", "lectureRoom");
    $("#noticeMenu li:eq(2)").addClass('active');
    goPageNoSubmit('notice', 'lecRoom');
}

//공지사항 > 개강안내
function goOpenMenu() {
    sessionStorage.setItem("noticeHeader", "openMenu");
    $("#noticeMenu li:eq(0)").addClass('active');
    goPageNoSubmit('notice', 'list');
    /*
     sessionStorage.setItem("noticeHeader", "lectureRoom");
                $("#noticeMenu li:eq(2)").addClass('active');
                goPageNoSubmit('notice', 'lecRoom');
     */
}

//공지사항 > 시험공고
function goExamNotice() {
    sessionStorage.setItem("noticeHeader", "examNotice");
    $("#noticeMenu li:eq(3)").addClass('active');
    goPageNoSubmit('notice', 'list');
}

//공지사항 > 시험공고 > 상세보기
function goDetailNotice(bbsKey) {
    innerValue("bbsKey", bbsKey);
    goPage("notice", "detail");
}

function goDetailNotice2(bbsKey, tagId) {
    if(tagId == 'examNotice'){
        sessionStorage.setItem("noticeHeader", "examNotice");
        $("#noticeMenu li:eq(3)").addClass('active');
    }else if(tagId == 'openInfo'){
        sessionStorage.setItem("noticeHeader", "openMenu");
        $("#noticeMenu li:eq(0)").addClass('active');
    }
    innerValue("bbsKey", bbsKey);
    goPage("notice", "detail");
}

function goCompany() {
    location.href = location.href = "/company?page_gbn=main&type=teacher";
}

function goCompany1() {
    goPageNoSubmit('company','main');
}

function goLogout() {
    if(confirm("로그아웃 하시겠습니까?")){
        sessionStorage.clear();
        $("#topNav_logout").show();
        goMain();
    }
}

function goAcademyMenu(gbnMenu, lefMenu) {
    if(lefMenu == 'public'){
        sessionStorage.setItem("leftMenu", "publicAcademy");
        var menu = "publicAcademy";
    }else if(lefMenu == 'tech'){
        sessionStorage.setItem("leftMenu", "techAcademy");
        var menu = "techAcademy";
    }else if(lefMenu == 'post'){
        sessionStorage.setItem("leftMenu", "postAcademy");
        var menu = "postAcademy";
    }

    if(gbnMenu == 'main') goPageNoSubmit(menu, "main");
    else if(gbnMenu == 'myLecRoom') goPageNoSubmit('myLecRoom', 'main');
    else if(gbnMenu == 'teacher') goPageNoSubmit('teacher', 'main');
    else if(gbnMenu == 'lecApply') goPageNoSubmit('lectureOrder', 'academy');
    else if(gbnMenu == 'passReview') goPassReview();
    else if(gbnMenu == 'customerCenter')  goPageNoSubmit('customerCenter', 'saveQuestion');
    else if(gbnMenu == 'notice'){
        sessionStorage.setItem("noticeHeader", "openMenu");
        $("#noticeMenu li:eq(0)").addClass('active');
        goPageNoSubmit('notice', 'list');
    }else if(gbnMenu == 'year'){
        javascript:goPageNoSubmit('zianPass', 'list');
    }else if(gbnMenu == 'free'){
        goPageNoSubmit('freeLecture', 'theory');
    }
}

function goOnlineMenu(gbnMenu, lefMenu) {
    if(lefMenu == 'public'){
        sessionStorage.setItem("leftMenu", "publicOnline");
        var menu = "publicOnline";
    }else if(lefMenu == 'tech'){
        sessionStorage.setItem("leftMenu", "techOnline");
        var menu = "techOnline";
    }else if(lefMenu == 'post'){
        sessionStorage.setItem("leftMenu", "postOnline");
        var menu = "postOnline";
    }
    if(gbnMenu == 'main') goPageNoSubmit(menu, "main");
    else if(gbnMenu == 'myLecRoom') goPageNoSubmit('myLecRoom', 'main');
    else if(gbnMenu == 'teacher') goPageNoSubmit('teacher', 'main');
    else if(gbnMenu == 'lecApply') goPageNoSubmit('lectureOrder', 'academy');
    else if(gbnMenu == 'passReview') goPassReview();
    else if(gbnMenu == 'zianPass') goPageNoSubmit('zianPass', 'list');
    else if(gbnMenu == 'free') goPageNoSubmit('freeLecture', 'theory');
    else if(gbnMenu == 'customerCenter')  goPageNoSubmit('customerCenter', 'saveQuestion');
    else if(gbnMenu == 'notice'){
        sessionStorage.setItem("noticeHeader", "openMenu");
        $("#noticeMenu li:eq(0)").addClass('active');
        goPageNoSubmit('notice', 'list');
    }
}

function goBookStoreMobile(gbnMenu) {
    if(gbnMenu == 'main'){
        sessionStorage.setItem("leftMenu", 'bookStore');
        goPageNoSubmit('bookStore','main');
    }else if (gbnMenu != 'main' && gbnMenu != 'errata') {
        location.href = "/bookStore?page_gbn=bookTypeList&bookType=" + gbnMenu;
    } else if(gbnMenu == 'errata'){
        goPageNoSubmit('bookStore','errataList');
    }
}

function goBigExamMenu(gbnMenu) {
    sessionStorage.setItem("leftMenu", "bigExam");
    if(gbnMenu == 'apply'){
        goPageNoSubmit('bigExam','examApply');
    }else if(gbnMenu == 'acaExam'){
        goPageNoSubmit('bigExam','acaExam');
    }else if(gbnMenu == 'weekExam'){
        goPageNoSubmit('bigExam','weekExam');
    }else if(gbnMenu == 'pastQuestion'){
        goPageNoSubmit('bigExam','pastQuestion');
    }else if(gbnMenu == 'bigReviewList'){
        goPageNoSubmit('bigExam','bigReviewList');
    }else if(gbnMenu == 'referenceList'){
        goPageNoSubmit('bigExam','referenceList')
    }
}
function goDetailbookType(type) {
    innerValue('bookType', type);
    $("#bookTypePage").attr("action", "/bookStore?page_gbn=bookTypeList");
    $("#bookTypePage").submit();
}

function setLeftMenu() {
    var topSubHtml = $("#topSub").html();
    if(topSubHtml == '기술직 학원'){
        sessionStorage.setItem("leftMenu", "techAcademy");
        goPageNoSubmit("techAcademy", "main");
    }else if(topSubHtml == '행정직 학원'){
        sessionStorage.setItem("leftMenu", "publicAcademy");
        goPageNoSubmit("publicAcademy", "main");
    }else if(topSubHtml == '계리직 학원'){
        sessionStorage.setItem("leftMenu", "postAcademy");
        goPageNoSubmit("postAcademy", "main");
    }else if(topSubHtml == '계리직 학원'){
        sessionStorage.setItem("leftMenu", "postAcademy");
        goPageNoSubmit("postAcademy", "main");
    }else if(topSubHtml == '기술직 온라인'){
        sessionStorage.setItem("leftMenu", "techOnline");
        goPageNoSubmit("techOnline", "main");
    }else if(topSubHtml == '행정직 온라인'){
        sessionStorage.setItem("leftMenu", "publicOnline");
        goPageNoSubmit("publicOnline", "main");
    }else if(topSubHtml == '계리직 온라인'){
        sessionStorage.setItem("leftMenu", "postOnline");
        goPageNoSubmit("postOnline", "main");
    }else {
        sessionStorage.setItem("leftMenu", "publicOnline");
    }
}

function setLeftMenu1(){
    var subMenuHtml = $("#subMenu1").html();
    if(subMenuHtml == '기술직'){
        sessionStorage.setItem("leftMenu", "techOnline");
        goPageNoSubmit("techOnline", "main");
    }else if(subMenuHtml == '행정직'){
        sessionStorage.setItem("leftMenu", "publicOnline");
        goPageNoSubmit("publicOnline", "main");
    }else if(subMenuHtml == '계리직'){
        sessionStorage.setItem("leftMenu", "postOnline");
        goPageNoSubmit("postOnline", "main");
    }else{
        sessionStorage.setItem("leftMenu", "publicOnline");
    }
}

function setLeftMenu2(){
    var subMenuHtml = $("#subMenu2").html();
    if(subMenuHtml == '기술직'){
        sessionStorage.setItem("leftMenu", "techOnline");
        goPageNoSubmit("techOnline", "main");
    }else if(subMenuHtml == '행정직'){
        sessionStorage.setItem("leftMenu", "publicOnline");
        goPageNoSubmit("publicOnline", "main");
    }else if(subMenuHtml == '계리직'){
        sessionStorage.setItem("leftMenu", "postOnline");
        goPageNoSubmit("postOnline", "main");
    }else{
        sessionStorage.setItem("leftMenu", "publicOnline");
    }
}

function goExamGuide() {
    sessionStorage.setItem("noticeHeader", "examGuide");
    $("#noticeMenu li:eq(4)").addClass('active');
    goPageNoSubmit('notice', 'examGuide');
}

function setLeftMenu4() {
    var subMenuHtml = $("#subMenu4").html();
    if(subMenuHtml == '자격증/가산점'){
        window.open("http://www.algisa.com/public/main.html", "_blank");
        return false;
    }else if(subMenuHtml == '온라인서점'){
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        if(leftMenuInfo != 'bookStore') {
            sessionStorage.setItem("prevLeftMenu", leftMenuInfo);
        }
        sessionStorage.setItem("leftMenu", 'bookStore');
        goPageNoSubmit('bookStore','main');
    }
}

function setLeftMenu5() {
    var subMenuHtml = $("#subMenu5").html();
    if(subMenuHtml == '온라인서점'){
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        if(leftMenuInfo != 'bookStore') {
            sessionStorage.setItem("prevLeftMenu", leftMenuInfo);
        }
        sessionStorage.setItem("leftMenu", 'bookStore');
        goPageNoSubmit('bookStore','main');
    }else if(subMenuHtml == '빅모의고사'){
        sessionStorage.setItem("leftMenu", 'bigExam');
        goPageNoSubmit('bigExam','main');
    }
}

function goMyCart() {
    sessionStorage.setItem("myPageHeader", "cart");
    $("#myPageMenu li:eq(1)").addClass('active');
    goPageNoSubmit('myPage', 'cart');
}

function setLeftMenu3() {
    var subMenuHtml = $("#subMenu3").html();
    if(subMenuHtml == '자격증/가산점'){
        window.open("http://www.algisa.com/public/main.html", "_blank");
        return false;
    }else if(subMenuHtml == '온라인서점'){
        var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
        if(leftMenuInfo != 'bookStore') {
            sessionStorage.setItem("prevLeftMenu", leftMenuInfo);
        }
        sessionStorage.setItem("leftMenu", 'bookStore');
        goPageNoSubmit('bookStore','main');
    }else if(subMenuHtml == '행정직'){
        sessionStorage.setItem("leftMenu", "publicOnline");
        goPageNoSubmit("publicOnline", "main");
    }
}


//행정직 수강후기 > 상세보기
function detailReview(bbsKey, tagId) {
    innerValue('bbsKey', bbsKey);
    if(tagId == 'lecInfo'){
        goPage('review','detailLecture');
    }else if(tagId == 'passInfo'){
        goPage('review','detailPass');
    }else if(tagId == 'bookInfo'){
        goDetailNotice(bbsKey);
    }
}

//교수 상세페이지 이동
function goTeacherDetail(teacherKey, reqKey) {
    innerValue("teacherKey", teacherKey);
    innerValue("reqKey", reqKey);
    location.href = "/teacher?page_gbn=detail&teacherKey="+teacherKey+"&reqKey="+reqKey;
}

function goDetailBook(gkey) {
    goPage('bookStore', 'detail');
    location.href = "/bookStore?page_gbn=detail&bbsKey="+gkey;
}

function goPassReview() {
    var leftMenuInfo = sessionStorage.getItem('leftMenu');
    if(leftMenuInfo == 'bookStore') {
        sessionStorage.setItem("leftMenu", "publicOnline");
    }
    goPageNoSubmit('review', 'videoList');
}

function goMyPage() {
    goPageNoSubmit('myPage','orderList');
}

function goPassReview() {
    var leftMenuInfo = sessionStorage.getItem('leftMenu');
    if(leftMenuInfo == 'bookStore') {
        sessionStorage.setItem("leftMenu", "publicOnline");
    }
    goPageNoSubmit('review', 'videoList');
}

function goBigExam() {
    var leftMenuInfo = sessionStorage.getItem('leftMenu');//직렬 구분
    if(leftMenuInfo != 'bigExam') {
        sessionStorage.setItem("prevLeftMenu", leftMenuInfo);
    }
    sessionStorage.setItem("leftMenu", "bigExam");
    goPageNoSubmit('bigExam','bigExamMain');
}

//파일다운로드(파일명만 있을때)
function download(fileName) {
    var downloadUrl = apiHost + "/download/fileDownload?filePath=" + fileName;
    $.fileDownload(downloadUrl);
}

//파일다운로드(경로가 있을때)
function downloadExamFile(filePath) {
    var downloadUrl = apiHost + "/download/fileDownloadFullPath?filePath=" + filePath;
    $.fileDownload(downloadUrl);
}

//오늘날짜와 날짜비교
function compareToday(compareDate) {
    var bl = true;
    if (compareDate != "") {
        var today = this.today();
        var todayArr = today.split('-');

        var compareDateArr = compareDate.split('-');

        var todayCompare = new Date(todayArr[0], parseInt(todayArr[1])-1, todayArr[2]);
        var compareDateCompare = new Date(compareDateArr[0], parseInt(compareDateArr[1])-1, compareDateArr[2]);

        if(todayCompare.getTime() > compareDateCompare.getTime()) {
            bl = false;
        }
    }
    return bl;
}

//댓글 저장
function commentSave() {
    var commentContent = getInputTextValue("commentContent");
    var bbsKey = getInputTextValue("bbsKey");
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    var userKey = sessionUserInfo.userKey;

    if (commentContent == '') {
        alert("댓글을 입력하세요.");
        focusInputText("commentContent");
        return false;
    }
    var result = saveBoardComment(bbsKey, userKey, commentContent);
    if(result.resultCode == 200){
        alert("댓글이 등록 되었습니다.");
        isReloadPage();
    }
}

//날짜 더하기
function addDate(ymd, addDay) {
    //var today = new Date();
    //var ymd = getFormatDate(today);
    var yyyy = ymd.substr(0,4);
    var mm = eval(ymd.substr(5,2) + "- 1") ;
    var dd = ymd.substr(8,2);
    var dt3 = new Date(yyyy, mm, eval(dd + '+' + addDay));
    yyyy = dt3.getFullYear();
    mm = (dt3.getMonth()+1)<10? "0" + (dt3.getMonth()+1) : (dt3.getMonth()+1) ;
    dd = dt3.getDate()<10 ? "0" + dt3.getDate() : dt3.getDate();
    var result =  yyyy + "-" + mm + "-" + dd ;
    return result;
}
