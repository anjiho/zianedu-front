$(document).ready(function() {
    var pcMobile = divisionPcMobile();
    if (pcMobile == "PC") {
        // gfn_display("pcBtn", true);
        // gfn_display("pcPaymentMethodUl", true);
        gfn_display("mobilePaymentMethodUl", true);
        gfn_display("mobileBtn", true);
    } else {
        gfn_display("mobilePaymentMethodUl", true);
        gfn_display("mobileBtn", true);
    }
});

addEventListener("load", function()
{
    setTimeout(updateLayout, 0);
}, false);

var currentWidth = 0;

function updateLayout()
{
    if (window.innerWidth != currentWidth)
    {
        currentWidth = window.innerWidth;

        var orient = currentWidth == 320 ? "profile" : "landscape";
        document.body.setAttribute("orient", orient);
        setTimeout(function()
        {
            window.scrollTo(0, 1);
        }, 100);
    }
}

setInterval(updateLayout, 400);

window.name = "BTPG_CLIENT";

var width = 1000;
var height = 1000;
var xpos = (screen.width - width) / 2;
var ypos = (screen.width - height) / 2;
var position = "top=" + ypos + ",left=" + xpos;
var features = position + ", width=320, height=440";
var date = new Date();
var result = getJId();
if(result.resultCode == 200){
    var date_str = result.keyValue;
}

if( date_str.length != 16 )
{
    for( i = date_str.length ; i < 16 ; i++ )
    {
        date_str = date_str+"0";
    }
}
function setOid()
{
    document.ini.P_OID.value = ""+date_str;
}

function on_web()
{
    var order_form = document.ini;
    var paymethod = get_radio_value("ckbox2");
    if(paymethod == 'wcard'){
        innerValue("P_RESERVED", "twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N");
    }else{
        innerValue("P_RESERVED", "twotrs_bank=Y&apprun_check=Y");
    }
    var wallet = window.open("", "BTPG_WALLET", features);

    if (wallet == null)
    {
        if ((webbrowser.indexOf("Windows NT 5.1")!=-1) && (webbrowser.indexOf("SV1")!=-1))
        {    // Windows XP Service Pack 2
            alert("팝업이 차단되었습니다. 브라우저의 상단 노란색 [알림 표시줄]을 클릭하신 후 팝업창 허용을 선택하여 주세요.");
        }
        else
        {
            alert("팝업이 차단되었습니다.");
        }
        return false;
    }

    order_form.target = "BTPG_WALLET";
    order_form.action = "https://mobile.inicis.com/smart/" + paymethod + "/";

    order_form.submit();
}

function onSubmit()
{
    var order_form = document.ini;
    var inipaymobile_type = order_form.inipaymobile_type.value;
    if( inipaymobile_type == "web" )
        return on_web();
}
