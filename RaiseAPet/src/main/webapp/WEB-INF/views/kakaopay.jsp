<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>	
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
	td{
			padding-bottom: 15px;
		padding-top: 15px
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
	font-size: 14px;width: 120px;height: 40px;border: none;background-color: #f3d4ff;border-radius: 12px;
	}
	.btn:hover{
	background-color:white;
	color:black;
	border:2px solid #DDC3F7;
	cursor: pointer;
	}
}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 쿠폰함 Show, Hide -->
</head>
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

<!-- 추가 -->
<script>
	function couponCount(){

		$.ajax({
			type : "POST",
			url : "couponCount",

			// 성공 시
			success : function(data){
				if(data=="OK"){
					location.href="memberMyPage";
				}else{
					alert("실패");
				}
			},

			// 실패 시
			error : function(){
				alert('couponCount 함수 통신 실패');
				}
		});
	}
</script>
<!-- 쿠폰함 갯수 end -->
<header>
	<div style="height:100%;  width:14.1%; margin:0 auto; padding-left: 135px">
		<a class="logo" style=" height: 100%; padding:0;" href="./">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 110px;">
		</a>
	</div>		
</header>
<body>
	<table border="1" style="width: 20%; text-align: center; margin-top: 50px"  >
				<caption style="margin-bottom:20px; font-size: 20px;" >{결제창}</caption>
			<tr>
				<td colspan="2">상품금액 : ${sum}
				</td>
			</tr>
			<tr>

				<td colspan="2">현재 포인트 : ${sessionScope.loginUser.userPoint}</td>
			</tr>
		<!-- 쿠폰 -->
		<tr>
			<td colspan="2" style="position: relative;">
				<small id="msg"></small><br>
				
				<div id="couponBoxShow" style="float: left; margin-left: 40px;" >
					<button class="btn" onclick="couponBoxShow()">쿠폰함 열기</button>
				</div>
				
				<div id="pointBoxShow" style="float: right;margin-right: 40px;">
					<button class="btn" onclick="pointBoxShow()">포인트 열기</button>
				</div>
				
				<div id="couponBoxHide">
					<button class="btn" onclick="pointBoxHide()">쿠폰함 닫기</button>
				
						<table border="1" style="border-collapse: collapse; text-align: center;">
							<tr style="background-color:#DDC3F7;">
								<td>R&P</td>
								<td>쿠폰 이름</td>
								<td>쿠폰 코드</td>
								<td>쿠폰 유효기간</td>
								<td>쿠폰 내용<input type="hidden" id="couponCheck" value="0">
									<!-- 쿠폰 번호 저장  -->
							</td>
							</tr>
							<c:choose>
								<c:when test="${not empty couponList}">
									<tr>
										<td><input type="radio" id="couponCode0" name="coupon"
											value =""></td>
										<td>해당없음</td>
										<td>해당없음</td>
										<td>해당없음</td>
										<td>해당없음</td>
									</tr>
									<c:forEach var="couponList" items="${couponList}">
										<tr>
											<td><input type="radio"
												id="couponCode" name="coupon"
												value="${couponList.couponSale},${couponList.couponCode}"></td>
											<td>${couponList.couponName}</td>
											<td>${couponList.couponCode}</td>
											<fmt:parseDate var="couponDate"
												value="${couponList.couponDate}" pattern="YYYY-mm-dd"></fmt:parseDate>
											<fmt:formatDate var="newFormatted" value="${couponDate}"
												pattern="YYYY-mm-dd" />
											<td>${newFormatted}</td>
											<td>${couponList.couponContents}<input type="hidden"
												name="couponSale" value="${couponList.couponSale}"> <!-- 쿠폰 세일 내용 -->
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
						<button  class="btn"onclick="pointBoxHide()"style="margin-top: 6px; margin-bottom: 7px">포인트 HIDE</button><br>
						<input type="text" id="point" name="point">
						<button class="btn" id="point_use">포인트 사용하기</button><br>
						잔여 포인트 : <div id="original_point"></div>
					</div>
			</td>
		</tr>
		
		<!-- 총금액 -->
		<tr>
			<td colspan="2">
				총 결제금액 : 
				<div id="total_sum">${sum}</div>
			</td>
		</tr>
		
		<!-- 결제 버튼 -->
		<tr>
			<td colspan="2"><button class="btn" id="online" >온라인 결제</button></td>
			<input type="hidden" name="hotelPrice" value="hotelPrice"></button>
		</tr>
	</table>
</body>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp23418340'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var msg;
</script>

