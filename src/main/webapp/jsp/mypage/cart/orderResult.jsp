<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%@ page import="com.inicis.std.util.ParseUtil"%>
<%@ page import="com.inicis.std.util.SignatureUtil"%>
<%@ page import="com.inicis.std.util.HttpUtil"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//    String cartNum = Util.isNullValue(request.getParameter("cartNum"), "");
//    String gKeys = Util.isNullValue(request.getParameter("gKeys"), "");
//    String goodsInfo = Util.isNullValue(request.getParameter("goodsInfo"), "");
%>
<%
    String tId = "";    //거래번호
    String resultCode = ""; //결과코드
    String resultMsg = "";  //결과 메세지
    String payMethod = "";  //결제방법
    String moId = "";   //상점주문번호
    int totPrice = 0;  //
    String applDate = "";    //승인일자
    String applTime = "";   //승인시간
    String applNum = "";    //승인번호
    String cardQuota = "";   //카드 할부기간
    String cardInterest = "";   //카드할부 여부
    String cardNum = "";    //신용카드 번호
    String cardCode = "";   //카드사 코드
    String cardBankCode = "";   //카드 발급사
    String eventCode = "";  //이벤트코드
    String cardApplPrice = "";  //카드승인금액
    String ocbPayPrice = ""; //OK캐시백 포인트 지불금액
    String acctBankCode = "";   //은행코드
    String resultErrorCode = "";    //에러결과코드

    String vactNum = "";
    String vactDate = "";
    String vactTime = "";
    String vactBankCode = "";
    String vactName = "";
    String bankName = "";
    String vactInputName = "";



    try{

        //#############################
        // 인증결과 파라미터 일괄 수신
        //#############################
        request.setCharacterEncoding("UTF-8");

        Map<String,String> paramMap = new Hashtable<String,String>();

        Enumeration elems = request.getParameterNames();

        String temp = "";

        while(elems.hasMoreElements())
        {
            temp = (String) elems.nextElement();
            paramMap.put(temp, request.getParameter(temp));
        }

        System.out.println("paramMap : "+ paramMap.toString());

        //#####################
        // 인증이 성공일 경우만
        //#####################


        if("0000".equals(paramMap.get("resultCode"))){

//            out.println("####인증성공/승인요청####");
//            out.println("<br/>");
            System.out.println("####인증성공/승인요청####");

            //############################################
            // 1.전문 필드 값 설정(***가맹점 개발수정***)
            //############################################

            String mid 		= paramMap.get("mid");						// 가맹점 ID 수신 받은 데이터로 설정
            String signKey	= "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";		// 가맹점에 제공된 키(이니라이트키) (가맹점 수정후 고정) !!!절대!! 전문 데이터로 설정금지
            String timestamp= SignatureUtil.getTimestamp();				// util에 의해서 자동생성
            String charset 	= "UTF-8";								    // 리턴형식[UTF-8,EUC-KR](가맹점 수정후 고정)
            String format 	= "JSON";								    // 리턴형식[XML,JSON,NVP](가맹점 수정후 고정)
            String authToken= paramMap.get("authToken");			    // 취소 요청 tid에 따라서 유동적(가맹점 수정후 고정)
            String authUrl	= paramMap.get("authUrl");				    // 승인요청 API url(수신 받은 값으로 설정, 임의 세팅 금지)
            String netCancel= paramMap.get("netCancelUrl");			 	// 망취소 API url(수신 받은 값으로 설정, 임의 세팅 금지)
            String ackUrl 	= paramMap.get("checkAckUrl");			    // 가맹점 내부 로직 처리후 최종 확인 API URL(수신 받은 값으로 설정, 임의 세팅 금지)
            String merchantData = paramMap.get("merchantData");			// 가맹점 관리데이터 수신

            //#####################
            // 2.signature 생성
            //#####################
            Map<String, String> signParam = new HashMap<String, String>();

            signParam.put("authToken",	authToken);		// 필수
            signParam.put("timestamp",	timestamp);		// 필수

            // signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
            String signature = SignatureUtil.makeSignature(signParam);

            String price = "";  // 가맹점에서 최종 결제 가격 표기 (필수입력아님)

            // 1. 가맹점에서 승인시 주문번호가 변경될 경우 (선택입력) 하위 연결.
            // String oid = "";

            //#####################
            // 3.API 요청 전문 생성
            //#####################
            Map<String, String> authMap = new Hashtable<String, String>();

            authMap.put("mid"			    ,mid);			  // 필수
            authMap.put("authToken"		,authToken);	// 필수
            authMap.put("signature"		,signature);	// 필수
            authMap.put("timestamp"		,timestamp);	// 필수
            authMap.put("charset"		  ,charset);		// default=UTF-8
            authMap.put("format"		  ,format);		  // default=XML
            //authMap.put("price" 		,price);		    // 가격위변조체크기능 (선택사용)

            System.out.println("##승인요청 API 요청##");

            HttpUtil httpUtil = new HttpUtil();

            try{
                //#####################
                // 4.API 통신 시작
                //#####################

                String authResultString = "";

                authResultString = httpUtil.processHTTP(authMap, authUrl);

                //############################################################
                //5.API 통신결과 처리(***가맹점 개발수정***)
                //############################################################
                //out.println("## 승인 API 결과 ##");

                String test = authResultString.replace(",", "&").replace(":", "=").replace("\"", "").replace(" ","").replace("\n", "").replace("}", "").replace("{", "");

                //out.println("<pre>"+authResultString.replaceAll("<", "&lt;").replaceAll(">", "&gt;")+"</pre>");

                Map<String, String> resultMap = new HashMap<String, String>();

                resultMap = ParseUtil.parseStringToMap(test); //문자열을 MAP형식으로 파싱

                System.out.println("resultMap == " + resultMap);
                //out.println("<pre>");
                //out.println("<table width='565' border='0' cellspacing='0' cellpadding='0'>");

                /*************************  결제보안 강화 2016-05-18 START ****************************/
                Map<String , String> secureMap = new HashMap<String, String>();
                secureMap.put("mid"			, mid);								//mid
                secureMap.put("tstamp"		, timestamp);						//timestemp
                secureMap.put("MOID"		, resultMap.get("MOID"));			//MOID
                secureMap.put("TotPrice"	, resultMap.get("TotPrice"));		//TotPrice

                // signature 데이터 생성
                String secureSignature = SignatureUtil.makeSignatureAuth(secureMap);
                /*************************  결제보안 강화 2016-05-18 END ****************************/

                if("0000".equals(resultMap.get("resultCode")) && secureSignature.equals(resultMap.get("authSignature")) ){	//결제보안 강화 2016-05-18
                    /*****************************************************************************
                     * 여기에 가맹점 내부 DB에 결제 결과를 반영하는 관련 프로그램 코드를 구현한다.

                     [중요!] 승인내용에 이상이 없음을 확인한 뒤 가맹점 DB에 해당건이 정상처리 되었음을 반영함
                     처리중 에러 발생시 망취소를 한다.
                     ******************************************************************************/

//                    out.println("<tr><th class='td01'><p>거래 성공 여부</p></th>");
//                    out.println("<td class='td02'><p>성공</p></td></tr>");

                    //결과정보
//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                    out.println("<tr><th class='td01'><p>결과 코드</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("resultCode")+"</p></td></tr>");
//                    out.println("<tr><th class='td01'><p>결과 내용</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("resultMsg")+"</p></td></tr>");

                } else {
//                    out.println("<tr><th class='td01'><p>거래 성공 여부</p></th>");
//                    out.println("<td class='td02'><p>실패</p></td></tr>");
//                    out.println("<tr><th class='td01'><p>결과 코드</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("resultCode")+"</p></td></tr>");
//                    out.println("<tr><th class='td01'><p>결과 내용</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("resultMsg")+"</p></td></tr>");

                    //결제보안키가 다른 경우
                    if (!secureSignature.equals(resultMap.get("authSignature")) && "0000".equals(resultMap.get("resultCode"))) {
                        //결과정보
//                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                        out.println("<tr><th class='td01'><p>결과 내용</p></th>");
//                        out.println("<td class='td02'><p>* 데이터 위변조 체크 실패</p></td></tr>");

                        //망취소
                        if ("0000".equals(resultMap.get("resultCode"))) {
                            throw new Exception("데이터 위변조 체크 실패");
                        }
                    }
                }

                tId = resultMap.get("tid");
                resultCode = resultMap.get("resultCode");
                resultMsg = resultMap.get("resultMsg");
                payMethod = resultMap.get("payMethod");
                moId = resultMap.get("MOID");
                totPrice = Integer.parseInt(resultMap.get("TotPrice"));
                applDate = resultMap.get("applDate");
                applTime = resultMap.get("applTime");
                applNum = resultMap.get("applTime");
                vactInputName = resultMap.get("VACT_InputName");


                //공통 부분만
//                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                out.println("<tr><th class='td01'><p>거래 번호</p></th>");
//                out.println("<td class='td02'><p>" +resultMap.get("tid")+"</p></td></tr>");
//                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                out.println("<tr><th class='td01'><p>결제방법(지불수단)</p></th>");
//                out.println("<td class='td02'><p>" +resultMap.get("payMethod")+"</p></td></tr>");
//                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                out.println("<tr><th class='td01'><p>결제완료금액</p></th>");
//                out.println("<td class='td02'><p>" +resultMap.get("TotPrice")+"원</p></td></tr>");
//                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                out.println("<tr><th class='td01'><p>주문 번호</p></th>");
//                out.println("<td class='td02'><p>" +resultMap.get("MOID")+"</p></td></tr>");
//                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                out.println("<tr><th class='td01'><p>승인날짜</p></th>");
//                out.println("<td class='td02'><p>" +resultMap.get("applDate")+"</p></td></tr>");
//                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                out.println("<tr><th class='td01'><p>승인시간</p></th>");
//                out.println("<td class='td02'><p>" +resultMap.get("applTime")+"</p></td></tr>");
//                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                if("VBank".equals(resultMap.get("payMethod"))){ //가상계좌

//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                    out.println("<tr><th class='td01'><p>입금 계좌번호</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("VACT_Num")+"</p></td></tr>");
//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                    out.println("<tr><th class='td01'><p>입금 은행코드</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("VACT_BankCode")+"</p></td></tr>");
//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                    out.println("<tr><th class='td01'><p>입금 은행명</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("vactBankName")+"</p></td></tr>");
//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                    out.println("<tr><th class='td01'><p>예금주 명</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("VACT_Name")+"</p></td></tr>");
//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                    out.println("<tr><th class='td01'><p>송금자 명</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("VACT_InputName")+"</p></td></tr>");
//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                    out.println("<tr><th class='td01'><p>송금 일자</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("VACT_Date")+"</p></td></tr>");
//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                    out.println("<tr><th class='td01'><p>송금 시간</p></th>");
//                    out.println("<td class='td02'><p>" +resultMap.get("VACT_Time")+"</p></td></tr>");

                    vactNum = resultMap.get("VACT_Num");
                    vactDate = resultMap.get("VACT_Date");
                    vactTime = resultMap.get("VACT_Time");
                    vactName = resultMap.get("VACT_Name");
                    acctBankCode = resultMap.get("VACT_BankCode");

                    if ("04".equals(acctBankCode)) bankName = "국민은행";
                    else if ("11".equals(acctBankCode)) bankName = "농협";


//                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("DirectBank".equals(resultMap.get("payMethod"))){ //실시간계좌이체


                }else if("iDirectBank".equals(resultMap.get("payMethod"))){ //실시간계좌이체


                }else if("HPP".equals(resultMap.get("payMethod"))){ //휴대폰


                }else if("DGCL".equals(resultMap.get("payMethod"))){//게임문화상품권


                    if(!"".equals(resultMap.get("GAMG_Num2"))){

                    }
                    if(!"".equals(resultMap.get("GAMG_Num3"))){

                    }
                    if(!"".equals(resultMap.get("GAMG_Num4"))){


                    }
                    if(!"".equals(resultMap.get("GAMG_Num5"))){

                    }
                    if(!"".equals(resultMap.get("GAMG_Num6"))){

                    }
                    //out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("OCBPoint".equals(resultMap.get("payMethod"))){ //오케이 캐쉬백


                }else if("GSPT".equals(resultMap.get("payMethod"))){ //GSPoint



                }else if("UPNT".equals(resultMap.get("payMethod"))){ //U-포인트



                }
                else if("KWPY".equals(resultMap.get("payMethod"))){ //뱅크월렛 카카오


                }else if("Culture".equals(resultMap.get("payMethod"))){//문화 상품권


                }else if("TEEN".equals(resultMap.get("payMethod"))){//틴캐시


                }else if("Bookcash".equals(resultMap.get("payMethod"))){//도서문화상품권



                }else if("PhoneBill".equals(resultMap.get("payMethod"))){//폰빌전화결제



                }else if("Bill".equals(resultMap.get("payMethod"))){//빌링결제

                }else if("Auth".equals(resultMap.get("payMethod"))){//빌링결제

                    if ("BILL_CARD".equalsIgnoreCase(resultMap.get("payMethodDetail"))) {

                    } else  if ("BILL_HPP".equalsIgnoreCase(resultMap.get("payMethodDetail"))) {


                    } else {
                        //
                    }
                }else if("HPMN".equals(resultMap.get("payMethod"))){//해피머니

                }else{//카드
                    int  quota=Integer.parseInt(resultMap.get("CARD_Quota"));
                    if(resultMap.get("EventCode")!=null){
//                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
//                        out.println("<tr><th class='td01'><p>이벤트 코드</p></th>");
//                        out.println("<td class='td02'><p>" +resultMap.get("EventCode")+"</p></td></tr>");
                    }
                    applNum = resultMap.get("applNum");
                    cardQuota = resultMap.get("CARD_Quota");
                    cardInterest = resultMap.get("CARD_Interest");
                    cardNum = resultMap.get("CARD_Num");
                    cardCode = resultMap.get("CARD_Code");
                    cardBankCode = resultMap.get("CARD_BankCode");
                    eventCode = resultMap.get("EventCode");
                    cardApplPrice = resultMap.get("TotPrice");


                    if("1".equals(resultMap.get("CARD_Interest")) || "1".equals(resultMap.get("EventCode"))){

                    }else if(quota > 0 && !"1".equals(resultMap.get("CARD_Interest"))){

                    }

                    if("1".equals(resultMap.get("point"))){

                    }else{

                    }

                    if(resultMap.get("OCB_Num")!=null && resultMap.get("OCB_Num") != ""){
                        ocbPayPrice = resultMap.get("OCB_PayPrice");

                    }
                    if(resultMap.get("GSPT_Num")!=null && resultMap.get("GSPT_Num") != ""){

                    }

                    if(resultMap.get("UNPT_CardNum")!=null && resultMap.get("UNPT_CardNum") != ""){

                    }
                }

                // 수신결과를 파싱후 resultCode가 "0000"이면 승인성공 이외 실패
                // 가맹점에서 스스로 파싱후 내부 DB 처리 후 화면에 결과 표시

                // payViewType을 popup으로 해서 결제를 하셨을 경우
                // 내부처리후 스크립트를 이용해 opener의 화면 전환처리를 하세요

                //throw new Exception("강제 Exception");
            } catch (Exception ex) {

                //####################################
                // 실패시 처리(***가맹점 개발수정***)
                //####################################

                //---- db 저장 실패시 등 예외처리----//
                System.out.println(ex);

                //#####################
                // 망취소 API
                //#####################
                String netcancelResultString = httpUtil.processHTTP(authMap, netCancel);	// 망취소 요청 API url(고정, 임의 세팅 금지)

                //out.println("## 망취소 API 결과 ##");

                // 취소 결과 확인
                //out.println("<p>"+netcancelResultString.replaceAll("<", "&lt;").replaceAll(">", "&gt;")+"</p>");
            }

        }else{

            //#############
            // 인증 실패시
            //#############
//            out.println("<br/>");
//            out.println("####인증실패####");
//
//            out.println("<p>"+paramMap.toString()+"</p>");

        }

    }catch(Exception e){

        System.out.println(e);
    }
