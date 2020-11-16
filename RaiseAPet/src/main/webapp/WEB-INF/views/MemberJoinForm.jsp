<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	
	hr{
		height : 5px;
		border : 0;
		box-shadow : 0 10px 10px -10px #c886d1 inset;
	}
	
	.all{
		text-align : center;
	}
	
	table, .sertification{
		margin: 0 auto;
		width : 450px;
	}
	
	.imageLook{
		width: 100px;
		height: 100px
	}
	
	.input{
		width: 88%;
		height: 30%;
		margin: 3px 0;
		text-align: center;
		font-size: 15px;
		border-top: none;
		border-right: none;
		border-left: none;
		border-bottom: 1px solid;
		border-color: gray;
	}
	
	.inputImage{
		width: 88%;
	}
	
	fieldset{
		border-top: 1px solid;
		border-left: none;
		border-right: none;
		border-bottom: none;
		border-color: #c886d1;
		top: 50%;
		left: 38.25%;
		position: relative;
	}
	
	legend{
		padding-left: 3%; 
		padding-right: 3%;
		font-size: 18px;
	}
	
	.btn{
		font-size: 15px;
		margin: 4px 0;
		width: 128px;
		height: 25px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
	
	.btn2{
		font-size: 15px;
		margin: 5px 0;
		width: 270px;
		heigth: 25px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
	
	.btn_Sender{
		font-size: 15px;
		width: 270px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
</style>
<!-- 중복검사 Ajax start -->
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>
	// 아이디 중복 확인
	function idOverlap(){
		
		// idCheck : 작성한 아이디(input text로 작성한 값)
		var userId = document.getElementById("userId").value;
		// confirmId : span 태그 준 부분
		var confirmId = document.getElementById("confirmId");

		$.ajax({
			type : "POST", // POST 방식으로
			url : "idoverlap", // Controller에 idoverlap이라는 value로 보낸다.
			data : {"userId" : userId}, // idCheck를 mid라는 변수명으로 담아서
			dataType : "text", // data의 type은 text이다.

			// 성공 시
			success : function(data){
				if(data=="OK"){
					confirmId.style.color = "#00ff00";
					confirmId.innerHTML = "O";
				} else{
					confirmId.style.color = "#ff0000";
					confirmId.innerHTML = "X";
					document.getElementById('userId').value = '';
					document.getElementByid('userId').focus();
					}
				}, 

			// 실패 시
			error : function(){
				alert("idOverlap 함수 통신 실패");
				}
			}); // end Ajax
		} // end idOverlap

	// 전화번호 중복 확인
	function phoneOverlap(){
		
		var userPhone = document.getElementById("userPhone").value;
		var confirmPhone = document.getElementById("confirmPhone");

		$.ajax({
			type : "POST", // POST 방식으로
			url : "phoneoverlap", // Controller에 idoverlap이라는 value로 보낸다.
			data : {"userPhone" : userPhone}, // idCheck를 mid라는 변수명으로 담아서
			dataType : "text", // data의 type은 text이다.

			// 성공 시
			success : function(data){
				if(data=="OK"){
					confirmPhone.style.color = "#00ff00";
					confirmPhone.innerHTML = "O";
				} else{
					confirmPhone.style.color = "#ff0000";
					confirmPhone.innerHTML = "X";
					document.getElementById('userPhone').value = '';
					document.getElementByid('userPhone').focus();
					}
				}, 

			// 실패 시
			error : function(){
				alert("phoneOverlap 함수 통신 실패");
				}
			}); // end Ajax
		} // end idOverlap

	// 이메일 중복 확인
	function emailOverlap(){
			
		var userEmail = document.getElementById("userEmail").value;
		var confirmEmail = document.getElementById("confirmEmail");

		$.ajax({
			type : "POST", // POST 방식으로
			url : "emailoverlap",
			data : {"userEmail" : userEmail},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					confirmEmail.style.color = "#00ff00";
					confirmEmail.innerHTML = "O";
				} else{
					confirmEmail.style.color = "#ff0000";
					confirmEmail.innerHTML = "X";
					document.getElementById('userEmail').value = '';
					document.getElementByid('userEmail').focus();
					}
				}, 

			// 실패 시
			error : function(){
				alert("emailOverlap 함수 통신 실패");
				}
			}); // end Ajax
		} // end idOverlap	
</script>
<!-- 중복검사 Ajax end -->

<!-- 비밀번호 확인 start -->
<script>
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
</script>
<!-- 비밀번호 확인 end -->

<!-- 정규식 검사 start -->
<script>
	// 아이디 정규식 검사
	function idCheck(){
		var idReg = /^[A-za-z]/g;
			        	
		if( !idReg.test( $("input[name=userId]").val() ) ) {
			alert("아이디가 올바르지 않습니다.");
			$("input[name=userId]").val('');
			$("input[name=userId]").focus();
			return false;
		}
		return true;
	}

	// 전화번호 정규식 검사
	function phoneCheck(){

		var phone = $("input[name=userPhone]").val();
		var phoneReg = /^[0-9]*$/;

		if(phone.length == 11){
			if(!phoneReg.test( $("input[name=userPhone]").val() ) ){
				alert("전화번호가 올바르지 않습니다.");
				$("input[name=userPhone]").val('');
				$("input[name=userPhone]").focus();
				
				return false;
			}
		}else{
			alert("11자리로 입력해주세요");
			$("input[name=userPhone]").val('');
			$("input[name=userPhone]").focus();

			return false;
		}
		return true;
	}

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
<!-- 정규식 검사 end -->

<!-- 본인인증 화면 전환 start -->
<script>
	// 이메일 본인인증 form
	function emailConfirmNum(){
		var output = "<tr>";
		output += "<td>";
		output += "<div class='sertification'>";
		output += "<input type='text' class='input' id='userPhone' name='userPhone' onblur='phoneOverlap()' onchange='phoneCheck()' placeholder='전화번호 (필수)' maxlength='11' required='required'>&nbsp;"
		output += "<span id='confirmPhone'></span><br>";
		output += "<input type='email' class='input' id='userEmail' name='userEmail' onblur='emailOverlap()' placeholder='이메일 (필수)' required='required' maxlength='50'>&nbsp;";
		output += "<span id='confirmEmail'></span><br>";
		output += "<a onclick='emailSender()'>[인증번호 발송]</a><br>";
		output += "<input type='text' class='input' id='emailConfirmNum' placeholder='인증번호 입력 (필수)' onchange='emailNumCheck()' required='required' maxlength='5'><br>";
		output += "<span id='emailConfirm'></span>";
		output += "</div>";
		output += "</td>";
		output += "</tr>";
		$("#area").html(output);
	}

	// 전화번호 본인인증 form
	function phoneConfirmNum(){
		var output = "<tr>";
		output += "<td>";
		output += "<div class='sertification'>";
		output += "<input type='email' class='input' id='userEmail' name='userEmail' onblur='emailOverlap()' onchange='emailCheck()' placeholder='이메일 (필수)' required='required' maxlength='50'>&nbsp;";
		output += "<span id='confirmEmail'></span><br>";
		output += "<input type='text' class='input' id='userPhone' name='userPhone' onblur='phoneOverlap()' onchange='phoneCheck()' placeholder='전화번호 (필수)' maxlength='11' required='required'>&nbsp;";
		output += "<span id='confirmPhone'></span><br>";
		output += "<a onclick='phoneSender()'>[인증번호 발송]</a><br>";
		output += "<input type='text' class='input' id='phoneConfirmNum' placeholder='인증번호 입력 (필수)' onchange='phoneNumCheck()' required='required' maxlength='6'><br>";
		output += "<span id='phoneConfirm'></span>";
		output += "</div>";
		output += "</td>";
		output += "</tr>";
		$("#area").html(output);
	}
</script>
<!-- 본인인증 화면 전환 end -->

<!-- 인증번호 발송 start -->
<script>
	
	// 회원이 회원가입 때 작성한 전화번호로 인증번호 발송
	function phoneSender(){

		var phone = document.getElementById("userPhone").value;
	
		$.ajax({
			type : "POST", // POST 방식으로
			url : "phoneNumSender", // Controller에 idoverlap이라는 value로 보낸다.
			data : {"phone" : phone}, // idCheck를 mid라는 변수명으로 담아서
	
			// 성공 시
			success : function(data){
				if(data=="OK"){
					alert("인증번호가 발송 되었습니다.");
				} else{
					alert("인증번호 발송에 실패 했습니다.");
					}
				}, 
	
			// 실패 시
			error : function(){
				alert("전화번호 작성 후 발송을 클릭 해주세요");
				}
			}); // end Ajax
		} // end phoneSender
	
	// 전화번호 인증번호 일치하는 지 확인하는 function
	function phoneNumCheck(){
	
		var phoneConfirmNum = document.getElementById("phoneConfirmNum").value;
		// 내가 작성한 인증번호
		var phoneConfirm = document.getElementById("phoneConfirm");
		// ajax로 넘어온 값의 결과를 출력하는 span 태그
		
		$.ajax({
			type : "POST", // POST 방식으로
			url : "phoneNumCheck",
			data : {"phoneConfirmNum" : phoneConfirmNum}, 
	
			// 성공 시
			success : function(data){
				if(data=="OK"){
					phoneConfirm.style.color = "#00ff00";
					phoneConfirm.innerHTML = "인증번호가 일치합니다.";
				} else{
					phoneConfirm.style.color = "#ff0000";
					phoneConfirm.innerHTML = "인증번호가 일치하지 않습니다.";
					document.getElementById('phoneConfirmNum').value = '';
					document.getElementByid('phoneConfirmNum').focus();
					}
				}, 
	
			// 실패 시
			error : function(){
				phoneConfirm.style.color = "#ff0000";
				phoneConfirm.innerHTML = "인증번호가 일치하지 않습니다.";
				document.getElementById('phoneConfirmNum').value = '';
				document.getElementByid('phoneConfirmNum').focus();
				}
			}); // end Ajax
		} // end phoneSender

	// 이메일 발송
	function emailSender(){
	
		var email = document.getElementById("userEmail").value;

		if(email == ""){
			alert("이메일을 작성 후 발송을 클릭 해주세요");
		}else{
			
			$.ajax({
				type : "POST", // POST 방식으로
				url : "emailNumSender",
				data : {"email" : email}, 
		
				// 성공 시
				success : function(data){
					if(data=="OK"){
						alert("인증번호가 발송 되었습니다.");
					} else{
						alert("인증번호 발송에 실패 했습니다.");
						}
					}, 
		
				// 실패 시
				error : function(){
					alert("이메일 작성 후 발송을 클릭 해주세요");
					}
				}); // end Ajax
			}
		} // end phoneSender

	// 이메일 인증번호 일치하는 지 확인하는 function
	function emailNumCheck(){

		var emailConfirmNum = document.getElementById("emailConfirmNum").value;
		// 내가 작성한 인증번호
		var emailConfirm = document.getElementById("emailConfirm");
		// ajax로 넘어온 값의 결과를 출력하는 span 태그

		$.ajax({
			type : "POST", // POST 방식으로
			url : "emailNumCheck",
			data : {"emailConfirmNum" : emailConfirmNum}, 

			// 성공 시
			success : function(data){
				if(data=="OK"){
					emailConfirm.style.color = "#00ff00";
					emailConfirm.innerHTML = "인증번호가 일치합니다.";
				} else{
					emailConfirm.style.color = "#ff0000";
					emailConfirm.innerHTML = "인증번호가 일치하지 않습니다.";
					document.getElementById('emailConfirmNum').value = '';
					document.getElementByid('emailConfirmNum').focus();
					}
				}, 

			// 실패 시
			error : function(){
				emailConfirm.style.color = "#ff0000";
				emailConfirm.innerHTML = "인증번호가 일치하지 않습니다.";
				document.getElementById('emailConfirmNum').value = '';
				document.getElementByid('emailConfirmNum').focus();
				}
			}); // end Ajax
		} // end phoneSender
</script>
<!-- 인증번호 발송 end -->
</head>
<header>
	<div style="height:100%;  width:5%; margin:0 auto;">
		<a href="./" class="logo" style=" height: 100%; padding:0;">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 80px;">
		</a>
	</div>	
</header>
<body>
	<div class="all">
	<!-- 회원가입 form start -->
	<form action="memberJoin" method="POST" enctype="Multipart/form-data" class="join">
		<table>			
			<tr>
				<td>
					<form id="form" runat="server">
   						<input type='file' class='inputImage' id="userImageFile" name="userImageFile" maxlength="100"/><br>
   						<img id="image_section" style="height:270px; width: 400px;"/>
					</form>
					
					<!-- 이미지 미리보기 start -->
					<script>
					function readURL(input) {
						 if (input.files && input.files[0]) {
						  var reader = new FileReader();
						  
						  reader.onload = function (e) {
						   $('#image_section').attr('src', e.target.result);  
						  }
						  
						  reader.readAsDataURL(input.files[0]);
						  }
						}
						 
						// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
						$("#userImageFile").change(function(){
						   readURL(this);
						});
					</script>
					<!-- 이미지 미리보기 end -->
				</td>
			</tr>
			
			<c:choose>
				<c:when test="${naverid ne null}">
					<tr>
						<td>
							<input type="text" class='input' name="userId" id="userId" onblur="idOverlap()" onchange="idCheck()" placeholder="네이버 아이디 (필수)" required="required" maxlength="15">
							<span id="confirmId"></span><br>
							영문자, 숫자 혼합하여 15자리 이내(영문자로 시작)<br>
							<input type="hidden" name="naverId" id="naverId" value="${naverid}">
							<input type="password" class='input' name="userPw" id="userPw" placeholder="네이버 비밀번호 (필수)" onchange="pwCheck()" maxlength="15" required="required"><br>
							<input type="password" class='input' name="userPwConfirm" id="userPwConfirm" placeholder="네이버 비밀번호 확인 (필수)" required="required"><br>
							영문, 숫자, 특수문자를 혼합하여 15자리 이내
						</td>
					</tr>
				</c:when>
				
				<c:when test="${kakaoId ne null}">
					<tr>
						<td>
							<input type="text" class='input' name="userId" id="userId" onblur="idOverlap()" onchange="idCheck()" placeholder="카카오 아이디 (필수)" required="required" maxlength="15">
							<span id="confirmId"></span><br>
							영문자, 숫자 혼합하여 15자리 이내(영문자로 시작)<br>
							<input type="hidden" name="kakaoId" id="kakaoId" value="${kakaoId}">
							<input type="password" class='input' name="userPw" id="userPw" placeholder="카카오 비밀번호 (필수)" onchange="pwCheck()" maxlength="15" required="required"><br>
							<input type="password" class='input' name="userPwConfirm" id="userPwConfirm" placeholder="카카오 비밀번호 확인 (필수)" required="required"><br>
							영문, 숫자, 특수문자를 혼합하여 15자리 이내
						</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td>
							<input type="text" class='input' name="userId" id="userId" placeholder="아이디 (필수)" onblur="idOverlap()" onchange="idCheck()" maxlength="15" required="required">
							<span id="confirmId"></span><br>
							<small>영문자, 숫자 혼합하여 15자리 이내(영문자로 시작)</small><br>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="password" class='input' id="userPw" name="userPw" placeholder="비밀번호 (필수)" onchange="pwCheck()" maxlength="15" required="required"><br>
																													 <!-- 최대 글자 수 지정 --><!-- 필수 조건으로 설정 -->
							<input type="password" class='input' id="userPwConfirm" name="userPwConfirm" placeholder="비밀번호 재확인  (필수)" required="required"><br>
																														<!-- 필수 조건으로 설정 -->
							<small>영문, 숫자, 특수문자를 혼합하여 15자리 이내</small>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			<tr>
				<td><input type="text" class='input' id="userName" name="userName" placeholder="이름 (필수)" required="required" maxlength="5"></td>
																						<!-- 필수 조건으로 설정 -->
			</tr>
			
			<tr>
				<td>
					남자<input type="radio" name="userGender" value="남" required="required" maxlength="2">
					여자<input type="radio" name="userGender" value="여" required="required" maxlength="2"></td>
						       																  <!-- 필수 조건으로 설정 -->
			</tr>
			
			<tr>
				<td><input type="date" class='input' id="userBirth" name="userBirth" placeholder="생년월일 (필수)" required="required"></td>
																								<!-- 필수 조건으로 설정 -->
			</tr>
			
			<tr>
				<td>
					<input type="text" class='input' id="postcode" name="postcode" placeholder="우편번호"><br>
					<input type="button" onclick="execDaumPostcode()" class="btn2" value="우편번호 찾기"><br>
					<input type="text" class='input' id="address" name="address" placeholder="주소"><br>
					<input type="text" class='input' id="detailAddress" name="detailAddress" placeholder="상세주소"><br>
					<input type="text" class='input' id="extraAddress" name="extraAddress" placeholder="참고항목">
				</td>
			</tr>
				
			<tr>
				<td>
					<!-- 본인인증 화면 전환 start -->
					전화번호로 인증 <input type="radio" name="join" onclick="phoneConfirmNum()" checked="checked">
					이메일로 인증 <input type="radio" name="join" onclick="emailConfirmNum()"><br>
					<div id="area" class="sertification">	
						<input type="email" id="userEmail" class='input' name="userEmail" onblur="emailOverlap()" placeholder="이메일 (필수)" required="required" maxlength="50">&nbsp;
						<span id="confirmEmail"></span><br>
						<!-- 본인인증 form start -->
						<input type="text" id="userPhone" class='input' name="userPhone" onblur="phoneOverlap()" onchange="phoneCheck()" placeholder="전화번호 (필수)" maxlength="11" required="required">&nbsp;
						<span id="confirmPhone"></span><br>
						<a class="btn_Sender" onclick="phoneSender()">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인증번호 발송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br>
						
						<!-- 본인인증 form end -->
						<input type="text" id="phoneConfirmNum" class='input' onchange="phoneNumCheck()" placeholder="인증번호 입력 (필수)" maxlength="6" required="required"><br>
						<span id="phoneConfirm"></small>
						<!-- ajax를 사용하여서 인증번호랑 입력한 인증번호랑 같으면 span 태그에 인증 되었습니다 또는 인증 되지 않았습니다가 뜨고
						인증 되었습니다면 넘어 갈 수 있고 인증 되지 않았습니다가 뜨면 focus랑 value를 사용하여서 입력 하도록 설정한다. -->
					</div>
					<!-- 본인인증 화면 전환 end -->
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="submit" class="btn" value="회원가입">&nbsp;
					<input type="reset" class="btn" value="다시 입력">
				</td>
			</tr>
		</table>
	</form>
	
	<fieldset style="width:22%;">
		<legend>또는</legend>
	</fieldset>
	
	<!-- SNS 계정으로 회원가입 하기 start -->
	<a href="naverjoin"><img width="450" src="resources/img/naverJoin.png"></a><br>
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=964cb0d4419ff73c619b3139a1a93c8f&redirect_uri=http://106.243.194.230:9092/project/join&response_type=code">
	<img width="450" src="resources/img/kakaoJoin.png"></a><br>
	<!-- SNS 계정으로 회원가입 하기 end -->
	</div>
</body>
<!-- 이미지 미리보기 Script start-->
<script type="text/javascript">
    	//이미지 미리보기
    	var sel_file;
 
    	$(document).ready(function() {
       	 	$("#userImage").on("change", handleImgFileSelect);
   	 	});
 
    	function handleImgFileSelect(e) {
        	var files = e.target.files;
        	var filesArr = Array.prototype.slice.call(files);
 
        	var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        	filesArr.forEach(function(f) {
           	 	if (!f.type.match(reg)) {
                	alert("확장자는 이미지 확장자만 가능합니다.");
                	return;
            	}
 
            	sel_file = f;
 
            	var reader = new FileReader();
            	reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            	}
            	reader.readAsDataURL(f);
        	});
    	}
	</script>
<!-- 이미지 미리보기 Script end -->

<!-- 우편주소 API script start -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<!-- 우편주소 API script end -->
</html>