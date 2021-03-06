<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.zianedu.front.axis.security.StringEncrypter" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page import="com.google.gson.JsonObject" %>
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
        //기기등록확인
        String splitStr[] = content_id.split("_");
        String jLecKey = splitStr[0];
        System.out.println("jLecKey >>" + jLecKey);
        String url = "http://52.79.40.214:9090/myPage/confirmDuplicateDevice/" + user_id + "?deviceType=1&deviceId=" + device_id + "&jLecKey=" + jLecKey
                        + "&osVersion=" + os_version.replaceAll("\\p{Z}","") + "&appVersion=" + app_version;

        String result = Util.httpGet(url);

        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        JsonObject jObj = element.getAsJsonObject();
        boolean bl = jObj.get("keyValue").getAsBoolean();

        if (bl == true) {
            sb.append("<axis-app>");
            sb.append("<error>0</error>");
            sb.append("<message></message>");
            sb.append("</axis-app>");
        } else {
            sb.append("<axis-app>");
            sb.append("<error>1</error>");
            sb.append("<push_id>1</push_id>");
            sb.append("<message>등록된 기기가 아닙니다.</message>");
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
        String splitStr[] = content_id.split("_");
        String jLecKey = splitStr[0];
        String curriKey = splitStr[1];

        System.out.println("play_time >> " + play_time);
        System.out.println("play_type >> " + play_type);
        System.out.println("jLecKey >> " + jLecKey);
        System.out.println("curriKey >> " + curriKey);
        System.out.println("currentPosition >> " + current_position);
        //동영상 플레이중 && 동영상 일시정지 일때 시간 업데이트 기능
        String url = "http://52.79.40.214:9090/myPage/injectVideoPlayTime";
        String paramStr = "jLecKey=" + jLecKey + "&curriKey=" + curriKey + "&deviceType=1";
        Util.httpPost(url, paramStr);

        sb.append("<axis-app>");
        sb.append("<error>0</error>");
        sb.append("<message></message>");
        sb.append("</axis-app>");
    }else{
        sb.append("<axis-app>");
        sb.append("<error>-1</error>");
        sb.append("<message>유효한 이벤트가 아닙니다.</message>");
        sb.append("</axis-app>");
    }
    out.print(sb.toString());

%>
