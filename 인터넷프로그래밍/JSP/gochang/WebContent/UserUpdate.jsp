<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다 안나와-회원관리</title>
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
	if(userID == null || !userID.equals("rhckdrnr123")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	String RuserID = null;
	if(request.getParameter("RuserID") != null) {
		RuserID = (String) request.getParameter("RuserID");
	}
	if(RuserID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('없는 회원입니다.')");
		script.println("location.href = 'Usermanage.jsp'");
		script.println("</script>");
	}
	User user = new UserDAO().getID(RuserID);
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
	        <li><a href="community.jsp"style="color:white">커뮤니티</a></li>
	        <%
        		if(userID != null && userID.equals("rhckdrnr123")) {
        	%>
        	<li class="active"><a href="Usermanage.jsp" style="color:white;background-color:blue;">회원관리</a></li>
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
	<div class="contaniner" style="margin-left: 500px; margin-right: 500px;">
		<div class="row">
			<form method="post" action="UserUpdateAction.jsp?userID=<%= user.getUserID() %>">
				<table class="table table-striped" style="text-align: center; border: 2px solid royalblue;">
					<thead>
						<tr>
							<th colspan = "2" style="background-color: #eeeeee; text-align: center;">회원정보 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>아이디</td>
							<td style="text-align:left"><%= user.getUserID() %></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="text" class="form-control" placeholder ="비밀번호" name="userPassword" maxlength="30" value="<%= user.getUserPassword() %>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" class="form-control" placeholder ="이름" name="userName" maxlength="30" value="<%= user.getUserName() %>"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" class="form-control" placeholder ="전화번호" name="userPhonenum" maxlength="30" value="<%= user.getUserPhonenum() %>"></td>
						</tr>
						
					</tbody>
				</table>
				<input type = "submit" class="btn btn-primary pull-right" value = "수정하기">
			</form>
		</div>
	</div>
</body>
</html>