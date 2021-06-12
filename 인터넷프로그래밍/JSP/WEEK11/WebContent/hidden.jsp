<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String date = request.getParameter("time");
%>

<p>Hidden Test Name is :
<%=name %>
</p>

<p>Received Time is :
<%=date %>
</p>
</body>
</html>