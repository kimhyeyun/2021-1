
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="qa.QaDTO"%>
<%@page import="java.util.List"%>
<%@page import="qa.QaPage"%>
<%@page import="user.UserDTO"%>
<%@page import="qa.QaDAO"%>
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

<title>REVIEW</title>
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/qa.css">

</head>
<body>
	<%
	QaDAO dao = new QaDAO();
	Page p = new Page();

	int totalcnt = dao.getTotalCnt();

	String userid = null;
	boolean admin = false;

	if (session.getAttribute("userid") != null) {
		userid = (String) session.getAttribute("userid");
		UserDAO udao = new UserDAO();
		UserDTO dto = udao.getById(userid);
		if (dto.getAdmin() == 1)
			admin = true;
	}

	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}

	p.setPageNo(pageNumber);
	p.setPageSize(10);
	p.setTotalCount(totalcnt);

	pageNumber = (pageNumber - 1) * 10;

	QaPage qp = new QaPage(pageNumber, p.getPageSize());
	List<QaDTO> list = dao.SearchAll(qp);
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
					<h2>Q&A</h2>
				</div>

				<div id="qabox">
					<%
					if (totalcnt == 0) {
					%>
					<p>게시물이 없습니다.</p>
					<%
					} else {
					%>
					<table>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col" style="width:50%;">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<%
							int admincnt = 0;
							int adcnt = 0;
							int pno = 0;
		
							if(request.getParameter("adcnt") != null){
								adcnt = Integer.parseInt(request.getParameter("adcnt"));
							}
							if(request.getParameter("pno") != null){
								pno = Integer.parseInt(request.getParameter("pno"));
							}
							if(pageNumber == 0){
								admincnt = 0;
								pno = 0;
							}
							
							for (int i = 0, j = pno*10-adcnt+1 ; i < list.size(); i++){
							%>
							<tr style="background-color: #ffffff; color: #777777">
								<td>
									<%
									if (list.get(i).getAdmin() == 1) {
									%>
									<p style="color: red;">공지</p> 
									<% admincnt++;	} else {%> <%=j++%> <% }%>
								</td>
								<td style="text-align: left; padding-left: 10px;"><a
									href="qaDetail.jsp?qid=<%=list.get(i).getQid() %>"> <%=list.get(i).getQtitle() %> </a></td>
								<td><%=list.get(i).getUserid() %> <%
								Timestamp timestamp = list.get(i).getQdate();
								SimpleDateFormat ConTimeFormat = new SimpleDateFormat("yyyy-MM-dd");
								%></td>
								<td><%=ConTimeFormat.format(timestamp) %></td>
							</tr>
							<%} %>
						</tbody>
					</table>
					<div class="pdiv">
						<%
					for (int i = p.getStartPageNo(); i <= p.getEndPageNo(); i++) {
					%>
						<ul class="pul">
							<li><a href="qa.jsp?&pageNumber=<%=i%>&adcnt=<%=admincnt%>&pno=<%=pno++%>"><%=i%></a></li>
						</ul>
						<%
						}
						%>
					</div>
					<%} %>
				</div>

				<% if(admin) {%>
				<a href="addQa.jsp" id="writeadbtn">WRITE NOTICE</a>
				<%}else{ %>
				<a href="addQa.jsp" id="writebtn" style="width: 150px;">WRITE QUESTION</a>
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