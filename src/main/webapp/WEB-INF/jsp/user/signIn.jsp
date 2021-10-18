<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 게시판 - 로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="content d-flex justify-content-center align-items-center">
			<div class="login-box">
				<h1>로그인</h1>
				<form id="loginForm">
					<input type="text" id="loginIdInput" class="form-control" placeholder="아이디를 입력하세요">
					<input type="password" id="passwordInput" class="form-control mt-2" placeholder="비밀번호를 입력하세요">
					<input type="submit" class="btn btn-primary btn-block mt-2" value="로그인">
				</form>
				<div class="text-right mt-2">
					<a href="/user/signup_view">회원가입</a>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
		$(document).ready(function() {
			
			$("#loginForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력해주세요");
					return ;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력해주세요");
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/memoList_view";
						} else {
							alert("아이디 비밀번호를 확인하세요");
						}
					}
					, error:function(e) {
						alert("로그인실패");
					}
				});
			});
		});
	
	</script>
</body>
</html>