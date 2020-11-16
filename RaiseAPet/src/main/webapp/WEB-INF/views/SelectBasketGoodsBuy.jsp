<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.all{
		text-align: center;
		margin : 0 auto;
		width : -33%;
		border-color: gray;
	}	
	
	fieldset{
		border-right: none;
		border-left: none;
		border-bottom: none;
		left: 24.7%;
		position: relative;
		margin-top: 1%;
	}
	
	header{
		margin-top: 3%;
		margin-botton: 2%;
	}
	
	table, tr, td, th{
		border-collapse: collapse;
		margin: 0 auto;
		border-width : medium;
		border : 1px solid #474747;
		border-left: none;
		border-right: none;
		border-color: gray;
		table-layout: fixed;
		/* 
			테이블의 크기 지정 및 고정 시켜야 할 경우에 사용한다
			td에서 문자열을 자르거나 숨길 수 있다.
		 */
		border-color: gray;
	}	
	
	th{
		background-color: #f1d2fc;
		font-size: 13px;
	}
	
	legend{ 
		padding-left: 3%; 
		padding-right: 3%;
		font-size: 18px;
	}	
	
	.btn{
		margin-top: 5px;
		margin-bottom: 5px;
		font-size: 15px;
		width: 100px;
		height: 30px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 상품 목록 출력 -->
<script>
	$(document).ready(function(){

			if(${goodsInfoLength} == 1){ // 값이 1개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				
			}else if(${goodsInfoLength} == 2){ // 값이 2개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				
			}else if(${goodsInfoLength} == 3){ // 값이 3개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				document.getElementById("2").innerHTML = "3. " + "${goodsInfo2}";
				
			}else if(${goodsInfoLength} == 4){ // 값이 4개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				document.getElementById("2").innerHTML = "3. " + "${goodsInfo2}";
				document.getElementById("3").innerHTML = "4. " + "${goodsInfo3}";
				
			}else if(${goodsInfoLength} == 5){ // 값이 5개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				document.getElementById("2").innerHTML = "3. " + "${goodsInfo2}";
				document.getElementById("3").innerHTML = "4. " + "${goodsInfo3}";
				document.getElementById("4").innerHTML = "5. " + "${goodsInfo4}";
				
			}else if(${goodsInfoLength} == 6){ // 값이 6개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				document.getElementById("2").innerHTML = "3. " + "${goodsInfo2}";
				document.getElementById("3").innerHTML = "4. " + "${goodsInfo3}";
				document.getElementById("4").innerHTML = "5. " + "${goodsInfo4}";
				document.getElementById("5").innerHTML = "6. " + "${goodsInfo5}";
				
			}else if(${goodsInfoLength} == 7){ // 값이 7개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				document.getElementById("2").innerHTML = "3. " + "${goodsInfo2}";
				document.getElementById("3").innerHTML = "4. " + "${goodsInfo3}";
				document.getElementById("4").innerHTML = "5. " + "${goodsInfo4}";
				document.getElementById("5").innerHTML = "6. " + "${goodsInfo5}";
				document.getElementById("6").innerHTML = "7. " + "${goodsInfo6}";
				
			}else if(${goodsInfoLength} == 8){ // 값이 8개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				document.getElementById("2").innerHTML = "3. " + "${goodsInfo2}";
				document.getElementById("3").innerHTML = "4. " + "${goodsInfo3}";
				document.getElementById("4").innerHTML = "5. " + "${goodsInfo4}";
				document.getElementById("5").innerHTML = "6. " + "${goodsInfo5}";
				document.getElementById("6").innerHTML = "7. " + "${goodsInfo6}";
				document.getElementById("7").innerHTML = "8. " + "${goodsInfo7}";
				
			}else if(${goodsInfoLength} == 9){ // 값이 9개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				document.getElementById("2").innerHTML = "3. " + "${goodsInfo2}";
				document.getElementById("3").innerHTML = "4. " + "${goodsInfo3}";
				document.getElementById("4").innerHTML = "5. " + "${goodsInfo4}";
				document.getElementById("5").innerHTML = "6. " + "${goodsInfo5}";
				document.getElementById("6").innerHTML = "7. " + "${goodsInfo6}";
				document.getElementById("7").innerHTML = "8. " + "${goodsInfo7}";
				document.getElementById("8").innerHTML = "9. " + "${goodsInfo8}";
				
			}else if(${goodsInfoLength} == 10){ // 값이 10개이면
				document.getElementById("0").innerHTML = "1. " + "${goodsInfo0}";
				document.getElementById("1").innerHTML = "2. " + "${goodsInfo1}";
				document.getElementById("2").innerHTML = "3. " + "${goodsInfo2}";
				document.getElementById("3").innerHTML = "4. " + "${goodsInfo3}";
				document.getElementById("4").innerHTML = "5. " + "${goodsInfo4}";
				document.getElementById("5").innerHTML = "6. " + "${goodsInfo5}";
				document.getElementById("6").innerHTML = "7. " + "${goodsInfo6}";
				document.getElementById("7").innerHTML = "8. " + "${goodsInfo7}";
				document.getElementById("8").innerHTML = "9. " + "${goodsInfo8}";
				document.getElementById("9").innerHTML = "10. " + "${goodsInfo9}";
				
			}
	});
</script>
<!-- 주소지 radio -->
<script>
	// 기존 배송 정보
	function address(){

		if(${sessionScope.loginUser.userAddress.equals("정보 없음")}){
			alert("배송지 정보가 없습니다 배송지를 적어주세요");

			var output = "<div>";
			output += "<input type='text' id='postcode' name='postcode' placeholder='우편번호'>&nbsp;";
			output += "<input class='btn' type='button' onclick='execDaumPostcode()' value='우편번호 찾기'><br>";
			output += "<input type='text' id='address' name='address' placeholder='주소'>";
			output += "<input type='text' id='detailAddress' name='detailAddress' placeholder='상세주소'><br>";
			output += "<input type='text' id='extraAddress' name='extraAddress' placeholder='참고항목'>&nbsp;";
			output += "<input class='btn' type='button' onclick='addressUpdate()' value='등록'>";
			output += "</div>";
			$("#addressChange").html(output);
		}else{
		
			var output = "<div>";
			output += "${sessionScope.loginUser.userAddress}";
			output += "<input type='hidden' id='addressCheck' name='buyAddress' value='${sessionScope.loginUser.userAddress}'>";
			output += "</div>";
			$("#addressChange").html(output);
			$("#addressResult").hide();
			document.getElementById("addressCheckResult").value = 0;
			// 기본 배송지일 경우 : 0
		}
	}

	// 신규 배송 정보
	function newAddress(){
		var output = "<div>";
		output += "<input type='text' id='postcode' name='postcode' placeholder='우편번호'>&nbsp;";
		output += "<input class='btn' type='button' onclick='execDaumPostcode()' value='우편번호 찾기'><br>";
		output += "<input type='text' id='address' name='address' placeholder='주소'>";
		output += "<input type='text' id='detailAddress' name='detailAddress' placeholder='상세주소'><br>";
		output += "<input type='text' id='extraAddress' name='extraAddress' placeholder='참고항목'>&nbsp;";
		output += "<input class='btn' type='button' onclick='addressUpdate()' value='등록'>";
		output += "</div>";
		$("#addressChange").html(output);
		$("#addressResult").show();
	}

	// 신규 주소 업데이트
	function addressUpdate(){

		var postcode = document.getElementById("postcode").value;
		var address = document.getElementById("address").value;
		var detailAddress = document.getElementById("detailAddress").value;
		var extraAddress = document.getElementById("extraAddress").value;

		var address = postcode + " " + address + " " + detailAddress + " " + extraAddress;

		$.ajax({
			type :"POST",
			url : "addressUpdate",
			data : {
				"postcode" : postcode,
				"address" : address,
				"detailAddress" : detailAddress,
				"extraAddress" : extraAddress
				},
			success : function(){
				document.getElementById("addressResult").innerHTML = address;
				$("#addressResult").show();
				document.getElementById("addressCheckResult").value = 1;
				// 신규 배송지일 경우 1
				}
			});
	}
</script>

<!-- 포인트, 쿠폰 사용 -->
<script>
	// 포인트 모두 사용
	function point_all(){

		// 1.
		var check = ${totalSum} >= ${sessionScope.loginUser.userPoint};
		// 상품 총합이 현재 보유 중인 포인트 보다 큰지 체크

		// 2.
		var original_point = ${sessionScope.loginUser.userPoint};
		// 기존 포인트
		var use_point = document.getElementById("point").value;
		// 사용한 포인트
		
		var point = original_point - use_point;
		// 기존 포인트 - 사용한 포인트
		
		// 3.
		var sum = ${totalSum + 2500};
		// 합계 금액
	
		// 4.
		if(${sessionScope.loginUser.userPoint} >= 0 && check == true){

			var total_sum = sum - use_point;
			// 합계 금액  - 사용한 포인트
			document.getElementById("total_sum").value = total_sum;
			document.getElementById("totalSumPay").value = total_sum;
			document.getElementById("total_sum").innerHTML = "총금액 : " + total_sum +"원";
			
			document.getElementById('point').value = ${sessionScope.loginUser.userPoint};
			// input 태그에 point 전체 값 출력
			
			document.getElementById('original_point').value = "현재 포인트 : " + point;
			document.getElementById("original_point").innerHTML = "현재 포인트 : " + point;

			document.getElementById("payCheck").value = 2;
			document.getElementById("couponCheck").value = 0;
			
			var total_point = total_sum * 0.05;
			// 총합에 따른 포인트
			total_point = Math.round(total_point);
			// 반올림

			document.getElementById("total_point").value = total_point;
			document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
			
		}else{
			alert("포인트가 부족하여 사용 하실 수 없습니다.");
		}
	}

	// 포인트 선택 사용
	function point_use(){

		var original_point = ${sessionScope.loginUser.userPoint};
		// 기존 포인트
		
		var use_point = document.getElementById("point").value;
		// 사용한 포인트
			
		var point = original_point - use_point;
		// 기존 포인트 - 사용한 포인트

		var use_pointCheck = use_point <= original_point;
		// 선택 사용 할 때 보유한 포인트 보다 크게 적지 못하게
		
		var check = ${totalSum+2500} >= use_point;
		// 입력한 포인트가 합계 금액보다 작으면
		
		var sum = ${totalSum + 2500};
		// 합계 금액

		if(${sessionScope.loginUser.userPoint} >= 0 && check == true && use_pointCheck == true){

			var total_sum = sum - use_point;
			// 합계 금액  - 사용한 포인트
			document.getElementById("total_sum").value = total_sum;
			document.getElementById("totalSumPay").value = total_sum;
			document.getElementById("total_sum").innerHTML = "총금액 : " + total_sum + "원";

			document.getElementById('original_point').value = point;
			document.getElementById("original_point").innerHTML = "현재 포인트 : " + point;

			document.getElementById("payCheck").value = 2;
			document.getElementById("couponCheck").value = 0;
			
			var total_point = total_sum * 0.05;
			// 총합에 따른 포인트
			total_point = Math.round(total_point);
			// 반올림

			document.getElementById("total_point").value = total_point;
			document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
			
		}else{

			alert("포인트가 부족하거나, 금액 보다 많습니다.");
			
			document.getElementById('point').value = 0;
			document.getElementById('point').focus;

			// 가지고 있는 포인트 보다 많이 쓰면 기존 금액과 포인트를 출력한다.
			document.getElementById('total_sum').value = sum;
			document.getElementById("totalSumPay").value = sum;
			document.getElementById('total_sum').innerHTML = "총금액 : " + sum + "원";

			document.getElementById('original_point').value = original_point;
			document.getElementById('original_point').innerHTML = "현재 포인트 : " + original_point;
		}
	}

	// 쿠폰 사용 후 금액 차감
	function couponUse(couponCode){

		if(couponCode == undefined){
			document.getElementById("payCheck").value = 0;
			// 해당 없음 쿠폰을 선택 했을 경우 쿠폰 코드를 0으로 설정

			document.getElementById("couponCheck").value = 0;
		}

		// 쿠폰을 바꿀 때마다 포인트의 값이 초기화 되도록 설정
		document.getElementById('point').value = 0;
		document.getElementById('point').focus;

		if(couponCode > 0){
			var couponCode1 = document.getElementById("couponCode"+couponCode).value;
			// "couponCode"+couponCode로 한 이유는 c:forEach를 돌렸을 때 "couponCode".value로 하면 맨 처음에 출력된 value만 불러오기 때문에
			// P.K 컬럼의 값을 뒤에 붙여서 id를 정해준다.

			document.getElementById("couponCheck").value = couponCode;
		}else{
			var couponCode1 = document.getElementById("couponCode0").value;
		}

		if(couponCode1 > 0 && couponCode1 <= 100){ // 퍼센트(/) 할인

			var sum = ${totalSum + 2500};
			// 총합 금액
			var total_sum = sum / couponCode1;
			// 합계 금액 / 할인률 = 총금액

			if(total_sum < 0){
				// 총금액이 -가 될 경우
				alert("금액 이상의 쿠폰은 사용 불가 합니다.");
				document.getElementById('total_sum').value = sum;
				document.getElementById("totalSumPay").value = sum;
				document.getElementById('total_sum').innerHTML = "총금액 : " + sum + "원";
			}else{
				// 총금액을 출력
				document.getElementById('total_sum').value = total_sum;
				document.getElementById("totalSumPay").value = total_sum;
				document.getElementById('total_sum').innerHTML = "총금액 : " + total_sum + "원";

				document.getElementById("payCheck").value = 1;
				
				var total_point = total_sum * 0.05;
				// 총합에 따른 포인트
				total_point = Math.round(total_point);
				// 반올림

				document.getElementById("total_point").value = total_point;
				document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
			}
			
		}else if(couponCode1 >= 1000){ // 금액(-) 할인

			var sum = ${totalSum + 2500};
			// 총합 금액
			var total_sum = sum - couponCode1;
			// 합계 금액 / 할인률 = 총금액

			if(total_sum < 0){
				// 총금액이 -가 될 경우
				alert("금액 이상의 쿠폰은 사용 불가 합니다.");
				document.getElementById('total_sum').value = sum;
				document.getElementById("totalSumPay").value = sum;
				document.getElementById('total_sum').innerHTML = "총금액 : " + sum + "원";
			}else{
				// 총금액을 출력
				document.getElementById('total_sum').value = total_sum;
				document.getElementById("totalSumPay").value = total_sum;
				document.getElementById('total_sum').innerHTML = "총금액 : " + total_sum + "원";

				document.getElementById("payCheck").value = 1;
				
				var total_point = total_sum * 0.05;
				// 총합에 따른 포인트
				total_point = Math.round(total_point);
				// 반올림

				document.getElementById("total_point").value = total_point;
				document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
			}
		}else{

			var sum = ${totalSum + 2500};
			// 총합 금액
			var total_sum = sum - couponCode;
			// 합계 금액 / 할인률 = 총금액
			
			document.getElementById('total_sum').value = sum;
			document.getElementById("totalSumPay").value = sum;
			document.getElementById('total_sum').innerHTML = "총금액 : " + sum + "원";

			document.getElementById("total_point").value = total_point;
			document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;

			var total_point = sum * 0.05;
			// 총합에 따른 포인트
			total_point = Math.round(total_point);
			// 반올림

			document.getElementById("total_point").value = sum;
			document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
		}
	}

	function point_ParseCheck(){
		var point = document.getElementById("point").value;
		if(point >= 0){
			point_use();
		}else{
			alert("포인트는 0 이상부터 가능합니다.")
			document.getElementById("point").value = 0;
		}
	}
</script>

<!-- 쿠폰함 Show, Hide -->
<script>
	$(document).ready(function(){
		
		document.getElementById("msg").innerHTML = "포인트 or 쿠폰함(만원 이상만 사용 가능)";

		var total_point = ${(totalSum + 2500) * 0.05};
		// 포인트
		total_point = Math.round(total_point);
		// 반올림
		
		// 지급 포인트 반올림
		document.getElementById("total_point").value = total_point;
		document.getElementById("total_point").innerHTML = "지급 포인트 : " + total_point;
		
		$("#couponBoxShow").show();
		$("#couponBoxHide").hide();
		$("#pointBoxShow").show();
		$("#pointBoxHide").hide();
	});

	function couponBoxShow(){
		
		$("#couponBoxShow").hide();
		$("#couponBoxHide").show();
		$("#pointBoxShow").hide();
		$("#pointBoxHide").hide();
	}

	function couponBoxHide(){
		
		$("#couponBoxShow").show();
		$("#couponBoxHide").hide();
		$("#pointBoxShow").show();
		$("#pointBoxHide").hide();
	}

	function pointBoxShow(){

		$("#couponBoxShow").hide();
		$("#couponBoxHide").hide();
		$("#pointBoxShow").hide();
		$("#pointBoxHide").show();
	}

	function pointBoxHide(){

		$("#couponBoxShow").show();
		$("#couponBoxHide").hide();
		$("#pointBoxShow").show();
		$("#pointBoxHide").hide();
	}
</script>
</head>
<header>
	<div style="height:100%;  width:14.1%; margin:0 auto;">
		<a class="logo" style=" height: 100%; padding:0;">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 110px;">
		</a>
	</div>		
</header>
<body>
	<div class="all">
	<fieldset style="width: 48%">
		<legend>[상품 목록]</legend>
		<div id="0"></div>
		<div id="1"></div>
		<div id="2"></div>
		<div id="3"></div>
		<div id="4"></div>
		<div id="5"></div>
		<div id="6"></div>
		<div id="7"></div>
		<div id="8"></div>
		<div id="9"></div>
	</fieldset>
	
	<table border="1" style="width: 50%">
		<!-- 이름 -->
		<tr>
			<td colspan="5">주문자 : ${sessionScope.loginUser.userName}</td>
		</tr>
		
		<!-- 주소지 -->
		<tr>
			<td colspan="5">
			<input type="radio" name="address" onclick="address()">기존 배송지로 설정
			<input type="radio" name="address" onclick="newAddress()">새로운 배송지로 설정
			<input type="hidden" id="addressCheckResult" value=0> <!-- 배송지 어떤 걸로 선택 했는 지 -->
			
			<div id="addressChange">
				${sessionScope.loginUser.userAddress}
				<input type='hidden' name='buyAddress' value='${sessionScope.loginUser.userAddress}'>
			</div><br>
			<span id="addressResult"></span>
			</td>
		</tr>
		
		<!-- 쿠폰 -->
		<tr>
			<td colspan="5">
				<small id="msg"></small>
				
				<div id="couponBoxShow">
					<button class="btn" onclick="couponBoxShow()">쿠폰함 열기</button>
				</div>
				
				<div id="pointBoxShow">
					<button class="btn" onclick="pointBoxShow()">포인트 열기</button>
				</div>
				
				<div id="couponBoxHide">
					<button class="btn" onclick="pointBoxHide()">쿠폰함 닫기</button>
				
					<table border="1">
						<tr>
							<th>R&P</th>
							<th>쿠폰 코드</th>
							<th>쿠폰 이름</th>
							<th>쿠폰 유효기간</th>
							<th>쿠폰 내용<input type="hidden" id="couponCheck" value="0"> <!-- 쿠폰 번호 저장  --></th>
						</tr>	
						
						<c:choose>
						<c:when test="${not empty userCoupon}">
							<tr>
								<td><input type="radio" id="couponCode0" name="coupon" onclick="couponUse()">
								</td>
								<td>해당없음</td>
								<td>해당없음</td>
								<td>해당없음</td>
								<td>해당없음</td>
							</tr>
							
							
							<c:forEach var="couponList" items="${userCoupon}">
							<tr>
									<td><input type="radio" id="couponCode${couponList.couponCode}" name="coupon" onclick="couponUse(${couponList.couponCode})" 
									value="${couponList.couponSale}"></td>
									<td>${couponList.couponCode}</td>
									<td style="overflow: hidden;
									text-overflow: ellipsis; 
									white-space: nowrap;" 
									class="contents">${couponList.couponName}</td>
									<fmt:parseDate var="couponDate" value="${couponList.couponDate}" pattern="YYYY-mm-dd"></fmt:parseDate>
									<fmt:formatDate var="newFormatted" value="${couponDate}" pattern="YYYY-mm-dd"/> 
									<td>${newFormatted}</td>
									<td>${couponList.couponContents}
									<input type="hidden" id="couponSale" value="${couponList.couponSale}"> <!-- 쿠폰 세일 내용 -->
									</td>
							</tr>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							<tr>
								<td colspan="5">쿠폰이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</table>
				</div>
				
				<!-- 포인트 -->
				<div id="pointBoxHide">
					<button class="btn" onclick="pointBoxHide()">포인트 닫기</button><br>
					<input type="hidden" name="userPoint" value="${totalSum * 0.05}">
					<p id="original_point">현재 포인트 : ${sessionScope.loginUser.userPoint}</p>
					<input type="text" id="point" onblur="point_ParseCheck()" placeholder="포인트 사용" value=0>
					<button class="btn" onclick="point_all()">모두 사용</button><br>
				</div>
			</td>
		</tr>
		
		<!-- 총금액 -->
		<tr>
			<td colspan="5">
				<p id="total_point">지급 포인트 : ${totalSum * 0.05}</p>
				<p>배송비 : 2500원</p>
				<p id="total_sum">총금액  : ${totalSum + 2500}원</p>
				<input type="hidden" id="payCheck"><!-- 할인 방식 체크 -->
			</td>
		</tr>
		
		<!-- 결제 버튼 -->
		<tr>
			<td colspan="5"><button class="btn" id="card">온라인 결제</button>
			<input type="hidden" id="totalSumPay" value="${totalSum + 2500}"> <!-- 합계 금액 -->
			</td>
		</tr>
	</table>
	</div>
</body>
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
<!-- 카카오페이 결제 -->
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp23418340'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var msg;
</script>
<script>
	$('#card').click(function(){	    

		var total_pay = document.getElementById("totalSumPay").value;
		
		if(total_pay > 0){
		    IMP.request_pay({
		        pg : 'inicis',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : '레어펫', // 상품이름
		        amount : total_pay,//가격
		        buyer_name : '${sessionScope.loginUser.userId}',//이름 
		        buyer_tel : '${sessionScope.loginUser.userPhone}'//전화번호 
				}, function(rsp){
					if(rsp.success){
						DBinsert();
					} else {
						msg = '결제가 실패하였습니다.';
						
						alert(msg);
						location.href="memberBasketList";
					}
				});
			}else{
				DBinsert();
				// 총합이 0원이면 결제가 쿠폰이나 포인트를 써서 다 끝난거기 때문에 DB로 보낸다.
			}
	});

	// 결제 성공 후 DB에 결제내역 insert, 장바구니 내역 delete
	function DBinsert(){

		var totalpay = document.getElementById("totalSumPay").value;
		// 합계 금액

		var original_point = ${sessionScope.loginUser.userPoint};
		// 기존 포인트
		
		var use_point = document.getElementById("point").value;
		// 사용한 포인트
		
		var payCheck = document.getElementById("payCheck").value;
		// 할인을 쿠폰으로 했는 지 포인트로 했는 지 체크 
		
		var point = original_point - use_point;
		// 기존 포인트에서 사용한 포인트 차감
		
		var couponCode = document.getElementById("couponCheck").value;
		// 사용한 쿠폰 코드
		
		var payCheck2 = 0; // 할인 수단 체크
		
		var addressCheck = document.getElementById("addressCheckResult").value;
		// 기존 주소인지 새로운 주소인지 체크
		
		if(payCheck == 0 && use_point == 0){ // 아무것도 사용 안함.
			payCheck2 = 0; // 선택 X
		}else if(payCheck == 1){ // 쿠폰 사용함
			payCheck2 = 1; // 쿠폰 O
		}else if(use_point > 0){ // 포인트 사용함
			payCheck2= 2; // 포인트 O
		}
		
		$.ajax({
			type :"GET",
			url : "selectBuyInfoUpdate",
			data : {
			    "point" : point,
			    "couponCode" : couponCode,
			    "payCheck" : payCheck2,
			    "totalpay" : totalpay,
			    "addressCheck" : addressCheck
				},
			success : function(){
				if(resultMsg = "OK"){
					paySuccess();
				}
			}
		});
	}

	// DBinsert 성공 후
	function paySuccess(){
		location.href="paySuccess";
	}
</script>
</html>