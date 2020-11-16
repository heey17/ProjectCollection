<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<style>
	hr{
		height : 5px;
		border : 0;
		box-shadow : 0 10px 10px -10px #c886d1 inset;
	}
	
	.all{
		text-align : center;
		margin-top: 11%;
		font-size: 16px
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
		border-radius: 12px;
		background-color: #f3d4ff;
		font-size: 15px
	}
	
	.btn2{
		width: 9%;
		height: 30px;
		margin: 3px 0;
		text-align: center;
		border: none;
		border-radius: 12px;
		background-color: #f3d4ff;
		font-size: 15px
	}
</style>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<!-- 아이디/비밀번호 찾기 - 아이디 or 비밀번호 선택 start -->
<script>
	// 비밀번호 찾기
	function pwFind(){
		var output = "<div>";
		output += "이메일 <input type='radio' name='pwFind' value='phoneFind' checked='checked' onclick='emailPwCheck()'>&nbsp;";
		output += "전화번호 <input type='radio' name='pwFind' value='emailFind' onclick='phonePwCheck()'><br>";
		output += "<input type='text' id='userId' class='input' name='userId' placeholder='아이디 (필수)' maxlength='15'><br>";
		output += "<input type='text' id='userName' class='input' name='userName' placeholder='이름 (필수)' maxlength='5'><br>";
		output += "<div id='confirmDiv'>";
		output += "<input type='email' id='userEmail' class='input' name='userEmail' placeholder='이메일 (필수)' maxlength='50'><br>";
		output += "<button class='btn' onclick='pwFindOverlapEmail()'>인증번호 발송</button><br>";
		output += "<input type='text' id='keyConfirm' class='input' name='keyConfirm' onchange='keyConfirmEmail()' placeholder='인증번호 (필수)' maxlength='5'><br>";
		output += "<span id='keyConfirmSpan'></span><br>";
		output += "<input type='button' class='btn' onclick='pwProcess()' value='비밀번호 찾기'>";
		output += "</div>";
		output += "</div>";
		$("#idOrPwFindDiv").html(output);
	}

	// 아이디 찾기
	function idFind(){
		var output = "<div>";
		output += "<input type='text' id='userName' class='input' name='userName' placeholder='이름 (필수)' maxlength='3'><br>";
		output += "<input type='email' id='userEmail' class='input' name='userEmail' placeholder='이메일 (필수)' maxlength='50'><br>";
		output += "<span id='idFindResult'></span><br>";
		output += "<button class='btn' onclick='idFindOverlap()'>아이디 찾기</button>";
		output += "</div>";
		$("#idOrPwFindDiv").html(output);
	}

	// 비밀번호 찾기 -> 전화번호 본인인증 
	function phonePwCheck(){
		var output = "<div>";
		output += "<input type='text' id='userPhone' class='input' name='userPhone' placeholder='전화번호 (필수)' maxlength='11'><br>";
		output += "<button class='btn' onclick='pwFindOverlapPhone()'>인증번호 발송</button><br>";
		output += "<input type='text' id='keyConfirm' class='input' name='keyConfirm' onchange='keyConfirmPhone()' placeholder='인증번호 (필수)' maxlength='6'><br>";
		output += "<span id='keyConfirmSpan'></span><br>";
		output += "<input type='button' class='btn' onclick='pwProcess()' value='비밀번호 찾기'>";
		output += "</div>";
		$("#confirmDiv").html(output);
	}

	// 비밀번호 찾기 -> 이메일 본인인증
	function emailPwCheck(){
		var output = "<div>";
		output += "<input type='email' id='userEmail' class='input' name='userEmail' placeholder='이메일 (필수)' maxlength='50'><br>";
		output += "<button class='btn' onclick='pwFindOverlapEmail()'>인증번호 발송</button><br>";
		output += "<input type='text' id='keyConfirm' class='input' name='keyConfirm' onchange='keyConfirmEmail()' placeholder='인증번호 (필수)' maxlength='5'><br>";
		output += "<span id='keyConfirmSpan'></span><br>";
		output += "<input type='button' class='btn' onclick='pwProcess()' value='비밀번호 찾기'>";
		output += "</div>";
		$("#confirmDiv").html(output);
	}

	// 비밀번호 찾기 인증번호 확인 후 비밀번호 수정 jsp로 이동
	function pwProcess(){

		var userId = document.getElementById("userId").value;
		var userName = document.getElementById("userName").value;
		var keyConfirm = document.getElementById("keyConfirm").value;
		// 아이디, 이름, 인증번호의 value를 가져와서

		if(userId != "" && userName != "" && keyConfirm != ""){ // value에 값이 있을 경우 ("")
			location.href="pwProcessForm";
		}else{ // value에 값이 없을 경우 ("")
			alert("정보를 입력 후 다시 시도 해주세요");
		}
	}
