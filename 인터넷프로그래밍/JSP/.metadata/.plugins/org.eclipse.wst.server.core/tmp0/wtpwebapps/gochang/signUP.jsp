<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>다 안나와 회원가입</title>
</head>
<body>


	<div class="container">
		<!-- 좌우측의 공간 확보 -->
		<!-- 헤더 들어가는 부분 -->

		<div class="row">
			<p></p>
			<div class="col-md-6">
				<a class="navbar-brand" href="main.jsp"><img id="dalogo"
					src="media/dalogo.jpg" alt="Logo" height="35px" /></a>
			</div>
		</div>
		<!--// 헤더 들어가는 부분 -->
		<!-- 모달창 -->
		<div class="modal fade" id="defaultModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">알림</h4>
					</div>
					<div class="modal-body">
						<p class="modal-contents"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<form class="form-horizontal" role="form" method="post"
			action="signUPAction.jsp">
			<!-- action="javascript:alert( 'success!' );" -->
			<div class="form-group" id="divId">
				<label for="inputId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-5">
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="id" data-rule-required="true" name="userID"
						placeholder="30자이내의 알파벳, 숫자만 입력 가능합니다." maxlength="30"> <span
						id="idSpan" style="color: #999; display: none"></span>
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-5">
					<input type="password" class="form-control" id="password"
						name="userPassword" data-rule-required="true" placeholder="비밀번호"
						maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-5">
					<input type="text" class="form-control onlyHangul" id="name"
						name="userName" data-rule-required="true"
						placeholder="한글만 입력 가능합니다." maxlength="15">
				</div>
			</div>

			<div class="form-group" id="divEmail">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-5">
					<input type="email" class="form-control" id="email"
						name="userEmail" data-rule-required="true" placeholder="이메일"
						maxlength="40">
				</div>
			</div>
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
					번호</label>
				<div class="col-lg-5">
					<input type="tel" class="form-control onlyNumber" id="phoneNumber"
						name="userPhonenum" data-rule-required="true"
						placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmailReceiveYn" class="col-lg-2 control-label">이메일
					수신여부</label>
				<div class="col-lg-10">
					<label class="radio-inline"> <input type="radio"
						id="emailReceiveYn" name="emailReceiveYn" value="Y" checked>
						동의합니다.
					</label> <label class="radio-inline"> <input type="radio"
						id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지
						않습니다.
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">SMS
					수신여부</label>
				<div class="col-lg-10">
					<label class="radio-inline"> <input type="radio"
						id="smsReceiveYn" name="smsReceiveYn" value="Y" checked>
						동의합니다.
					</label> <label class="radio-inline"> <input type="radio"
						id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지
						않습니다.
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>