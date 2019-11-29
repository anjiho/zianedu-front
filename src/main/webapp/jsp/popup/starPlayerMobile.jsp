<%@page contentType="text/html; charset=UTF-8" session="true"%>
<%@ page import="com.zianedu.front.axis.security.*" %>

<%

    String data = "";
    data = "<?xml version='1.0' encoding='UTF-8' ?>";
    data += "<axis-app>";
    data += "<action-type>streaming</action-type>";
    data += "<user-id><![CDATA[ANONYMOUS]]></user-id>";
    data += 	"<content>";
    data += 		"<id><![CDATA[0001]]></id>";
    data += 		"<url><![CDATA[http://zianedu.star.skcdn.com/zian/korean/ahn/01_1911/191105_107422_01_H.mp4]]></url>";
    data += 		"<title><![CDATA[테스트]]></title>";
    data += 		"<limit-date><![CDATA[20201210120000]]></limit-date>";
    data +=       "<position>0</position>";
    data += 	"</content>";
    data += "</axis-app>";


    // FDDFA75E-B718-4DAF-BF57-A8D1FC0299B9는 발급받은 라이선스 코드

    StringEncrypter encrypter = new StringEncrypter("FBD4FB45-D5F4-4493-AE56-BCD6F36F646A", "starplayer");
    String encrypted_url = encrypter.encrypt(data);

    String dec =  encrypter.decrypt("Uz7aC7IKj4alIqrG1zyufnAb4OrGN1KPN8sIVtpFJv1Hr4zMOGFn4ZUySjXAVGws77rEPgVHK4oaE7Bb4C4NUARYXg9H2KnPzdmozwE3ufzF05vxZcKW1W5bdmKRzfaz8GjTdUbcUeeWLuVFk/vPrGDNNTaG0oq2p3Gwzk+wC3h4rxZG72VdEY4/VsSYXOj1Me3VMLZVN6GoA75V7InlOFaiWOwrFwtyGMqadXmO67L0ArNCqyQjDub3/vsl8gYdgWIS3TNDBBIQe+0YD71AuB2EopD3JdM5WsVv8VXofX2KdFEQ3Qn9LNL4X8Kh2/p+VhFKQZ/ky7maU3LzFOYPe5WvzYn/kUdsEpBTXOGwx/dlr5b0c8DxD323itD/EC9t0Ee/ukO4FXlxLxivmvRXenNYYPn+uFvKOb40+1McNGu/rOFGHJCZ3y2ZjlE2kxGsALVAp+YHZjCLFaZcSJASXpskITWV+mut8jEbr+p7XcwZUkEwMtaFkYfiSYzx6Y8oDRhNVPznL9AJ72YtLgB4Cod912dtU7dzNGGq3NC4nJByA5LL7WwRcxn0h4E7uxp6");

    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Pragma", "no-cache");
    response.setHeader("contentType", "text/html");

%>
<%= encrypted_url %>
