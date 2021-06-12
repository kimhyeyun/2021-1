<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score.jsp</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="score" class="javabean.GradeBean" scope="page"></jsp:useBean>

<h2>JavaBeans를 이용한 학생의 이름과 성적의 저장과 조회 예제</h2>
<jsp:setProperty property="*" name="score"/>
<hr>
<h3>이름과 성적을 JavaBeans ScoreBean에 저장</h3>
이름 : <jsp:getProperty property="name" name="score"/>
, 성적 : <jsp:getProperty property="point" name="score"/>
<hr>
<h3>JavaBeans ScoreBean에 저장된 정보를 조회 출력</h3>
이름 : <jsp:getProperty property="name" name="score"/><br>
성적 : <jsp:getProperty property="point" name="score"/><br>
등급 : <%=score.getGrade() %>
</body>
</html>