<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/jsp/common.jsp" %>
<%
    String targetUrl = request.getParameter("zianPassUrl");
%>
<form name="frm" method="get">
    <input type="hidden" name="page_gbn" id="page_gbn">
    <div id="wrap">
        <%@include file="/common/jsp/leftMenu.jsp" %>
        <!--상단-->
        <%@include file="/common/jsp/header.jsp" %>
        <!--//상단-->
        <!--본문-->

            <iframe src="<%=targetUrl%>" style="border:none; width: 100%; height: 1000px" frameborder="0" ></iframe>

<%--        <div id="container">--%>
<%--            <div class="inner">--%>
<%--                <iframe src="<%=targetUrl%>" width="1000" height="1000" style="border:none;" frameborder="0" ></iframe>--%>
<%--            </div>--%>
<%--        </div>--%>
        <!--//본문-->
        <!--하단-->
        <%@include file="/common/jsp/footer.jsp" %>
        <!--//하단-->
        <!--우측따라다니는영역-->
        <%@include file="/common/jsp/rightMenu.jsp" %>
        <!--//우측따라다니는영역-->
        <!--하단고정식배너-->
        <%@include file="/common/jsp/footerBanner.jsp" %>
        <!--//하단고정식배너-->
    </div>
    <div id="overlay"></div>
</form>
</body>
</html>
