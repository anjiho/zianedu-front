var STARPLAYER_APP_IPHONE_URL = "https://itunes.apple.com/kr/app/axis-starplayer/id598865744?mt=8";
var STARPLAYER_APP_IPAD_URL = "https://itunes.apple.com/kr/app/axis-starplayerhd/id599892711?mt=8";
var STARPLAYER_PLUS_APP_IOS_URL = "https://apps.apple.com/kr/app/id1474597276";
var STARPLAYER_APP_INSTALL_ANDROID_URL = "market://details?id=com.axissoft.starplayer";
var STARPLAYER_APP_INSTALL_CONFIRM = "[ StarPlayer App 설치 ]\n\n설치 페이지로 이동하시겠습니까?\n\n기존에 앱이 설치되어 있다면\n '취소'버튼을 선택해주세요.";
var DataType = {};
DataType.URL = 1;
DataType.DATA = 2;
var StarPlayerApp = {};
var uagent = navigator.userAgent.toLocaleLowerCase();
StarPlayerApp.android = (uagent.search("android") > -1 || navigator.platform.toLocaleLowerCase().search("linux") > -1);
StarPlayerApp.mobile_mac = (uagent.search("mac os x") > -1 && uagent.search("macintosh") > -1 && window.navigator.maxTouchPoints > 1);
StarPlayerApp.ios = /iP(hone|od|ad)/.test(navigator.platform) || StarPlayerApp.mobile_mac;
StarPlayerApp.iphone = (uagent.search("iphone") > -1 || uagent.search("ipod") > -1);
StarPlayerApp.ipad = (uagent.search("ipad") > -1);
StarPlayerApp.safari = (uagent.search("safari") > -1);
StarPlayerApp.chrome = (uagent.search("chrome") > -1 || uagent.search("crios") > -1);
StarPlayerApp.opera = (uagent.search("opera") > -1);
StarPlayerApp.windows = (uagent.search("windows") > -1 || uagent.search("wow64") > -1);
StarPlayerApp.ios_sp_min_version = StarPlayerApp.mobile_mac ? "13.0.3" : "13.2.0";
StarPlayerApp.iosVersion = function () {
    var c = null;
    var b;
    if (/iP(hone|od|ad)/.test(navigator.platform)) {
        b = (navigator.appVersion).match(/OS (\d+)_(\d+)_?(\d+)?/);
        if (b != null) {
            c = {
                status: true,
                major: parseInt(b[1], 10),
                version: parseInt(b[1], 10) + "." + parseInt(b[2], 10) + "." + parseInt(b[3] || 0, 10)
            }
        }
    } else {
        if (StarPlayerApp.mobile_mac) {
            var a = (navigator.appVersion).match(/(version)[/\s]([\d.]+)/ig);
            b = a[0].match(/(\d+).(\d+).?(\d+)?/);
            if (b != null) {
                c = {
                    status: true,
                    major: parseInt(b[1], 10),
                    version: parseInt(b[1], 10) + "." + parseInt(b[2], 10) + "." + parseInt(b[3] || 0, 10)
                }
            }
        }
    }
    if (c == null) {
        c = {status: false, major: 0, version: "0"}
    }
    return c
};
StarPlayerApp.iosPlusIsAvailable = function () {
    var c = StarPlayerApp.iosVersion();
    if (c.major >= 13) {
        var a = c.version.replace(/\./gi, "");
        var b = StarPlayerApp.ios_sp_min_version.replace(/\./gi, "");
        if (a >= b) {
            return true
        }
    }
    return false
};
StarPlayerApp.executeApp = function (d, b) {
    document.addEventListener(getVisibilityValue(), handleVisibilityChange, false);
    if (typeof this.referer == "undefined") {
        this.referer = window.location.href
    }
    var a = this.urlscheme(d, b);
    checkInstalled2();
    if (this.android) {
        var c = "intent://?" + a + "#Intent;";
        c += "scheme=starplayer;";
        c += "action=android.intent.action.VIEW;";
        c += "category=android.intent.category.BROWSABLE;";
        c += "package=com.axissoft.starplayer;end";
        window.parent.location.href = c
    } else {
        if (this.ios) {
            if (this.opera) {
                alert("사용하고 계신 환경(OS)에서는 지원되지 않습니다.")
            } else {
                setTimeout(function () {
                    window.parent.location.href = a
                }, 10)
            }
        } else {
            if (this.windows) {
                setTimeout(function () {
                    window.parent.location.href = a
                }, 10)
            }
        }
    }
};
StarPlayerApp.urlscheme = function (c, b) {
    if (typeof b === "undefined") {
        b = DataType.URL
    }
    if (typeof this.license === "undefined") {
        alert("license 값이 설정되지 않았습니다.");
        return
    }
    if (typeof c === "undefined") {
        alert("data 값이 설정되지 않았습니다.");
        return
    }
    var a = "";
    if (b == DataType.URL) {
        a = this.url(c)
    } else {
        if (b == DataType.DATA) {
        }
    }
    return a
};
StarPlayerApp.url = function (c) {
    var a = "";
    if (this.ios) {
        if (this.iosPlusIsAvailable()) {
            a += "starplayerplus://?"
        } else {
            a += "starplayer://?"
        }
    } else {
        if (this.windows) {
            a += "starplayer://?"
        }
    }
    a += "license=" + encodeURIComponent(this.license) + "&url=" + encodeURIComponent(c);
    if (typeof this.referer !== "undefined") {
        a += "&referer=" + encodeURIComponent(this.referer)
    }
    if (typeof this.debug !== "undefined") {
        a += "&debug=" + this.debug
    } else {
        a += "&debug=false"
    }
    var b = false;
    if (this.android) {
        if (typeof this.android_version !== "undefined") {
            a += "&version=" + this.android_version;
            b = true
        }
    } else {
        if (typeof this.ios_version !== "undefined") {
            a += "&version=" + this.ios_version;
            b = true
        }
    }
    if (b == false) {
        if (typeof this.version !== "undefined") {
            a += "&version=" + this.version
        } else {
            a += "&version=1.0.0"
        }
    }
    if (typeof this.pmp !== "undefined") {
        a += "&pmp=" + this.pmp
    } else {
        a += "&pmp=true"
    }
    if (this.chrome) {
        a += "&from=chrome"
    } else {
        if (this.safari) {
            a += "&from=safari"
        } else {
            if (this.opera) {
                a += "&from=opera"
            } else {
                a += "&from=none"
            }
        }
    }
    if (this.android) {
        if (this.android_referer_return) {
            a += "&android_referer_return=" + this.android_referer_return
        } else {
            a += "&android_referer_return=false"
        }
    } else {
        if (this.referer_return) {
            a += "&referer_return=" + this.referer_return
        } else {
            a += "&referer_return=true"
        }
    }
    if (typeof this.offline_check !== "undefined") {
        a += "&offline_check=" + this.offline_check
    } else {
        a += "&offline_check=false"
    }
    if (typeof this.user_id !== "undefined") {
        a += "&user_id=" + this.user_id
    }
    return a
};
var checkInstalled = function () {
};
var agentCheck = function () {
    var a = "";
    if (StarPlayerApp.iosPlusIsAvailable()) {
        a = STARPLAYER_PLUS_APP_IOS_URL
    } else {
        if (StarPlayerApp.iphone === true) {
            a = STARPLAYER_APP_IPHONE_URL
        } else {
            if (StarPlayerApp.ipad === true) {
                a = STARPLAYER_APP_IPAD_URL
            } else {
                if (StarPlayerApp.android === true) {
                    a = STARPLAYER_APP_INSTALL_ANDROID_URL
                }
            }
        }
    }
    return a
};
var checkInstalled2 = function () {
    if (StarPlayerApp.ios || (StarPlayerApp.android && StarPlayerApp.opera)) {
        var a = +new Date;
        StarPlayerAppCheckTimer = setTimeout(function () {
            if (+new Date - a < 2000) {
                var b = StarPlayerApp.iosPlusIsAvailable();
                spDialog = new StarPlayerDialog(StarPlayerApp.iosPlusIsAvailable() ? "StarPlayerPlus App 설치" : "StarPlayer App 설치", "설치 페이지로 이동하시겠습니까?</br></br>기존에 앱이 설치되어 있다면</br> '닫기'버튼을 선택해주세요.", !b && StarPlayerApp.mobile_mac ? "아이폰 설치" : "확인", !b && StarPlayerApp.mobile_mac ? "아이패드 설치" : "취소", function () {
                    if (!b && StarPlayerApp.mobile_mac) {
                        location.href = STARPLAYER_APP_IPHONE_URL
                    } else {
                        location.href = agentCheck()
                    }
                }, function () {
                    if (!b && StarPlayerApp.mobile_mac) {
                        location.href = STARPLAYER_APP_IPAD_URL
                    }
                }, true);
                spDialog.show()
            }
        }, 1500)
    }
};

