var isAtLeastIE11 = !!(navigator.userAgent.match(/Trident/) && !navigator.userAgent.match(/MSIE/));
var isIE11 = !!(navigator.userAgent.match(/Trident/) && navigator.userAgent.match(/rv 11/));
var uagent = navigator.userAgent.toLocaleLowerCase();
var isChrome = window.chrome && !navigator.userAgent.match(/Opera|OPR\//);
var isEdge = navigator.appVersion.indexOf("Edge/") != -1 ? true : false;
var isFirefox = navigator.userAgent.toLowerCase().indexOf("firefox") > -1;
var isOpera = navigator.userAgent.toLowerCase().indexOf("opr/") != -1 ? true : false;
if (x64()) {
    STARPLAYER_URL = STARPLAYER64_URL;
    STARPLAYER_SETUP_URL = STARPLAYER64_SETUP_URL;
    STARPLAYER_VERSION = STARPLAYER64_VERSION
} else {
    if (isMac()) {
        STARPLAYER_AGENT_SETUP_URL = STARPLAYER_OSX_SETUP_URL;
        STARPLAYER_AGENT_VERSION = STARPLAYER_OSX_VERSION
    }
}

function StarPlayerString() {
}

StarPlayerString.INSTALL_ACTIVEX = "<p>스타플레이어를 구동하려면 'StarPlayer' ActiveX 컨트롤을 설치하여 주십시오.</p><p>설치에 문제가 있으면 <a style='color:#ff0000' href='" + STARPLAYER_SETUP_URL + "'>설치 프로그램을 다운로드</a>한 후 설치하여 주십시오.</p>";
StarPlayerString.INSTALL_AGENT = "<p>스타플레이어를 구동하려면 <a style='color:#ff0000' href='" + STARPLAYER_AGENT_SETUP_URL + "'>설치 프로그램을 다운로드</a>한 후 설치하여 주십시오.</p>";
StarPlayerString.MEDIA_ERR_ABORTED = "비디오 재생을 중단하였습니다.";
StarPlayerString.MEDIA_ERR_NETWORK = "네트워크 오류가 발생하였습니다.";
StarPlayerString.MEDIA_ERR_DECODE = "비디오 파일이 잘못되었거나 지원하지 않는 형식입니다.";
StarPlayerString.MEDIA_ERR_SRC_NOT_SUPPORTED = "비디오를 재생할 수 없습니다. 서비스 장애가 발생하였거나 지원하지 않는 형식입니다.";
StarPlayerString.UNKNOWN = "알 수 없는 오류가 발생하였습니다.";
StarPlayerString.MULTIPLECONNECTION = "동일 아이디 동시 접속으로 동영상 재생이 차단되었습니다.";
StarPlayerString.BLOCKED_UID = "불법적 시도로 인해 아이디가 차단되었습니다.";
StarPlayerString.BLOCKED_PID = "불법적 시도로 인해 시스템이 차단되었습니다.";
StarPlayerString.BLOCKED_IP = "불법적 시도로 인해 아이피가 차단되었습니다.";
StarPlayerString.VMACHINE = "가상머신에서는 재생할 수 없습니다.";
StarPlayerString.RDESKTOP = "원격 데스크탑에서는 재생할 수 없습니다.";
StarPlayerString.MSG_DETECT_HARDWARE = "지원하지 않는 하드웨어 장비가 발견되었습니다.";

function OpenState() {
}

OpenState.CLOSED = 0;
OpenState.OPENING = 1;
OpenState.OPENED = 2;
OpenState.CLOSING = 3;

function PlayState() {
}

PlayState.STOPPED = 0;
PlayState.PLAYING = 1;
PlayState.PAUSED = 2;
PlayState.BUFFERING_STARTED = 3;
PlayState.BUFFERING_STOPPED = 4;
PlayState.COMPLETE = 5;

function StarPlayerError() {
}

StarPlayerError.OPEN_FAILURE = 1000;
StarPlayerError.INVALID_MEDIA_TYPE = 1001;
StarPlayerError.DISK_FULL = 1002;
StarPlayerError.FILTER_NOT_INSTALLED = 1003;
StarPlayerError.FILTER_NOT_CONNECTED = 1004;
StarPlayerError.FILE_NOT_FOUND = 1005;
StarPlayerError.UNKNOWN = 1006;
StarPlayerError.MULTIPLE_CONNECTIONS = 1007;
StarPlayerError.BLOCKED_UID = 1008;
StarPlayerError.BLOCKED_IP = 1009;
StarPlayerError.BLOCKED_PID = 1010;

function WatermarkAlign() {
}

WatermarkAlign.LEFT = 0;
WatermarkAlign.RIGHT = 2;
WatermarkAlign.CENTER = 1;
WatermarkAlign.TOP = 0;
WatermarkAlign.BOTTOM = 2;
WatermarkAlign.RANDOM = 3;

function WatermarkText() {
}

WatermarkText.HARDWARE = "_STARPLAYER_SSN_";

function SubTitle() {
}

SubTitle.NONE = 0;
SubTitle.KOR = 1;
SubTitle.ENG = 2;
SubTitle.JAP = 4;
SubTitle.CHI = 8;

function ControllerMode() {
}

ControllerMode.DEFAULT = 0;
ControllerMode.EMBEDED = 1;

function LogoAlign() {
}

LogoAlign.TOP = 0;
LogoAlign.BOTTOM = 1;
LogoAlign.LEFT = 0;
LogoAlign.RIGHT = 1;

function isIE() {
    if (uagent.indexOf("trident") != -1) {
        return true
    }
    return navigator.appName == "Microsoft Internet Explorer"
}

function x64() {
    if (typeof window.navigator.cpuClass != "undefined") {
        return window.navigator.platform.toLowerCase() == "win64" && window.navigator.cpuClass.toLowerCase() == "x64"
    }
    return window.navigator.platform.toLowerCase() == "win64"
}

function isMac() {
    if (navigator.platform == "MacIntel") {
        return true
    }
    return false
}

function attachIE11Event(g, e, f) {
    var a = /^function\s?([^\s(]*)/;
    var d = /\(\)|\([a-zA-Z1-9,\_\-\s]+\)/;
    var h = f.toString().match(d)[0];
    var c;
    try {
        c = document.createElement("script");
        c.setAttribute("for", g.id);
        c.event = e + h;
        c.appendChild(document.createTextNode("player." + e + h + ";"));
        if (document.body) {
            document.body.appendChild(c)
        }
    } catch (b) {
    }
}

var vod_protocal = "http";
var http_host = "127.0.0.1";
var http_port = "3450";
var ws_protocol = "ws";
var ws_host = "127.0.0.1";
var ws_port = "3451";
var ws_separator = "starplayer";
if (window.location.protocol == "https:") {
    ws_protocol = "wss";
    ws_host = "localhost.axissoft.co.kr";
    ws_port = "3453";
    vod_protocal = "https";
    http_host = "localhost.axissoft.co.kr";
    http_port = "3454";
    if (isFirefox) {
        var iframe_id = "_ssl_iframe_";
        var iframe = document.getElementById(iframe_id);
        if (!iframe) {
            iframe = document.createElement("iframe");
            iframe.id = "_ssl_iframe_";
            iframe.style.display = "none";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(iframe, s)
        }
        iframe.src = "https://www.comodossl.co.kr/Images/main/comodo_logo.gif"
    }
}

function StarPlayerHtml5(af, U, Z) {
    var n = this;
    var ab = false;
    var S = false;
    var H = OpenState.CLOSED;
    var v = PlayState.STOPPED;
    var a = -1;
    var ak = -1;
    var j;
    var x;
    var L;
    var e;
    var h = 60;
    var m;
    var J;
    var c;
    var W = N(U.videoContainer);
    var q = N(U.controllerContainerHtml5);
    var G = W.parentElement;
    var C = N("watermark");
    var ai = N("subtitle");
    var T = N("logo");
    var g = null;
    var ag = new Date();
    var B = ag.getFullYear() + "/" + (ag.getMonth() + 1) + "/" + ag.getDate() + " " + ag.getHours() + ":" + ag.getMinutes() + ":" + ag.getSeconds();
    var w = 0;
    var p = 60;
    if (typeof U.subtitlePlacement == "undefined") {
        U.subtitlePlacement = 90
    }

    function N(d) {
        return document.getElementById(d)
    }

    function y(al) {
        n._connect_callback = al;
        var d = '{"scms" : "connection"}';
        n.websocket.send(d)
    }

    function u(al) {
        n._opened_callback = al;
        var d = '{"scms" : "opened"}';
        n.websocket.send(d)
    }

    function O(al) {
        n._keepalive_callback = al;
        var d = '{"scms" : "keepalive"}';
        n.websocket.send(d)
    }

    function E(al) {
        n._ssn_callback = al;
        var d = '{"ssn" : ""}';
        n.websocket.send(d)
    }

    function aa(d) {
        if (typeof n.custom_log_url != "undefined") {
            var d = '{"history" : "' + d + '"}';
            n.websocket.send(d)
        }
    }

    function f(d) {
        if (typeof n.custom_log_url != "undefined") {
            var d = '{"disconnected" : "' + d + '"}';
            n.websocket.send(d)
        }
    }

    function Y(al) {
        if (n._on_error) {
            for (var d in n._on_error) {
                n._on_error[d](al)
            }
        }
    }

    function M() {
        return "'" + U.userId + "' " + StarPlayerString.MULTIPLECONNECTION
    }

    this.set_media = function (am) {
        if (Z.url == am.url) {
            return
        }
        K();
        Z = am;
        var d = unescape(encodeURIComponent(encodeURIComponent(n.custom_log_extra)));
        var al = '{"url" : "' + Z.url + '","custom_log_url" : "' + n.custom_log_url + '","custom_log_extra" : "' + d + '"}';
        n.websocket.send(al)
    };
    this.url = function () {
        return j
    };
    this.sessionid = function () {
        return x
    };
    this.open_media = function (d, al) {
        K();
        j = d;
        y(function (am, ap, ao) {
            if (am != "" && am != "Connected") {
                if (ap !== "") {
                    Y(ap);
                    return
                }
                if (am == "MultipleConnections") {
                    Y(M())
                } else {
                    if (am == "BlockedUID") {
                        Y(StarPlayerString.BLOCKED_UID)
                    } else {
                        if (am == "BlockedIP") {
                            Y(StarPlayerString.BLOCKED_IP)
                        } else {
                            if (am == "BlockedPID") {
                                Y(StarPlayerString.BLOCKED_PID)
                            } else {
                                if (am == "VMACHINE") {
                                    Y(StarPlayerString.VMACHINE)
                                } else {
                                    if (am == "RDESKTOP") {
                                        Y(StarPlayerString.RDESKTOP)
                                    }
                                }
                            }
                        }
                    }
                }
                return
            }
            x = ao;
            if (af) {
                af.controls = true;
                var an = "?";
                if (j.indexOf("?") != -1) {
                    an = "&"
                }
                af.src = vod_protocal + "://" + http_host + ":" + http_port + "/" + j + an + "sid=" + x;
                af.load();
                if (Z.autoPlay != false) {
                    af.play()
                }
                af.controls = false
            }
            w = 0
        })
    };
    this.close_media = function () {
        n.close()
    };
    this.close = function () {
        S = true;
        af.src = "http://null/";
        af.load()
    };
    this.play = function () {
        if (H != OpenState.OPENED && H != OpenState.OPENING) {
            return
        }
        af.play();
        ab = false
    };
    this.pause = function () {
        if (H != OpenState.OPENED) {
            return
        }
        af.pause()
    };
    this.stop = function () {
        if (H != OpenState.OPENED) {
            return
        }
        ab = true;
        af.pause();
        P(PlayState.STOPPED);
        af.currentTime = 0
    };
    this.addEvent = function (d, al) {
        n.attachEvent(d, al)
    };
    this.attachEvent = function (d, al) {
        var am = "_on_" + d;
        if (!n[am]) {
            n[am] = []
        }
        n[am].push(al)
    };
    this.setOpenState = function (d) {
        H = d
    };
    this.getOpenState = function () {
        return H
    };
    this.getPlayState = function () {
        return v
    };
    this.getDuration = function () {
        if (typeof Z.previewTime != "undefined") {
            if (Z.previewTime < af.duration) {
                return Z.previewTime
            }
        }
        return af.duration
    };
    this.getCurrentPosition = function () {
        return parseFloat(af.currentTime)
    };
    this.setCurrentPosition = function (am) {
        var al = af.currentTime;
        if (a >= 0 || ak >= 0) {
            if (a > am || ak < am) {
                am = a
            }
        }
        af.currentTime = am;
        if (n._on_open_state_change) {
            for (var d in n._on_position_change) {
                n._on_position_change[d](am)
            }
        }
        if (n._on_position_change2) {
            for (var d in n._on_position_change2) {
                n._on_position_change2[d](am, al)
            }
        }
    };
    this.getRate = function () {
        return af.playbackRate
    };
    this.setRate = function (d) {
        af.playbackRate = d;
        af.defaultPlaybackRate = d
    };
    this.getVolume = function () {
        return af.volume
    };
    this.setVolume = function (d) {
        if (d < 0) {
            d = 0
        } else {
            if (d > 1) {
                d = 1
            }
        }
        af.muted = false;
        af.volume = d
    };
    this.getMute = function () {
        return af.muted
    };
    this.setMute = function (al) {
        if (H != OpenState.OPENED) {
            return
        }
        af.muted = al;
        if (n._on_volume_change) {
            for (var d in n._on_volume_change) {
                n._on_volume_change[d](af.volume, af.muted)
            }
        }
    };
    this.getFullscreen = function () {
        if (document.fullscreenElement || document.webkitFullscreenElement || document.mozFullScreenElement || document.msFullscreenElement) {
            return true
        }
        return false
    };
    this.setFullscreen = function (d) {
        if (d) {
            if (G.requestFullscreen) {
                G.requestFullscreen()
            } else {
                if (G.mozRequestFullScreen) {
                    G.mozRequestFullScreen()
                } else {
                    if (G.webkitRequestFullscreen) {
                        G.webkitRequestFullscreen()
                    } else {
                        if (G.msRequestFullscreen) {
                            G.msRequestFullscreen()
                        }
                    }
                }
            }
        } else {
            if (document.exitFullscreen) {
                document.exitFullscreen()
            } else {
                if (document.webkitExitFullscreen) {
                    document.webkitExitFullscreen()
                } else {
                    if (document.mozCancelFullScreen) {
                        document.mozCancelFullScreen()
                    } else {
                        if (document.msExitFullscreen) {
                            document.msExitFullscreen()
                        }
                    }
                }
            }
        }
    };
    var V;
    var I;
    var Q;
    var ae;
    var k;
    var o;
    var X;
    var F;
    var R;
    var A = null;

    function D() {
        q.style.visibility = "visible";
        document.body.style.cursor = "default";
        clearTimeout(A);
        A = setTimeout(function () {
            q.style.visibility = "hidden";
            document.body.style.cursor = "none"
        }, 3000)
    }

    function ah() {
        q.style.visibility = "visible";
        document.body.style.cursor = "default";
        clearTimeout(A)
    }

    function t() {
        var d = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        q.style.top = d - parseInt(q.style.height, 10) + "px"
    }

    function l() {
        var aq = n.getFullscreen();
        if (aq) {
            V = G.style.width;
            I = G.style.height;
            Q = W.style.width;
            ae = W.style.height;
            X = q.style.position;
            F = q.style.top;
            R = q.style.left;
            k = q.style.width;
            o = q.style.height;
            G.style.width = "100%";
            G.style.height = "100%";
            W.style.width = "100%";
            W.style.height = "100%";
            W.addEventListener("mousemove", D, false);
            q.style.position = "absolute";
            q.style.left = "0px";
            var ap = screen.height;
            q.style.top = ap - parseInt(q.style.height, 10) + "px";
            q.style.width = "100%";
            q.classList.add("fullscreen_controller");
            q.addEventListener("mousemove", ah, false);
            window.addEventListener("resize", t, false);
            ad();
            C.style.width = G.style.width;
            z(ap);
            ai.style.width = G.style.width;
            ai.style.top = parseInt(ap * (U.subtitlePlacement / 100) - 30, 10) + "px";
            var an = T.naturalWidth;
            var am = T.naturalHeight;
            var d = 0;
            if (U.logoHorzAlign == LogoAlign.RIGHT) {
                var al = screen.width;
                d = al - an
            }
            var ar = 0;
            if (U.logoVertAlign == LogoAlign.BOTTOM) {
                ar = ap - am
            }
            T.style.left = d + "px";
            T.style.top = ar + "px"
        } else {
            clearTimeout(A);
            q.style.visibility = "visible";
            document.body.style.cursor = "default";
            W.removeEventListener("mousemove", D);
            G.style.width = V;
            G.style.height = I;
            W.style.width = Q;
            W.style.height = ae;
            q.style.position = X;
            q.style.top = F;
            q.style.left = R;
            q.style.width = k;
            q.classList.remove("fullscreen_controller");
            q.removeEventListener("mousemove", ah);
            window.removeEventListener("resize", t);
            ad();
            C.style.width = G.style.width;
            var ap = parseInt(W.style.height, 10);
            z(ap);
            ai.style.width = G.style.width;
            ai.style.top = parseInt(ap * (U.subtitlePlacement / 100) - 30, 10) + "px";
            var an = T.naturalWidth;
            var am = T.naturalHeight;
            var d = 0;
            if (U.logoHorzAlign == LogoAlign.RIGHT) {
                var al = parseInt(G.style.width, 10);
                d = al - an
            }
            var ar = 0;
            if (U.logoVertAlign == LogoAlign.BOTTOM) {
                ar = ap - am
            }
            T.style.left = d + "px";
            T.style.top = ar + "px"
        }
        if (n._on_fullscreen_change) {
            for (var ao in n._on_fullscreen_change) {
                n._on_fullscreen_change[ao](aq)
            }
        }
    }

    document.addEventListener("fullscreenchange", l, false);
    document.addEventListener("webkitfullscreenchange", l, false);
    document.addEventListener("mozfullscreenchange", l, false);
    document.addEventListener("MSFullscreenChange", l, false);
    this.getRepeat = function () {
        return n.getRepeatStartTime() >= 0 && n.getRepeatEndTime() >= 0
    };
    this.setRepeat = function (al) {
        if (al) {
            n.setRepeatStartTime(0);
            n.setRepeatEndTime(af.duration)
        } else {
            n.resetRepeatStartTime();
            n.resetRepeatEndTime()
        }
        if (n._on_repeat_change) {
            for (var d in n._on_repeat_change) {
                n._on_repeat_change[d](al)
            }
        }
    };
    this.getRepeatStartTime = function () {
        if (a < 0 && ak >= 0) {
            return 0
        } else {
            return a
        }
    };
    this.setRepeatStartTime = function (d) {
        if (H != OpenState.OPENED) {
            return
        }
        if (a == d) {
            return
        }
        a = d;
        if (a >= 0 && a > n.getRepeatEndTime()) {
            a = n.getRepeatEndTime()
        }
        if (a > n.getCurrentPosition()) {
            n.setCurrentPosition(a)
        }
        if (n._on_repeat_range_change) {
            for (var al in n._on_repeat_range_change) {
                n._on_repeat_range_change[al](a, n.getRepeatEndTime())
            }
        }
    };
    this.resetRepeatStartTime = function () {
        n.setRepeatStartTime(-1)
    };
    this.getRepeatEndTime = function () {
        if (ak < 0 && a >= 0) {
            return af.duration
        } else {
            return ak
        }
    };
    this.setRepeatEndTime = function (d) {
        if (H != OpenState.OPENED) {
            return
        }
        if (ak == d) {
            return
        }
        ak = d;
        if (n._on_repeat_range_change) {
            for (var al in n._on_repeat_range_change) {
                n._on_repeat_range_change[al](n.getRepeatStartTime(), ak)
            }
        }
    };
    this.resetRepeatEndTime = function () {
        n.setRepeatEndTime(-1)
    };
    this.getVisible = function () {
        af.style.visibility != "hidden"
    };
    this.setVisible = function (d) {
        if (af) {
            af.style.visibility = d ? "visible" : "hidden"
        }
    };
    this.command = function (d, al) {
    };
    this.getPlayTime = function () {
        if (g) {
            return g.getPlayedTime()
        }
        return 0
    };

    function i() {
        var ap = new Date();
        var am = ap.getFullYear() + "/" + (ap.getMonth() + 1) + "/" + ap.getDate() + " " + ap.getHours() + ":" + ap.getMinutes() + ":" + ap.getSeconds();
        var an = unescape(encodeURIComponent(encodeURIComponent(U.userId)));
        var al = unescape(encodeURIComponent(encodeURIComponent(n.custom_log_extra)));
        var ao = "user_id=" + an + "&player_id=" + n.getPID() + "&content_duration=" + parseInt(n.getDuration(), 10) + "&current_position=" + parseInt(n.getCurrentPosition(), 10) + "&played_time=" + g.getPlayedTime() + "&strong_played_time=" + g.getStrongPlayedTime() + "&tracker_time=" + g.getTrackerTime() + "&tracker_data=" + g.getTracker() + "&content_url=" + n.url() + "&extra_data=" + al + "&begin_localtime=" + encodeURIComponent(B) + "&end_localtime=" + encodeURIComponent(am);
        return ao
    }

    function r(an) {
        H = an;
        if (an == OpenState.OPENING) {
            if (n._on_volume_change) {
                for (var d in n._on_volume_change) {
                    n._on_volume_change[d](af.volume, af.muted)
                }
            }
        } else {
            if (an == OpenState.OPENED) {
                E(function (ao) {
                    n.ssn = ao
                });
                u(function (ao) {
                    if (ao == "UnknownError") {
                        Y(StarPlayerString.UNKNOWN);
                        n.close()
                    }
                });
                L = setInterval(function () {
                    O(function (ao) {
                        if (ao == "MultipleConnections") {
                            n.close();
                            Y(M())
                        } else {
                            if (ao == "DetectHardware") {
                                n.close();
                                Y(StarPlayerString.MSG_DETECT_HARDWARE)
                            }
                        }
                    })
                }, 1000 * n.keepalive_interval);
                g = new StarPlayerTracker(n);
                if (typeof n.custom_log_url != "undefined") {
                    e = setInterval(function () {
                        var ao = i();
                        aa(Base64.encode(ao))
                    }, 30000)
                }
                if (typeof n.timelimit != "undefined") {
                    setInterval(function () {
                        var ao = n.getCurrentPosition();
                        if (ao >= n.timelimit) {
                            n.stop();
                            P(PlayState.COMPLETE)
                        }
                    }, 500)
                }
                if (typeof Z.cc != "undefined" && Z.cc != "") {
                    ai.style.display = "block";
                    ai.style.textAlign = "center";
                    ai.style.width = G.style.width;
                    var al = parseInt(W.style.height, 10);
                    ai.style.top = parseInt(al * (U.subtitlePlacement / 100) - 30, 10) + "px"
                }
                if (typeof U.logoUrl != "undefined" && U.logoUrl != "") {
                    T.src = U.logoUrl;
                    T.onload = function () {
                        T.style.display = "block";
                        var ar = T.naturalWidth;
                        var aq = T.naturalHeight;
                        T.style.width = ar + "px";
                        T.style.height = aq + "px";
                        var ao = 0;
                        if (U.logoHorzAlign == LogoAlign.RIGHT) {
                            var ap = parseInt(G.style.width, 10);
                            ao = ap - ar
                        }
                        var au = 0;
                        if (U.logoVertAlign == LogoAlign.BOTTOM) {
                            var at = parseInt(W.style.height, 10);
                            au = at - aq
                        }
                        T.style.left = ao + "px";
                        T.style.top = au + "px"
                    }
                }
            } else {
                if (an == OpenState.CLOSED) {
                    var am = "";
                    if (typeof n.custom_log_url != "undefined" && g != null) {
                        am = i()
                    }
                    f(Base64.encode(am));
                    L = clearInterval(L);
                    if (g) {
                        clearInterval(e);
                        g = null
                    }
                }
            }
        }
        if (n._on_open_state_change) {
            for (var d in n._on_open_state_change) {
                n._on_open_state_change[d](H)
            }
        }
    }

    var ac = null;
    var aj = null;

    function b() {
        var d = "<div id='watermark'></div>";
        var am = parent.document.createElement("div");
        am.id = "watermark";
        am.innerHTML;
        parent.document.getElementById("video-container").appendChild(am);
        C = N("watermark");
        ad();
        C.style.width = G.style.width;
        var al = parseInt(W.style.height, 10);
        z(al)
    }

    function z(d) {
        if (U.watermarkText == null || U.watermarkText == "undefined") {
            return
        }
        if (typeof U.watermarkInterval == "undefined") {
            U.watermarkInterval = 5
        }
        C.style.width = G.style.width;
        if (ac) {
            clearInterval(ac)
        }
        if (aj) {
            clearTimeout(aj)
        }
        if (U.watermarkHorzAlign == WatermarkAlign.RANDOM || U.watermarkVertAlign == WatermarkAlign.RANDOM) {
            ac = setInterval(function () {
                var al = document.getElementById("watermark");
                if (!al) {
                    b()
                }
                C.innerHTML = U.watermarkText;
                C.style.display = "block";
                if (U.watermarkHorzAlign == WatermarkAlign.RANDOM) {
                    var an = "initial";
                    switch (Math.floor(Math.random() * 10000) % 3) {
                        case 0:
                            an = "left";
                            break;
                        case 1:
                            an = "center";
                            break;
                        case 2:
                            an = "right";
                            break
                    }
                    C.style.textAlign = an
                } else {
                    if (U.watermarkHorzAlign == WatermarkAlign.LEFT) {
                        C.style.textAlign = "left"
                    } else {
                        if (U.watermarkHorzAlign == WatermarkAlign.CENTER) {
                            C.style.textAlign = "center"
                        } else {
                            if (U.watermarkHorzAlign == WatermarkAlign.RIGHT) {
                                C.style.textAlign = "right"
                            }
                        }
                    }
                }
                if (U.watermarkVertAlign == WatermarkAlign.RANDOM) {
                    var am;
                    switch (Math.floor(Math.random() * 10000) % 3) {
                        case 0:
                            am = 0;
                            break;
                        case 1:
                            am = d / 2 - 20;
                            break;
                        case 2:
                            am = d - 40;
                            break
                    }
                    C.style.top = am + "px"
                } else {
                    if (U.watermarkVertAlign == WatermarkAlign.TOP) {
                        C.style.top = "0px"
                    } else {
                        if (U.watermarkVertAlign == WatermarkAlign.CENTER) {
                            C.style.top = (d / 2 - 20) + "px"
                        } else {
                            if (U.watermarkVertAlign == WatermarkAlign.BOTTOM) {
                                C.style.top = (d - 40) + "px"
                            }
                        }
                    }
                }
                aj = setTimeout(function () {
                    C.style.display = "none"
                }, U.watermarkShowInterval * 1000)
            }, U.watermarkInterval * 1000)
        } else {
            setInterval(function () {
                var al = document.getElementById("watermark");
                if (!al) {
                    b()
                }
            }, 1000);
            C.innerHTML = U.watermarkText;
            C.style.display = "block";
            if (U.watermarkHorzAlign == WatermarkAlign.LEFT) {
                C.style.textAlign = "left"
            } else {
                if (U.watermarkHorzAlign == WatermarkAlign.CENTER) {
                    C.style.textAlign = "center"
                } else {
                    if (U.watermarkHorzAlign == WatermarkAlign.RIGHT) {
                        C.style.textAlign = "right"
                    }
                }
            }
            if (U.watermarkVertAlign == WatermarkAlign.TOP) {
                C.style.top = "0px"
            } else {
                if (U.watermarkVertAlign == WatermarkAlign.CENTER) {
                    C.style.top = (d / 2 - 20) + "px"
                } else {
                    if (U.watermarkVertAlign == WatermarkAlign.BOTTOM) {
                        C.style.top = (d - 40) + "px"
                    }
                }
            }
        }
    }

    function ad() {
        clearInterval(ac);
        clearTimeout(aj);
        ac = null;
        aj = null;
        if (C) {
            C.innerHTML = ""
        }
    }

    function P(am) {
        v = am;
        if (n._on_play_state_change) {
            for (var d in n._on_play_state_change) {
                n._on_play_state_change[d](v)
            }
        }
        if (am == PlayState.PLAYING) {
            var al = parseInt(W.style.height, 10);
            z(al)
        } else {
            if (am == PlayState.PAUSED) {
                ad()
            } else {
                if (am == PlayState.STOPPED) {
                    ad();
                    if (af) {
                        if (af.currentTime > 0) {
                            w = af.currentTime
                        }
                    }
                } else {
                    if (am == PlayState.COMPLETE) {
                        if (a >= 0 || ak >= 0) {
                            if (parseInt(n.getRepeatEndTime(), 10) == parseInt(af.duration, 10)) {
                                setTimeout(function () {
                                    n.play();
                                    n.setCurrentPosition(n.getRepeatStartTime())
                                }, 10)
                            }
                        }
                    }
                }
            }
        }
    }

    function K() {
        S = false;
        P(PlayState.STOPPED);
        r(OpenState.CLOSED);
        n.resetRepeatStartTime();
        n.resetRepeatEndTime();
        if (n.onMuteChanged) {
            for (var d in n.onMuteChanged) {
                n.onMuteChanged[d](af.muted)
            }
        }
    }

    this.setTimelimit = function (d) {
        n.timelimit = d
    };
    this.getPID = function () {
        return n.player_id
    };
    this.getMAC = function () {
        return n.mac_address
    };
    this.getSSN = function () {
        return n.ssn
    };
    this.getTrack = function () {
        if (g) {
            return g.getTracker()
        }
        return ""
    };
    this.setTrack = function (d) {
        if (g) {
            g.setHistory(d)
        }
    };
    this.getProgressRate = function () {
        if (g) {
            return g.getPercent()
        }
        return 0
    };
    this.getStopPosition = function () {
        return w
    };
    this.getSubtitle = function () {
        return n.subtitle
    };
    this.setSubtitle = function (d) {
        n.subtitle = d;
        if (d == SubTitle.NONE) {
            ai.style.display = "none"
        } else {
            ai.style.display = "block"
        }
    };
    this.setLogUrl = function (d) {
        n.custom_log_url = d
    };
    this.setLogExtraData = function (d) {
        n.custom_log_extra = d
    };
    if (af) {
        af.addEventListener("loadstart", function () {
            if (S) {
                K()
            } else {
                r(OpenState.OPENING)
            }
        }, false);
        af.addEventListener("loadeddata", function () {
            r(OpenState.OPENED)
        }, false);
        af.addEventListener("durationchange", function () {
        }, false);
        af.addEventListener("suspend", function () {
        }, false);
        af.addEventListener("playing", function () {
            af.controls = false;
            P(PlayState.PLAYING)
        }, false);
        af.addEventListener("pause", function () {
            if (ab) {
                ab = false;
                P(PlayState.STOPPED);
                n.resetRepeatStartTime();
                n.resetRepeatEndTime()
            } else {
                P(PlayState.PAUSED)
            }
        }, false);
        af.addEventListener("ended", function () {
            P(PlayState.COMPLETE);
            n.stop()
        }, false);
        af.addEventListener("waiting", function () {
            af.controls = false;
            if (n.onBufferingData) {
                n.onBufferingData(true)
            }
            if (!isEdge) {
                P(PlayState.BUFFERING_STARTED)
            }
        }, false);
        af.addEventListener("error", function () {
            if (af.src == "http://null/") {
                return
            }
            var d;
            switch (af.error.code) {
                case 1:
                    d = StarPlayerString.MEDIA_ERR_ABORTED;
                    break;
                case 2:
                    d = StarPlayerString.MEDIA_ERR_NETWORK;
                    break;
                case 3:
                    d = StarPlayerString.MEDIA_ERR_DECODE;
                    break;
                case 4:
                    d = StarPlayerString.MEDIA_ERR_SRC_NOT_SUPPORTED;
                    break;
                default:
                    d = StarPlayerString.UNKNOWN;
                    break
            }
            K();
            Y(d)
        }, false);
        af.addEventListener("ratechange", function () {
            if (n._on_rate_change) {
                for (var d in n._on_rate_change) {
                    n._on_rate_change[d](af.playbackRate)
                }
            }
        }, false);
        af.addEventListener("volumechange", function () {
            if (n._on_volume_change) {
                for (var d in n._on_volume_change) {
                    n._on_volume_change[d](af.volume, af.muted)
                }
            }
        }, false);
        af.addEventListener("timeupdate", function () {
            if (a >= 0 || ak >= 0) {
                if (af.currentTime >= n.getRepeatEndTime()) {
                    af.currentTime = n.getRepeatStartTime()
                }
            }
            if (n._on_update_time) {
                for (var d in n._on_update_time) {
                    n._on_update_time[d](af.currentTime)
                }
            }
        }, false);
        af.oncontextmenu = function () {
            return false
        }
    }
}

function StarPlayer_API(a) {
    var b = false;
    var d = -1;
    var c = -1;
    this.url = function () {
        return a.url
    };
    this.closeBrowser = function () {
        a.close_browser()
    };
    this.open_media = function (e, f) {
        a.open_media(e, f)
    };
    this.close_media = function () {
        a.close()
    };
    this.getDuration = function () {
        return a.duration
    };
    this.getCurrentPosition = function () {
        return a.current_position
    };
    this.setCurrentPosition = function (e) {
        a.current_position = e
    };
    this.getVolume = function () {
        return a.volume
    };
    this.setVolume = function (e) {
        a.volume = e
    };
    this.getMute = function () {
        return a.mute
    };
    this.setMute = function (e) {
        a.mute = e
    };
    this.getFullscreen = function () {
        return a.fullscreen
    };
    this.setFullscreen = function (e) {
        a.fullscreen = e
    };
    this.getRate = function () {
        return a.rate
    };
    this.setRate = function (e) {
        a.rate = e
    };
    this.getRepeat = function () {
        return a.repeat
    };
    this.setRepeat = function (e) {
        a.repeat = e
    };
    this.getRepeatStartTime = function () {
        return a.repeat_start_time
    };
    this.setRepeatStartTime = function (e) {
        a.repeat_start_time = e
    };
    this.getRepeatEndTime = function () {
        return a.repeat_end_time
    };
    this.setRepeatEndTime = function (e) {
        a.repeat_end_time = e
    };
    this.getPlayTime = function () {
        return a.play_time
    };
    this.initPlayTime = function () {
        a.init_play_time()
    };
    this.play = function () {
        a.play()
    };
    this.pause = function () {
        a.pause()
    };
    this.stop = function () {
        a.stop()
    };
    this.addEvent = function (e, f) {
        if (a.attachEvent) {
            a.attachEvent(e, f)
        } else {
            attachIE11Event(a, e, f)
        }
    };
    this.setOpenState = function (e) {
        d = e
    };
    this.getOpenState = function () {
        return d
    };
    this.setPlayState = function (e) {
        c = e
    };
    this.getPlayState = function () {
        return c
    };
    this.getTopmost = function () {
        return a.topmost
    };
    this.setTopmost = function (e) {
        a.topmost = e
    };
    this.getXHR = function () {
        return a.xml_http_request
    };
    this.getVisible = function () {
        return b
    };
    this.setVisible = function (e) {
        if (isIE()) {
            if (e) {
                a.style.position = "relative";
                a.style.left = "0px"
            } else {
                a.style.position = "absolute";
                a.style.left = "-9999999px"
            }
        } else {
            a.style.visibility = e ? "visible" : "hidden"
        }
        b = e
    };
    this.getVideoWidth = function () {
        return a.video_width
    };
    this.getVideoHeight = function () {
        return a.video_height
    };
    this.getBrightness = function () {
        return a.brightness
    };
    this.setBrightness = function (e) {
        a.brightness = e
    };
    this.getContrast = function () {
        return a.contrast
    };
    this.setContrast = function (e) {
        a.contrast = e
    };
    this.getSaturation = function () {
        return a.saturation
    };
    this.setSaturation = function (e) {
        a.saturation = e
    };
    this.getHue = function () {
        return a.hue
    };
    this.setHue = function (e) {
        a.hue = e
    };
    this.setCaption = function (e) {
        a.set_caption(e)
    };
    this.clearCaption = function () {
        a.set_caption(undefined)
    };
    this.callFunction = function (e) {
        return a.call_func(e)
    };
    this.captureFrame = function (e) {
        return a.capture_frame(e)
    };
    this.control_alpha_brain = function (f, e) {
        return a.control_alpha_brain(f, e)
    };
    this.getPID = function () {
        return a.pid
    };
    this.internetCheckConnection = function (e) {
        return a.is_internet_connection(e)
    };
    this.setTimelimit = function (e) {
        a.timelimit = e
    };
    this.getSSN = function () {
        return a.ssn
    };
    this.getMAC = function () {
        return a.mac_address
    };
    this.getTrack = function () {
        return a.track
    };
    this.setTrack = function (e) {
        a.track = e
    };
    this.getProgressRate = function () {
        return a.progress_rate
    };
    this.getStopPosition = function () {
        return a.stop_position
    };
    this.getSubtitle = function () {
        return a.subtitle
    };
    this.setSubtitle = function (e) {
        a.subtitle = e
    };
    this.getMaxBandwidth = function () {
        return a.max_bandwidth
    };
    this.getBandwidth = function () {
        return a.bandwidth
    };
    this.getBitrate = function () {
        return a.bitrate
    };
    this.getAvgFrameRate = function () {
        return a.avg_frame_rate
    };
    this.getTotalBytes = function () {
        return a.total_bytes
    };
    this.getReceivedBytes = function () {
        return a.received_bytes
    };
    this.setLogUrl = function (e) {
        a.custom_log_url = e
    };
    this.setLogExtraData = function (e) {
        a.custom_log_extra = e
    };
    this.setThumbnailRootUrl = function (e) {
        a.thumbnail_root_url = e
    }
}

function installStarPlayer() {
    var a = "<object classid='CLSID:99277D5A-52B3-4B2E-AC38-B0065575FC55' width='0' height='0' codebase='" + STARPLAYER_URL + "#version=" + STARPLAYER_VERSION + "' ></object>";
    document.body.innerHTML += a
}

function StarPlayer(e, c, h) {
    var p = this;
    var b = e.id ? e.id : "__starplayer";
    var g = b + "_controller";
    var m;
    var d = 10;
    var f = false;
    var l = false;
    var a = null;
    var n = x64() != true ? e.controllerUrl : e.controller64Url;

    function j(q) {
        k(e.videoContainer).innerHTML = "<table width='100%' height='100%' style='color:red;font-size:14px'><tr><td align='center' valign='middle'>" + q + "</td></tr></table>"
    }

    function k(q) {
        return document.getElementById(q)
    }

    function o() {
        p.onInit = e.onInit;
        p.onOpenStateChange = e.onOpenStateChange;
        p.onPlayStateChange = e.onPlayStateChange;
        p.onKeyDown = e.onKeyDown;
        p.onKeyUp = e.onKeyUp;
        p.onClick = e.onClick;
        p.onMouseDown = e.onMouseDown;
        p.onMouseUp = e.onMouseUp;
        p.onMouseDbclick = e.onMouseDbclcik;
        p.onMouseWheel = e.onMouseWheel;
        p.onFullscreen = e.onFullscreen;
        p.onRateChange = e.onRateChange;
        p.onCustom = e.onCustom;
        p.onSubtitle = e.onSubtitle;
        if (!e.userId) {
            e.userId = "ANONYMOUS"
        } else {
            if (String(e.userId).replace(/ /g, "").length == 0) {
                e.userId = "ANONYMOUS"
            }
        }
        if (!e.spkId) {
            e.spkId = ""
        }
        var E = 1;
        if (e.armode != undefined) {
            E = e.armode
        }
        if (e.watermarkTextSize) {
            var H = /.*%$/g;
            if (H.test(e.watermarkTextSize)) {
                e.watermarkTextSize = e.watermarkTextSize.replace(/%$/g, "")
            } else {
                e.watermarkTextSize = -e.watermarkTextSize
            }
        }
        if (typeof c.autoPlay == "undefined") {
            c.autoPlay = true
        }

        function u(N, M) {
            var K = STARPLAYER_VERSION.split(",");
            var J = N.split(M);

            function L(P) {
                var O = parseInt(J[P]);
                var Q = parseInt(K[P]);
                if (O > Q) {
                    return 1
                } else {
                    if (O == Q) {
                        if (P == 3) {
                            return 0
                        } else {
                            return L(P + 1)
                        }
                    } else {
                        return -1
                    }
                }
            }

            return L(0)
        }

        function z(N, M) {
            var K = STARPLAYER_AGENT_VERSION.split(",");
            var J = N.split(M);

            function L(P) {
                var O = parseInt(J[P]);
                var Q = parseInt(K[P]);
                if (O > Q) {
                    return 1
                } else {
                    if (O == Q) {
                        if (P == 3) {
                            return 0
                        } else {
                            return L(P + 1)
                        }
                    } else {
                        return -1
                    }
                }
            }

            return L(0)
        }

        function D() {
            k(e.videoContainer).innerHTML = "<table width='100%' height='100%' style='color:white;font-size:14px'><tr><td align='center' valign='middle'>" + StarPlayerString.INSTALL_ACTIVEX + "</td></tr></table>"
        }

        function v() {
            var K = ws_protocol + "://" + ws_host + ":" + ws_port + "/" + ws_separator;
            var J = new WebSocket(K);
            J.onopen = function (L) {
                var M = '{"config" : "' + STARPLAYER_CONFIG_URL + '"}';
                J.send(M)
            };
            J.onmessage = function (L) {
                var M = JSON.parse(L.data);
                if (typeof M.version !== "undefined") {
                    if (z(M.version, ".") == -1) {
                        setTimeout(function () {
                            v()
                        }, 1000)
                    } else {
                        setTimeout(function () {
                            location.reload()
                        }, 100)
                    }
                }
            };
            J.onclose = function (L) {
                setTimeout(function () {
                    v()
                }, 500)
            };
            J.onerror = function (L) {
            }
        }

        function B() {
            k(e.videoContainer).innerHTML = "<table width='100%' height='100%' style='color:white;font-size:14px'><tr><td align='center' valign='middle'>" + StarPlayerString.INSTALL_AGENT + "</td></tr></table>";
            setTimeout(function () {
                v()
            }, 500)
        }

        function x() {
            m = new StarPlayer_API(window.external);
            i()
        }

        function w(J) {
            var M = k(e.videoContainer).style.width;
            M = M != "" ? M : "100%";
            var L = k(e.videoContainer).style.height;
            L = L != "" ? L : "100%";
            var K = "<object style='position:absolute;left:-9999999px;' id='" + b + "' classid='CLSID:99277D5A-52B3-4B2E-AC38-B0065575FC55' width='" + M + "' height='" + L + " codebase='" + STARPLAYER_URL + "#version=" + STARPLAYER_VERSION + "' ><param name='config' value='" + STARPLAYER_CONFIG_URL + "' /><param name='controller' value='" + n + "' /><param name='user_id' value='" + e.userId + "' /><param name='spk_id' value='" + e.spkId + "' /><param name='time_limit' value='" + c.previewTime + "' /><param name='auto_play' value='" + c.autoPlay + "' /><param name='video_armode' value='" + E + "' /><param name='cpcode' value='" + e.cpcode + "' /><param name='controller_container_hwnd' value='" + J + "' /><param name='controller_params' value='" + e.controllerParams + "' /><param name='enable_block_messenger' value='" + e.blockMessenger + "' /><param name='enable_block_virtual_machine' value='" + e.blockVirtualMachine + "' /><param name='enable_dual_monitor' value='" + e.dualMonitor + "' /><param name='closed_caption_size' value='" + e.captionSize + "' /><param name='watermark_text' value='" + e.watermarkText + "' /><param name='watermark_text_color' value='" + e.watermarkTextColor + "' /><param name='watermark_text_size' value='" + e.watermarkTextSize + "' /><param name='watermark_horz_align' value='" + e.watermarkHorzAlign + "' /><param name='watermark_vert_align' value='" + e.watermarkVertAlign + "' /><param name='watermark_interval' value='" + e.watermarkInterval + "' /><param name='watermark_show_interval' value='" + e.watermarkShowInterval + "' /><param name='auto_progressive_download' value='" + e.auto_progressive_download + "' /><param name='marker' value='" + c.marker + "' /><param name='controller_mode' value='" + e.controllerMode + "' /><param name='custom_log_url' value='" + c.logUrl + "' /><param name='custom_log_extra' value='" + c.logExtraData + "' /><param name='logo_url' value='" + e.logoUrl + "' /><param name='logo_horz_align' value='" + e.logoHorzAlign + "' /><param name='logo_vert_align' value='" + e.logoVertAlign + "' /><param name='subtitle_placement' value='" + e.subtitlePlacement + "' /></object>";
            k(e.videoContainer).innerHTML += K;
            if (e.visible != false) {
                k(b).style.position = "relative";
                k(b).style.left = "0px"
            }
            if (isAtLeastIE11) {
                if (k(b).object) {
                    m = new StarPlayer_API(k(b));
                    k(b).init();
                    i();
                    setTimeout(y, 10)
                } else {
                    D()
                }
            } else {
                k(b).onreadystatechange = function () {
                    if (this.object) {
                        m = new StarPlayer_API(k(b));
                        k(b).init();
                        i();
                        setTimeout(y, 10)
                    } else {
                        D()
                    }
                };
                if (k(b).object) {
                    k(b).onreadystatechange()
                }
            }
        }

        function I(J) {
            if (c.blockMessenger && !e.blockMessenger) {
                e.blockMessenger = c.blockMessenger
            }
            w(J)
        }

        function y() {
            if (p.onInit) {
                p.onInit()
            }
            if (typeof c.previewTime != "undefined") {
                m.setTimelimit(c.previewTime)
            }
            if (c.intro) {
                m.open_media(c.intro, null);
                m.setLogUrl("")
            } else {
                if (c.intro2) {
                    m.open_media(c.intro2, null);
                    m.setLogUrl("")
                } else {
                    if (c.url) {
                        m.open_media(c.url, c.cc);
                        if (typeof e.thumbnailRootUrl != "undefined") {
                            m.setThumbnailRootUrl(e.thumbnailRootUrl)
                        }
                    }
                }
            }
            f = true
        }

        function C() {
            var L = k(e.controllerContainer).style.width;
            L = L != "" ? L : "100%";
            var K = k(e.controllerContainer).style.height;
            K = K != "" ? K : "100%";
            k(e.controllerContainer).innerHTML = "<object style='position:absolute;left:-9999999px;' id='" + g + "' classid='CLSID:7A63FEE6-E174-4FBC-A064-875DB95594A6' width='" + L + "' height='" + K + "' codebase='" + STARPLAYER_URL + "#version=" + STARPLAYER_VERSION + "' ></object>";
            var J = k(g);
            J.onreadystatechange = function () {
                if (this.object) {
                    J.style.position = "relative";
                    J.style.left = "0px";
                    A()
                } else {
                    D()
                }
            };
            if (J.object) {
                J.onreadystatechange()
            } else {
                if (isAtLeastIE11) {
                    J.addEventListener("readystatechange", J.onreadystatechange, false)
                }
            }
        }

        function t() {
            if (k(e.controllerContainer)) {
                C()
            } else {
                I(0)
            }
        }

        function A() {
            var J = k(g);
            if (J.HWND) {
                I(J.HWND)
            } else {
                var K = setInterval(function () {
                    if (J.HWND) {
                        clearInterval(K);
                        I(J.HWND)
                    }
                }, 1)
            }
        }

        this.toggleFullscreen = function () {
            if (m.getFullscreen()) {
                m.setFullscreen(false)
            } else {
                m.setFullscreen(true)
            }
        };

        function F() {
            var J = "<video style='visibility:hidden' id='" + b + "' width='100%' height='100%' preload ondblclick='toggleFullscreen()'></video>";
            J += "<div id='watermark'></div><div id='subtitle'></div><img id='logo'/>";
            k(e.videoContainer).innerHTML = J
        }

        if (isIE()) {
            k(e.videoContainer) ? t() : x()
        } else {
            if (!("WebSocket" in window)) {
            } else {
                var q = false;
                F();
                var G = ws_protocol + "://" + ws_host + ":" + ws_port + "/" + ws_separator;
                var r = new WebSocket(G);
                r.onopen = function (K) {
                    q = true;
                    var L = unescape(encodeURIComponent(encodeURIComponent(e.userId)));
                    var J = unescape(encodeURIComponent(encodeURIComponent(c.logExtraData)));
                    var M = '{"url" : "' + c.url + '","config" : "' + STARPLAYER_CONFIG_URL + '","user_id" : "' + L + '","spk_id" : "' + e.spkId + '","referer" : "' + window.parent.location.href + '","cpcode" : "' + e.cpcode + '","enable_block_messenger" : ' + e.blockMessenger + ',"enable_block_virtual_machine" : ' + e.blockVirtualMachine + ',"enable_dual_monitor" : ' + e.dualMonitor + ',"custom_log_url" : "' + c.logUrl + '","custom_log_extra" : "' + J + '"}';
                    r.send(M)
                };
                r.onmessage = function (J) {
                    var K = JSON.parse(J.data);
                    if (typeof K.version !== "undefined") {
                        if (z(K.version, ".") == -1) {
                            B()
                        } else {
                            if (!m) {
                                m = new StarPlayerHtml5(k(b), e, c);
                                if (e.visible != false) {
                                    m.setVisible(true)
                                }
                                m.player_id = K.player_id;
                                m.mac_address = K.mac_address;
                                m.websocket = r;
                                if (typeof K.keepalive_interval !== "undefined") {
                                    m.keepalive_interval = K.keepalive_interval
                                }
                                i();
                                setTimeout(y, 10)
                            }
                        }
                    }
                    if (typeof K.method !== "undefined") {
                        if (K.method == "keepalive") {
                            if (m._keepalive_callback) {
                                m._keepalive_callback(K.status)
                            }
                        } else {
                            if (K.method == "connection") {
                                if (m._connect_callback) {
                                    m._connect_callback(K.status, decodeURIComponent(K.msg), K.session_id)
                                }
                            } else {
                                if (K.method == "opened") {
                                    if (m._opened_callback) {
                                        m._opened_callback(K.status)
                                    }
                                } else {
                                    if (K.method == "ssn") {
                                        if (m._ssn_callback) {
                                            m._ssn_callback(K.value)
                                        }
                                    }
                                }
                            }
                        }
                    }
                };
                r.onclose = function (J) {
                    if (q == false) {
                        B()
                    }
                };
                r.onerror = function (J) {
                }
            }
        }
    }

    if (h) {
        if (k(b) && k(g)) {
            return
        }
    }
    o();
    this.bindEvent = function (q, r) {
        var t = "_on_" + q;
        if (!p[t]) {
            p[t] = []
        }
        p[t].push(r)
    };
    this.open_state_change = function (r) {
        if (m.setOpenState) {
            m.setOpenState(r)
        }
        switch (r) {
            case OpenState.CLOSING:
                break;
            case OpenState.CLOSED:
                break;
            case OpenState.OPENING:
                if (p.isIntroMovie() || p.isIntro2Movie() || p.isOutroMovie()) {
                    m.setLogUrl("");
                    m.setLogExtraData("")
                } else {
                    if (m.url() == c.url) {
                        if (typeof c.logUrl != "undefined") {
                            if (m.setLogUrl) {
                                m.setLogUrl(c.logUrl)
                            }
                            if (m.setLogExtraData) {
                                m.setLogExtraData(c.logExtraData)
                            }
                        }
                    }
                }
                break;
            case OpenState.OPENED:
                if (m.url() == c.url && c.startTime > 0) {
                    m.setCurrentPosition(c.startTime)
                }
                if (c.autoPlay) {
                    m.play()
                }
                break
        }
        if (p.onOpenStateChange) {
            p.onOpenStateChange(r)
        }
        if (p._on_open_state_change) {
            for (var q in p._on_open_state_change) {
                p._on_open_state_change[q](r)
            }
        }
    };
    this.play_state_change = function (r) {
        if (!m) {
            return
        }
        if (r != PlayState.COMPLETE) {
            if (m.setPlayState) {
                m.setPlayState(r)
            }
        }
        switch (r) {
            case PlayState.STOPPED:
                break;
            case PlayState.PLAYING:
                if (p.completeOutro) {
                    p.completeOutro = false;
                    if (c.intro) {
                        window.setTimeout(function () {
                            m.open_media(c.intro, null)
                        }, 10);
                        return
                    } else {
                        if (c.intro2) {
                            window.setTimeout(function () {
                                m.open_media(c.intro2, null)
                            }, 10);
                            return
                        } else {
                            if (c.url) {
                                window.setTimeout(function () {
                                    m.open_media(c.url, c.cc)
                                }, 10);
                                return
                            }
                        }
                    }
                }
                break;
            case PlayState.PAUSED:
                break;
            case PlayState.BUFFERING_STARTED:
                break;
            case PlayState.BUFFERING_STOPPED:
                break;
            case PlayState.COMPLETE:
                if (p.isIntroMovie()) {
                    if (c.intro2) {
                        window.setTimeout(function () {
                            m.open_media(c.intro2, null)
                        }, 10);
                        return
                    } else {
                        if (c.url) {
                            window.setTimeout(function () {
                                m.open_media(c.url, c.cc)
                            }, 10);
                            return
                        }
                    }
                } else {
                    if (p.isIntro2Movie()) {
                        if (c.url) {
                            window.setTimeout(function () {
                                m.open_media(c.url, c.cc)
                            }, 10);
                            return
                        }
                    } else {
                        if (p.isOutroMovie()) {
                            p.completeOutro = true
                        } else {
                            if (c.outro) {
                                window.setTimeout(function () {
                                    m.open_media(c.outro, null)
                                }, 10);
                                return
                            } else {
                            }
                        }
                    }
                }
                break
        }
        if (p.onPlayStateChange) {
            p.onPlayStateChange(r)
        }
        if (p._on_play_state_change) {
            for (var q in p._on_play_state_change) {
                p._on_play_state_change[q](r)
            }
        }
    };
    this.position_change = function (r) {
        if (p.onPositionChange) {
            p.onPositionChange(r)
        }
        if (p._on_position_change) {
            for (var q in p._on_position_change) {
                p._on_position_change[q](r)
            }
        }
    };
    this.position_change2 = function (q, t) {
        if (p.onPositionChange2) {
            p.onPositionChange2(q, t)
        }
        if (p._on_position_change2) {
            for (var r in p._on_position_change2) {
                p._on_position_change2[r](q, t)
            }
        }
    };
    this.volume_change = function (t, r) {
        if (p.onVolumeChange) {
            p.onVolumeChange(t, r)
        }
        if (p._on_volume_change) {
            for (var q in p._on_volume_change) {
                p._on_volume_change[q](t, r)
            }
        }
    };
    this.rate_change = function (r) {
        if (p.onRateChange) {
            p.onRateChange(r)
        }
        if (p._on_rate_change) {
            for (var q in p._on_rate_change) {
                p._on_rate_change[q](r)
            }
        }
    };
    this.repeat_change = function (r) {
        if (p.onRepeatChange) {
            p.onRepeatChange(r)
        }
        if (p._on_repeat_change) {
            for (var q in p._on_repeat_change) {
                p._on_repeat_change[q](r)
            }
        }
    };
    this.repeat_range_change = function (t, q) {
        if (p.onRepeatRangeChange) {
            p.onRepeatRangeChange(t, q)
        }
        if (p._on_repeat_range_change) {
            for (var r in p._on_repeat_range_change) {
                p._on_repeat_range_change[r](t, q)
            }
        }
    };
    this.update_time = function (r) {
        if (p._on_update_time) {
            for (var q in p._on_update_time) {
                p._on_update_time[q](r)
            }
        }
    };
    this.key_down = function (q) {
        if (p.onKeyDown && (!isIE() || p.getFullscreen())) {
            p.onKeyDown(q)
        }
    };
    this.key_up = function (q) {
        if (p.onKeyUp) {
            p.onKeyUp(q)
        }
    };
    this.mouse_down = function (q, r) {
        if (p.onMouseDown) {
            p.onMouseDown(q, r)
        }
    };
    this.mouse_up = function (q, r) {
        if (p.onMouseUp) {
            p.onMouseUp(q, r)
        }
        if (p.onClick) {
            p.onClick(q, r)
        }
    };
    this.mouse_dbclick = function (q, r) {
        if (p.onMouseDbclick) {
            p.onMouseDbclick(q, r)
        }
    };
    this.mouse_wheel = function (q, t, r) {
        if (p.mouseWheelHandler) {
            p.mouseWheelHandler(q, t, r)
        }
    };
    this.error = function (q) {
        if (isNaN(q)) {
            m = null;
            j(q)
        }
        if (q >= 1000) {
            if (p.isIntroMovie()) {
                if (c.intro2) {
                    m.open_media(c.intro2, null)
                } else {
                    if (c.url) {
                        m.open_media(c.url, c.cc)
                    }
                }
                return true
            } else {
                if (p.isIntro2Movie()) {
                    m.open_media(c.url, c.cc);
                    return true
                }
            }
            p.setVisible(true)
        }
        if (p.onError) {
            p.onError(q)
        }
        if (p._on_error) {
            for (var r in p._on_error) {
                p._on_error[r](q)
            }
        }
    };
    this.close = function () {
        if (p.onClose) {
            if (!p.onClose()) {
                m.closeBrowser()
            }
        } else {
            m.closeBrowser()
        }
    };
    this.destroy = function () {
        if (p.onDestroy) {
            p.onDestroy()
        }
        if (p._on_destroy) {
            for (var q in p._on_destroy) {
                p._on_destroy[q]()
            }
        }
    };
    this.marker = function (y, x, r, z, u, v, t, q) {
        if (p.onMarker) {
            p.onMarker(y, x, r, z, u, v, t, q)
        }
        if (p._on_marker) {
            for (var w in p._on_marker) {
                p._on_marker[w](y, x, r, z, u, v, t, q)
            }
        }
    };
    this.custom = function (r, t) {
        if (p.onCustom) {
            p.onCustom(r, t)
        }
        if (p._on_custom) {
            for (var q in p._on_custom) {
                p._on_custom[q](r, t)
            }
        }
    };
    this.subtitle = function (t, r) {
        if (p.onSubtitle) {
            p.onSubtitle(t, r)
        }
        if (p._on_subtitle) {
            for (var q in p._on_subtitle) {
                p._on_subtitle[q](t, r)
            }
        }
    };
    this.fullscreen_change = function (r) {
        if (p.onFullscreen) {
            p.onFullscreen(r)
        }
        if (p._on_fullscreen_change) {
            for (var q in p._on_fullscreen_change) {
                p._on_fullscreen_change[q](r)
            }
        }
    };

    function i() {
        m.addEvent("open_state_change", function (q) {
            p.open_state_change(q)
        });
        m.addEvent("play_state_change", function (q) {
            p.play_state_change(q)
        });
        m.addEvent("position_change", function (q) {
            p.position_change(q)
        });
        m.addEvent("position_change2", function (q, r) {
            p.position_change2(q, r)
        });
        m.addEvent("volume_change", function (r, q) {
            p.volume_change(r, q)
        });
        m.addEvent("rate_change", function (q) {
            p.rate_change(q)
        });
        m.addEvent("repeat_change", function (q) {
            p.repeat_change(q)
        });
        m.addEvent("repeat_range_change", function (r, q) {
            p.repeat_range_change(r, q)
        });
        m.addEvent("update_time", function (q) {
            p.update_time(q)
        });
        m.addEvent("key_down", function (q) {
            p.key_down(q)
        });
        m.addEvent("key_up", function (q) {
            p.key_up(q)
        });
        m.addEvent("mouse_down", function (q, r) {
            p.mouse_down(q, r)
        });
        m.addEvent("mouse_up", function (q, r) {
            p.mouse_up(q, r)
        });
        m.addEvent("mouse_dbclick", function (q, r) {
            p.mouse_dbclick(q, r)
        });
        m.addEvent("mouse_wheel", function (q, t, r) {
            p.mouse_wheel(q, t, r)
        });
        m.addEvent("error", function (q) {
            p.error(q)
        });
        m.addEvent("close", function () {
            p.close()
        });
        m.addEvent("destroy", function () {
            p.destroy()
        });
        m.addEvent("marker", function (y, t, x, r, q, w, v, u) {
            p.marker(y, t, x, r, q, w, v, u)
        });
        m.addEvent("custom", function (q, r) {
            p.custom(q, r)
        });
        m.addEvent("subtitle", function (r, q) {
            p.subtitle(r, q)
        });
        m.addEvent("fullscreen_change", function (q) {
            p.fullscreen_change(q)
        })
    }

    this.closeBrowser = function () {
        m.closeBrowser()
    };
    this.open_media = function (q) {
        c = q;
        if (typeof c.previewTime != "undefined") {
            m.setTimelimit(c.previewTime)
        }
        if (typeof c.autoPlay == "undefined") {
            c.autoPlay = true
        }
        if (f) {
            if (m.set_media) {
                m.set_media(c)
            }
            if (c.intro) {
                m.open_media(c.intro)
            } else {
                if (c.intro2) {
                    m.open_media(c.intro2)
                } else {
                    m.open_media(c.url, c.cc)
                }
            }
        }
    };
    this.close_media = function () {
        if (m.close_media) {
            m.close_media()
        }
    };
    this.getDuration = function () {
        if (m) {
            return m.getDuration()
        }
        return 0
    };
    this.getCurrentPosition = function () {
        if (m) {
            return m.getCurrentPosition()
        }
        return 0
    };
    this.setCurrentPosition = function (q) {
        if (m) {
            if (q > m.getDuration()) {
                q = 0
            }
            m.setCurrentPosition(q)
        }
    };
    this.getVolume = function () {
        if (m) {
            return m.getVolume()
        }
        return 1
    };
    this.setVolume = function (q) {
        if (m) {
            if (q > 1) {
                q = 1
            } else {
                if (q < 0) {
                    q = 0
                }
            }
            m.setVolume(q)
        }
    };
    this.getMute = function () {
        if (m) {
            return m.getMute()
        }
        return false
    };
    this.setMute = function (q) {
        if (m) {
            m.setMute(q)
        }
    };
    this.getFullscreen = function () {
        return m.getFullscreen()
    };
    this.setFullscreen = function (r) {
        if (p._on_fullscreen_change) {
            for (var q in p._on_fullscreen_change) {
                p._on_fullscreen_change[q](r)
            }
        }
        if (p.onFullscreen) {
            if (p.onFullscreen(r)) {
                m.setFullscreen(r)
            }
        } else {
            m.setFullscreen(r)
        }
    };
    this.getRate = function () {
        if (m) {
            return m.getRate()
        } else {
            return 1
        }
    };
    this.setRate = function (q) {
        if (m) {
            if (q > 2) {
                q = 2
            }
            if (q < 0.5) {
                q = 0.5
            }
            m.setRate(q)
        }
    };
    this.getRepeat = function () {
        if (m) {
            return m.getRepeat()
        }
        return false
    };
    this.setRepeat = function (q) {
        if (m) {
            m.setRepeat(q)
        }
    };
    this.getRepeatStartTime = function () {
        return m.getRepeatStartTime()
    };
    this.setRepeatStartTime = function (q) {
        m.setRepeatStartTime(q)
    };
    this.getRepeatEndTime = function () {
        return m.getRepeatEndTime()
    };
    this.setRepeatEndTime = function (q) {
        m.setRepeatEndTime(q)
    };
    this.getPlayTime = function () {
        return m.getPlayTime()
    };
    this.initPlayTime = function () {
        return m.initPlayTime()
    };
    this.play = function () {
        if (m) {
            m.play()
        }
    };
    this.pause = function () {
        if (m) {
            m.pause()
        }
    };
    this.stop = function () {
        if (m) {
            m.stop()
        }
    };
    this.addEventListener2 = function (r, q) {
        if (r == StarPlayer.OpenStateChangeEvent) {
            m.onOpenStateChange = q
        } else {
            if (r == StarPlayer.PlayStateChangeEvent) {
                m.onPlayStateChange = q
            } else {
                if (r == StarPlayer.KeyDownEvent) {
                    m.onKeyDown = q
                } else {
                    if (r == StarPlayer.KeyUpEvent) {
                        m.onKeyUp = q
                    } else {
                        if (r == StarPlayer.MouseDownEvent) {
                            m.onMouseDown = q
                        } else {
                            if (r == StarPlayer.MouseUpEvent) {
                                m.onMouseUp = q
                            } else {
                                if (r == StarPlayer.MouseDbclickEvent) {
                                    m.onMouseDbclick = q
                                } else {
                                    if (r == StarPlayer.MouseWheelEvent) {
                                        m.mouseWheelHandler = q
                                    } else {
                                        if (r == StarPlayer.ClickEvent) {
                                            m.onClick = q
                                        } else {
                                            if (r == StarPlayer.FullscreenEvent) {
                                                m.onFullscreen = q
                                            } else {
                                                if (r == StarPlayer.RateChangeEvent) {
                                                    m.onRateChange = q
                                                } else {
                                                    if (r == StarPlayer.DestroyEvent) {
                                                        m.onDestroy = q
                                                    } else {
                                                        if (r == StarPlayer.MarkerEvent) {
                                                            m.onMarker = q
                                                        } else {
                                                            if (r == StarPlayer.PositionChange) {
                                                                m.onPositionChange = q
                                                            } else {
                                                                if (r == StarPlayer.PositionChange2) {
                                                                    m.onPositionChange2 = q
                                                                } else {
                                                                    if (r == StarPlayer.CustomEvent) {
                                                                        m.onCustom = q
                                                                    } else {
                                                                        if (r == StarPlayer.Subtitle) {
                                                                            m.onSubtitle = q
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    };
    this.getOpenState = function () {
        return m.getOpenState()
    };
    this.getPlayState = function () {
        if (m) {
            return m.getPlayState()
        } else {
            return PlayState.STOPPED
        }
    };
    this.backward = function (q) {
        if (m) {
            var r = m.getCurrentPosition() - (q ? q : d);
            if (r < 0) {
                r = 0
            }
            m.setCurrentPosition(r)
        }
    };
    this.forward = function (q) {
        if (m) {
            var r = m.getCurrentPosition() + (q ? q : d);
            if (r > m.getDuration()) {
                r = m.getDuration()
            }
            m.setCurrentPosition(r)
        }
    };
    this.getStep = function () {
        return d
    };
    this.setStep = function (q) {
        d = q
    };
    this.isIntroMovie = function () {
        return c.url != c.intro && c.url != c.intro2 && m.url() == c.intro
    };
    this.isIntro2Movie = function () {
        return c.url != c.intro && c.url != c.intro2 && m.url() == c.intro2
    };
    this.isOutroMovie = function () {
        return c.url != c.outro && m.url() == c.outro
    };
    this.getTopmost = function () {
        return m.getTopmost()
    };
    this.setTopmost = function (q) {
        m.setTopmost(q)
    };
    this.getXHR = function () {
        return m.getXHR()
    };
    this.setVisible = function (q) {
        m.setVisible(q)
    };
    this.getVideoWidth = function () {
        if (m.getVideoWidth) {
            return m.getVideoWidth()
        }
        return 0
    };
    this.getVideoHeight = function () {
        if (m.getVideoHeight) {
            return m.getVideoHeight()
        }
        return 0
    };
    this.getBrightness = function () {
        if (m.getBrightness) {
            return m.getBrightness()
        }
        return 0
    };
    this.setBrightness = function (q) {
        if (m.setBrightness) {
            m.setBrightness(q)
        }
    };
    this.getContrast = function () {
        if (m.getContrast) {
            return m.getContrast()
        }
        return 0
    };
    this.setContrast = function (q) {
        if (m.setContrast) {
            m.setContrast(q)
        }
    };
    this.getSaturation = function () {
        if (typeof m.saturation !== "undefined") {
            return m.saturation
        }
        return 0
    };
    this.setSaturation = function (q) {
        if (m.setSaturation) {
            m.setSaturation(q)
        }
    };
    this.getHue = function () {
        if (m.getHue) {
            return m.getHue()
        }
        return 0
    };
    this.setHue = function (q) {
        if (m.setHue) {
            m.setHue(q)
        }
    };
    this.getBlockMessenger = function () {
        return c.blockMessenger
    };
    this.setCaption = function (q) {
        if (m.setCaption) {
            m.setCaption(q)
        }
    };
    this.clearCaption = function () {
        if (m.clearCaption) {
            m.clearCaption()
        }
    };
    this.callFunction = function (q) {
        if (m.callFunction) {
            return m.callFunction(q)
        }
    };
    this.captureFrame = function (q) {
        if (m.captureFrame) {
            return m.captureFrame(q)
        }
    };
    this.getAlphaBrain = function () {
        function q() {
            var t = 1;
            var r = 4;
            var u = 40;
            this.initialize = function () {
                t = 1;
                r = 4;
                u = 40
            };
            this.start = function (w) {
                m.control_alpha_brain("AB_Start", w ? w : [t, r, u].join("/"))
            };
            this.stop = function () {
                m.control_alpha_brain("AB_Stop", "")
            };
            this.func = function (w) {
                t = w;
                m.control_alpha_brain("AB_Function", w.toString())
            };
            this.soundUp = function (w) {
                if (r + w > 20) {
                    return
                }
                r += w;
                m.control_alpha_brain("AB_Sound_up", w.toString())
            };
            this.soundDown = function (w) {
                if (r - w < 0) {
                    return
                }
                r -= w;
                m.control_alpha_brain("AB_Sound_down", w.toString())
            };
            this.volumeUp = function (w) {
                if (u + w > 100) {
                    return
                }
                u += w;
                m.control_alpha_brain("AB_Volume_up", w.toString())
            };
            this.volumeDown = function (w) {
                if (u - w < 0) {
                    return
                }
                u -= w;
                m.control_alpha_brain("AB_Volume_down", w.toString())
            };
            this.volumeMute = function () {
                m.control_alpha_brain("AB_Volume_Mute", "")
            }
        }

        if (!a) {
            a = new q()
        }
        return a
    };
    this.getPID = function () {
        return m.getPID()
    };
    this.getSessionId = function () {
        if (m.sessionid) {
            return m.sessionid()
        } else {
            return ""
        }
    };
    this.internetCheckConnection = function (q) {
        if (m.internetCheckConnection) {
            return m.internetCheckConnection(q)
        }
        return true
    };
    this.getSSN = function () {
        if (m.getSSN) {
            return m.getSSN()
        }
        return ""
    };
    this.getMAC = function () {
        return m.getMAC()
    };
    this.getTrack = function () {
        return m.getTrack()
    };
    this.setTrack = function (q) {
        m.setTrack(q)
    };
    this.getProgressRate = function () {
        return m.getProgressRate()
    };
    this.getStopPosition = function () {
        return m.getStopPosition()
    };
    this.getSubtitleUrl = function () {
        return c.cc
    };
    this.getSubtitle = function () {
        if (m.getSubtitle) {
            return m.getSubtitle()
        }
        return 0
    };
    this.setSubtitle = function (q) {
        if (m.setSubtitle) {
            m.setSubtitle(q)
        }
    };
    this.getMaxBandwidth = function () {
        if (m.getMaxBandwidth) {
            return m.getMaxBandwidth()
        }
        return 0
    };
    this.getBandwidth = function () {
        if (m.getBandwidth) {
            return m.getBandwidth()
        }
        return 0
    };
    this.getBitrate = function () {
        if (m.getBitrate) {
            return m.getBitrate()
        }
        return 0
    };
    this.getAvgFrameRate = function () {
        if (m.getAvgFrameRate) {
            return m.getAvgFrameRate()
        }
        return 0
    };
    this.getTotalBytes = function () {
        if (m.getTotalBytes) {
            return m.getTotalBytes()
        }
        return 0
    };
    this.getReceivedBytes = function () {
        if (m.getReceivedBytes) {
            return m.getReceivedBytes()
        }
        return 0
    }
}

StarPlayer.OpenStateChangeEvent = "Event.OpenStateChange";
StarPlayer.PlayStateChangeEvent = "Event.PlayStateChange";
StarPlayer.ClickEvent = "Event.Click";
StarPlayer.KeyDownEvent = "Event.KeyDown";
StarPlayer.KeyUpEvent = "Event.KeyUp";
StarPlayer.MouseDownEvent = "Event.MouseDown";
StarPlayer.MouseUpEvent = "Event.MouseDown";
StarPlayer.MouseDbclickEvent = "Event.MouseDbclick";
StarPlayer.MouseWheelEvent = "Event.MouseWheel";
StarPlayer.FullscreenEvent = "Event.Fullscreen";
StarPlayer.RateChangeEvent = "Event.RateChage";
StarPlayer.DestroyEvent = "Event.Destroy";
StarPlayer.MarkerEvent = "Event.Marker";
StarPlayer.PositionChange = "Event.PositionChange";
StarPlayer.PositionChange2 = "Event.PositionChange2";
StarPlayer.CustomEvent = "Event.Custom";
StarPlayer.Subtitle = "Event.Subtitle";

function StarPlayerTracker(n) {
    var e = this;
    var i = 0;
    var d = 0;
    var a;
    var f = null;
    var o = 0;
    var g = 0;
    var j = 0;
    var r = [];
    var h = false;
    n.addEvent("open_state_change", m);
    n.addEvent("play_state_change", q);
    n.addEvent("position_change2", c);

    function m(t) {
        if (t == OpenState.OPENED) {
            j = parseInt(n.getCurrentPosition(), 10);
            g = parseInt(n.getDuration(), 10)
        }
    }

    function q(t) {
        switch (t) {
            case PlayState.PLAYING:
                l();
                break;
            case PlayState.PAUSED:
                k();
                break;
            case PlayState.STOPPED:
                if (!h) {
                    c(j, o)
                }
                j = 0;
                h = false;
                k();
                break;
            case PlayState.BUFFERING_STARTED:
                k();
                break;
            case PlayState.COMPLETE:
                c(j, g);
                h = true;
                setTimeout(function () {
                    b(new Date().getTime(), g)
                }, 100);
                break
        }
    }

    function c(t, u) {
        if (u < j) {
            u = j
        }
        r.push([j, parseInt(u, 10)]);
        j = parseInt(t)
    }

    function p(u, v) {
        var t;
        v = v || [];
        for (t in u) {
            if (u.hasOwnProperty(t)) {
                v[t] = u[t]
            }
        }
        return v
    }

    this.getHistory = function () {
        var y = p(r);
        var x = n.getPlayState();
        if (x != PlayState.STOPPED && x != PlayState.COMPLETE) {
            var u = parseInt(n.getCurrentPosition(), 10);
            if (u < j) {
                u = j
            }
            y.push([j, u])
        }
        var t = [];
        var w = y.length;
        for (var v = 0; v < w; v += 1) {
            t.push([y[v][0], y[v][1]].join(":"))
        }
        return t.join(",")
    };
    this.setHistory = function (w) {
        var t = w.replace(/:/g, ",").split(",");
        var v = t.length;
        for (var u = 0; u < v; u += 2) {
            r.push([t[u], t[u + 1]])
        }
    };
    this.getTrackerTime = function () {
        var A = p(r);
        var u = n.getPlayState();
        if (u != PlayState.STOPPED && u != PlayState.COMPLETE) {
            var y = parseInt(n.getCurrentPosition(), 10);
            if (y < j) {
                y = j
            }
            A.push([j, y])
        }
        A.sort(function (F, E) {
            return F[0] - E[0]
        });
        var C, D, v, x, t;
        C = 0, D = 0, v = 0, x = 0, t = 0;
        var w = A.length;
        if (w > 0) {
            D = Number(A[0][0], 10);
            v = Number(A[0][1], 10);
            for (var z = 1; z < w; z += 1) {
                x = Number(A[z][0], 10);
                t = Number(A[z][1], 10);
                if (t != x) {
                    var B = v;
                    if (B > x) {
                        v = x
                    }
                    if (B > t) {
                        t = B
                    }
                    if (v - D > 0) {
                        C += (v - D)
                    }
                    D = x;
                    v = t
                }
            }
        }
        if (v - D > 0) {
            C += (v - D)
        }
        return C
    };
    this.getPercent = function () {
        var t = e.getTrackerTime();
        return parseInt(t / g * 100, 10)
    };
    this.getTracker = function () {
        var E = [];
        var z = p(r);
        var t = n.getPlayState();
        if (t != PlayState.STOPPED && t != PlayState.COMPLETE) {
            var x = parseInt(n.getCurrentPosition(), 10);
            if (x < j) {
                x = j
            }
            z.push([j, x])
        }
        z.sort(function (G, F) {
            return G[0] - F[0]
        });
        var C, v, D, u, B;
        C = 0, v = 0, D = 0, u = 0, B = 0;
        var w = z.length;
        if (w > 0) {
            v = Number(z[0][0], 10);
            D = Number(z[0][1], 10);
            for (var y = 1; y < w; y += 1) {
                u = Number(z[y][0], 10);
                B = Number(z[y][1], 10);
                if (u != B) {
                    var A = D;
                    if (A > u && A < B) {
                        D = B
                    }
                    if (A < u) {
                        E.push([v, D].join(":"));
                        v = u;
                        D = B
                    }
                }
            }
            E.push([v, D].join(":"))
        }
        return E.join(",")
    };
    this.getStrongPlayedTime = function () {
        return parseInt(i, 10)
    };
    this.getPlayedTime = function () {
        return parseInt(d, 10)
    };

    function l() {
        a = new Date().getTime();
        if (f == null) {
            f = setInterval(function () {
                b(new Date().getTime(), parseInt(n.getCurrentPosition(), 10))
            }, 1000)
        }
    }

    function k() {
        clearInterval(f);
        f = null
    }

    function b(v, w) {
        if (w > 0) {
            o = parseInt(w, 10)
        }
        var u = new Number(n.getRate());
        var t = v - a;
        if (t < 2000) {
            i += t * u.toFixed(1) / 1000;
            d += t / 1000
        }
        a = v;
        $("#debug1").text("Progress : " + e.getPercent() + "%");
        $("#debug2").text("History : " + e.getHistory());
        $("#debug3").text("Tracker : " + e.getTracker())
    }
}

var Base64 = {
    _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (c) {
        var a = "";
        var k, h, f, j, g, e, d;
        var b = 0;
        c = Base64._utf8_encode(c);
        while (b < c.length) {
            k = c.charCodeAt(b++);
            h = c.charCodeAt(b++);
            f = c.charCodeAt(b++);
            j = k >> 2;
            g = ((k & 3) << 4) | (h >> 4);
            e = ((h & 15) << 2) | (f >> 6);
            d = f & 63;
            if (isNaN(h)) {
                e = d = 64
            } else {
                if (isNaN(f)) {
                    d = 64
                }
            }
            a = a + this._keyStr.charAt(j) + this._keyStr.charAt(g) + this._keyStr.charAt(e) + this._keyStr.charAt(d)
        }
        return a
    }, decode: function (c) {
        var a = "";
        var k, h, f;
        var j, g, e, d;
        var b = 0;
        c = c.replace(/[^A-Za-z0-9\+\/\=]/g, "");
        while (b < c.length) {
            j = this._keyStr.indexOf(c.charAt(b++));
            g = this._keyStr.indexOf(c.charAt(b++));
            e = this._keyStr.indexOf(c.charAt(b++));
            d = this._keyStr.indexOf(c.charAt(b++));
            k = (j << 2) | (g >> 4);
            h = ((g & 15) << 4) | (e >> 2);
            f = ((e & 3) << 6) | d;
            a = a + String.fromCharCode(k);
            if (e != 64) {
                a = a + String.fromCharCode(h)
            }
            if (d != 64) {
                a = a + String.fromCharCode(f)
            }
        }
        a = Base64._utf8_decode(a);
        return a
    }, _utf8_encode: function (b) {
        b = b.replace(/\r\n/g, "\n");
        var a = "";
        for (var e = 0; e < b.length; e++) {
            var d = b.charCodeAt(e);
            if (d < 128) {
                a += String.fromCharCode(d)
            } else {
                if ((d > 127) && (d < 2048)) {
                    a += String.fromCharCode((d >> 6) | 192);
                    a += String.fromCharCode((d & 63) | 128)
                } else {
                    a += String.fromCharCode((d >> 12) | 224);
                    a += String.fromCharCode(((d >> 6) & 63) | 128);
                    a += String.fromCharCode((d & 63) | 128)
                }
            }
        }
        return a
    }, _utf8_decode: function (a) {
        var b = "";
        var d = 0;
        var e = c1 = c2 = 0;
        while (d < a.length) {
            e = a.charCodeAt(d);
            if (e < 128) {
                b += String.fromCharCode(e);
                d++
            } else {
                if ((e > 191) && (e < 224)) {
                    c2 = a.charCodeAt(d + 1);
                    b += String.fromCharCode(((e & 31) << 6) | (c2 & 63));
                    d += 2
                } else {
                    c2 = a.charCodeAt(d + 1);
                    c3 = a.charCodeAt(d + 2);
                    b += String.fromCharCode(((e & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                    d += 3
                }
            }
        }
        return b
    }
};