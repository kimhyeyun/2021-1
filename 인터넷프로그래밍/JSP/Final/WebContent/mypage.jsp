<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">

<title>MYPAGE</title>

<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/mypage.css">

<%
	String userid = null;
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	}
%>

<script>
function userDelete(userid){
	if(confirm("정말 탈퇴하시겠습니까?")){
		location.href = "userInfoDelete";
	}
}
</script>


</head>
<body>
	<div class="wrap">
		<aside class="left">
			<h1 id="home">
				<a href="main.jsp"><img src="static/home.png"></a>
			</h1>
			<!-- 카테고리 -->
			<section id="category">
				<ul>
			<li style="margin-bottom: 10px;"><a href="main.jsp">HOME</a></li>
					<li style="margin-bottom: 10px;"><a href="product.jsp?pcode=1">IPHONE</a></li>
					<li style="margin-bottom: 10px;"><a href="product.jsp?pcode=2">AIRPODS</a></li>
					<li style="margin-bottom: 10px;"><a href="product.jsp?pcode=3">SMART
							TOK</a></li>
					<li style="margin-bottom: 10px;"><a href="product.jsp?pcode=4">KEYRING</a></li>
					<li style="margin-bottom: 10px;"><a href="qa.jsp">Q&A</a></li>
				</ul>
			</section>
		</aside>
		<aside id="right"></aside>

		<div class="container">
			<header>
				<div id="user">
					<ul>
						<%
						if (userid == null) {
						%>
						<li><a href="loginpage.jsp">로그인</a></li>
						<li><a href="joinform.jsp">회원가입</a></li>
						<%
						} else {
						%>
						<li><a href="logout.jsp">로그아웃</a>
						<li>
						<li><a href="mypage.jsp">마이페이지</a></li>
						<li><a href="cart.jsp">장바구니</a></li>
						<%
						}
						%>

					</ul>
				</div>
			</header>

			<div class="contents">
				<div class="titleArea">
					<h2>MYPAGE</h2>
				</div>

				<form id="myform" method="post" action="userInfoUpdate"
					name="userinfo">
					<div id="mydiv">
						<table border="1">
							<colgroup>
								<col style="width: 150px;">
								<col style="width: auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td><input id="userID" name="userid" type="text"
										value=<%=userid%> readonly="readonly"></td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td><input id="userPW" name="userpw" type="password" required="required"></td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td><input id="userName" name="username" type="text" required="required"></td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td><input id="userPhone" name="userphone" type="tel" required="required"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="infosub">
						<input type="submit" value="정보수정" class="btnmy"> 
						<a onclick="userDelete('<%=userid%>')" id="delbtn" style="cursor:pointer">회원탈퇴</a>
					</div>
				</form>
			</div>

			<footer>
				<div id="insta">
					<div class="titleArea">
						<h2>INSTAGRAM</h2>
						<p onclick="window.open('http://www.instagram.com/potato_yunn')">@potato_yun</p>
					</div>
				</div>
				<div id="f_menu">
					<span>ABOUT&nbsp;&nbsp;</span> <span>GUIDE&nbsp;&nbsp;</span> <span>AGREEMENT&nbsp;&nbsp;</span>
					<span>PRIVACY</span>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>