%>
<script>
    $( document ).ready(function() {
        var resultCode = '<%=resultCode%>';
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var cartKeys = sessionStorage.getItem('cartNum');
        var gKeys = sessionStorage.getItem('gKeys');
        var onOffGbn = JSON.parse(sessionStorage.getItem('onOffGbn'));//빅모의고사 온라인,오프라인 구분값
        alert(onOffGbn);
        var goodsInfo = sessionStorage.getItem('goodsInfo');
        var resultData = JSON.parse(sessionStorage.getItem('resultData'));
        var userKey = sessionUserInfo.userKey;

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

        var pcMobile = divisionPcMobile();
        var isMobile = 0;
        if(pcMobile == "MOBILE") isMobile = 1;
            var saveInipayInfoData = {
                tid : '<%=tId%>',
                resultcode : '<%=resultCode%>',
                resultmsg : '<%=resultMsg%>',
                paymethod : '<%=payMethod%>',
                moid : '<%=moId %>',
                totprice : savePayInfo.pricePay,
                appldate : '<%=applDate %>',
                appltime : '<%=applTime %>',
                applnum : '<%=applNum %>',
                cardQuota : '<%=cardQuota %>',
                cardInterest : '<%=cardInterest %>',
                cardNum : '<%=cardNum %>',
                cardCode : '<%=cardCode %>',
                cardBankcode : '<%=cardBankCode %>',
                eventcode :  '<%=eventCode %>',
                cardApplprice : '<%=cardApplPrice %>',
                ocbPayprice : '<%=ocbPayPrice %>',
                acctBankcode : '<%=acctBankCode %>',
                vactNum : '<%=vactNum%>',
                vactDate : '<%=vactDate%>',
                vactTime : '<%=vactTime%>',
                vactBankCode : '<%=acctBankCode%>',
                vactName : '<%=vactName%>',
                resulterrorcode : '<%=resultErrorCode %>',
                isMobile : isMobile
            };
            var InipayInfoResult = saveInipayInfo(saveInipayInfoData);

            var payStatus = 2;
            if('<%=payMethod%>' == 'VBank') payStatus = 0;

            if('<%=resultCode%>' == '0000'){
                if(InipayInfoResult.resultCode == 200) {
                    var savePaymentInfoData = {
                        jId: '<%=moId %>',
                        userKey: userKey,
                        price: savePayInfo.price,
                        pricePay: savePayInfo.pricePay,
                        point: point,
                        discountPoint: discountPoint,
                        deliveryPrice: deliveryPrice,
                        payStatus: payStatus,/* 무통장일때 기능 추가 */
                        cardCode: '<%=cardCode%>',
                        bank: '<%=bankName%>',/* 수정 필요 */
                        bankAccount: '<%=vactNum%>',/* 수정 필요 */
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
                    savePaymentInfo(savePaymentInfoData);
                }
            }
        var payMethod = '<%=payMethod%>';
        var vactDate = '<%=vactDate%>';
        var vateDateStr = gfn_dateFormat(vactDate, 14, 'F');
        if(payMethod == 'VBank'){
            innerHTML("bankName", '<%=bankName%>');//입금 은행명
            innerHTML("vactNum", '<%=vactNum%>');//입금 은행명
            innerHTML("payMethodName ", '무통장입금');
            innerHTML("payStatusName ", '입금예정');//
            innerHTML("vactDate ", vateDateStr);//
            innerHTML("vactTime ", '<%=vactTime%>');//
            innerHTML("vackName ", '<%=vactInputName%>');//
            gfn_display("goReceipt", false);
        }else if(payMethod == 'VCard'){
            innerHTML("payMethodName ", '신용카드');
            innerHTML("payStatusName ", '결제완료');//
            gfn_display("line1", false);
            gfn_display("line2", false);
            gfn_display("line3", false);
            gfn_display("line4", false);
            if(pcMobile == "PC"){
                gfn_display("goReceipt", true);
            }
        }else if(payMethod == 'DirectBank'){
            innerHTML("payMethodName ", '실시간 계좌이체');
            innerHTML("payStatusName ", '결제완료');//
            gfn_display("line1", false);
            gfn_display("line2", false);
            gfn_display("line3", false);
            gfn_display("line4", false);
            if(pcMobile == "PC") {
                gfn_display("goReceipt", true);
            }
        }
        <%--var allProductPrice = "<%= request.getParameter("allProductPrice") %>";--%>
        <%--var postName = "<%= reque st.getParameter("postName") %>";--%>
        <%--var allTel = "<%= request.getParameter("allTel") %>";--%>
        <%--var allPhone = "<%= request.getParameter("allPhone") %>";--%>
        <%--var allEmail = "<%= request.getParameter("allEmail") %>";--%>
        <%--var postCode = "<%= request.getParameter("postCode1") %>";--%>
        <%--var add1 = "<%= request.getParameter("add1") %>";--%>
        <%--var add2 = "<%= request.getParameter("add2") %>";--%>
        <%--if('<%=cartNum%>' == "" && '<%=goodsInfo%>' == ""){//바로구매--%>
        <%--    var gKeys = toStrFileName(<%= request.getParameter("gKeys") %>);--%>
        <%--   // innerValue("gKeys", gKeys);--%>
        <%--    getOrderSheetInfoFromImmediately(userKey, gKeys);--%>
        <%--}else if('<%=gKeys%>' == "" && '<%=goodsInfo%>' == ""){--%>
        <%--    var cartKeys = toStrFileName(<%= request.getParameter("cartNum") %>);--%>
        <%--   // innerValue("cartNum", cartKeys);--%>
        <%--    getOrderSheetInfoFromPay(userKey, cartKeys);--%>
        <%--}else{//패키지--%>
        <%--    var goodsInfo ='<%= request.getParameter("goodsInfo") %>';--%>
        <%--   // innerValue("goodsInfo", goodsInfo);--%>
        <%--    getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, goodsInfo, 1);--%>
        <%--}--%>
        if(cartKeys == "" && goodsInfo == ""){//바로구매
            //var gKeys = toStrFileName(gKeys);
            getOrderSheetInfoFromImmediately(userKey, gKeys);
        }else if(gKeys == "" && goodsInfo == ""){
            //var cartKeys = toStrFileName(cartNum);
            getOrderSheetInfoFromPay(userKey, cartKeys);
        }else{//패키지
            //var goodsInfo = goodsInfo;
            getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, goodsInfo, 1);
        }

        innerValue("allProductPrice", resultData.allProductPrice);
        innerHTML("allPrice", format(resultData.allProductPrice));
        innerHTML("orderName1", resultData.postName);
        innerHTML("telephone1", resultData.allTel);
        innerHTML("telephoneMobile1", resultData.allPhone);
        innerHTML("email1", resultData.allEmail);
        innerHTML("zipcode1", resultData.postCode);
        innerHTML("address1", resultData.add1);
        innerHTML("address2", resultData.add2);
    });
    
    function goReceiptPopup() {
        var url = "https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid="+ '<%=tId%>' +"&noMethod=1";
        gfn_winPop(600, 600, url);
    }
