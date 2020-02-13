<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.zianedu.front.axis.security.StringEncrypter" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="com.google.gson.JsonParser" %>
<%@ page import="com.google.gson.JsonElement" %>
<%
    StringEncrypter encrypter = new StringEncrypter("FDDFA75E-B718-4DAF-BF57-A8D1FC0299B9", "starplayer");

    String evt = Util.isNullValue(request.getParameter("event"), "");
    String device_id = Util.isNullValue(request.getParameter("device_id"), "");
    String os_version = Util.isNullValue(request.getParameter("os_version"), "");
    String app_version = Util.isNullValue(request.getParameter("app_version"), "");
    String state = Util.isNullValue(request.getParameter("state"), "");
    String date = Util.isNullValue(request.getParameter("date"), "");
    String content_id = Util.isNullValue(request.getParameter("content_id"), "");
    //String content_url = encrypter.decrypt(Util.isNullValue(request.getParameter("content_url"), ""));
    String play_type = Util.isNullValue(request.getParameter("play_type"), "");
    String user_id = Util.isNullValue(request.getParameter("user_id"), "");
    String play_time = Util.isNullValue(request.getParameter("play_time"), "");
    String current_position = Util.isNullValue(request.getParameter("current_position"), "");

    System.out.println("evt >> " + evt);
    System.out.println("device_id >> " + device_id);
    System.out.println("os_version >>" + os_version);
    System.out.println("app_version >>" + app_version);
    System.out.println("content_id >>" + content_id);
    System.out.println("user_id >>" + user_id);
    //System.out.println("play_time >>" + play_time);
%>
<%
    response.addHeader("Cache-Control", "no-cache");
    response.setContentType("text/html");

    StringBuffer data = new StringBuffer();
    StringBuffer sb = new StringBuffer();


    //CurriContentsAction curriContentsAction = new CurriContentsAction(); // DB에 저장하는 함수 (고객사마다 DB, LMS 구성이 다르므로 각 고객사에서 구성해야 합니다.)

    sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");

    if(evt.equals("begin_app")){
        //System.out.print("begin_app");
        sb.append("<axis-app>");
        sb.append("<error>0</error>");
        sb.append("<message></message>");
        sb.append("</axis-app>");
    }else if(evt.equals("begin_content")){
        //System.out.println("begin_content");		// begin_content 이벤트 로그가 정상적으로 넘어오는지 로그를 찍어봄
        //System.out.println("user_id=="+user_id); // user_id 로그가 정상적으로 넘어오는지 로그를 찍어봄
        //System.out.println("content_id=="+content_id); // content_id 로그가 정상적으로 넘어오는지 로그를 찍어봄
        //curriContentsAction.mobileStarPlayerBookMarkStart(user_id,content_id,play_time); // 전달받은 로그를 DB에 저장함

        String splitStr[] = content_id.split("_");
        String jLecKey = splitStr[0];
        System.out.println("jlecKey >>" + jLecKey);


        String url = "http://52.79.40.214:9090/myPage/confirmDuplicateDevice/" + user_id + "?deviceType=1&deviceId=" + device_id + "&jLecKey=" + jLecKey
                + "&osVersion=" + os_version.replaceAll("\\p{Z}","") + "&appVersion=" + app_version;
        URL obj = new URL(url);
        System.out.println("url >>" + url);
        HttpURLConnection conn = (HttpURLConnection) obj.openConnection();

        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        conn.setRequestMethod("GET");


        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

        String inputLine;
        StringBuffer response2 = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response2.append(inputLine);
        }
        in.close();

        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(response2.toString());
        JsonObject jObj = element.getAsJsonObject();
        boolean bl = (Boolean)jObj.get("keyValue").getAsBoolean();
        System.out.println("bl >>" + bl);
        if (bl == true) {
            sb.append("<axis-app>");
            sb.append("<error>0</error>");
            sb.append("<message></message>");
            sb.append("</axis-app>");
        } else {
            sb.append("<axis-app>");
            sb.append("<error>1</error>");
            sb.append("<push_id>1</push_id>");
            sb.append("<message>해당 아이디로 중복된 기기가 있습니다. 관리자에 문의하세요</message>");
            sb.append("<type>notice</type>");
            sb.append("</axis-app>");
        }
    }else if(evt.equals("end_content")){
        //System.out.println("end_content");
        //System.out.println("user_id=="+user_id);
        //System.out.println("content_id=="+content_id);
        //System.out.println("play_time=="+play_time);
        //curriContentsAction.mobileStarPlayerBookMarkLog(user_id,content_id,play_time);
        sb.append("<axis-app>");
        sb.append("<error>0</error>");
        sb.append("<message></message>");
        sb.append("</axis-app>");
    }else if(evt.equals("download_begin_content")){
        sb.append("<axis-app>");
        sb.append("<error>0</error>");
        sb.append("<message></message>");
        sb.append("</axis-app>");
    }else if(evt.equals("download_content")){
        sb.append("<axis-app>");
        sb.append("<error>0</error>");
        sb.append("<message></message>");
        sb.append("</axis-app>");
    }else if(evt.equals("delete_content")){
        sb.append("<axis-app>");
        sb.append("<error>0</error>");
        sb.append("<message></message>");
        sb.append("</axis-app>");
    }else if(evt.equals("register_device_id")){
        sb.append("<axis-app>");
        sb.append("<error>0</error>");
        sb.append("<message></message>");
        sb.append("</axis-app>");
    }else if(evt.equals("unregister_device_id")){
        sb.append("<axis-app>");
        sb.append("<error>0</error>");
        sb.append("<message></message>");
        sb.append("</axis-app>");
    } else if(evt.equals("playing_content")) {
        //TODO 동영상 플레이중일때 시간 업데이트 기능 개발하기
    }else{
        sb.append("<axis-app>");
        sb.append("<error>-1</error>");
        sb.append("<message>유효한 이벤트가 아닙니다.</message>");
        sb.append("</axis-app>");
    }
    out.print(sb.toString());

%>