<script>
$(document).ready(function () {
	document.getElementById("total_sum").value = ${sum};
	document.getElementById("total_sum").innerHTML =  ${sum};
});	
	$('#online').click(function(){
		var total_sum = document.getElementById('total_sum').value;	 		
		if(total_sum>0){
	    IMP.request_pay({
	        pg : 'inicis',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : "${hotel.hotelRoomName}", // 상품이름
	        amount : total_sum,//가격
	        buyer_name : "${hotel.hotelUserName}",//이름 
	        buyer_tel : "${hotel.hotelUserPhone}"//전화번호 
			}, function(rsp){
				if(rsp.success){
						DBinsert();
			} else {
					msg = '결제가 실패하였습니다.';
					msg += '에러내용 :' + rsp.error_msg;
					location.href="<%=request.getContextPath()%>/order/payFail";
				alert(msg);
			}
		});
	} else {
		DBinsert();
		}
	});
	
	function DBinsert() {
		var hotelUserName = "${sessionScope.loginUser.userName}";
		console.log(hotelUserName);
		var hotelUserPhone = "${sessionScope.loginUser.userPhone}";
		var hotelCheckIn = "${hotel.hotelCheckIn}";
		var hotelCheckOut = "${hotel.hotelCheckOut}";
		var hotelAnimalKind = "${hotel.hotelAnimalKind}";
		var hotelSpecialNote = "${hotel.hotelSpecialNote}";
		var hotelRoomName = "${hotel.hotelRoomName}";
		var hotelPrice = "${hotel.hotelPrice}";
		var hotelPayment = "${hotel.hotelPayment}";
		var hotelUserId = "${sessionScope.loginUser.userId}";
		var hotelCode = "${hotel.hotelCode}";
		var hotelReservePrice = document.getElementById("total_sum").value;
		var use_point = document.getElementById("point").value;
		var hotelReservePoint = hotelReservePrice * 0.05;

		console.log(coupon);
		if($('input:radio[name="coupon"]:checked').val() == null  || $('input:radio[name="coupon"]:checked').val()==''){
			$.ajax({
				type : "GET",
				url : "kakao/cardPament",
				dataType : "json",
				data : {
					"hotelUserName" : hotelUserName,
					"hotelUserPhone" : hotelUserPhone,
					"hotelCheckIn" : hotelCheckIn,
					"hotelCheckOut" : hotelCheckOut,
					"hotelAnimalKind" : hotelAnimalKind,
					"hotelSpecialNote" : hotelSpecialNote,
					"hotelPayment" : hotelPayment,
					"hotelUserId" : hotelUserId,
					"hotelRoomName" : hotelRoomName,
					"hotelPrice" : hotelPrice,
					"use_point" : use_point,
					"hotelReservePrice" : hotelReservePrice,
					"hotelReservePoint" : hotelReservePoint
				},
				success : function(result) {
					location.href = "hotelList";
					alert('결제 성공하셨습니다.');
				}
			});
		} else {
			var string = $('input:radio[name="coupon"]:checked').val();
			var coupon = string.split(',')[1];
			string = $('input:radio[name="coupon"]:checked').val();
			coupon = string.split(',')[1];
			$.ajax({
				type : "GET",
				url : "kakao/cardPament",
				dataType : "json",
				data : {
					"hotelCode" : hotelCode,
					"hotelUserName" : hotelUserName,
					"hotelUserPhone" : hotelUserPhone,
					"hotelCheckIn" : hotelCheckIn,
					"hotelCheckOut" : hotelCheckOut,
					"hotelAnimalKind" : hotelAnimalKind,
					"hotelSpecialNote" : hotelSpecialNote,
					"hotelPayment" : hotelPayment,
					"hotelUserId" : hotelUserId,
					"hotelRoomName" : hotelRoomName,
					"hotelPrice" : hotelPrice,
					"couponCode" : coupon,
					"hotelReservePrice" : hotelReservePrice,
					"hotelReservePoint" : hotelReservePoint
				},
				success : function() {
					location.href = "hotelList";
					alert('결제 성공하셨습니다.');
				}
			});
		}
	};
</script>


<script>
		// 선택포인트 사용
		document.querySelector('#point_use').addEventListener('click',function(){
			var use_point = document.getElementById("point").value;
			var check = ${sum} >= use_point;
			var total_sum = ${sum} - use_point;
			var original_point = ${sessionScope.loginUser.userPoint} - use_point;

			if(${sessionScope.loginUser.userPoint} >= 0 && check == true && use_point > 0){
	         // 합계 금액 
	          document.getElementById("total_sum").value = total_sum;
	          document.getElementById("total_sum").innerHTML =  total_sum;       
	          // 잔여포인트
	          document.getElementById('original_point').value =  original_point;
	          document.getElementById("original_point").innerHTML = original_point;       
	       } else if (use_point > total_sum){
	          alert("금액 이상의 포인트는 사용할 수 없습니다.");
	       } else {
			   alert("포인트가 부족하여 사용 하실 수 없습니다.");
				}
		});
</script>
<script>
//쿠폰 사용 후 금액 차감
		 $('input[name=coupon]:radio').change(function() {	
		var string = $('input:radio[name="coupon"]:checked').val();
		var coupon = string.split(',')[0];
		var sum = ${sum};
		if (coupon > 100){
		 var total_sum = sum - coupon;
		 document.getElementById("total_sum").value = total_sum;
         document.getElementById("total_sum").innerHTML =  total_sum;      
		} else {
		 var total_sum = sum * (100-coupon)/100;
		 document.getElementById("total_sum").value = total_sum;
         document.getElementById("total_sum").innerHTML =  total_sum;      
			}
		 });
</script>

<!-- 쿠폰함 Show, Hide -->
<script>
$(document).ready(function () {
	document.getElementById("msg").innerHTML = "쿠폰함(만원 이상만 사용 가능)";
	$("#couponBoxShow").show();
	$("#couponBoxHide").hide();
	$("#pointBoxShow").show();
	$("#pointBoxHide").hide();
});
function couponBoxShow() {
	$("#couponBoxShow").hide();
	$("#couponBoxHide").show();
	$("#pointBoxShow").hide();
	$("#pointBoxHide").hide();
}
function couponBoxHide() {
	$("#couponBoxShow").show();
	$("#couponBoxHide").hide();
	$("#pointBoxShow").show();
	$("#pointBoxHide").hide();
}
function pointBoxShow() {
	$("#couponBoxShow").hide();
	$("#couponBoxHide").hide();
	$("#pointBoxShow").hide();
	$("#pointBoxHide").show();
}
function pointBoxHide() {
	$("#couponBoxShow").show();
	$("#couponBoxHide").hide();
	$("#pointBoxShow").show();
	$("#pointBoxHide").hide();
}
</script>

</html>