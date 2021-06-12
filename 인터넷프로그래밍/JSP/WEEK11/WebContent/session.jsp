<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>session.jsp</title>
</head>
<body>
<center>
<h2>session 예제</h2>
<hr>

<%
if(session.isNew()){
	out.println("<script>alert('세션이 해제되어 다시 설정합니다.')</script>");
	session.setAttribute("login", "ok");
}
%>

1.세션 ID : <%=session.getId() %><br>
2.세션 유지시간 : <%=session.getMaxInactiveInterval() %><br>
3.login 세션의 설정값 : <%=session.getAttribute("login") %><br>
</center>
</body>
</html>