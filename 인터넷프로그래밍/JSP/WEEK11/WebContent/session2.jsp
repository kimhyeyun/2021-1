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
String name = request.getParameter("thename");
session.setAttribute("thename", name);
%>

What's your name : <%=name %><p>
<form action="session3.jsp?pwd=123456" method="post">
	What do you like?
	<input type="text" name="food">
	<p>
	<input type="submit" value="submit">
</form>
</body>
</html>