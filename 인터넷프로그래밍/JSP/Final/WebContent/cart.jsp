<%@page import="java.util.List"%>
<%@page import="cart.CartDTO"%>
<%@page import="cart.CartDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">

<title>CART</title>

<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/cart.css">


<%
	String userid = null;
	
	if(session.getAttribute("userid") != null){
		userid = (String)session.getAttribute("userid");
	}
	
	CartDAO dao = new CartDAO();
	List<CartDTO> list = dao.SearchAll(userid);
	int cnt = dao.totalCnt(userid);
	
	
%>
<script type="text/javascript">
	function cartDelete(pid){
		if(confirm("정말 삭제하시겠습니까?"))
			location.href = "cartDelete?pid="+pid;
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
			<div class="titleArea">
					<h2>CART</h2>
				</div>
				<div id="cartbox">
					<%  if(cnt == 0){ %>
						<p>장바구니가 비었습니다.</p>
					<%}else{ %>
						<table style="font-size: 10px;">
							<thead>
								<tr>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">판매가</th>
									<th scope="col">수량</th>
									<th scope="col">합계</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<%for(int i=0;i<list.size();i++){ %>
							<tbody>
								<tr>
									<td><img style="width: 80px;" src=<%=list.get(i).getPimage() %>></td>
									<td><%=list.get(i).getPname() %></td>
									<td>KRW <%=list.get(i).getPprice() %></td>
									<td><%=list.get(i).getCount() %></td>
									<td><%int c = list.get(i).getCount(); int p = list.get(i).getPprice();   %>KRW <%=c*p %></td>
									<td><a onclick="cartDelete(<%=list.get(i).getPid() %>)" id="delebtn">DELETE</a></td>							
							</tbody>
							<%} %>
						</table>
					<%} %>
				</div>
			
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