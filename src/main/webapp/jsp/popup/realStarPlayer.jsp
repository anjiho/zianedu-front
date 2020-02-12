<%@ page import="com.zianedu.front.axis.security.*" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%
    response.addHeader("Cache-Control", "no-cache");
%>
<%
    String vodPath = Util.isNullValue(request.getParameter("vodPath"), "");
    String vodTitle = Util.isNullValue(request.getParameter("vodTitle"), "샘플");
    String curriKey = Util.isNullValue(request.getParameter("curriKey"), "");

    StringEncrypter encrypter = new StringEncrypter("axissoft", "starplayer");

    System.out.println(">>" + vodPath);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="X-UA-Compatible" content="requiresActiveX=true"/>
    <title><%=vodTitle%></title>
    <link type="text/css" href="/common/starplayer/css/starplayer.css" rel="stylesheet" />
    <script type="text/javascript" src="/common/starplayer/js/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="/common/starplayer/js/starplayer_config.js"></script>
    <script type="text/javascript" src="/common/starplayer/js/starplayer.js"></script>
    <script type="text/javascript" src="/common/starplayer/js/starplayer_ui.js"></script>
    <script type="text/javascript" src="/common/starplayer/js/htmlparser.js"></script>
    <script type="text/javascript" src="/common/starplayer/js/sami.js"></script>
    <script type="text/javascript">
        var player;

        var step_;
        step_ = 20;
        var rate = 1.0;
        function getStep() {
            return step_;
        }

        function onMouseDbclick(x, y) {
            player.setFullscreen(!player.getFullscreen());
        }

        function onKeyDown(keycode) {
            if (window.event) {
                var type = window.event.srcElement.type;
                if (type == "text" || type == "textarea")
                    return true;
            }
            //alert(keycode);
            switch (keycode) {
                case 13: // ENTER
                    player.setFullscreen(true);
                    break;
                case 32: // SPACE
                    if (player.getPlayState() == PlayState.PLAYING)
                        player.pause();
                    else
                        player.play();
                    break;
                case 38: // UP
                    player.setVolume(player.getVolume() + 0.1);
                    break;
                case 40: // DOWN
                    player.setVolume(player.getVolume() - 0.1);
                    break;
                case 37: // LEFT
                    player.backward(getStep());
                    break;
                case 39: // RIGHT
                    player.forward(getStep());
                    break;
                case 190: // >
                    var newrate = player.getRate() + 0.2;
                    player.setRate(newrate.toFixed(1));
                    break;
                case 188: // <
                    var newrate = (player.getRate() - 0.2) < 0.6 ? 0.6 : (player.getRate() - 0.2);
                    player.setRate(newrate.toFixed(1));
                    break;
                case 77: // M
                    player.setMute(!player.getMute());
                    break;
                case 82: // R
                    player.setRepeat(!player.getRepeat());
                    break;
                default:
                    return;
            }
            return false;
        }

        function getBlockMessenger() {
            return player.getBlockMessenger();
        }

        function onOpenStateChange(state) {
            switch (state) {
                case OpenState.CLOSING:
                    break;
                case OpenState.CLOSED:
                    break;
                case OpenState.OPENING:
                    break;
                case OpenState.OPENED:
                    player.setVolume(1);
                    player.setRate(rate);
                    //console.log(getPlayTime());
                    setTimeout("saveHistory()", 1000 * 60);
                    break;
            }
        }

        var complete = false;
        function onPlayStateChange(state) {
            switch (state) {
                case PlayState.PLAYING:
                    player.setVisible(true);
                    complete = false;
                    break;
                case PlayState.PAUSED:
                    break;
                case PlayState.STOPPED:
                    player.setVisible(false);
                    break;
                case PlayState.BUFFERING_STARTED:
                    break;
                case PlayState.COMPLETE:
                    //$('#debug1').text('complete');
                    rate = player.getRate();
                    complete = true;
                    break;
            }
        }

        function onError(errcode) {
            player.setVisible(true);
            if (errcode == StarPlayerError.OPEN_FAILURE) {
            }
        }

        function onPositionChange(pos) {
        }

        function onVolumeChange(volume, mute) {

        }

        function onRateChange(rate) {

        }

        function onLoad(){
            var config = {
                userId: "ANONYMOUS",    //사용자 아이디 세팅
                id: "starplayer",
                videoContainer: "video-container",
                controllerContainer: "controller-container",
                controllerContainerHtml5: "controller-container2",
                controllerUrl: "axissoft3.bin",
                visible:true,
                auto_progressive_download:false,
                blockVirtualMachine:true,
                blockMessenger: false,
                dualMonitor: true,
                captionSize:5
            };

            var url = "<%=vodPath%>";
            var media = {
                url : url,
                autoPlay:true,
                startTime: 0
            };
            player = new StarPlayer(config, media);

            player.onOpenStateChange = onOpenStateChange;
            player.onKeyDown = onKeyDown;
            player.onMouseDbclick = onMouseDbclick;
            player.onPlayStateChange = onPlayStateChange;
            player.onVolumeChange = onVolumeChange;
            player.onRateChange = onRateChange;

            initScriptUI(player);
        }

        function onUnload() {

        }

        function goSampleYoutube(url) {
            window.open(url, 'Vod','left=0, top=0, width=1035, height=650, menubar=no, directories=no, resizable=yes, status=no, scrollbars=no');
        }

        <%--function goSample(movieUrl) {--%>
        <%--    if(movieUrl.match(/youtube/)){--%>
        <%--        window.open(movieUrl, 'Vod','left=0, top=0, width=1035, height=650, menubar=no, directories=no, resizable=yes, status=no, scrollbars=no');--%>
        <%--    }else{--%>
        <%--        //window.open('http://localhost:8080/edu/resources/starPlayer_2017/starPlayerSample_2017.jsp?url=' + encodeURIComponent("http://algisa.nptechnology.com:8000/file/sample.mp4"), 'Vod','left=0, top=0, width=1035, height=650, menubar=no, directories=no, resizable=yes, status=no, scrollbars=no');--%>
        <%--        var pop_title = "starPlayer" ;--%>
        <%--        var frmData = document.frmPlayerData;--%>
        <%--        //var url  = "http://www.algisa.com/resources/starPlayer_2017/starPlayers.jsp";--%>
        <%--        var url = "<%=targetUrl%>";--%>
        <%--        $('#url').val(movieUrl); //encodeURIComponent(movieUrl)--%>

        <%--        frmData.target = pop_title;--%>
        <%--        frmData.action = url;--%>


        <%--        window.open("", pop_title,'left=0, top=0, width=1035, height=650, menubar=no, directories=no, resizable=yes, status=no, scrollbars=no');--%>
        <%--        frmData.submit();--%>
        <%--    }--%>
        <%--}--%>

        //TODO : 모바일 맛보기 공통화 처리 필요.. 왜 안될까..
        /*function goSampleApp(movieUrl, refererInfo) {

            var sp = StarPlayerApp;
            sp.license = "FDDFA75E-B718-4DAF-BF57-A8D1FC0299B9";
            sp.version = "1.0.0";
            sp.debug = "false";
            sp.referer = refererInfo;
            var app = function(info_url) {
                sp.executeApp(info_url);
            }

            var url = "http://59.150.150.205:8080/edu/movieLectureInfo/starPlayerM_2017_sample.html?movieUrl=" + movieUrl;
            app(url);
        }*/

        function saveHistory() {
            var time = player.getPlayTime();
            console.log(time);
            setTimeout("saveHistory()", 1000 * 60);
        }
    </script>

    <style type="text/css">
        #controller-container2 {
            position:absolute;
            display:block;
            left: 0px;
            top: 568px;
        }
    </style>

