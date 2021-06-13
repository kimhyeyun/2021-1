<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String[] array = {"홍길동","김철수","김영희"}; %>
<html>
<head>
<meta charset="UTF-8">
<title>배열 예제</title>
</head>
<body>
<%
	int i=0;
	for(i=0;i<array.length;i++){
		out.print("배열 요소:"+array[i]+"<br>");
	}
%>
</body>
</html>