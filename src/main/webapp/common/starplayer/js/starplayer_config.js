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

function OpenSamplePlayer( a_strFilePath, a_strTitle, a_lLecKey, a_lCurriKey, a_bHigh )
{
    var pcMobile = divisionPcMobile();

    a_strFilePath = "zian/data/soft/01_09/190905_107226_01_H.mp4";
    a_strTitle = "1234",
    a_lLecKey = "14591";
    a_lCurriKey = "126979";
    a_bHigh = "1";
    if( pcMobile == 'pc' )
    {
            window.open( "", "Player", "width=1000, height=680, scrollbars=0, menubar=0, resizable=0" );
            //gfn_winPop(980, 680, )

            // $("#a_strPlayer_FilePath").val( a_strFilePath );
            // $("#a_strPlayer_Title" ).val( a_strTitle );
            // $("#a_bPlayer_High" ).val( a_bHigh );

            $("#id_frm_player").attr( "target", "Player" );
            $( "#id_frm_player").attr( "action", "/popup?page_gbn=starPlayer" );
            $( "#id_frm_player" ).submit();
    }
    else
    {
        var sp				= StarPlayerApp;
        sp.license			= "FD361CA3-5366-4F63-9971-F647AD34DAF4";
        sp.version			= "1.0.0";
        sp.android_version	= "1.0.0";
        sp.ios_version		= "1.0.0";
        sp.pmp				= "true";

        if( a_lLecKey.toString() == "0" && a_strFilePath.length > 0 )
            sp.executeApp( GetCurrentSiteAddress() + "Player/AxisSmartStreamingSampleFile?a_strPlayer_FilePath=" + a_strFilePath + "&a_strPlayer_Title=" + a_strTitle );
        else
            sp.executeApp( GetCurrentSiteAddress() + "Player/AxisSmartStreamingSample?a_lPlayer_LecKey=" + a_lLecKey + "&a_lPlayer_CurriKey=" + a_lCurriKey + "&a_bPlayer_High=" + a_bHigh );
    }
}