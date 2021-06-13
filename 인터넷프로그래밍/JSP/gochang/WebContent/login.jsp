<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 하세요</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<br>
					<h1>
						<a href="main.jsp"><img src="media/dalogo.jpg"
							height=100px></a>
					</h1>
					<br> <br> <br>
					<form class="form-horizontal" role="form" method="post"
						action="login">
						<div class="form-group form-group-lg" id="inputId">
							<input type="text" class="form-control" id="id" name="userID"
								placeholder="아이디" maxlength="20"> <span
								class="text-left" id="idSpan" style="color: red; display: none"></span>
						</div>
						<div class="form-group form-group-lg" id="inputPw">
							<input type="password" class="form-control" id="password"
								name="userPassword" placeholder="비밀번호" maxlength="30"> <span
								class="text-left" id="pwSpan" style="color: red; display: none"></span>
						</div>
						<span class="text-left" id="loginSpan"
							style="color: red; display: none"></span> <br>
						<div class="form-group">
							 <input type="submit"
								class="btn btn-primary form-control btn-lg btn-login-submit btn-block m-t-md"
								value="로그인" />
						</div>

						<div class="form-group">
							<a href="signUP.jsp"
								class="btn btn-default btn-lg btn-block m-t-md"> 회원가입</a>
						</div>
						<hr />
					</form>
					<br> <br> <br> <br>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>