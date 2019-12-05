<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%@ page import="com.zianedu.front.utils.Util" %>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@ page import="com.inicis.std.util.ParseUtil"%>
<%@ page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<%@ page import="com.inicis.std.util.HttpUtil" %>

<%
    String cartNum = Util.isNullValue(request.getParameter("cartNum"), "");
    String gKeys = Util.isNullValue(request.getParameter("gKeys"), "");
    String goodsInfo = Util.isNullValue(request.getParameter("goodsInfo"), "");
    String allProductPrice = Util.isNullValue(request.getParameter("allProductPrice"), "");
    String userName = Util.isNullValue(request.getParameter("postName"), "");
    String phoneNum = Util.isNullValue(request.getParameter("allPhone"), "");
    String email = Util.isNullValue(request.getParameter("allEmail"), "");
    String productNames = Util.isNullValue(request.getParameter("productNames"), "");
%>
<%
    // 여기에 설정된 값은 Form 필드에 동일한 값으로 설정
    String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)

    //인증
    String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
    String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

    //String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
    String oid                  = Util.getJId();
    String price				= allProductPrice;													// 상품가격(특수기호 제외, 가맹점에서 직접 설정)
    String cardNoInterestQuota	= "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4";		// 카드 무이자 여부 설정(가맹점에서 직접 설정)
    String cardQuotaBase		= "2:3:4:5:6:11:12:24:36";		// 가맹점에서 사용할 할부 개월수 설정

    //###############################################
    // 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
    //###############################################
    String mKey = SignatureUtil.hash(signKey, "SHA-256");

    //###############################################
    // 2.signature 생성
    //###############################################
    Map<String, String> signParam = new HashMap<String, String>();

    signParam.put("oid", oid); 					// 필수
    signParam.put("price", price);				// 필수
    signParam.put("timestamp", timestamp);		// 필수

    // signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
    String signature = SignatureUtil.makeSignature(signParam);

    /* 기타 */
    String siteDomain = "http://localhost:8000"; //가맹점 도메인 입력
    // 페이지 URL에서 고정된 부분을 적는다.
    // Ex) returnURL이 http://localhost:8080INIpayStdSample/INIStdPayReturn.jsp 라면
    // http://localhost:8080/INIpayStdSample 까지만 기입한다.
%>
<%

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

            String ResultMid 		= paramMap.get("mid");						// 가맹점 ID 수신 받은 데이터로 설정
            String ResultSignKey	= "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";		// 가맹점에 제공된 키(이니라이트키) (가맹점 수정후 고정) !!!절대!! 전문 데이터로 설정금지
            String ResultTimestamp= SignatureUtil.getTimestamp();				// util에 의해서 자동생성
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
            Map<String, String> signParam2 = new HashMap<String, String>();

            signParam2.put("authToken",	authToken);		// 필수
            signParam2.put("timestamp",	timestamp);		// 필수

            // signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
            String signature2 = SignatureUtil.makeSignature(signParam2);

            String price2 = "";  // 가맹점에서 최종 결제 가격 표기 (필수입력아님)

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
<script src="/common/zian/js/inicis.js"></script>
<script>
    $( document ).ready(function() {
        var locationHost = location.host;
        //var returnUrl = "http://" + locationHost + "/payment?page_gbn=inicisResult";
        var returnUrl = "http://" + locationHost + "/myPage?page_gbn=pay";
        innerValue("returnUrl", returnUrl);

        var locationHost = location.host;
        var closeUrl = "http://" + locationHost + "/myPage?page_gbn=write";
        innerValue("closeUrl", closeUrl);


        $("input:radio[name=ckbox]").click(function(){
            console.log($(this).val());
            innerValue("gopaymethod", $(this).val())
        });
        var sessionUserInfo = JSON.parse(sessionStorage.getItem('userInfo'));
        var userKey = sessionUserInfo.userKey;

        var allProductPrice = "<%= request.getParameter("allProductPrice") %>";
        var postName = "<%= request.getParameter("postName") %>";
        var allTel = "<%= request.getParameter("allTel") %>";
        var allPhone = "<%= request.getParameter("allPhone") %>";
        var allEmail = "<%= request.getParameter("allEmail") %>";
        var postCode = "<%= request.getParameter("postCode1") %>";
        var add1 = "<%= request.getParameter("add1") %>";
        var add2 = "<%= request.getParameter("add2") %>";

        if('<%=cartNum%>' == "" && '<%=goodsInfo%>' == ""){//바로구매
            var gKeys = toStrFileName(<%= request.getParameter("gKeys") %>);
            innerValue("gKeys", gKeys);
            getOrderSheetInfoFromImmediately(userKey, gKeys);
        }else if('<%=gKeys%>' == "" && '<%=goodsInfo%>' == ""){
            var cartKeys = toStrFileName(<%= request.getParameter("cartNum") %>);
            innerValue("cartNum", cartKeys);
            getOrderSheetInfoFromPay(userKey, cartKeys);
        }else{//패키지
            var goodsInfo ='<%= request.getParameter("goodsInfo") %>';
            innerValue("goodsInfo", goodsInfo);
            getOrderSheetInfoFromImmediatelyAtBasicPackage(userKey, goodsInfo, 1);
        }

        innerValue("allProductPrice", allProductPrice);
        innerHTML("allPrice", format(allProductPrice));
        innerHTML("orderName1", postName);
        innerHTML("telephone1", allTel);
        innerHTML("telephoneMobile1", allPhone);
        innerHTML("email1", allEmail);
        innerHTML("zipcode1", postCode);
        innerHTML("address1", add1);
        innerHTML("address2", add2);

        innerValue("postName", postName);
        innerValue("allTel", allTel);
        innerValue("allPhone", allPhone);
        innerValue("allEmail", allEmail);
        innerValue("postCode1", postCode);
        innerValue("add1", add1);
        innerValue("add2", add2);
    });

    function goOrderResult() {
        $("#id_frm_orderPay").attr( "action", "/myPage?page_gbn=orderResult");
        $("#id_frm_orderPay").submit();
    }
