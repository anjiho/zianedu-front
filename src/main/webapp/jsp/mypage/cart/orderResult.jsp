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

            out.println("####인증성공/승인요청####");
            out.println("<br/>");
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
                out.println("## 승인 API 결과 ##");

                String test = authResultString.replace(",", "&").replace(":", "=").replace("\"", "").replace(" ","").replace("\n", "").replace("}", "").replace("{", "");

                //out.println("<pre>"+authResultString.replaceAll("<", "&lt;").replaceAll(">", "&gt;")+"</pre>");

                Map<String, String> resultMap = new HashMap<String, String>();

                resultMap = ParseUtil.parseStringToMap(test); //문자열을 MAP형식으로 파싱

                System.out.println("resultMap == " + resultMap);
                out.println("<pre>");
                out.println("<table width='565' border='0' cellspacing='0' cellpadding='0'>");

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

                    out.println("<tr><th class='td01'><p>거래 성공 여부</p></th>");
                    out.println("<td class='td02'><p>성공</p></td></tr>");

                    //결과정보
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>결과 코드</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("resultCode")+"</p></td></tr>");
                    out.println("<tr><th class='td01'><p>결과 내용</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("resultMsg")+"</p></td></tr>");

                } else {
                    out.println("<tr><th class='td01'><p>거래 성공 여부</p></th>");
                    out.println("<td class='td02'><p>실패</p></td></tr>");
                    out.println("<tr><th class='td01'><p>결과 코드</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("resultCode")+"</p></td></tr>");
                    out.println("<tr><th class='td01'><p>결과 내용</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("resultMsg")+"</p></td></tr>");

                    //결제보안키가 다른 경우
                    if (!secureSignature.equals(resultMap.get("authSignature")) && "0000".equals(resultMap.get("resultCode"))) {
                        //결과정보
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>결과 내용</p></th>");
                        out.println("<td class='td02'><p>* 데이터 위변조 체크 실패</p></td></tr>");

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


                //공통 부분만
                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                out.println("<tr><th class='td01'><p>거래 번호</p></th>");
                out.println("<td class='td02'><p>" +resultMap.get("tid")+"</p></td></tr>");
                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                out.println("<tr><th class='td01'><p>결제방법(지불수단)</p></th>");
                out.println("<td class='td02'><p>" +resultMap.get("payMethod")+"</p></td></tr>");
                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                out.println("<tr><th class='td01'><p>결제완료금액</p></th>");
                out.println("<td class='td02'><p>" +resultMap.get("TotPrice")+"원</p></td></tr>");
                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                out.println("<tr><th class='td01'><p>주문 번호</p></th>");
                out.println("<td class='td02'><p>" +resultMap.get("MOID")+"</p></td></tr>");
                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                out.println("<tr><th class='td01'><p>승인날짜</p></th>");
                out.println("<td class='td02'><p>" +resultMap.get("applDate")+"</p></td></tr>");
                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                out.println("<tr><th class='td01'><p>승인시간</p></th>");
                out.println("<td class='td02'><p>" +resultMap.get("applTime")+"</p></td></tr>");
                out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                if("VBank".equals(resultMap.get("payMethod"))){ //가상계좌

                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>입금 계좌번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("VACT_Num")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>입금 은행코드</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("VACT_BankCode")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>입금 은행명</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("vactBankName")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>예금주 명</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("VACT_Name")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>송금자 명</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("VACT_InputName")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>송금 일자</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("VACT_Date")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>송금 시간</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("VACT_Time")+"</p></td></tr>");

                    acctBankCode = resultMap.get("VACT_BankCode");

                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("DirectBank".equals(resultMap.get("payMethod"))){ //실시간계좌이체
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>은행코드</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("ACCT_BankCode")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>현금영수증 발급결과코드</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CSHR_ResultCode")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>현금영수증 발급구분코드</p> <font color=red><b>(0 - 소득공제용, 1 - 지출증빙용)</b></font></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CSHR_Type")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("iDirectBank".equals(resultMap.get("payMethod"))){ //실시간계좌이체
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>은행코드</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("ACCT_BankCode")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>현금영수증 발급결과코드</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CSHRResultCode")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>현금영수증 발급구분코드</p> <font color=red><b>(0 - 소득공제용, 1 - 지출증빙용)</b></font></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CSHR_Type")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("HPP".equals(resultMap.get("payMethod"))){ //휴대폰
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>통신사</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("HPP_Corp")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>결제장치</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("payDevice")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>휴대폰번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("HPP_Num")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("DGCL".equals(resultMap.get("payMethod"))){//게임문화상품권
                    String sum="0",sum2="0",sum3="0",sum4="0",sum5="0",sum6="0";
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>게임문화상품권승인금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("GAMG_ApplPrice")+"원</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>사용한 카드수</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("GAMG_Cnt")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>사용한 카드번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("GAMG_Num1")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>카드잔액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("GAMG_Price1")+"원</p></td></tr>");

                    if(!"".equals(resultMap.get("GAMG_Num2"))){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>사용한 카드번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Num2")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>카드잔액</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Price2")+"원</p></td></tr>");
                    }
                    if(!"".equals(resultMap.get("GAMG_Num3"))){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>사용한 카드번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Num3")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>카드잔액</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Price3")+"원</p></td></tr>");
                    }
                    if(!"".equals(resultMap.get("GAMG_Num4"))){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>사용한 카드번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Num4")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>카드잔액</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Price4")+"원</p></td></tr>");
                    }
                    if(!"".equals(resultMap.get("GAMG_Num5"))){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>사용한 카드번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Num5")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>카드잔액</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Price5")+"원</p></td></tr>");
                    }
                    if(!"".equals(resultMap.get("GAMG_Num6"))){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>사용한 카드번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Num6")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>카드잔액</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GAMG_Price6")+"원</p></td></tr>");
                    }
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("OCBPoint".equals(resultMap.get("payMethod"))){ //오케이 캐쉬백

                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>지불구분</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("PayOption")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
// 					out.println("<tr><th class='td01'><p>결제완료금액</p></th>");
// 					out.println("<td class='td02'><p>" +resultMap.get("applPrice")+"원</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>OCB 카드번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("OCB_Num")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>적립 승인번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("OCB_SaveApplNum")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>사용 승인번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("OCB_PayApplNum")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>OCB 지불 금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("OCB_PayPrice")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("GSPT".equals(resultMap.get("payMethod"))){ //GSPoint

                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>지불구분</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("PayOption")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>GS 포인트 승인금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("GSPT_ApplPrice")+"원</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>GS 포인트 적립금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("GSPT_SavePrice")+"원</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>GS 포인트 지불금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("GSPT_PayPrice")+"원</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("UPNT".equals(resultMap.get("payMethod"))){ //U-포인트

                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>U포인트 카드번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("UPoint_Num")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>가용포인트</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("UPoint_usablePoint")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>포인트지불금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("UPoint_ApplPrice")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }
                else if("KWPY".equals(resultMap.get("payMethod"))){ //뱅크월렛 카카오
                    out.println("<tr><th class='td01'><p>결제방법</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("payMethod")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>결과 코드</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("resultCode")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>결과 내용</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("resultMsg")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>거래 번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("tid")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>주문 번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("MOID")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>결제완료금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("price")+"원</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>사용일자</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("applDate")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>사용시간</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("applTime")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("Culture".equals(resultMap.get("payMethod"))){//문화 상품권
                    out.println("<tr><th class='td01'><p>컬처랜드 아이디</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CULT_UserID")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");

                }else if("TEEN".equals(resultMap.get("payMethod"))){//틴캐시
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>틴캐시 승인번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("TEEN_ApplNum")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>틴캐시아이디</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("TEEN_UserID")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>틴캐시승인금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("TEEN_ApplPrice")+"원</p></td></tr>");

                }else if("Bookcash".equals(resultMap.get("payMethod"))){//도서문화상품권

                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>도서상품권 승인번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("BCSH_ApplNum")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>도서상품권 사용자ID</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("BCSH_UserID")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>도서상품권 승인금액</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("BCSH_ApplPrice")+"원</p></td></tr>");

                }else if("PhoneBill".equals(resultMap.get("payMethod"))){//폰빌전화결제
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>승인전화번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("PHNB_Num")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");


                }else if("Bill".equals(resultMap.get("payMethod"))){//빌링결제
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>빌링키</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CARD_BillKey")+"</p></td></tr>");
                }else if("Auth".equals(resultMap.get("payMethod"))){//빌링결제
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>빌링키</p></th>");
                    if ("BILL_CARD".equalsIgnoreCase(resultMap.get("payMethodDetail"))) {
                        out.println("<td class='td02'><p>" +resultMap.get("CARD_BillKey")+"</p></td></tr>");
                    } else  if ("BILL_HPP".equalsIgnoreCase(resultMap.get("payMethodDetail"))) {
                        out.println("<td class='td02'><p>" +resultMap.get("HPP_BillKey")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>통신사</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("HPP_Corp")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>결제장치</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("payDevice")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>휴대폰번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("HPP_Num")+"</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>상품명</p></th>");			//상품명
                        out.println("<td class='td02'><p>" +resultMap.get("goodName")+"</p></td></tr>");

                    } else {
                        //
                    }
                }else if("HPMN".equals(resultMap.get("payMethod"))){//해피머니

                }else{//카드
                    int  quota=Integer.parseInt(resultMap.get("CARD_Quota"));
                    if(resultMap.get("EventCode")!=null){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>이벤트 코드</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("EventCode")+"</p></td></tr>");
                    }
                    applNum = resultMap.get("applNum");
                    cardQuota = resultMap.get("CARD_Quota");
                    cardInterest = resultMap.get("CARD_Interest");
                    cardNum = resultMap.get("CARD_Num");
                    cardCode = resultMap.get("CARD_Code");
                    cardBankCode = resultMap.get("CARD_BankCode");
                    eventCode = resultMap.get("EventCode");
                    cardApplPrice = resultMap.get("TotPrice");


                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>카드번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CARD_Num")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>승인번호</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("applNum")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>할부기간</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CARD_Quota")+"</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    if("1".equals(resultMap.get("CARD_Interest")) || "1".equals(resultMap.get("EventCode"))){
                        out.println("<tr><th class='td01'><p>할부 유형</p></th>");
                        out.println("<td class='td02'><p>무이자</p></td></tr>");
                    }else if(quota > 0 && !"1".equals(resultMap.get("CARD_Interest"))){
                        out.println("<tr><th class='td01'><p>할부 유형</p></th>");
                        out.println("<td class='td02'><p>유이자 <font color='red'> *유이자로 표시되더라도 EventCode 및 EDI에 따라 무이자 처리가 될 수 있습니다.</font></p></td></tr>");
                    }

                    if("1".equals(resultMap.get("point"))){
                        out.println("<td class='td02'><p></p></td></tr>");
                        out.println("<tr><th class='td01'><p>포인트 사용 여부</p></th>");
                        out.println("<td class='td02'><p>사용</p></td></tr>");
                    }else{
                        out.println("<td class='td02'><p></p></td></tr>");
                        out.println("<tr><th class='td01'><p>포인트 사용 여부</p></th>");
                        out.println("<td class='td02'><p>미사용</p></td></tr>");
                    }
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>카드 종류</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CARD_Code")+ "</p></td></tr>");
                    out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                    out.println("<tr><th class='td01'><p>카드 발급사</p></th>");
                    out.println("<td class='td02'><p>" +resultMap.get("CARD_BankCode")+ "</p></td></tr>");

                    if(resultMap.get("OCB_Num")!=null && resultMap.get("OCB_Num") != ""){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>OK CASHBAG 카드번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("OCB_Num")+ "</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>OK CASHBAG 적립 승인번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("OCB_SaveApplNum")+ "</p></td></tr>");
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>OK CASHBAG 포인트지불금액</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("OCB_PayPrice")+ "</p></td></tr>");

                        ocbPayPrice = resultMap.get("OCB_PayPrice");

                    }
                    if(resultMap.get("GSPT_Num")!=null && resultMap.get("GSPT_Num") != ""){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>GS&Point 카드번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GSPT_Num")+ "</p></td></tr>");

                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>GS&Point 잔여한도</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GSPT_Remains")+ "</p></td></tr>");

                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>GS&Point 승인금액</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("GSPT_ApplPrice")+ "</p></td></tr>");
                    }

                    if(resultMap.get("UNPT_CardNum")!=null && resultMap.get("UNPT_CardNum") != ""){
                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>U-Point 카드번호</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("UNPT_CardNum")+ "</p></td></tr>");

                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>U-Point 가용포인트</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("UPNT_UsablePoint")+ "</p></td></tr>");

                        out.println("<tr><th class='line' colspan='2'><p></p></th></tr>");
                        out.println("<tr><th class='td01'><p>U-Point 포인트지불금액</p></th>");
                        out.println("<td class='td02'><p>" +resultMap.get("UPNT_PayPrice")+ "</p></td></tr>");
                    }
                }
                out.println("</table>");
                out.println("<span style='padding-left : 100px;'>");
                out.println("</span>");
                out.println("<form name='frm' method='post'>");
                out.println("<input type='hidden' name='tid' value='"+resultMap.get("tid")+"'/>");
                out.println("</form>");

                out.println("</pre>");

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

                out.println("## 망취소 API 결과 ##");

                // 취소 결과 확인
                out.println("<p>"+netcancelResultString.replaceAll("<", "&lt;").replaceAll(">", "&gt;")+"</p>");
            }

        }else{

            //#############
            // 인증 실패시
            //#############
            out.println("<br/>");
            out.println("####인증실패####");

            out.println("<p>"+paramMap.toString()+"</p>");

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
        var goodsInfo = sessionStorage.getItem('goodsInfo');
        var resultData = JSON.parse(sessionStorage.getItem('resultData'));
        var userKey = sessionUserInfo.userKey;

        var orderGoodsList = sessionStorage.getItem('orderGoodsList');
        var savePayInfo = JSON.parse(sessionStorage.getItem('savePayInfo'));
        //console.log(savePayInfo);

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
            resulterrorcode : '<%=resultErrorCode %>',
            isMobile : isMobile
        };
        var InipayInfoResult = saveInipayInfo(saveInipayInfoData);

        var payStatus = 2;
        if('<%=payMethod%>' == 'VBank'){
             payStatus = 0;
        }
        if(InipayInfoResult.resultCode == 200){
            var savePaymentInfoData = {
                jId : '<%=moId %>',
                userKey : userKey,
                price : savePayInfo.price,
                pricePay : savePayInfo.pricePay,
                point : point,
                discountPoint : discountPoint,
                deliveryPrice : deliveryPrice,
                payStatus :  payStatus,/* 무통장일때 기능 추가 */
                cardCode :  '<%=cardCode%>',
                bank : '우리은행',/* 수정 필요 */
                bankAccount :  '123-123-11111',/* 수정 필요 */
                depositUser : resultData.postName,
                deliveryName : resultData.postName,
                deliveryTelephone : resultData.allTel,
                deliveryTelephoneMobile : resultData.allPhone,
                deliveryZipcode :  resultData.postCode,
                deliveryAddress :  resultData.add1,
                deliveryAddressRoad : resultData.add1,
                deliveryAddressAdd : resultData.add2,
                payKey :  InipayInfoResult.keyValue,
                isMobile : isMobile,
                orderGoodsList :  orderGoodsList
            };
            var PaymentResult = savePaymentInfo(savePaymentInfoData);
        }
        console.log(savePaymentInfoData);
        console.log(PaymentResult);
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
                        <div class="tbd_03 tbd_05 mgb60">
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
                                    <li><span class="tit">결제방법</span>무통장입금</li>
                                    <li><span class="tit">입금은행</span>국민은행</li>
                                    <li><span class="tit">결제방법</span>013837-04-002130</li>
                                    <li><span class="tit">입금자명</span>000</li>
                                    <li><span class="tit">입금예정일</span>2019-07-01 오전 12:00:00</li>
                                    <li><span class="tit">결제상태</span>입금예정</li>
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