<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
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
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	String keyWord = null;
	if(request.getParameter("keyWord") != null) {
		keyWord = (String) request.getParameter("keyWord");
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
			<table class="table table-striped" style="text-align: center; border: 2px solid royalblue">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">올린 날짜</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> list = boardDAO.getSearchlist(keyWord);
						for(int i = 0; i < list.size(); i++)
						{
					%>
					<tr>
						<td><%= list.get(i).getBdID() %></td>
						<td><a href="view.jsp?bdID=<%= list.get(i).getBdID() %>"><%= list.get(i).getBdTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBdDate() %></td>
					</tr>
					<%		
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {	
			%>
				<a href="Search.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(boardDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="Search.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href="com_write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<footer style="background-color: white; color: #bbbbbb">
		<div class="container">
			<br>
			<div class="row">
				<p style="width: 800px">
					<img src="media/dalogo.jpg" height="35px">
				</p>
				<p style="width: 800px;">
					<a href="#" role="button" aria-expanded="false"
						style="color: #bbbbbb; text-decoration: none">Privacy Policy</a>&nbsp;&nbsp;
					|&nbsp;&nbsp; <a href="#" role="button" aria-expanded="false"
						style="color: #bbbbbb; text-decoration: none">Legal Info</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="#" role="button" aria-expanded="false"
						style="color: #bbbbbb; text-decoration: none">Contact Us</a><br>
				</p>
				<p style="width: 800px;">
					<small>Copyright &copy; daannawa Corporation</small>
				</p>
				<br> <br>
			</div>
		</div>
	</footer>
</body>
</html>