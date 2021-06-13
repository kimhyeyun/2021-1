<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 결과화면</title>
</head>
<body>

<h2>로그인 입력 화면에서</h2>
<h>전송된 아이디와 비밀번호는<br>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	out.print(id+" ");
	out.print(pwd+" 입니다.");
%>

</body>
</html>