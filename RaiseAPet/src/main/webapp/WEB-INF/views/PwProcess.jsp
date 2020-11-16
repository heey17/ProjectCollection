<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
		margin: 0 auto; /* 가운데 정렬 */
		text-align : center;
	}
	
	.all{
		text-align : center;
		margin-top: 13%;
		font-size: 16px
	}

	.input{
		width: 95%;
		height: 20px;
		margin: 3px 0;
		text-align: center;
		font-size: 15px;
		border-top: none;
		border-right: none;
		border-left: none;
		border-bottom: 1px solid;
		border-color: gray;
		margin-bottom: 5px;
	}
	
	.btn{
		width: 95%;
		height: 25px;
		margin: 3px 0;
		text-align: center;
		border: none;
		border-radius: 12px;
		background-color: #f3d4ff;
		font-size: 15px
	}
	
	.btn2{
		width: 46%;
		height: 25px;
		margin: 3px 0;
		text-align: center;
		border: none;
		border-radius: 12px;
		background-color: #f3d4ff;
		font-size: 15px
	}
</style>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>
	// 비밀번호 작성 후 확인 버튼 눌렀을 때
	function newPassword(){
		alert("비밀번호가 수정 되었습니다");
		newPassword.submit();
	}

	// 비밀번호 확인
	$(function(){
		$('#userPwConfirm').blur(function(){
			  if($('#userPw').val() != $('#userPwConfirm').val()){
			    if($('#userPwConfirm').val()!=''){
				   alert("비밀번호가 일치하지 않습니다.");
			    	  $('#userPwConfirm').val(''); // 비밀번호가 일치하지 않으면 userPwConfirm의 값을 비운다.
			         $('#userPwConfirm').focus(); 
			      }
			   }
		})  	   
	});

	// 비밀번호 정규식 검사
	function pwCheck(){
		var pw = $("input[name=userPw]").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(pw.length < 2 || pw.length > 16){
			alert("3자리 ~ 15자리 이내로 입력해주세요.");
			$("input[name=userPw]").val('');
			$("input[name=userPw]").focus();
			// 비밀번호가 정규식에 포함 되지 않았을 경우 focus와 val를 설정하여 다른 곳으로 갈 수 없도록 함.
			return false;
		}else if(pw.search(/\s/) != -1){
			alert("비밀번호는 공백 없이 입력해주세요.");
			$("input[name=userPw]").val('');
			$("input[name=userPw]").focus();
			return false;
		}else if(num < 0 || eng < 0 || spe < 0 ){
			alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			$("input[name=userPw]").val('');
			$("input[name=userPw]").focus();
			return false;
		}else {
			return true;
		}
	}
</script>
</head>
<body>
	<div class="all">
	<header>
		<div style="height:150px;  width:15%; margin:0 auto;">
		<a href="./" class="logo" style=" height: 100%; padding:0;">
				<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 100%;">
			</a>
		</div>	
	</header>
	<br>
	<form action="newPassword" method="POST" name="newPassword">
		<table>
			<tr>
				<td>
					<input type="password" class="input" name="userPw" id="userPw" placeholder="새비밀번호 (필수)" onchange="pwCheck()" required="required" maxlength="15"><br>
					<small>(영문, 숫자, 특수문자를 혼합하여 15자리 이내)</small><br>
					<input type="password" class="input" name="userPwConfirm" id="userPwConfirm" placeholder="새비밀번호 확인 (필수)" required="required" maxlength="15"><br>
					<button class="btn" onclick="newPassword()">수정</button>
					
					<br><br>
					
					<button class="btn2" onclick="location.href='memberLoginForm'">로그인</button>&nbsp;
					<button class="btn2" onclick="location.href='memberJoinForm'">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>