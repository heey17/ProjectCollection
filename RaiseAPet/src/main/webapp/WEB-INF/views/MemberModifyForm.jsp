<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<style>
	table{
		margin: 0 auto;
		width : 450px;
	}
	
	.imageLook{
		width: 100px;
		height: 100px
	}
	
	.all{
		text-align : center;
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
	
	.btn{
		font-size: 15px;
		margin: 4px 0;
		width: 44%;
		height: 25px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
	
	.btn2{
		font-size: 15px;
		margin: 5px 0;
		width: 90%;
		heigth: 25px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
	
	.btn3{
		font-size: 15px;
		margin: 5px 0;
		width: 21.5%;
		heigth: 25px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
</style>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
</head>
<header>
	<br><br><br>
	<div style="height:100%;  width:5.5%; margin:0 auto;">
		<a href="./" class="logo" style=" height: 100%; padding:0;">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 80px;">
		</a>
	</div>	
</header>
<body>
	<div class="all">
	<!-- 수정 form start -->
	<form action="memberModify" method="POST" enctype="Multipart/form-data">
		<table>
			<tr>
				<td>
					<form id="form" runat="server">
   						<input type='file' class="inputImage" id="userImageFile" name="userImageFile" maxlength="100"/><br>
   						<img id="image_section" style="height:270px; width: 400px"/>
					</form><br>
					
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
			
			<tr>
				<td>
					<input type="text" class="input" id="userId" name="userId" value="${sessionScope.loginUser.userId}" readonly>
																			<!-- input태그에 readonly를 사용하여서 수정 할 수 없도록 함.
																				display는 form을 사용 했을 때 값을 넘길 수 없기 때문에
																				readonly를 사용했음.
																			 -->
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="text" class="input" id="userName" name="userName" value="${sessionScope.loginUser.userName}" maxlength="5">
				</td>
			</tr>
			
			<tr>
				<td>
					남 <input type="radio" id="userGender" name="userGender" value="남">
					여 <input type="radio" id="userGender" name="userGender" value="여"> 
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="text" class="input" id="postcode" name="postcode" placeholder="우편번호">
					<input type="button" class="btn2" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" class="input" id="address" name="address" placeholder="주소"><br>
					<input type="text" class="input" id="detailAddress" name="detailAddress" placeholder="상세주소">
					<input type="text" class="input" id="extraAddress" name="extraAddress" placeholder="참고항목">
					<input type="hidden" class="input" id="userAddress" name="userAddress" value="${sessionScope.loginUser.userAddress}">
				</td>
			</tr>
			<tr>
				<td>
					<input type="email" class="input" id="userEmail" name="userEmail" value="${sessionScope.loginUser.userEmail}">
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="text" class="input" id="userPhone" name="userPhone" value="${sessionScope.loginUser.userPhone}" maxlength="11" readonly>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" class="btn" value="수정">
					<input type="reset" class="btn" value="다시 입력">
				</td>
			</tr>
		</table>
	</form>
	<button class="btn3" onclick="window.history.back()">취소</button>
	<!-- 수정 form end -->
	
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