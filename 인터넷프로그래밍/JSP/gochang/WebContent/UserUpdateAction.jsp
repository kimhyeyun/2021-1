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
<title>회원정보 수정동작</title>
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
		String RuserID = null;
		if(request.getParameter("userID") != null) {
			RuserID = (String) request.getParameter("userID");
		}
		if(RuserID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 회원입니다.')");
			script.println("location.href = 'Usermanage.jsp'");
			script.println("</script>");
		}
		if(request.getParameter("userPassword") == null || request.getParameter("userName") == null || request.getParameter("userPhonenum") == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 정보를 입력하세요')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				UserDAO userDAO = new UserDAO();
				int result1 = userDAO.updatePassword(RuserID, request.getParameter("userPassword"));
				int result2 = userDAO.updateName(RuserID, request.getParameter("userName"));
				int result3 = userDAO.updatePhonenum(RuserID, request.getParameter("userPhonenum"));
				if(result1 == -1 || result2 == -1 || result3 == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('실패!')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정완료')");
					script.println("location.href = 'Usermanage.jsp'");
					script.println("</script>");
				}
				
			}
		
		
		
	%>

</body>
</html>