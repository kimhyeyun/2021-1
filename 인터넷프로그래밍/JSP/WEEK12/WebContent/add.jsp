<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% int idx = 1; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
</head>
<body>
<h1>추가할 회원정보를 입력하세요 : </h1>
<form method="post">
- 이름 : <input type="text" name="name"><br>
- 성별 : <input type="radio" name="sex" value="man" >남자
<input type="radio" name="sex" value="woman">여자<br>
- 취미 : <input type="text" name="hobby"><br>
- 전화번호 : <input type="text" name="phone"><p>
<input type="submit" value="추가">
</form>

<%
	String name = request.getParameter("name");
	if(name != null){
		String sex = request.getParameter("sex");
		if(sex.equalsIgnoreCase("man"))
			sex = "남자";
		else
			sex = "여자";
		String hobby = request.getParameter("hobby");
		String phone = request.getParameter("phone");
		
	
%>
<%	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/member_db","root","asd070311");
		PreparedStatement stmt = null;

		String sqlStr = "INSERT INTO member (membername, sex, hobby, phone) VALUES (?, ?, ?, ?)";
		
		stmt = conn.prepareStatement(sqlStr);
		/* stmt.setInt(1,idx++); */
		stmt.setString(1,name);
		stmt.setString(2,sex);
		stmt.setString(3,hobby);
		stmt.setString(4, phone);
		
		stmt.executeUpdate();
		
		stmt.close();
		conn.close();
	}
	
%>
<form method="post" action="PrintMember.jsp">
<input type="submit" value="회원 정보 검색"> 
</form>

</body>
</html>