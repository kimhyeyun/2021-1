
<%@page import="comment.CommentDTO"%>
<%@page import="comment.CommentDAO"%>
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
<link rel="stylesheet" href="css/qadetail.css">

<script type="text/javascript">
	function qaDelete(qid,quserid){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "qaDelete?qid="+qid+"&quserid="+quserid;
		}
	}
</script>

</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	QaDAO dao = new QaDAO();
	Page p = new Page();

	int totalcnt = dao.getTotalCnt();

	String userid = null;
	boolean admin = false;
	
	if(session.getAttribute("userid") != null){
		userid = (String)session.getAttribute("userid");
		UserDAO udao = new UserDAO();
		UserDTO dto = udao.getById(userid);
		if(dto.getAdmin() == 1)
			admin = true;
	}
	
	int qid = -1;
	qid = Integer.parseInt(request.getParameter("qid"));
	
	QaDTO q = dao.SearchOne(qid);
	
	pageContext.setAttribute("q", q);
	
	CommentDAO cdao = new CommentDAO();
	int cnt = cdao.TotalCnt(qid);
	
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
					<table>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>${q.qtitle }</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>${q.userid }</td>
							</tr>
							<tr>
								<td colspan="2">
									<ul class="etcArea">
										<li>
											<strong>작성일</strong>
											<span class="txtNum">
											<%
												Timestamp timestamp = q.getQdate();
												SimpleDateFormat ConTimeFormat = new SimpleDateFormat("yyyy-MM-dd");
											%>
											<%=ConTimeFormat.format(timestamp) %>
											</span>
										</li>
									</ul>
									<div class="detail">
										${q.qcontent }
									</div>
						</tbody>
					</table>
				</div>

				<a onclick="qaDelete('${q.qid}','${q.userid }')" id="removebtn" >DELETE</a>
	
				
				<div id="cdiv" style="margin-top: 100px;">
				<%if(cnt > 0){ 
					List<CommentDTO> list = cdao.SearchAll(qid);
				%>
				<div id="clist">
					<%for(int i=0;i<list.size();i++){ %>
					<ul id="cul" style="-webkit-padding-start:0px;">
						<li>
							<div class="commentTop">
								<strong class="name"><%=list.get(i).getUserid() %></strong>
								<span class="date">
									<%
										timestamp = list.get(i).getCdate();
									%>
									<%=ConTimeFormat.format(timestamp) %>
								</span>
							</div>
							<span class="btn">
								<a href="deleteComment?cid=<%=list.get(i).getCid()%>&qid=<%=qid%>&userid=<%=list.get(i).getUserid()%>">삭제</a>
							</span>
							<div class="comment_div">
								<span id="comment_content"><%=list.get(i).getCcontent() %></span>
							</div>
						</li>
					</ul>
					<%} %>
				</div>
				<%} %>
				<div style="background: #f9f9f9;padding: 10px;">
					<form action="addComment?qid=<%=qid %>" method="post">
						<p id="fp"><span>이름 :</span><input id="comment_name" value=<%=userid %> name="userid" readonly="readonly"></p>
						<div class="comment_view">
							<textarea id="comment" name="ccontent" ></textarea>
							<input type="submit" id="csub" value="확인">
						</div>
					</form>
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
				<div id="f_menu">
					<span>ABOUT&nbsp;&nbsp;</span> <span>GUIDE&nbsp;&nbsp;</span> <span>AGREEMENT&nbsp;&nbsp;</span>
					<span>PRIVACY</span>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>