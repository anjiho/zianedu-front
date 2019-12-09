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


	if ("00".equals(pStatus)) {
		String resultJson = null;
		HttpClient client = HttpClientBuilder.create().build();

		try {
			HttpPost httpPost = new HttpPost(pReqUrl);
			StringEntity params = new StringEntity("P_TID=" + URLEncoder.encode(pTID, "UTF-8") + "&P_MID=INIpayTest");
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
			resultPUName = resultMap.get("P_UNAME");
			resultPMid = resultMap.get("P_MID");
			resultPOid = resultMap.get("P_OID");
			resultPMName = resultMap.get("P_MNAME");
			resultPCardNum = resultMap.get("P_CARD_NUM");
			resultPCardIssuerCode = resultMap.get("P_CARD_ISSUER_CODE");
			resultPCardPurchaseCode = resultMap.get("P_CARD_PURCHASE_CODE");
			resultPCardPrtcCode = resultMap.get("P_CARD_PRTC_CODE");
			resultPCardInterest = resultMap.get("P_CARD_INTEREST");
			resultPCardCheckFlag = resultMap.get("P_CARD_CHECKFLAG");
			resultPCardIssuerName = resultMap.get("P_CARD_ISSUER_NAME");
			resultPCardPurchaseName = resultMap.get("P_CARD_PURCHASE_NAME");
			resultPFnNm = resultMap.get("P_FN_NM");
			resultPIspCardCode = resultMap.get("P_ISP_CARDCODE");
			resultPCardApplprice = resultMap.get("P_CARD_APPLPRICE");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

%>
<script src="/common/zian/js/kiplayer/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		alert('<%=resultPStatus%>');//00
		alert('<%=resultPCardApplprice%>');//

		var pcMobile = divisionPcMobile();
		var isMobile = 0;
		if(pcMobile == "MOBILE") isMobile = 1;

		var saveInipayInfoData = {
			tid : '<%=resultPTid%>',
			resultcode : '<%=resultCode%>',
			resultmsg : '<%=resultPRmesg%>',
			paymethod : '<%=resultPType%>',
			moid : '<%=resultPOid%>',
			totprice : savePayInfo.pricePay,
			appldate : '<%=resultPAuthDt%>',
			appltime : '<%=applTime%>',
			applnum : '<%=resultPAuthNo %>',
			cardQuota : '<%=resultPRmesg2%>',
			cardInterest : '<%=resultPCardInterest%>',
			cardNum : '<%=resultPCardNum%>',
			cardCode : '<%=resultPFnCd1%>',
			cardBankcode : '<%=resultPCardIssuerCode%>',
			eventcode :  '<%=eventCode%>',
			cardApplprice : '<%=resultPCardApplprice%>',
			ocbPayprice : '<%=ocbPayPrice%>',
			acctBankcode : '<%=resultPFnCd1 %>',
			resulterrorcode : '<%=resultErrorCode%>',
			isMobile : isMobile
		};
		var InipayInfoResult = saveInipayInfo(saveInipayInfoData);

		var payStatus = 2;
		if('<%=resultPType%>' == 'VBank') payStatus = 0;

		var resultData = JSON.parse(sessionStorage.getItem('resultData'));
		var orderGoodsList = sessionStorage.getItem('orderGoodsList');
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

		if('<%=resultPStatus%>' == '00') {
			if (InipayInfoResult.resultCode == 200) {
				var savePaymentInfoData = {
					jId: '<%=resultPOid%>',
					userKey: userKey,
					price: savePayInfo.price,
					pricePay: savePayInfo.pricePay,
					point: point,
					discountPoint: discountPoint,
					deliveryPrice: deliveryPrice,
					payStatus: payStatus,/* 무통장일때 기능 추가 */
					cardCode: '<%=resultPFnCd1%>',
					bank: '우리은행',/* 수정 필요 */
					bankAccount: '123-123-11111',/* 수정 필요 */
					depositUser: resultData.postName,
					deliveryName: resultData.postName,
					deliveryTelephone: resultData.allTel,
					deliveryTelephoneMobile: resultData.allPhone,
					deliveryZipcode: resultData.postCode,
					deliveryAddress: resultData.add1,
					deliveryAddressRoad: resultData.add1,
					deliveryAddressAdd: resultData.add2,
					payKey: InipayInfoResult.keyValue,
					isMobile: isMobile,
					orderGoodsList: orderGoodsList
				};
				var PaymentResult = savePaymentInfo(savePaymentInfoData);
			}
		}

	});
</script>

