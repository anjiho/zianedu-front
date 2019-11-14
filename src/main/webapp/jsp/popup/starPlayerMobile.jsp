<%@page contentType="text/html; charset=UTF-8" session="true"%>
<%@ page import="com.zianedu.front.axis.security.*" %>

<%

    String data = "";
    data = "<?xml version='1.0' encoding='UTF-8' ?>";
    data += "<axis-app>";
    data += "<action-type>streaming</action-type>";
    data += "<user-id><![CDATA[ANONYMOUS]]></user-id>";
    data += "<folders>";
    data += "<folder id='1' name='영어' thumbnail='http://domain/xxxx.png' />";
    data += "<folder id='2' name='기초' thumbnail='http://domain/xxxx.png' />";
    data += "</folders>";
    data += 	"<content>";
    data += 		"<id><![CDATA[0001]]></id>";
    data += 		"<url><![CDATA[http://m.starplayer.net/axsample/vod/480x320.mp4]]></url>";
    data += 		"<title><![CDATA[기초영어-01]]></title>";
    data += 		"<category><![CDATA[테스트/다운로드]]></category>";
    data += 		"<limit-date><![CDATA[20131210120000]]></limit-date>";
    data += 	"</content>";
    data += "</axis-app>";


    // FDDFA75E-B718-4DAF-BF57-A8D1FC0299B9는 발급받은 라이선스 코드

    StringEncrypter encrypter = new StringEncrypter("FD361CA3-5366-4F63-9971-F647AD34DAF4", "starplayer");
    String encrypted_url = encrypter.encrypt(data);

    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Pragma", "no-cache");
    response.setHeader("contentType", "text/html");

%>
<%= encrypted_url %>
