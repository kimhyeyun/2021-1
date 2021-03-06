<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>ADD PRODUCT</title>

<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/addprod.css">
</head>
<body>
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
						<li><a href="logout.jsp">로그아웃</a></li>
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
					<h2>ADD PRODUCT</h2>
				</div>

				<div>
					<form method="post" action="productAdd" id="addprodform" name="dto">
						<div class="table">
							<table>
								<tbody>
									<tr>
										<th scope="row">카테고리</th>
										<td><select name="pcode">
												<option value="1">IPHONE</option>
												<option value="2">AIRPODS</option>
												<option value="3">SMART TOK</option>
												<option value="4">KEYRING</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row">상품명</th>
										<td><input class="in" type="text" name="pname" required="required"></td>
									</tr>
									<tr>
										<th scope="row">상품금액</th>
										<td><input class="in" type="number" name="pprice" required="required"></td>
									</tr>
									<tr>
										<th scope="row">이미지 URL</th>
										<td><input class="in" type="text" name="pimage" required="required"></td>
									</tr>
									<tr>
										<td colspan="2">
											<div>
												<textarea style="width: 100%;" name="pcontent"required="required"></textarea>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<input type="submit" value="등록" id="subbtn">
					</form>
				</div>


			</div>

			<footer>
				<div id="insta">
					<div class="titleArea">
						<h2>INSTAGRAM</h2>
						<p onclick="window.open('http://www.instagram.com/potato_yunn')">@potato_yun</p>
					</div>
				</div>
				<div id="f_menu" style="font-size: 3px;">
					<span>ABOUT&nbsp;&nbsp;</span> <span>GUIDE&nbsp;&nbsp;</span> <span>AGREEMENT&nbsp;&nbsp;</span>
					<span>PRIVACY</span>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>