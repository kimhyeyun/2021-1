<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SignUp.jsp</title>
</head>
<body>
<%request.setCharacterEncoding("EUC-KR"); %>

<%
String name = request.getParameter("name");
String PhoneNum = request.getParameter("phonenum");
String sex = request.getParameter("sex");
String country = request.getParameter("country");
String[] hobby = request.getParameterValues("hobby");

if(sex.equalsIgnoreCase("man")){
	sex = "남자";
}
else{
	sex = "여자";
}
%>

<h2>회원가입 정보</h2>
이름 : <%=name %><p>
전화번호 : <%=PhoneNum %><p>
성별 : <%=sex %><p>
국적 : <%=country %><p>
취미 : <%
			if(hobby==null){
				out.println("취미없음");
			}
			else{
				for(String eachhobby : hobby){
					out.println(eachhobby+" ");
				}
			}
		%>

</body>
</html>