</script>
<style>
    body, tr, td {font-size:10pt; font-family:돋움,verdana; color:#433F37; line-height:19px;}
    table, img {border:none}
</style>
<script language="javascript" type="text/javascript" src="https://stgstdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
<form action="/mypage/cart/orderResult" id="id_frm_orderPay" method="post" name="name_frm_orderPay">
    <input type="hidden" id="allProductPrice" name="allProductPrice"><!-- 결제해야할 총 금액 -->
    <input type="hidden" id="cartNum" name="cartNum">
    <input type="hidden" id="gKeys" name="gKeys">
    <input type="hidden" id="postName" name="postName">
    <input type="hidden" id="allTel" name="allTel">
    <input type="hidden" id="allPhone" name="allPhone">
    <input type="hidden" id="allEmail" name="allEmail">
    <input type="hidden" id="postCode1" name="postCode1">
    <input type="hidden" id="add1" name="add1">
    <input type="hidden" id="add2" name="add2">
</form>
<!--pc-->
<body onload="setOid()" topmargin="0"  leftmargin="0" marginwidth="0" marginheight="0">
<div id="mobilePay" style="display: none">
    <table width="320" border="0" cellpadding="0" cellspacing="0">
        <form id="form1" name="ini" method="post" action="" style="display: none;">
            <tr>
                <td height="347" align="center" valign="top" background="images/bg_01.png"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="298" height="296" align="center" background="images/table_bg.png"><table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="95" height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">방식</td>
                                <td align="left">
                                    <select name="inipaymobile_type" id="select">
                                        <option value="web">INIpayMobile Web
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">주문번호</td>
                                <td align="left"><input type="hidden" name="P_OID" id="textfield2" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">상품명</td>
                                <td align="left"><input type="hidden" name="P_GOODS" value="<%=productNames%>" id="textfield3" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">가격 </td>
                                <td align="left"><input type="hidden" name="P_AMT" value="<%=allProductPrice%>" id="textfield4" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">구매자이름</td>
                                <td align="left"><input type="hidden" name="P_UNAME" value="<%=userName%>" id="textfield5" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">상점이름 </td>
                                <td align="left"><input type="hidden" name="P_MNAME" value="이니시스 쇼핑몰" id="textfield6" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">휴대폰번호</td>
                                <td align="left"><input type="hidden" name="P_MOBILE" id="textfield7" value="<%=phoneNum %>" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">이메일</td>
                                <td align="left"><input type="hidden" name="P_EMAIL" value="<%=email  %>" id="textfield8" style="border-color:#cdcdcd; border-width:1px; border-style:solid; color:#555555; height:15px;"/></td>
                            </tr>
                            <tr>
                                <td height="25" align="left" style="background-image:url(images/bullet.png); background-repeat:no-repeat; background-position:0px 40%; padding-left:8px; font-size:12px; color:#607c90;">결제방법 </td>
                                <td align="left"><label>
                                    <select name="paymethod" id="select">
                                        <option value="wcard">신용카드
                                            <!--<option value="DBANK">계좌이체-->
                                        <option value="vbank">가상계좌
                                        <option value="mobile">휴대폰
                                        <option value="culture">문화 상품권
                                        <option value="hpmn">해피머니 상품권
                                    </select>
                                </label></td>
                            </tr>
                        </table></td>
                    </tr>
                    <tr>
                        <td height="39" align="center" valign="bottom"><input type="button" value="결제하기" onclick="javascript:onSubmit();"/></td>
                    </tr>
                </table></td>
            </tr>
            <input type="hidden" name="P_MID" value="INIpayTest">
            <input type=hidden name="P_NEXT_URL" value="https://mobile.inicis.com/smart/testmall/next_url_test.php">
            <input type=hidden name="P_NOTI_URL" value="https://mobile.inicis.com/rnoti/rnoti.php">
            <input type=hidden name="P_HPP_METHOD" value="1">
        </form>
    </table>
</div>
<form id="SendPayForm_id" name="" method="POST" style="display: none;">
    <div style="border:2px #dddddd double;padding:10px;background-color:#f3f3f3;">
        <br/><input type="hidden"  style="width:100%;" name="version" value="1.0">
        <br/><input type="hidden"  style="width:100%;" name="mid" value="<%=mid%>">
        <br/><input type="hidden"  style="width:100%;" name="goodname" id="goodname" value="<%=productNames%>">
        <br/><input type="hidden" style="width:100%;" name="oid" value="<%=oid%>">
        <br/><input type="hidden" style="width:100%;" name="price" value="<%=price%>">
        <br/><input type="hidden" style="width:100%;" name="currency" value="WON">
        <br/><input type="hidden" style="width:100%;" name="buyername" value="<%=userName%>">
        <br/><input type="hidden" style="width:100%;" name="buyertel" value="<%=phoneNum%>">
        <br/><input type="hidden" style="width:100%;" name="buyeremail" value="<%=email%>">
        <input type="hidden" style="width:100%;" name="timestamp" value="<%=timestamp %>">
        <input type="hidden" style="width:100%;" name="signature" value="<%=signature%>">
        <br/><input type="hidden" style="width:100%;" name="returnUrl" id="returnUrl" value="">
        <input type="hidden"  name="mKey" value="<%=mKey%>">
    </div>

    <br/><br/>
    <b>***** 기본 옵션 *****</b>
    <div style="border:2px #dddddd double;padding:10px;background-color:#f3f3f3;">
        <b>gopaymethod</b> : 결제 수단 선택
        <br/>ex) Card (계약 결제 수단이 존재하지 않을 경우 에러로 리턴)
        <br/>사용 가능한 입력 값
        <br/>Card,DirectBank,HPP,Vbank,kpay,Swallet,Paypin,EasyPay,PhoneBill,GiftCard,EWallet
        <br/>onlypoint,onlyocb,onyocbplus,onlygspt,onlygsptplus,onlyupnt,onlyupntplus
        <br/><input type="hidden" style="width:100%;" name="gopaymethod" id="gopaymethod" value="" >
        <br/><br/>

        <br/>
        <b>offerPeriod</b> : 제공기간
        <br/>ex)20151001-20151231, [Y2:년단위결제, M2:월단위결제, yyyyMMdd-yyyyMMdd : 시작일-종료일]
        <br/><input type="hidden" style="width:100%;" name="offerPeriod" value="20151001-20151231" >
        <br/><br/>

        <br/><b>acceptmethod</b> : acceptmethod
        <br/>acceptmethod  ex) CARDPOINT:SLIMQUOTA(코드-개월:개월):no_receipt:va_receipt:vbanknoreg(0):vbank(20150425):va_ckprice:vbanknoreg:
        <br/>KWPY_TYPE(0):KWPY_VAT(10|0) 기타 옵션 정보 및 설명은 연동정의보 참조 구분자 ":"
        <br/><input type="hidden" style="width:100%;" name="acceptmethod" value="CARDPOINT:HPP(1):no_receipt:va_receipt:vbanknoreg(0):below1000" >
    </div>

    <br/><br/>
    <b>***** 표시 옵션 *****</b>
    <div style="border:2px #dddddd double;padding:10px;background-color:#f3f3f3;">
        <br/><b>languageView</b> : 초기 표시 언어
        <br/>[ko|en] (default:ko)
        <br/><input style="width:100%;" name="languageView" value="" >

        <br/><b>charset</b> : 리턴 인코딩
        <br/>[UTF-8|EUC-KR] (default:UTF-8)
        <br/><input style="width:100%;" name="charset" value="" >

        <br/><b>payViewType</b> : 결제창 표시방법
        <br/>[overlay] (default:overlay)
        <br/><input style="width:100%;" name="payViewType" value="" >

        <br/><b>closeUrl</b> : payViewType='overlay','popup'시 취소버튼 클릭시 창닥기 처리 URL(가맹점에 맞게 설정)
        <br/>close.jsp 샘플사용(생략가능, 미설정시 사용자에 의해 취소 버튼 클릭시 인증결과 페이지로 취소 결과를 보냅니다.)
        <br/><input style="width:100%;" name="closeUrl" id="closeUrl" >

        <br/><b>popupUrl</b> : payViewType='popup'시 팝업을 띄울수 있도록 처리해주는 URL(가맹점에 맞게 설정)
        <br/>popup.jsp 샘플사용(생략가능,payViewType='popup'으로 사용시에는 반드시 설정)
        <br/><input style="width:100%;" name="popupUrl" value="<%=siteDomain%>/popup.jsp" >

    </div>

    <b>***** 결제 수단별 옵션 *****</b>
    <br/>
    <b>-- 카드(간편결제도 사용) --</b>
    <div style="border:2px #cccccc solid;padding:10px;background-color:#f3f3f3;">

        <br/><b>quotabase</b> : 할부 개월 설정
        <br/>ex) 2:3:4
        <br/><input  style="width:100%;" name="quotabase" value="<%=cardQuotaBase%>" >

        <br/><b>ini_onlycardcode</b> : 중복 카드 코드
        <br/>ex) 01:03:04:11
        <br/><input  style="width:100%;" name="ini_onlycardcode" value="" >

        <br/><b>ini_cardcode</b> : 카드 코드
        <br/>ex) 2:3:4
        <br/><input  style="width:100%;" name="ini_cardcode" value="" >

        <br/><b>ansim_quota</b> : 할부 선택
        <br/>ex) 2:3:4
        <br/><input  style="width:100%;" name="ansim_quota" value="" >

    </div>

    <b>-- 가상계좌 --</b>
    <div style="border:2px #cccccc solid;padding:10px;background-color:#f3f3f3;">
        <br/><b>INIregno</b> : 주민번호 설정 기능
        <br/>13자리(주민번호),10자리(사업자번호),미입력시(화면에서입력가능)
        <br/><input  style="width:100%;" name="INIregno" value="" >
    </div>

    <br/><br/>
    <b>***** 추가 옵션 *****</b>
    <div style="border:2px #dddddd double;padding:10px;background-color:#f3f3f3;">
        <br/><b>merchantData</b> : 가맹점 관리데이터(2000byte)
        <br/>인증결과 리턴시 함께 전달됨(한글 지원 안됨, 개인정보 암호화(권장))
        <br/><input  style="width:100%;" name="merchantData" value="" >
    </div>

