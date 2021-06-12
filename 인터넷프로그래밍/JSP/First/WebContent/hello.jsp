<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 안녕하세요? 현재 시각은 <%=new java.util.Date() %>입니다.
<br>

<%
	java.util.Date date = new java.util.Date();
%>
안녕하세요? 현재 시각은 <%=date %>입니다. --%>

<%-- <%
	java.util.Date date = new java.util.Date();
%>
안녕하세요? 현재 시각
<%
	out.println(date);
	out.println("<br>이고 ip주소");
	out.println(request.getRemoteAddr());
%>
입니다. --%>
<%-- 
<%
	Date date = new Date();
%>
안녕하세요? 현재 시간은 <%=date %>입니다. --%>

<%!
	Date date = new Date();
	Date getDate(){
		return date;
	}
%>
안녕하세요? 현재 시각은 <%=getDate() %>입니다.
</body>
</html>