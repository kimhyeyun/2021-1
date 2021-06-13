<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃작동페이지</title>
</head>
<body>
	<%
		session.invalidate(); // 유저 세션 해제해줌
	%>
	<script>
		location.href = 'main.jsp';
	</script>

</body>
</html>