</form>

<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
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
                        <li class="active"><label>03.<b>결제하기</b></label></li>
                        <li class="last"><label>04.<b>주문완료</b></label></li>
                    </ul>
                    <!--cart -->
                    <div class="cart">
                        <div class="tbd_03 mgb20">
                            <p class="title"><span class="text_blue">최종 주문상품</span> 확인</p>
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
                                <tbody id="dataList">
                                </tbody>
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
                        <div class="pay">
                            <p class="title"><span class="text_blue">결제</span>하기</p>
                            <div class="left" style="width: 750px;">
                                <ul>
                                    <li class="tit">결제수단</li>
                                    <li><input type="radio" name="ckbox" value="Card" id="ckbox1">신용카드</li>
                                    <li><input type="radio" name="ckbox" value="DirectBank" id="ckbox2">실시간 계좌이체</li>
                                    <li><input type="radio" name="ckbox" value="VBank" id="ckbox3">무통장입금</li>
                                </ul>
                                <div id="1" class="ckctn">
                                    <div class="ckinner credit"></div>
                                </div>
                                <div id="2" class="ckctn">
                                    <div class="ckinner transfer"></div>
                                </div>
                                <div id="3" class="ckctn">
                                    <div class="ckinner receipt">
                                        <p class="title">입금은행</p>
                                        <table>
                                            <thead>
                                            <tr>
                                                <th>은행명</th>
                                                <th>계좌번호</th>
                                                <th>예금주</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>국민은행</td>
                                                <td>013837-04-002130</td>
                                                <td>(주)지안에듀</td>
                                            </tr>
                                            <tr>
                                                <td>농협</td>
                                                <td>355-0019-9102-83</td>
                                                <td>(주)지안에듀</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <div class="detail">
                                                        <ul>
                                                            <li>입금자 <input type="text" name="" value="" class="">
                                                                <span class="txt">(단, 마일리지는 1,000점 이상 적립 되었을때, 현금과 동일하게 100원 단위로 사용이 가능합니다.) </span>
                                                            </li>
                                                            <li>입금예정일<span class="date">2019년 07월 26일</span></li>
                                                            <li>현금영수증발급
                                                                <select name="" class="w200">
                                                                    <option value="">신청안함</option>
                                                                    <option value="">소득공제용(개인-주민번호)</option>
                                                                    <option value="">소득공제용(개인-휴대폰번호)</option>
                                                                    <option value="">소득공제용(사업자-사업자번호)</option>
                                                                </select>
                                                            </li>
                                                            <li class="text_blue">※ 당일 오후 3시(토요일은 오후 12시) 까지 입금확인 된 주문건에 한하여 당일 발송이 가능합니다</li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="right">
                                <li class="pay-sum">
                                    <span class="txt1">총 주문금액</span>
                                    <span class="txt2"><b id="allPrice"></b>원</span>
                                </li>
                                <div class="btn_area">
                                    <a href="javascript:void(0);" onclick="INIStdPay.pay('SendPayForm_id')"  class="blue" id="pcBtn" style="display: none;">결제하기</a>
                                    <a href="javascript:void(0);" onclick="javascript:onSubmit();"  class="blue" id="mobileBtn" style="display: none;">결제하기</a>
                                    <a href="javascript:window.history.back();" class="gray">이전으로</a>
                                </div>
                            </div>
                        </div>
                        <!--확인해주세요 -->
                        <div class="infoarea">
                            <p class="tit">꼭!! 확인해주세요!</p>
                            <ul>
                                <li>·장바구니에 담겨진 상품을 7일 동안 보관됩니다.(7일 이후 자동 삭제) </li>
                                <li>·동영상 강의 최초 신청시 수강기간은 정지된 상태로 [내 강의실-수강중인강좌]로 연결이 됩니다.</li>
                                <li>·최초 대기시간은 30일이며, 30일 이내 자유롭게 시작일을 정해서 시작할 수 있고, 30일이 지나면 자동 시작됩니다.</li>
                                <li>·무통장 결제는 평일 정시 단위로 9시부터 18시 사이에 확인됩니다.</li>
                                <li>·무통장 입금 시 주문자명과 입금자명, 금액이 동일해야 처리됩니다.</li>
                            </ul>
                        </div>
                        <!--배송안내 -->
                        <div class="mileinfo">
                            <p class="tit text_blue">배송안내</p>
                            <ul>
                                <li>·택배는 CJ택배&롯데택배를 이용하며 평균 1~2일(주말 및 공휴일 제외 / 도서산간 지역의 경우 2~3일) 정도 소요됩니다.</li>
                                <li>·도서산간지역은 교재 구매시 추가 배송비가 적용됩니다. 추가 배송비는 면제/할인이 불가능합니다.</li>
                                <li>·교재배송은 당일 14:00시 이전 결제 건은 당일출고이며, 14:00시 이후 결제 건은 익일 출고입니다. 금요일 14:00시 이후 결제 건은 차주 월요일 배송입니다. (주말 및 공휴일은 배송불가)</li>
                                <li>·배송입금확인시간 평일 : 오후 2시</li>
                                <li class="text_blue">※ 무통장 결제는 정시단위로 입금확인되며, 오후 02시(14시)이후 결제 건은 다음날 오전 09시에 확인됩니다.</li>
                            </ul>
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