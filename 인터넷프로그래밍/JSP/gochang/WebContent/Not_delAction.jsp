<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.Notice" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 동작</title>
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
		int ntID = 0;
		if(request.getParameter("ntID") != null) {
			ntID = Integer.parseInt(request.getParameter("ntID"));
		}
		if(ntID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 글입니다.')");
			script.println("location.href = 'Notice.jsp'");
			script.println("</script>");
		}
		Notice notice = new NoticeDAO().getNotice(ntID);
		if(!userID.equals(notice.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'Notice.jsp'");
			script.println("</script>");
		} else {
			NoticeDAO noticeDAO = new NoticeDAO();
			int result = noticeDAO.delete(ntID);
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('실패!')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'Notice.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>