</script>
<!-- 아이디/비밀번호 찾기 - 아이디 or 비밀번호 선택 end -->

<!-- 아이디/비밀번호 찾기  ajax start -->
<script>
	function idFindOverlap(){

		var userName = document.getElementById("userName").value;
		var userEmail = document.getElementById("userEmail").value;
		var idFindResult = document.getElementById("idFindResult");

		$.ajax({
			type : "POST", // POST 방식으로
			url : "idfindoverlap",
			data : {"userName" : userName, "userEmail" : userEmail},

			// 성공 시
			// } 지웠다가 다시 쓰기
			success : function(data){
				if(data=="OK"){
					idFindResult.innerHTML = "회원님의 아이디는 " + "${userIdFindResult}" + "입니다.";
					idFindResult.style.color = "#00ff00";
				} else{
					idFindResult.innerHTML = "등록 되어 있지 않은 회원입니다.";
					idFindResult.style.color = "#ff0000";
					document.getElementById('userName').value = '';
					document.getElementById('userEmail').value = '';
					}
				}, 

			// 실패 시
			error : function(){
				alert("idFindOverlap 함수 통신 실패");
				}
			}); // end Ajax
		} // end idFindOverlap

	// 회원이 있는 지 확인 - 이메일
	function pwFindOverlapEmail(){

		var userEmail = document.getElementById("userEmail").value;
		var userName = document.getElementById("userName").value;
		var userId = document.getElementById("userId").value;

		$.ajax({
			type : "POST", // POST 방식으로
			url : "pwfindoverlapemail",
			data : {"userName" : userName, "userEmail" : userEmail, "userId" : userId},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					// OK가 왔다는 건 회원이 있다는 거니까 메일을 발송 해야 함.
					alert("인증번호가 발송 되었습니다. 메일 확인 후 인증번호를 작성 해주세요");
					pwFindEmail();
					// 비밀번호 찾기 이메일 발송 controller로 이동
				} else{
					alert("회원이 아니거나 정보를 잘못 입력 하셨습니다. 다시 입력 해주세요");
					document.getElementById('userId').value = '';
					document.getElementById('userName').value = '';
					document.getElementById('userEmail').value = '';
					}
				}, 

			// 실패 시
			error : function(){
				alert("pwFindOverlap 함수 통신 실패");
				}
			}); // end Ajax
		} // end pwFindOverlap

	// 회원이 있는 지 확인
	function pwFindOverlapPhone(){

		var userPhone = document.getElementById("userPhone").value;
		var userName = document.getElementById("userName").value;
		var userId = document.getElementById("userId").value;

		$.ajax({
			type : "POST", // POST 방식으로
			url : "pwfindoverlapphone",
			data : {"userName" : userName, "userPhone" : userPhone, "userId" : userId},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					// OK가 왔다는 건 회원이 있다는 거니까 메일을 발송 해야 함.
					alert("인증번호가 발송 되었습니다. 문자 확인 후 인증번호를 작성 해주세요");
					pwFindPhone();
					// 비밀번호 찾기 이메일 발송 controller로 이동
				} else{
					alert("회원이 아니거나 정보를 잘못 입력 하셨습니다. 다시 입력 해주세요");
					document.getElementById('userId').value = '';
					document.getElementById('userName').value = '';
					document.getElementById('userEmail').value = '';
					}
				}, 

			// 실패 시
			error : function(){
				alert("pwFindOverlap 함수 통신 실패");
				}
			}); // end Ajax
		} // end pwFindOverlap

	// 비밀번호 찾기 이메일 발송
	function pwFindEmail(){

		$.ajax({
			type : "POST", // POST 방식으로
			url : "pwFindEmail",
			data : {},

			// 성공 시
			success : function(data){
				if(data=="OK"){
				} else{
					}
				}, 

			// 실패 시
			error : function(){
				alert("pwFindEmail 함수 통신 실패");
				}
			}); // end Ajax
		} // end pwFindEmail

	// 비밀번호 찾기 전화번호 전송
	function pwFindPhone(){

		var userPhone = document.getElementById("userPhone").value;
			
		$.ajax({
			type : "POST", // POST 방식으로
			url : "pwFindPhone",
			data : {"userPhone" : userPhone},

			// 성공 시
			success : function(data){
				if(data=="OK"){
				} else{
					}
				}, 

			// 실패 시
			error : function(){
				alert("pwFindEmail 함수 통신 실패");
				}
			}); // end Ajax
		} // end pwFindEmail		
