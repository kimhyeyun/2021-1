<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP 예제 request3.jsp</title>
</head>
<body>
<%@ page import="java.util.Enumeration" %>

<% request.setCharacterEncoding("euc-kr"); %>

<h2>취미와 가보고 싶은 국가 결과</h2>

<%
Enumeration<String> e = request.getParameterNames();

while(e.hasMoreElements()){
	String name = e.nextElement();
	String[] data = request.getParameterValues(name);
	
	if(data!=null){
		for(String eachdata : data){
			out.println(eachdata+" ");
		}
		out.println("<p>");
	}
}
%>
</body>
</html>