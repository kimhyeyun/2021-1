<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 하세요</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int bdID = 0;
		if(request.getParameter("bdID") != null) {
			bdID = Integer.parseInt(request.getParameter("bdID"));
		}
		if(bdID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 글입니다.')");
			script.println("location.href = 'community.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(bdID);
		if(!userID.equals(board.getUserID()) && !userID.equals("rhckdrnr123")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'community.jsp'");
			script.println("</script>");
		} else {
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.delete(bdID);
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
				script.println("location.href = 'community.jsp'");
				script.println("</script>");
			}
		}
		
		
	%>

</body>
</html>