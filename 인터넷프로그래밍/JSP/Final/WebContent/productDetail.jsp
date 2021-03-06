<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String userid = null;
boolean admin = false;

if (session.getAttribute("userid") != null) {
	userid = (String) session.getAttribute("userid");
	UserDAO udao = new UserDAO();
	UserDTO dto = udao.getById(userid);
	if (dto.getAdmin() == 1)
		admin = true;
}

int pid = Integer.parseInt(request.getParameter("pid"));

ProductDAO dao = new ProductDAO();
ProductDTO dto = dao.SearchOne(pid);

pageContext.setAttribute("dto", dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>PRODUCT DETAIL</title>

<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/productDetail.css">

<script>
function prDelete(pid){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href = "productDelete?pid="+pid;
	}
}

function prCart(pid){
	if(confirm("장바구니에 담겠습니까?")){
		location.href = "cartAdd?pid="+pid;
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
				<div class="detailArea">
					<div id="imgArea">
						<img src="${dto.pimage }">
					</div>

					<div id="infoArea">
						<table>
							<tbody>
								<tr>
									<td colspan="2">
										<div class="optTit">
											<span style="font-size: 20px; color: #555555; font: bold;">${dto.pname }</span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="optTit">
											<span style="font-size: 15px; color: #ff0000;">판매가</span>
										</div>
										<div class="optCon">
											<span style="font-size: 15px; color: #ff0000;">KRW ${dto.pprice }</span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div>
											<span style="font-size: 16px;">${dto.pcontent }</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<a
							onclick="prCart('${dto.pid}')" 
							id="cartbtn">BASKET </a>
						<%
						if (admin) {
						%>
						<a onclick="prDelete('${dto.pid}')" id="removebtn">REMOVE
							PRODUCT</a>
						<%
						}
						%>
					</div>
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