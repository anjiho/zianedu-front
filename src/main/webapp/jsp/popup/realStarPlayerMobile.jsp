<%@page contentType="text/html; charset=UTF-8" session="true"%>
<%@ page import="com.zianedu.front.axis.security.*" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%
    String vodPath = request.getParameter("vodPath");
    String vodTitle = Util.isNullValue(request.getParameter("vodTitle"), "");
    String userKey = Util.isNullValue(request.getParameter("userKey"), "0");
    String jLecKey = Util.isNullValue(request.getParameter("jLecKey"), "0");
    String curriKey = Util.isNullValue(request.getParameter("curriKey"), "0");
    String newVodTitle = new String(vodTitle.getBytes("ISO-8859-1"), "UTF-8");
%>
<%
    String data = "";
    data = "<?xml version='1.0' encoding='UTF-8' ?>";
    data += "<axis-app>";
    data += "<action-type>streaming</action-type>";
    data += "<user-id><![CDATA[" + userKey + "]]></user-id>";
    data += 	"<content>";
    data += 		"<id><![CDATA[" + jLecKey +"_" + curriKey + "]]></id>";
    data += 		"<url><![CDATA[" + vodPath + "]]></url>";
    data += 		"<title><![CDATA[" + newVodTitle + "]]></title>";
    data += 		"<limit-date><![CDATA[20201210120000]]></limit-date>";
    data +=       "<position>0</position>";
    data += 	"</content>";
    data += "</axis-app>";


    // FDDFA75E-B718-4DAF-BF57-A8D1FC0299B9는 발급받은 라이선스 코드
    StringEncrypter encrypter = new StringEncrypter("FBD4FB45-D5F4-4493-AE56-BCD6F36F646A", "starplayer");
    String encrypted_url = encrypter.encrypt(data);

    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Pragma", "no-cache");
    response.setHeader("contentType", "text/html");

%>
<%= encrypted_url %>
