<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Compute.jsp</title>
</head>
<body>
<%String word = request.getParameter("word"); %>

<h>(Get the input message): <%=word %></h><p>
<h>(The length of the message): <%=word.length() %></h><p>

<%
	for(int i=1;i<=word.length();i++){
		out.print(i+" ");
		for(int j=0;j<i;j++){
			out.print("* ");
		}
		out.println("<p>");
	}
%>

</body>
</html>