</script>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <input type="hidden" id="allProductPrice" name="allProductPrice">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->
        <div id="container">
            <div class="inner">
                <!--서브 컨텐츠-->

                <%@include file="/common/jsp/myPageHeader.jsp" %>
                <div class="Mypage">
                    <ul class="statusBar">
                        <li><label>01.<b>장바구니</b></label></li>
                        <li><label>02.<b>주문서작성</b></label></li>
                        <li><label>03.<b>결제하기</b></label></li>
                        <li class="active last"><label>04.<b>주문완료</b></label></li>
                    </ul>
                    <!--cart -->
                    <div class="cart">
                        <p class="pay_comtitle">상품을 <span class="text_blue">구매</span>해주셔서 감사합니다.
                            <span class="subtitle"><span class="text_blue">[내 강의실-수강중인강좌]</span>에서 바로 수강하실 수 있습니다.</span>
                        </p>
                        <div class="tbd_03 mgb20">
                            <p class="title"><span class="text_blue">구매상품</span>정보</p>
                            <table>
                                <colgroup>
                                    <col width="100px">
                                    <col>
                                    <col width="150px">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>판매가</th>
                                </tr>
                                </thead>
                                <tbody id="dataList"></tbody>
                            </table>
                        </div>
                        <div class="tbd_03 tbd_05 mgb60">
                            <p class="title"><span class="text_blue">주문자</span>정보확인</p>
                            <table>
                                <colgroup>
                                    <col width="100px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>주문자</th>
                                    <td id="orderName"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td id="telephone"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td id="telephoneMobile"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td id="email"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><span class="taxt_blue">[<span id="zipcode"></span>]</span><span id="address"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tbd_03 tbd_05 mgb60" id="deliveryInfo">
                            <p class="title"><span class="text_blue">배송지</span>정보확인</p>
                            <table>
                                <colgroup>
                                    <col width="100px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>주문자</th>
                                    <td id="orderName1"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td id="telephone1"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td id="telephoneMobile1"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td id="email1"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><span class="taxt_blue">[<span id="zipcode1"></span>]</span> <span id="address1"></span> <br><span id="address2"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="pay_com">
                            <p class="title"><span class="text_blue">결제</span>정보</p>
                            <div class="left">
                                <ul>
                                    <li><span class="tit">결제방법</span><span id="payMethodName"></span></li>
                                    <li id="line1"><span class="tit">입금은행</span><span id="bankName"></span></li>
                                    <li id="line2"><span class="tit">계좌번호</span><span id="vactNum"></span></li>
                                    <li id="line3"><span class="tit">입금자명</span><span id="vackName"></span></li>
                                    <li id="line4"><span class="tit">입금예정일</span><span id="vactDate"></span></li>
                                    <li ><span class="tit">결제상태</span><span id="payStatusName"></span>
                                    <input type="button" onclick="goReceiptPopup();" value="영수증출력" id="goReceipt">
                                    </li>
                                </ul>
                            </div>
                            <div class="right">
                                <li class="pay-sum">
                                    <span class="txt1">총 주문금액</span>
                                    <span class="txt2"><b id="allPrice"></b>원</span>
                                </li>
                            </div>
                        </div>
                        <!--버튼 -->
                        <div class="btn_area">
                            <div class="center">
                                <a href="javascript:goMain();" class="blue">메인으로</a>
                            </div>
                        </div>
                    </div>
                    <!--//cart -->
                </div>

                <!--//서브 컨텐츠-->
            </div>
        </div>
        <!--//본문-->
        <%@include file="/common/jsp/footer.jsp" %>
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <%@include file="/common/jsp/footerBanner.jsp" %>
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>