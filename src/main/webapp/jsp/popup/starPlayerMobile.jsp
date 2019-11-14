<%@page contentType="text/html; charset=UTF-8" session="true"%>
<%@ page import="com.zianedu.front.axis.security.*" %>

<%

    String data = "";
    data = "<?xml version='1.0' encoding='UTF-8' ?>";
    data += "<axis-app>";
    data += "<action-type>streaming</action-type>";
    data += "<user-id><![CDATA[ANONYMOUS]]</user-id>";
    data += 	"<content>";
    data += 		"<id></id>";
    data += 		"<url><![CDATA[http://algisa.nptechnology.com:8000/file/sample.mp4]]></url>";
    data += 		"<title><![CDATA[맛보기]]></title>";
    data +=       "<position>0</position>";
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
