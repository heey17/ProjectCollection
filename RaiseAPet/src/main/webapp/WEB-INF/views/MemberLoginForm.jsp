<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	table{
		border-collapse: collapse;
		margin: 0 auto;
		width : 470px
	}
	
	fieldset{
		border-top: 1px solid;
		border-left: none;
		border-right: none;
		border-bottom: none;
		border-color: #c886d1;
		top: 50%;
		left: 40.2%;
		position: relative;
	}
	
	legend{
		padding-left: 3%; 
		padding-right: 3%;
		font-size: 18px;
	}
	
	.all{
		text-align : center;
		margin-top: 11%
	}
	
	.input{
		width: 18%;
		height: 30px;
		margin: 3px 0;
		text-align: center;
		font-size: 15px;
		border-top: none;
		border-right: none;
		border-left: none;
		border-bottom: 1px solid;
		border-color: gray;
	}
	
	.btn{
		width: 18.5%;
		height: 30px;
		margin: 3px 0;
		text-align: center;
		border: none;
		font-size: 15px;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
	
	.btn2{
		width: 9%;
		height: 30px;
		margin: 3px 0;
		text-align: center;
		border: none;
		font-size: 13px;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
</style>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>

// 아이디 중복 확인
function loginCheck(){

	var userId = document.getElementById("userId").value;
	var userPw = document.getElementById("userPw").value;

	var confirmLoginCheck = document.getElementById("confirmLogin");

	$.ajax({
		type : "POST",
		url : "loginCheck",
		data : {"userId" : userId, "userPw" : userPw},

		// 성공 시
		success : function(data){
			if(data=="OK"){
				memberLogin.submit();
				
			} else{ // data=="NO"
				confirmLoginCheck.style.color = "#ff0000";
				confirmLoginCheck.innerHTML = "로그인에 실패했습니다. 다시 시도 해주세요.";
			}
		}, 

		// 실패 시
		error : function(){
			alert("idOverlap 함수 통신 실패");
			}
		}); // end Ajax
	} // end idOverlap
</script>
</head>
<body>
	<div class="all">
	<header>
		<div style="height:150px;  width:11.3%; margin:0 auto;">
			<a href="./" class="logo" style=" height: 100%; padding:0;">
				<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 100%;">
			</a>
		</div>	
	</header>
	<br>
	
	<form action="memberLogin" method="POST" name="memberLogin" id="memberLogin">
		<input type="text" class="input" name="userId" id="userId" placeholder="아이디" required="required" maxlength="15"><br>
		<input type="password" class="input" name="userPw" id="userPw" placeholder="비밀번호" required="required" maxlength="15"><br>
	</form>
	<button onclick="loginCheck()" class="btn">로그인</button><br>
	<span id="confirmLogin"></span><br>
	
	<fieldset style="width:18%;">
		<legend>또는</legend>
	</fieldset>
	
	<!-- SNS 계정으로 로그인 하기 start -->
	<a href="naverLogin"><img width="18.5%" src="resources/img/naverLogin.jpg"></a><br>
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=964cb0d4419ff73c619b3139a1a93c8f&redirect_uri=http://106.243.194.230:9092/project/login&response_type=code">
	<img width="18.5%" src="resources/img/kakaoLogin.jpg"></a><br>
	<!-- SNS 계정으로 로그인 하기 end --><br>
	
	<button class="btn2" onclick="location.href='memberJoinForm'">회원가입</button>&nbsp;
	<button class="btn2" onclick="location.href='memberFindForm'">아이디/비밀번호 찾기</button>&nbsp;
	</div>
</body>
</html>