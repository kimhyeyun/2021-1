<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회 화면</title>
</head>
<body>
<h2>회원 정보 조회</h2>
<table border=2>
	<tr>
		<th>이름</th>
		<th>성별</th>
		<th>취미</th>
		<th>연락처</th>
	</tr>
	
	
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/member_db","root","asd070311"
				);
		Statement stmt = conn.createStatement();
		
		String query = "SELECT * FROM member order by memberid";
		
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
			int id = rs.getInt("memberid");
	%>
	
	<tr>
		<td><%=rs.getString("membername") %></td>
		<td><%=rs.getString("sex") %></td>
		<td><%=rs.getString("hobby") %></td>
		<td><%=rs.getString("phone") %></td>
	</tr>
	
	<%
		}
		
		rs.close();
		stmt.close();
		conn.close();
	%>
	
</table>
</body>
</html>