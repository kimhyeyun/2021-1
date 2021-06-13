<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fortune 예제</title>
</head>
<body>
<%
	double r = Math.random();
	if(r>0.60){
%>
<h2 style="color:red;">오늘은 행운의 날입니다!</h2><p>확률:<%=r %></p>
<%}else{ %>
<h2>오늘은 평범한 날입니다.</h2><p>확률:<%=r %></p>
<%} %>
<a href="<%=request.getRequestURI()%>"><h3>다시시도</h3></a>
</body>
</html>