</head>

<body style="margin: 0 0 0 0;overflow-x:hidden;overflow-y:hidden;" scroll=no onload="onLoad()" onkeydown="onKeyDown(event.keyCode)" oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<div id="player-container" style="width:1024px;">
    <div id="video-container" style="height:568px;background:black url('') no-repeat center center;">
    </div>
    <div id="controller-container" style="margin: 0 0 0 0;height:81px;"></div>
    <!-- Start UI -->
    <div id="controller-container2" class="starplayer_script_ui" style="margin: 0 0 0 0;width:1024px;height:81px;background-color:black;">
        <div class="top_area">
            <div class="seekbar_l">
                <div class="currentbar"></div>
                <div class="repeatbar"></div>
                <div class="seekbar_area">
                    <a class="btn_common btn_seek"></a>
                    <a class="btn_common btn_repeatA" style="left:0%;display:none;"></a>
                    <a class="btn_common btn_repeatB" style="left:100%;display:none;"></a>
                </div>
            </div>
            <div class="seekbar_r">
                <a class="btn_common btn_repeat"></a>
                <a class="btn_common btn_fullscreen"></a>
                <a class="btn_common btn_mute"></a>
                <div class="volumebar">
                    <div class="current_volumebar"></div>
                    <div class="volumebar_area">
                        <a class="btn_common btn_volume"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom_area">
            <div class="control_l">
                <div class="basic_controls">
                    <a class="btn_common btn_play"></a>
                    <a class="btn_common btn_stop"></a>
                    <a class="btn_common btn_backward"></a>
                    <a class="btn_common btn_forward"></a>
                </div>
                <div class="control_text_status">준비</div>
                <div class="control_text_time"><span id="text_currentTime">00:00:00</span> / <span id="text_duration">00:00:00</span></div>
            </div>
            <div class="control_r">
                <ul class="speed_controls">
                    <li><a class="btn_common btn_speed06"></a></li>
                    <li><a class="btn_common btn_speed08"></a></li>
                    <li><a class="btn_common btn_speed10 active"></a></li>
                    <li><a class="btn_common btn_speed12"></a></li>
                    <li><a class="btn_common btn_speed14"></a></li>
                    <li><a class="btn_common btn_speed16"></a></li>
                    <li><a class="btn_common btn_speed18"></a></li>
                    <li><a class="btn_common btn_speed20"></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End UI -->
</body>
</html>

