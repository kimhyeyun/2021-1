<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductPage"%>
<%@page import="user.UserDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="user.UserDAO"%>
<%@page import="page.Page"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<%
	int pcode = -1;
	String title = null;
	
	if(request.getParameter("pcode") != null){
		pcode = Integer.parseInt(request.getParameter("pcode"));	
	}
	if(pcode == 1){
		title = "IPHONE";		
	}
	else if(pcode == 2){
		title = "AIRPODS";
	}
	else if(pcode == 3){
		title = "SMART TOK";
	}
	else{
		title = "KEYRING";
	}

%>
<title><%=title %></title>
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/product.css">
<link rel="stylesheet" href="css/normalpackage.css">

</head>
<body>
	<%
	ProductDAO dao = new ProductDAO();
	Page p = new Page();

	int totalcnt = dao.getTotalCnt(pcode);

	String userid = null;
	boolean admin = false;
	
	if(session.getAttribute("userid") != null){
		userid = (String)session.getAttribute("userid");
		UserDAO udao = new UserDAO();
		UserDTO dto = udao.getById(userid);
		if(dto.getAdmin() == 1)
			admin = true;
	}
	
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}

	p.setPageNo(pageNumber);
	p.setPageSize(5);
	p.setTotalCount(totalcnt);

	pageNumber = (pageNumber - 1) * 5;
	
	ProductPage pp = new ProductPage(pageNumber, p.getPageSize(), pcode);
	List<ProductDTO> list = dao.SearchAll(pp);
	
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
					<h2><%=title %></h2>
				</div>

				<div class="xans-element- xans-product xans-product-normalpackage ">
					<div
						class="xans-element- xans-product xans-product-listnormal ec-base-product">
						<ul class="prdList">
							<% 
								for (int i = 0; i < list.size(); i++) {
							%>
							<li class="xans-record-">
								<div class="thumbnail">
									<div class="prdImg">
										<a href="productDetail.jsp?pid=<%=list.get(i).getPid()%>">
											<img src=<%=list.get(i).getPimage() %> style="width: 300px;">
										</a>
									</div>
								</div>

								<div class="description">
									<strong class="name"> <a> <span
											style="font-size: 14px; color: #555555; font-weight: bold;">
												<%=list.get(i).getPname() %>
										</span>
									</a>
									</strong>
									<ul class="spec">
										<li><span
											style="font-size: 14px; color: #ff0000; font-weight: bold">
												KRW <%=list.get(i).getPprice()%>
										</span></li>
									</ul>

								</div>
							</li>
							<%
							}
							%> 
						</ul>

					</div>
				</div>
				<div class="pdiv">
					<%
					for (int i = p.getStartPageNo(); i <= p.getEndPageNo(); i++) {
					%>
					<ul class="pul">
						<li><a href="product.jsp?pcode=<%=pcode%>&pageNumber=<%=i%>"><%=i%></a></li>
					</ul>
					<%
					}
					%>
				</div>
				<% if(admin) {%>
					<a href="addProduct.jsp?pcode=<%=pcode %>" class="addprod">ADD PRODUCT</a>
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
</body>
</html>