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

    // a_strFilePath = "zian/data/soft/01_09/190905_107226_01_H.mp4";
    // a_strTitle = "1234",
    // a_lLecKey = "14591";
    // a_lCurriKey = "126979";
    // a_bHigh = "1";
    var vodTitle = "샘플";
    if( pcMobile == 'PC' )
    {
            window.open( "", "Player", "width=1200, height=680, scrollbars=0, menubar=0, resizable=0" );
            //gfn_winPop(980, 680, )

            $("#vodPath").val( vodPath );
            $("#vodTitle" ).val( vodTitle );
            //$("#a_bPlayer_High" ).val( a_bHigh );

            $("#id_frm_player").attr( "target", "Player" );
            $( "#id_frm_player").attr( "action", "/popup?page_gbn=starPlayer" );
            $( "#id_frm_player" ).submit();
    }
    else
    {

        // var sp				= StarPlayerApp;
        // sp.license			= "FBD4FB45-D5F4-4493-AE56-BCD6F36F646A";
        // sp.version			= "1.0.0";
        // sp.android_version	= "1.0.0";
        // sp.ios_version		= "1.0.0";
        // sp.pmp				= "true";
        //
        // sp.executeApp("popup?page_gbn=starPlayerMobile");
        // if( a_lLecKey.toString() == "0" && a_strFilePath.length > 0 )
        //     //sp.executeApp( GetCurrentSiteAddress() + "Player/AxisSmartStreamingSampleFile?a_strPlayer_FilePath=" + a_strFilePath + "&a_strPlayer_Title=" + a_strTitle );
        //     sp.executeApp("/popup?page_gbn=starPlayerMobile");
        // else
        //     //sp.executeApp( GetCurrentSiteAddress() + "Player/AxisSmartStreamingSample?a_lPlayer_LecKey=" + a_lLecKey + "&a_lPlayer_CurriKey=" + a_lCurriKey + "&a_bPlayer_High=" + a_bHigh );
        //     sp.executeApp("/popup?page_gbn=starPlayerMobile");


        var sp = StarPlayerApp;
        var infoUrl = "http://15.164.7.237/popup?page_gbn=starPlayerMobile&license=FBD4FB45-D5F4-4493-AE56-BCD6F36F646A&vodPath=" + vodPath + "&vodTitle=" + vodTitle;
        sp.license = "FBD4FB45-D5F4-4493-AE56-BCD6F36F646A";
        sp.version = "1.0.0";
        sp.android_version = "1.0.0";
        sp.ios_version = "1.0.0";
        sp.pmp = "true";

        //var app = function(info_url) {
            sp.executeApp(infoUrl);
        //}
    }
}

function OpenLecPlayer( vodPath, vodTitle )
{
    console.log(vodPath);
    var pcMobile = divisionPcMobile();

    // a_strFilePath = "zian/data/soft/01_09/190905_107226_01_H.mp4";
    // a_strTitle = "1234",
    // a_lLecKey = "14591";
    // a_lCurriKey = "126979";
    // a_bHigh = "1";
    if( pcMobile == 'PC' )
    {
        window.open( "", "Player", "width=1200, height=680, scrollbars=0, menubar=0, resizable=0" );
        //gfn_winPop(980, 680, )

        $("#vodPath").val( vodPath );
        $("#vodTitle" ).val( vodTitle );
        //$("#a_bPlayer_High" ).val( a_bHigh );

        $("#id_frm_player").attr( "target", "Player" );
        $( "#id_frm_player").attr( "action", "/popup?page_gbn=starPlayer" );
        $( "#id_frm_player" ).submit();
    }
    else
    {

        // var sp				= StarPlayerApp;
        // sp.license			= "FBD4FB45-D5F4-4493-AE56-BCD6F36F646A";
        // sp.version			= "1.0.0";
        // sp.android_version	= "1.0.0";
        // sp.ios_version		= "1.0.0";
        // sp.pmp				= "true";
        //
        // sp.executeApp("popup?page_gbn=starPlayerMobile");
        // if( a_lLecKey.toString() == "0" && a_strFilePath.length > 0 )
        //     //sp.executeApp( GetCurrentSiteAddress() + "Player/AxisSmartStreamingSampleFile?a_strPlayer_FilePath=" + a_strFilePath + "&a_strPlayer_Title=" + a_strTitle );
        //     sp.executeApp("/popup?page_gbn=starPlayerMobile");
        // else
        //     //sp.executeApp( GetCurrentSiteAddress() + "Player/AxisSmartStreamingSample?a_lPlayer_LecKey=" + a_lLecKey + "&a_lPlayer_CurriKey=" + a_lCurriKey + "&a_bPlayer_High=" + a_bHigh );
        //     sp.executeApp("/popup?page_gbn=starPlayerMobile");


        var sp = StarPlayerApp;
        var infoUrl = "http://15.164.7.237/popup?page_gbn=starPlayerMobile&license=FBD4FB45-D5F4-4493-AE56-BCD6F36F646A&vodPath=" + vodPath + "&vodTitle=" + vodTitle;
        sp.license = "FBD4FB45-D5F4-4493-AE56-BCD6F36F646A";
        sp.version = "1.0.0";
        sp.android_version = "1.0.0";
        sp.ios_version = "1.0.0";
        sp.pmp = "true";

        //var app = function(info_url) {
        sp.executeApp(infoUrl);
        //}
    }
}

function goSampleM(movieUrl) {
    var sp = StarPlayerApp;
    sp.license			= "FD361CA3-5366-4F63-9971-F647AD34DAF4";
    sp.version			= "1.0.0";
    sp.android_version	= "1.0.0";
    sp.ios_version		= "1.0.0";
    sp.pmp				= "true";
    sp.debug = "false";
    //topmenu : 014, searchUserId : zian0071, searchSubjectCode : , searchSubjectCode : , leftMenuLType : T21, lecKType : D, searchLeccode: D2017104419
    sp.referer = "http://safe.algisa.com/lecture/movieLectureDetail.html?subNo=14&topMenu=" + $("#topMenu").val() + "&searchUserId=" + $("#searchUserId").val() + "&searchSubjectCode=" + $("#searchSubjectCode").val() + "&leftMenuLType=" + $("#leftMenuLType").val() + "&lecKType=" + $("#lecKType").val() + "&searchSubjectCode=" + $("#searchSubjectCode").val() + "&searchLeccode=" + $("#searchLeccode").val();
    var app = function(info_url) {
        sp.executeApp(info_url);
    }

    var url = "http://safe.algisa.com/movieLectureInfo/starPlayerM_2017_sample.html?movieUrl=" + movieUrl;
    app(url);
}