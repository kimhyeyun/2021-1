<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Session Track</title>
</head>
<body>
<h2>Session Track</h2>
<%@ page import = "java.util.Date" %>
<%!int cnt = 0;%>

<%
String scnt = (String) application.getAttribute("cnt");

if(scnt != null){
	cnt = Integer.parseInt(scnt);
}
else{
	cnt=0;
}

application.setAttribute("cnt",Integer.toString(++cnt));
%>


<table border="1" style="margin-left: auto; margin-right: auto">
<thead style="background-color: #d3d3d3;">
<tr>
	<th>Session info</th>	
	<th>detail</th>
</tr>
</thead>
<tr>
<td>session id</td>
<td><%=session.getId() %></td>
</tr>
<tr>
<td>Creation time</td>
<%
	Date time = new Date(session.getCreationTime());
%>

<td><%=time.toString() %></td>
</tr>
<tr>
<td>Last access time</td>
<%
	time = new Date(session.getLastAccessedTime());
%>
<td><%=time.toString() %></td>
</tr>
<tr>
<td>Access Count</td>
<td><%=cnt %></td>
</tr>
</table>
</body>
</html>