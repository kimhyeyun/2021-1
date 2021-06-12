<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%!int ans; %>
 <%
	if(session.isNew()){
		ans = (int)(Math.random()*9)+1;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	if(ans == num){
		session.setAttribute("msg", "Very good, you ar right.<br>");
	}
	else if(ans > num){
		session.setAttribute("msg", "Try again and input a larger number<br>");
	}
	else{
		session.setAttribute("msg", "Try again and input a smaller number<br>");
	}

%>

</body>
</html>