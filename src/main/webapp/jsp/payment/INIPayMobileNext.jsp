﻿<%@include file="/common/jsp/common.jsp" %>
<%@ page import="org.apache.http.impl.client.HttpClientBuilder" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.entity.StringEntity" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page import="com.zianedu.front.config.ConfigHolder" %>
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

	String resultPStatus = "";
	String resultPAuthDt = "";
	String resultPAuthNo = "";
	String resultPRmesg = "";
	String resultPRmesg2 = "";
	String resultPTid = "";
	String resultPFnCd1 = "";
	String resultPAmt = "";
	String resultPType = "";
	String resultPUName = "";
	String resultPMid = "";
	String resultPOid = "";
	String resultPMName = "";
	String resultPCardNum = "";
	String resultPCardIssuerCode = "";
	String resultPCardPurchaseCode = "";
	String resultPCardPrtcCode = "";
	String resultPCardInterest = "";
	String resultPCardCheckFlag = "";
	String resultPCardIssuerName = "";
	String resultPCardPurchaseName = "";
	String resultPFnNm = "";
	String resultPIspCardCode = "";
	String resultPCardApplprice = "";
	String applDate = "";
	String applTime = "";

	String resultPVactNum = "";	//입금할 가상계좌 번호
	String resultPVactDate = ""; //입금할 날짜
	String resultPVactTime = "";	//입금할 시간
	String resultPVactBankCode = "";	//입금할 은행
	String resultPVactName = "";	//입금할 상호명

	String bankName = "";


	if ("00".equals(pStatus)) {
		String resultJson = null;
		HttpClient client = HttpClientBuilder.create().build();
		String mid = ConfigHolder.getINIPayMid();

		try {
			HttpPost httpPost = new HttpPost(pReqUrl);
			StringEntity params = new StringEntity("P_TID=" + URLEncoder.encode(pTID, "UTF-8") + "&P_MID=" + mid);
			httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded");
			httpPost.setEntity(params);

			HttpResponse httpResponse = client.execute(httpPost);
			resultJson = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
			System.out.println("result >>" + resultJson);

			String makeUrl = "http://localhost/result?" + resultJson;
			URL parseUrl = new URL(makeUrl);
			Map<String, String> resultMap = Util.splitQuery(parseUrl);

			resultPStatus = resultMap.get("P_STATUS");
			resultPAuthDt = resultMap.get("P_AUTH_DT");
			resultPAuthNo = resultMap.get("P_AUTH_NO");
			resultPRmesg = resultMap.get("P_RMESG1");
			resultPRmesg2 = resultMap.get("P_RMESG2");
			resultPTid = resultMap.get("P_TID");
			resultPFnCd1 = resultMap.get("P_FN_CD1");
			resultPAmt = resultMap.get("P_AMT");
			resultPType = resultMap.get("P_TYPE");
			resultPUName = Util.encodeURIComponent(resultMap.get("P_UNAME"));
			resultPMid = resultMap.get("P_MID");
			resultPOid = resultMap.get("P_OID");
			resultPMName = resultMap.get("P_MNAME");
			resultPCardNum = Util.isNullValue(resultMap.get("P_CARD_NUM"), "");
			resultPCardIssuerCode = Util.isNullValue(resultMap.get("P_CARD_ISSUER_CODE"), "");
			resultPCardPurchaseCode = resultMap.get("P_CARD_PURCHASE_CODE");
			resultPCardPrtcCode = resultMap.get("P_CARD_PRTC_CODE");
			resultPCardInterest = Util.isNullValue(resultMap.get("P_CARD_INTEREST"), "");
			resultPCardCheckFlag = resultMap.get("P_CARD_CHECKFLAG");
			resultPCardIssuerName = resultMap.get("P_CARD_ISSUER_NAME");
			resultPCardPurchaseName = resultMap.get("P_CARD_PURCHASE_NAME");
			resultPFnNm = resultMap.get("P_FN_NM");
			resultPIspCardCode = resultMap.get("P_ISP_CARDCODE");
			resultPCardApplprice = Util.isNullValue(resultMap.get("P_CARD_APPLPRICE"), "");

			applDate =  Util.subStrStartEnd(resultPAuthDt, 0, 8);
			applTime = Util.subStrStartEnd(resultPAuthDt, 8, 14);

			if ("VBANK".equals(resultPType)) {
				resultPVactNum = Util.isNullValue(resultMap.get("P_VACT_NUM"), "");
				resultPVactDate = Util.isNullValue(resultMap.get("P_VACT_DATE"), "");
				resultPVactTime = Util.isNullValue(resultMap.get("P_VACT_TIME"), "");
				resultPVactBankCode = Util.isNullValue(resultMap.get("P_VACT_BANK_CODE"), "");
				resultPVactName = Util.isNullValue(resultMap.get("P_VACT_NAME"), "");

				if ("04".equals(resultPVactBankCode)) bankName = "국민은행";
				else if ("03".equals(resultPVactBankCode)) bankName = "기업은행";
				else if ("05".equals(resultPVactBankCode)) bankName = "하나은행(구외환)";
				else if ("06".equals(resultPVactBankCode)) bankName = "국민은행(구 주택)";
				else if ("07".equals(resultPVactBankCode)) bankName = "수협중항회";
				else if ("11".equals(resultPVactBankCode)) bankName = "농협";
				else if ("12".equals(resultPVactBankCode)) bankName = "단위농협";
				else if ("16".equals(resultPVactBankCode)) bankName = "축협중앙회";
				else if ("20".equals(resultPVactBankCode)) bankName = "우리은행";
				else if ("21".equals(resultPVactBankCode)) bankName = "신한은행(조흥은행)";
				else if ("23".equals(resultPVactBankCode)) bankName = "SC제일은행";
				else if ("25".equals(resultPVactBankCode)) bankName = "하나은행(서울은행)";
				else if ("26".equals(resultPVactBankCode)) bankName = "신한은행";
				else if ("27".equals(resultPVactBankCode)) bankName = "한국씨티은행(한미은행)";
				else if ("31".equals(resultPVactBankCode)) bankName = "대구은행";
				else if ("32".equals(resultPVactBankCode)) bankName = "부산은행";
				else if ("34".equals(resultPVactBankCode)) bankName = "광주은행";
				else if ("35".equals(resultPVactBankCode)) bankName = "제주은행";
				else if ("37".equals(resultPVactBankCode)) bankName = "전북은행";
				else if ("38".equals(resultPVactBankCode)) bankName = "강원은행";
				else if ("39".equals(resultPVactBankCode)) bankName = "경남은행";
				else if ("41".equals(resultPVactBankCode)) bankName = "비씨카드";
				else if ("53".equals(resultPVactBankCode)) bankName = "씨티은행";
				else if ("54".equals(resultPVactBankCode)) bankName = "홍콩상하이은행";
				else if ("71".equals(resultPVactBankCode)) bankName = "우체국";
				else if ("81".equals(resultPVactBankCode)) bankName = "하나은행";
				else if ("83".equals(resultPVactBankCode)) bankName = "평화은행";
				else if ("87".equals(resultPVactBankCode)) bankName = "신세계";
				else if ("88".equals(resultPVactBankCode)) bankName = "신한은행(조흥 통합)";
				else if ("97".equals(resultPVactBankCode)) bankName = "카카오 머니";
				else if ("98".equals(resultPVactBankCode)) bankName = "페이코(포인트 100%사용)";

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
<%--<%@include file="/common/jsp/common.jsp" %>--%>
<script>
	$(document).ready(function () {
		var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
		var userKey = sessionUserInfo.userKey;

		var pcMobile = divisionPcMobile();
		var isMobile = 0;
		if(pcMobile == "MOBILE") isMobile = 1;

		var savePayInfo = JSON.parse(sessionStorage.getItem('savePayInfo'));
		var discountPoint = 0;
		var point = 0;
		var deliveryPrice = 0;
		if(savePayInfo.discountPoint == null) discountPoint = 0;
		else discountPoint = savePayInfo.discountPoint;

		if(savePayInfo.point == null)  point = 0;
		else point = savePayInfo.point;

		if(savePayInfo.deliveryPrice == undefined || savePayInfo.deliveryPrice == null) deliveryPrice = 0;
		else deliveryPrice = savePayInfo.deliveryPrice;

		var saveInipayInfoData = {
			tid : '<%=resultPTid%>',
			resultcode : '<%=resultPStatus%>',
			resultmsg : '<%=resultPRmesg%>',
			paymethod : '<%=resultPType%>',
			moid : '<%=resultPOid%>',
			totprice : savePayInfo.pricePay,
			appldate : '<%=applDate%>',
			appltime : '<%=applTime%>',
			applnum : '<%=resultPAuthNo %>',//
			cardQuota : '<%=resultPRmesg2%>',//
			cardInterest : '<%=resultPCardInterest%>',//
			cardNum : '<%=resultPCardNum%>',//
			cardCode : '<%=resultPFnCd1%>',
			cardBankcode : '<%=resultPCardIssuerCode%>',//
			eventcode :  '',
			cardApplprice : '<%=resultPCardApplprice%>',//
			ocbPayprice : '',
			acctBankcode : '<%=resultPFnCd1 %>',
			vactNum : '<%=resultPVactNum%>',
			vactDate : '<%=resultPVactDate%>',
			vactTime : '<%=resultPVactTime%>',
			vactBankCode : '<%=resultPVactBankCode%>',
			vactName : '<%=bankName%>',
			resulterrorcode : '',
			isMobile : isMobile
		};
		var inipayInfoResult = saveInipayInfo(saveInipayInfoData);

		sessionStorage.setItem("saveInipayInfoData", JSON.stringify(saveInipayInfoData));

		var payStatus = 2;
		if('<%=resultPType%>' == 'VBANK') payStatus = 0;

		var resultData = JSON.parse(sessionStorage.getItem('resultData'));
		var orderGoodsList = sessionStorage.getItem('orderGoodsList');

		var payType = 0;
		if ('<%=resultPVactBankCode%>' != '') {
			payType = 19;
		}

		if('<%=resultPStatus%>' == '00') {
			if (inipayInfoResult.resultCode == 200) {
				var savePaymentInfoData = {
					jId: '<%=resultPOid%>',
					userKey: userKey,
					price: savePayInfo.price,
					pricePay: savePayInfo.pricePay,
					payType :payType,
					point: point,
					discountPoint: discountPoint,
					deliveryPrice: deliveryPrice,
					payStatus: payStatus,/* 무통장일때 기능 추가 */
					cardCode: '<%=resultPFnCd1%>',
					bank: '<%=bankName%>',
					bankAccount: '<%=resultPVactNum%>',
					depositUser: resultData.postName,
					deliveryName: resultData.postName,
					deliveryTelephone: resultData.allTel,
					deliveryTelephoneMobile: resultData.allPhone,
					deliveryZipcode: resultData.postCode,
					deliveryAddress: resultData.add1,
					deliveryAddressRoad: resultData.add1,
					deliveryAddressAdd: resultData.add2,
					payKey: inipayInfoResult.keyValue,
					isMobile: isMobile,
					orderGoodsList: orderGoodsList
				};
				savePaymentInfo(savePaymentInfoData);
			}
			alert("결제가 성공하였습니다.");
			//goPage("myPage", "orderResultMobile");
			location.href = "/myPage?page_gbn=orderResultMobile&name="+'<%=resultPUName%>';
		}else{
			alert("결제 오류가 발생하였습니다");
			goBack();
		}
	});
</script>

