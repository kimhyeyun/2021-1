<%@page import="javabean.StudentBean"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>JSP 예제 student.jsp</title>
</head>
<body>
	<h2>JavaBean StudentBean을 이용한 예제</h2>
	
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="student" class="javabean.StudentBean" scope="page"></jsp:useBean>
	
	<hr>
	<h3>폼에서 전달받은 학생정보를 그대로 자바빈 StudentBean에 저장</h3><p>
	<jsp:setProperty property="*" name="student"/>
	<hr>
	<h3>JavaBean StudentBean에 저장된 정보를 조회 출력</h3><p>
	
	학생 ID : <jsp:getProperty property="id" name="student"/><br>
	학생 이름 : <jsp:getProperty property="name" name="student"/><br>
	학생 번호 : <jsp:getProperty property="snum" name="student"/><br>
	나이(생년) : <%=student.getAge() %>(<jsp:getProperty property="year" name="student"/>)<br>
	암호 : <jsp:getProperty property="pass" name="student"/><br>
	전자메일 : <jsp:getProperty property="email" name="student"/><br>
	
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/student_db","root","asd070311");
		PreparedStatement stmt = null;
		
		String sql = "INSERT INTO student_table (ID,sname,snum,syear,sage,email) VALUES (?,?,?,?,?,?)";
		
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, student.getId());
		stmt.setString(2, student.getName());
		stmt.setString(3, student.getSnum());
		stmt.setInt(4, student.getYear());
		stmt.setInt(5, student.getAge());
		stmt.setString(6, student.getEmail());
		
		stmt.executeUpdate();
		
		stmt.close();
		conn.close();
	%>
</body>
</html>