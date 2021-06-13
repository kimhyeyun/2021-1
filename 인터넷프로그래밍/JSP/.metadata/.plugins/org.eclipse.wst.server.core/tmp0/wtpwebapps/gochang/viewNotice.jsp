<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.Notice" %>
<%@ page import="notice.NoticeDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다 안나와-공지사항</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
      background-color:white;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }

  </style>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int ntID = 0;
	if(request.getParameter("ntID") != null) {
		ntID = Integer.parseInt(request.getParameter("ntID"));
	}
	if(ntID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'community.jsp'");
		script.println("</script>");
	}
	Notice notice = new NoticeDAO().getNotice(ntID);
%>

	<div class="jumbotron">
	  <div class="container-fluid">
	    <div style="float: left; margin-top: 15px; margin-left: 30px;">
	        <a href ="main.jsp"><img src="./media/dalogo.jpg" style="width:200px"></a>
	    </div>
	    <div style="float: left; margin-left: 300px; margin-top: 15px;">
        <form class="navbar-form" method="post" action="Search.jsp">
            <div class="form-group">
                <input type="text" class="form-control" name="keyWord" placeholder="내용을 입력하세요" style="width: 500px; height: 50px; border-radius: 40%; border-color: royalblue;">
            </div>
            <input type = "submit" class="btn btn-primary" value = "검색" style="border-radius: 40%">
        </form>
	    </div>
	    <%
    	if(userID == null) {
	    %>
	    <div style="float: right;">
	        <a href="signUP.jsp"><img src="./media/sign.jpg" style="width:70px;height:70px"></a>
	    </div>
	    <div style="float: right;">
	        <a href="login.jsp"><img src="./media/loginI.jpg" style="width:70px;height:70px"></a>
	    </div>
	    <%
	    	} else {
	    %>
	    <div style="float: right;">
	        <a href="logout.jsp"><img src="./media/logout.jpg" style="width:70px;height:70px"></a>
	    </div>
	    <%
	    	}
	    %>
	  </div>
	</div>
	
	<nav class="navbar navbar-default">
	  <div class="container-fluid" style="background-color: royalblue;">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a class="navbar-brand" href="#"style="color:white">------------</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li><a href="Com.jsp"style="color:white">컴퓨터/노트북</a></li>
	        <li><a href="Mobile.jsp"style="color:white">태블릿/모바일</a></li>
	        <li class="active"><a href="Notice.jsp"style="color:white;background-color:blue;">공지사항</a></li>
	        <li><a href="community.jsp"style="color:white">커뮤니티</a></li>
	        <%
        		if(userID != null && userID.equals("rhckdrnr123")) {
        	%>
        	<li><a href="Usermanage.jsp" style="color:white">회원관리</a></li>
        	<%
        		}
        	%>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#"style="color:white"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
	        <li><a href="#"style="color:white"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="contaniner" style="margin-left: 150px; margin-right: 150px;">
		<div class="row">
		
			<table class="table table-striped" style="text-align: center; border: 2px solid royalblue;">
				<thead>
					<tr>
						<th colspan = "3" style="background-color: #eeeeee; text-align: center;">공지사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">제목</td>
						<td colspan="2"><%= notice.getNtTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= notice.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= notice.getNtDate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height:200px; text-align:left;"><%= notice.getNtContent().replaceAll(" ", "&nbsp;").replaceAll("\n","<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="Notice.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(notice.getUserID())){
			%>
				<a href="Not_update?ntID=<%= ntID %>" class="btn btn-primary">수정</a>
				<a href="Not_delAction.jsp?ntID=<%= ntID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>