function getHiddenValue() {
    if (typeof document.mozHidden !== "undefined") {
        return "hidden"
    } else {
        if (typeof document.msHidden !== "undefined") {
            return "msHidden"
        } else {
            if (typeof document.webkitHidden !== "undefined") {
                return "webkitHidden"
            } else {
                if (typeof document.hidden !== "hidden") {
                    return "hidden"
                }
            }
        }
    }
}

function getVisibilityValue() {
    if (typeof document.mozHidden !== "undefined") {
        return "mozvisibilitychange"
    } else {
        if (typeof document.msHidden !== "undefined") {
            return "msvisibilitychange"
        } else {
            if (typeof document.webkitHidden !== "undefined") {
                return "webkitvisibilitychange"
            } else {
                if (typeof document.hidden !== "hidden") {
                    return "visibilitychange"
                }
            }
        }
    }
}

function handleVisibilityChange() {
    if (!document[getHiddenValue()]) {
        var a = document.getElementsByClassName("starplayer_popup");
        if (a.length > 0) {
            if (spDialog != null) {
                spDialog.hide()
            }
        }
    }
}

var isModalshowing = false;
var modalViewStyleSheet;
var spDialog;

function StarPlayerDialog(q, h, b, r, g, p, d) {
    if (!arguments.length) {
        throw"StarPlayerDialog: No arguments were passed"
    }
    var m = this;
    var n = getModalTemplate();
    var a = n.querySelector(".stpp_title");
    var k = n.querySelector(".stpp_btn-close");
    var e = n.querySelector(".stpp_btn-yes");
    var l = n.querySelector(".stpp_btn-no");
    var f = n.querySelector(".stpp_body");
    a.innerHTML = q;
    f.innerHTML = h;
    e.innerHTML = b;
    l.innerHTML = r;
    k.addEventListener("click", i);
    l.addEventListener("click", j);
    e.addEventListener("click", c);
    if (d) {
        var o = document.createElement("DIV");
        n.appendChild(o);
        o.className = "stpp_overlay";
        o.addEventListener("click", i)
    }

    function i(s) {
        s.preventDefault();
        m.hide()
    }

    function c(s) {
        s.preventDefault();
        m.hide();
        if (typeof g === "function") {
            g()
        }
    }

    function j(s) {
        s.preventDefault();
        m.hide();
        if (typeof p === "function") {
            p()
        }
    }

    m.modal = n
}

