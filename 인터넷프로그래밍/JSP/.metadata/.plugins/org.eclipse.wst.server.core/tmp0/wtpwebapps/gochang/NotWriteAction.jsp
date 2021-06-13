<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id ="notice" class="notice.Notice" scope="page" />
<jsp:setProperty name="notice" property="ntTitle" />
<jsp:setProperty name="notice" property="ntContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지작성 동작페이지</title>
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
		} else {
			if(notice.getNtTitle() == null || notice.getNtContent() == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('모든 정보를 입력하세요')");
					script.println("history.back()");
					script.println("</script>");
				} else{
					NoticeDAO noticeDAO = new NoticeDAO();
					int result = noticeDAO.write(notice.getNtTitle(), userID, notice.getNtContent());
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
						script.println("location.href = 'Notice.jsp'");
						script.println("</script>");
					}
					
				}
		}

	%>

</body>
</html>