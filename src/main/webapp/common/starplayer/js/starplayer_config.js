//x86
var STARPLAYER_URL = "http://cab.starplayer.skcdn.com/starplayer/starplayer-1.5.13.37.cab";
var STARPLAYER_SETUP_URL = "http://cab.starplayer.skcdn.com/starplayer/starplayer-1.5.13.37.exe";
var STARPLAYER_VERSION = "1,5,13,37";

//x64
var STARPLAYER64_URL = "http://cab.starplayer.skcdn.com/starplayer/starplayer64-1.5.13.37.cab";
var STARPLAYER64_SETUP_URL = "http://cab.starplayer.skcdn.com/starplayer/starplayer64-1.5.13.37.exe";
var STARPLAYER64_VERSION = "1,5,13,37";


//Agent
var STARPLAYER_AGENT_SETUP_URL = "http://cab.starplayer.skcdn.com/starplayer/starplayer_agent_1.0.1.18.exe";
var STARPLAYER_AGENT_VERSION = "1,0,1,18";


//CONFIG
var STARPLAYER_CONFIG_URL = "http://mgt.zianedu.star.skcdn.com/config/starplayer.txt";

function OpenSamplePlayer( vodPath )
{
    var pcMobile = divisionPcMobile();

    var vodTitle = "샘플";
    if( pcMobile == 'PC' )
    {
            window.open( "", "Player", "width=1200, height=680, scrollbars=0, menubar=0, resizable=0" );

            $("#vodPath").val( vodPath );
            $("#vodTitle" ).val( vodTitle );
            $("#id_frm_player").attr( "target", "Player" );
            $( "#id_frm_player").attr( "action", "/popup?page_gbn=starPlayer" );
            $( "#id_frm_player" ).submit();
    }
    else
    {
        var sp = StarPlayerApp;
        var infoUrl = "http://15.164.7.237/popup?page_gbn=starPlayerMobile&license=FBD4FB45-D5F4-4493-AE56-BCD6F36F646A&vodPath=" + vodPath;
        sp.license = "FBD4FB45-D5F4-4493-AE56-BCD6F36F646A";
        sp.version = "1.0.0";
        sp.android_version = "1.0.0";
        sp.ios_version = "1.0.0";
        sp.pmp = "true";

        sp.executeApp(infoUrl);
    }
}

function OpenLecPlayer( vodPath, vodTitle, curriKey, jlecKey, videoType )
{
    var result  = confirmVideoPlay(jlecKey, curriKey);
    if(result == true){
        var pcMobile = divisionPcMobile();

        if(pcMobile == 'PC'){
            window.open("", "Player", "width=1200, height=680, scrollbars=0, menubar=0, resizable=0");
            $("#vodPath").val(vodPath);
            $("#vodTitle").val(vodTitle);

            $("#id_frm_player").attr("target", "Player");
            $("#id_frm_player").attr("action", "/popup?page_gbn=realStarPlayer&curriKey=" + curriKey + "&jlecKey=" + jlecKey);
            $("#id_frm_player").submit();
        }else{
            var sp = StarPlayerApp;
            var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
            var infoUrl = "http://15.164.7.237/popup?page_gbn=realStarPlayerMobile&license=FBD4FB45-D5F4-4493-AE56-BCD6F36F646A&vodPath=" + vodPath + "&vodTitle=" + vodTitle + "&userKey=" +  sessionUserInfo.userKey + "&jLecKey=" + jlecKey + "&curriKey=" + curriKey;
            sp.license = "FBD4FB45-D5F4-4493-AE56-BCD6F36F646A";
            sp.version = "1.0.0";
            sp.android_version = "1.0.0";
            sp.ios_version = "1.0.0";
            sp.pmp = "true";

            sp.executeApp(infoUrl);
        }
    }else{
        alert("재생 가능한 시간이 초과되었습니다.");
        return false;
    }

}
//모바일 다운로드
function OpenDownloadPlayer(vodPath, vodTitle, curriKey, jlecKey) {
    var sp = StarPlayerApp;
    var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
    var infoUrl = "http://15.164.7.237/popup?page_gbn=realStarPlayerMobileDownload&license=FBD4FB45-D5F4-4493-AE56-BCD6F36F646A&vodPath=" + vodPath + "&vodTitle=" + vodTitle + "&userKey=" +  sessionUserInfo.userKey + "&jLecKey=" + jlecKey + "&curriKey=" + curriKey;
    sp.license = "FBD4FB45-D5F4-4493-AE56-BCD6F36F646A";
    sp.version = "1.0.0";
    sp.android_version = "1.0.0";
    sp.ios_version = "1.0.0";
    sp.pmp = "true";

    sp.executeApp(infoUrl);
}
