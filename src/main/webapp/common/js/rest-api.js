$.ajaxSetup({async: false});

var apiHost = "http://52.79.40.214:9090";

/* post */
function postApi(url, paramData) {
    var resultData = null;

    $.post(apiHost + url, paramData, function (response) {
        resultData = response;
    }).fail(function() {
        alert( "통신 에러" );
    });
    return resultData;
}

/* get */
function getApi(url, pathData, paramData) {
    var resultData = null;

    $.get(apiHost + url + pathData, paramData, function (response) {
        if(response.resultCode == 200){
            resultData = {
                result : response.result
            };
        }
    }).fail(function() {
        alert("통신 에러");
    });
    return resultData;
}

/* get paging */
function getPageApi(url, pathData, paramData) {
    var resultData = null;

    $.get(apiHost + url + pathData, paramData, function (response) {
        if(response.resultCode == 200){
            resultData = {
                cnt : response.cnt,
                result : response.result
            };
        }
    }).fail(function() {
        alert("통신 에러");
    });
    return resultData;
}

/*************************************************************/
/*************************************************************/




