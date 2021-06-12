<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Contet-Type" content="text/html; charset=UTF-8">
<title>배열값 받기</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<h2>성별과 좋아하는 과목은</h2>
<%
	String sex = request.getParameter("sex");
	if(sex.equalsIgnoreCase("man"))
		sex = "남자";
	else
		sex = "여자";
	
	String[] subjects = request.getParameterValues("subject"); 
%>

<h>당신은 <strong><%=sex %></strong>이고,</h>
<p>
<h>좋아하는 과목으로</h><br>
<%
	if(subjects!=null){
		for(String sub : subjects){
			out.println("- <strong>"+sub+"</strong><br>");
		}
	}
%>
<p>
<h>을 선택하였군요.</h>
</body>
</html>