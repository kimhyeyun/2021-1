<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 삭제동작</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null || !userID.equals("rhckdrnr123")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		} 
		String DuserID = null;
		if(request.getParameter("DuserID") != null) {
			DuserID = (String) request.getParameter("DuserID");
		}
		if(DuserID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는회원입니다.')");
			script.println("location.href = 'Usermanage.jsp'");
			script.println("</script>");
		}
		if(userID == null && !userID.equals("rhckdrnr123")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'community.jsp'");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.delete(DuserID);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('실패!')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제되었습니다.')");
				script.println("location.href = 'Usermanage.jsp'");
				script.println("</script>");
			}
		}
		
		
	%>

</body>
</html>