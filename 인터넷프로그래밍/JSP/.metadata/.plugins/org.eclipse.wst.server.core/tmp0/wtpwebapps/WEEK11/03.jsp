<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입력 폼(2)</title>
</head>
<body>
<h2>성별과 좋아하는 과목 조사</h2><br>
<form method="post" action="04.jsp">
1.성별을 선택하세요.[Radio 버튼]<br>
<input type="radio" name="sex" value="man" >남자
<input type="radio" name="sex" value="woman">여자
<p>
2.좋아하는 과목을 선택하세요.[CheckBox]<br>
<input type="checkbox" name="subject" value="SQL 응용">SQL 응용<br>
<input type="checkbox" name="subject" value="DB 개발도구">DB 개발도구<br>
<input type="checkbox" name="subject" value="JSP">JSP<br>
<input type="checkbox" name="subject" value="오라클 실무">오라클 실무<br>
<input type="checkbox" name="subject" value="ERP 구축">ERP 구축
<p>
<input type="submit" value="확인">
<input type="reset" value="취소">
</form>
</body>
</html>