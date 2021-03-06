<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">

<title>YUN CASE</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/main.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<%
	String userid = null;
	boolean admin = false;
	
	if(session.getAttribute("userid") != null){
		userid = (String)session.getAttribute("userid");
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.getById(userid);
		if(dto.getAdmin() == 1)
			admin = true;
	}
%>


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
						<%if(userid == null){ %>
							<li><a href="loginpage.jsp">로그인</a></li>
							<li><a href="joinform.jsp">회원가입</a></li>							
						<%}else{ %>
							<li><a href="logout.jsp">로그아웃</a><li>
							<li><a href="mypage.jsp">마이페이지</a></li>
							<li><a href="cart.jsp">장바구니</a></li>
						<%} %>
					</ul>
				</div>
			</header>

			<div class="contents">
			
				<%if(!admin){ %>
				<section id="banner">

					<div id="big">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="static/banner/big1.jpg">
								</div>

								<div class="item">
									<img src="static/banner/big2.jpg">
								</div>

								<div class="item">
									<img src="static/banner/big3.jpg">
								</div>

								<div class="item">
									<img src="static/banner/big4.jpg">
								</div>
							</div>
						</div>
					</div>

					<div id="mini">
						<ul>
							<li><img src="static/banner/mini1.jpg"></li>
							<li><img src="static/banner/mini2.jpg"></li>
						</ul>
					</div>
				</section>
				<%}else{ %>
				<div class="titleArea">
					<h2>ADMIN</h2>
				</div>
				<%} %>
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
	<script>
		$(function() {
			// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
			$('#myCarousel').carousel({
				// 슬리아딩 자동 순환 지연 시간
				// false면 자동 순환하지 않는다.
				interval : 2000,
				// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
				wrap : true,
			});
		});
	</script>
</body>
</html>