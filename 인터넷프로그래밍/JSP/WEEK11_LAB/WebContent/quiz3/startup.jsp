
<%@page import="java.io.IOException"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try{
	int ran;
	if(session.isNew()){
		ran = (int)(Math.random()*9)+1;
		session.setAttribute("a", ran);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Startup.jsp</title>
</head>
<body>

<h2>Guess a Number</h2>
<h>Guess a number in [0,10]</h>
<form action="startup.jsp" method="post">
	<input type="text" name="num"><br>
	<input type="submit" value="guess"><br>
	<input type="reset" value="reset the game"><br>
</form>
<h>The guessed history: 
</body>
</html>
<%

	final int ans = (int)session.getAttribute("a");
	int num = Integer.parseInt(request.getParameter("num"));
	
	session.setAttribute("b", num);
	
	if(ans == num){
		out.println("Very good, you ar right.<br>");
	}
	else if(ans > num){
		out.println("Try again and input a larger number<br>");
	}
	else{
		out.println("Try again and input a smaller number<br>");
	}
	
}catch(IOException e){
	e.printStackTrace();
}
%>
