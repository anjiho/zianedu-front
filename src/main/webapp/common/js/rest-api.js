$.ajaxSetup({async: false});

var apiHost = "http://52.79.40.214:9090";
//var apiHost = "http://localhost:9090";
//var apiHost = "http://210.103.44.147:9090";


/* post */
function postApi(url, paramData) {
    var resultData = null;
    $.post(apiHost + url, paramData, function (response) {
        resultData = response;
    }).fail(function() {
        alert(comment.error);
    });
    return resultData;
}

/* post */
function postPathApi(url, pathData, paramData) {
    var resultData = null;
    $.post(apiHost + url + pathData, paramData, function (response) {
        resultData = response;
    }).fail(function() {
        alert(comment.error);
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
        alert(comment.error);
    });
    return resultData;
}

/* get */
function getLoginApi(url, pathData, paramData) {
    var resultData = null;

    $.get(apiHost + url + pathData, paramData, function (response) {
        resultData = {
            result : response.resultCode
        };
    }).fail(function() {
        alert(comment.error);
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
        alert(comment.error);
    });
    return resultData;
}

/* get */
function getResultStrApi(url, pathData, paramData) {
    var resultData = null;

    $.get(apiHost + url + pathData, paramData, function (response) {
        if(response.resultCode == 200){
            resultData = {
                result : response.resultStr
            };
        }
    }).fail(function() {
        alert(comment.error);
    });
    return resultData;
}

function getPayApi(url, pathData, paramData) {
    var resultData = null;
    $.get(apiHost + url + pathData, paramData, function (response) {
         resultData = response;
    }).fail(function() {
        alert(comment.error);
    });
    return resultData;
}

function getResultApi(url, pathData, paramData) {
    var resultData = null;
    $.get(apiHost + url + pathData, paramData, function (response) {
        resultData = response;
    }).fail(function() {
        alert(comment.error);
    });
    return resultData;
}
/*************************************************************/
/*************************************************************/




