<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다 안나와-게시판</title>
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
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
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
	}
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
	    <div style="float: right;">
	        <a href="logout.jsp"><img src="./media/logout.jpg" style="width:70px;height:70px"></a>
	    </div>
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
	        <li><a href="Notice.jsp"style="color:white">공지사항</a></li>
	        <li class="active"><a href="community.jsp"style="color:white;background-color:blue;">커뮤니티</a></li>
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
			<form method="post" action="update?bdID=<%= bdID %>">
				<table class="table table-striped" style="text-align: center; border: 2px solid royalblue;">
					<thead>
						<tr>
							<th colspan = "2" style="background-color: #eeeeee; text-align: center;">게시글 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder ="글 제목" name="bdTitle" maxlength="50" value="<%= board.getBdTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder ="글 내용" name="bdContent" maxlength="2048" style ="height:350px;"><%= board.getBdContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type = "submit" class="btn btn-primary pull-right" value = "수정하기">
			</form>
		</div>
	</div>
</body>
</html>