StarPlayerDialog.prototype.show = function () {
    if (isModalshowing) {
        return
    }
    isModalshowing = true;
    document.body.appendChild(this.modal)
};
StarPlayerDialog.prototype.hide = function () {
    isModalshowing = false;
    this.modal.remove()
};

function getModalTemplate() {
    var b = document.getElementsByClassName("starplayer_popup");
    if (b.length > 0) {
        if (typeof this.modal != "undefined" && this.modal != null) {
            this.modal.remove()
        }
    }
    var a;
    a = document.createElement("DIV");
    a.className = "starplayer_popup";
    a.innerHTML = " <div class='stpp_content'>		<header class='stpp_header'>			<h2 class='stpp_title'></h2>				<button class='stpp_btn-close'></button>		</header>		<div class='stpp_body'>	 </div> <footer class='stpp_footer'>		<button class='stpp_btn-no'></button>		<button class='stpp_btn-yes'></button> </footer>";
    if (!modalViewStyleSheet) {
        modalViewStyleSheet = document.createElement("style");
        modalViewStyleSheet.innerHTML = ".starplayer_popup { 		position: fixed; 		z-index: 9999; 		top: 0; 		left: 0; 		right: 0; 		bottom: 0; 		font-family: arial, sans-serif; } .stpp_content { 		padding: 10px; 		background: #fff; 		border-radius: 4px; 		-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.4); 		box-shadow: 0 0 10px rgba(0, 0, 0, 0.4); } .stpp_header { 		position: relative; 		display: flex; 		justify-content: space-between; } .stpp_title { 		margin: 0; 		flex: 1; 		font-size: 24px; 		text-align: center; } .stpp_body { 		margin: 10px; 		font-size: 16px; 		text-align: center; } .stpp_btn-close { 		position: absolute; 		top: 0; 		right: 0; 		width: 20px; 		height: 20px; 		padding: 0; 		font-size: 12px; 		font-weight: 700; 		text-align: center; 		background: none; 		border: 1px solid #000; 		border-radius: 50%; 		cursor: pointer; 		transition: all 0.4s;     line-height: 9px;     color: #000; } .stpp_btn-close:hover { 		opacity: 0.4; } .stpp_btn-close:before { 		content: 'X'; } .stpp_footer { 		margin-top: 20px; 		text-align: center; } .stpp_btn-yes, .stpp_btn-no { 		margin: 0 5px; 		padding: 4px 14px;  		font-size: 18px; 		border-radius: 20px; 		border: 1px solid #000; 		cursor: pointer;     line-height: 22px; 		transition: all 0.4s; 		width: auto!important; 		height: auto!important; } .stpp_btn-yes { 		background: #fff; 		color: #000; } .stpp_btn-no { 		background: #000; 		color: #fff; } .stpp_btn-yes:hover, .stpp_btn-no:hover { 		color: #000; 		border-color: transparent; 		background: rgba(0, 0, 0, 0.1); } .stpp_overlay { 		position: absolute; 		z-index: -1; 		top: 0; 		left: 0; 		right: 0; 		bottom: 0; 		background: rgba(0, 0, 0, 0.5); }";
        document.body.appendChild(modalViewStyleSheet)
    }
    return a.cloneNode(true)
};