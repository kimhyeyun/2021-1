<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Log-In</title>
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/login.css">
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
					<li style="margin-bottom: 10px;"><a href="product.jsp?gdCode=1">IPHONE</a></li>
					<li style="margin-bottom: 10px;"><a href="product.jsp?gdCode=2">AIRPODS</a></li>
					<li style="margin-bottom: 10px;"><a href="product.jsp?gdCode=3">SMART
							TOK</a></li>
					<li style="margin-bottom: 10px;"><a href="product.jsp?gdCode=4">KEYRING</a></li>
					<li style="margin-bottom: 10px;"><a href="qa.jsp">Q&A</a></li>
				</ul>
			</section>
		</aside>
		<aside id="right"></aside>

		<div class="container">
			<header>
				<div id="user">
					<ul>
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="joinform.jsp">회원가입</a></li>
					</ul>
				</div>
			</header>

			<div class="contents">
				<div class="titleArea">
					<h2>LOGIN</h2>
				</div>
				<form id="loginform" method="post" action="login">
					<div id="logdiv" style="text-align: center;">
						<fieldset>
							<label class="holder"> <input id="id" name="userid"
								type="text" class="form-control" placeholder="ID">
							</label> <label class="holder"> <input id="pw" name="userpw"
								type="password" class="form-control" placeholder="PASSWORD">
							</label> <label class="btnholder"> <input id="loginsub"
								type="submit" value="로그인">
							</label>
						</fieldset>
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