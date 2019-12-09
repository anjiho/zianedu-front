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
<script src="/common/zian/js/kiplayer/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		var P_TID = '<%=pTID%>';
		var P_MID = "INIpayTest";
		//var P_REQ_URL = P_TID + P_MID;
		var data = {
            P_TID : P_TID,
            P_MID : P_MID
        };
        $.ajax({
            type: "POST",
            url: 'https://ksmobile.inicis.com/smart/payReq.ini',
            async: true,
            data : data,
            success: function (msg) {
                console.log(msg);
                innerHTML("")
            }
        });
	});
</script>

<div id="test">

</div>