</script>
<!-- 아이디/비밀번호 찾기 ajax end -->

<!-- 비밀번호 찾기 - 인증번호 같은 지 확인 start -->
<script>
	function keyConfirmEmail(){
		
		var keyConfirm = document.getElementById("keyConfirm").value;
		// 회원이 인증번호를 받고 작성한 거
		
		var keyConfirmSpan = document.getElementById("keyConfirmSpan");
		// 인증번호가 일치 하는 지 불일치 하는 지 출력 할 span 부분

		$.ajax({
			type : "POST", // POST 방식으로
			url : "keyConfirmEmail",
			data : {"keyConfirm" : keyConfirm},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					keyConfirmSpan.style.color = "#00ff00";
					keyConfirmSpan.innerHTML = "인증번호가 일치합니다";
				} else{
					keyConfirmSpan.style.color = "#ff0000";
					document.getElementById('keyConfirm').value = '';
					document.getElementById('keyConfirm').focus();
					keyConfirmSpan.innerHTML = "인증번호가 일치하지 않습니다.";
					}
				}, 

			// 실패 시
			error : function(){
				keyConfirmSpan.style.color = "#ff0000";
				document.getElementById('keyConfirm').value = '';
				document.getElementById('keyConfirm').focus();
				keyConfirmSpan.innerHTML = "인증번호가 일치하지 않습니다.";
				}
			}); // end Ajax
		} // end keyConfirm

	function keyConfirmPhone(){
			
		var keyConfirm = document.getElementById("keyConfirm").value;
		// 회원이 인증번호를 받고 작성한 거
			
		var keyConfirmSpan = document.getElementById("keyConfirmSpan");
		// 인증번호가 일치 하는 지 불일치 하는 지 출력 할 span 부분

		$.ajax({
			type : "POST", // POST 방식으로
			url : "keyConfirmPhone",
			data : {"keyConfirm" : keyConfirm},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					keyConfirmSpan.style.color = "#00ff00";
					keyConfirmSpan.innerHTML = "인증번호가 일치합니다";
				} else{
					keyConfirmSpan.style.color = "#ff0000";
					document.getElementById('keyConfirm').value = '';
					document.getElementById('keyConfirm').focus();
					keyConfirmSpan.innerHTML = "인증번호가 일치하지 않습니다.";
					}
				}, 

			// 실패 시
			error : function(){
				keyConfirmSpan.style.color = "#ff0000";
				document.getElementById('keyConfirm').value = '';
				document.getElementById('keyConfirm').focus();
				keyConfirmSpan.innerHTML = "인증번호가 일치하지 않습니다.";
				}
			}); // end Ajax
		} // end keyConfirm
</script>
<!-- 비밀번호 찾기 - 인증번호 같은 지 확인 end -->
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
	
	<!-- 아이디/비밀번호 찾기 div start -->
	<div id="findDiv">
		아이디 찾기 <input type="radio" name="userFind" checked="checked" onclick="idFind()"> 
		비밀번호 찾기 <input type="radio" name="userFind" onclick="pwFind()"><br><br>
		
		<!-- 아이디 찾기 div start -->
		<div id="idOrPwFindDiv">
			<input type="text" id="userName" class="input" name="userName" placeholder="이름 (필수)" maxlength="5"><br>
			<input type="email" id="userEmail" class="input" name="userEmail" placeholder="이메일 (필수)" maxlength="50"><br>
			<span id="idFindResult"></span><br>
			<button class="btn" onclick="idFindOverlap()">아이디 찾기</button>
			<!-- ajax로 조회 해온 회원의 아이디 출력 -->
		</div>
		<!-- 아이디 찾기 div end -->
	</div>
	<!-- 아이디/비밀번호 찾기 div end -->
	
	<br>
	<button class="btn2" onclick="location.href='memberLoginForm'">로그인</button>
	<button class="btn2" onclick="location.href='memberJoinForm'">회원가입</button>
	</div>
</body>
</html>