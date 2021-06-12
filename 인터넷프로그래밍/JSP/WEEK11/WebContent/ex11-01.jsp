<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 입력 폼</title>
</head>
<body  style="text-align: center">
<h2>로그인 입력 화면</h2>
<form method="post" action="ex11-02.jsp">
	<table border="1" style="margin-left: auto; margin-right: auto;">
	<tr>
	<td>아이디</td>
	<td><input type="text" name="id"></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type="text" name="pwd"></td> 
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="로그인">
	<input type="reset" value="취소"> 
	</td>
	</tr>
	</table>
</form>
</body>
</html>