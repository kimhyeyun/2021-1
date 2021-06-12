<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>application 예제</title>
</head>
<body style="text-align: center">
<h2>application2 예제</h2>
<hr>
1.서버정보 : <%=application.getServerInfo() %><br>
2.서블릿 API 버전 정보 : 
<%=application.getMajorVersion() + ", "+ application.getMinorVersion() %><br>
3.application2.jsp 화일의 실제 경로 : <%=application.getRealPath("application2.jsp") %><br>

<hr>
setAttrubute 로 username 변수에 "홍길동" 설정<p>
<%application.setAttribute("username", "홍길동");
application.log("username=홍길동");
%>

<a href="application_result.jsp">확인하기</a>
</body>
</html>