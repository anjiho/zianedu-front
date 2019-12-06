<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pStatus = request.getParameter("P_STATUS");
	String pRmesg1 = request.getParameter("P_RMESG1");
	String pTID = request.getParameter("P_TID");
	String pReqUrl = request.getParameter("P_REQ_URL");
	String pNoti = request.getParameter("P_NOTI");
	String pAMT = request.getParameter("P_AMT");

	System.out.println("P_STATUS >> " + pStatus);
	System.out.println("P_RMESG1 >> " + pRmesg1);
	System.out.println("P_TID >> " + pTID);
	System.out.println("P_REQ_URL >> " + pReqUrl);
	System.out.println("P_NOTI >> " + pNoti);
	System.out.println("P_AMT >> " + pAMT);


%>

