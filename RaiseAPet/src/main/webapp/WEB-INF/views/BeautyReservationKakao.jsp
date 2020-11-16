<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>온라인 결제</title>
</head>
<body>
	<button id="card">카카오페이</button>
</body>
<script>
//jsp가 실행될때 자동으로 실행되는 부분
var IMP = window.IMP; // 생략가능
IMP.init('imp23418340'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var msg;
</script>
<script>
	$('#card').click(function(){	    
	    IMP.request_pay({
	        pg : 'inicis', //api주소역할?
	        pay_method : 'card',//
	        merchant_uid : 'merchant_' + new Date().getTime(), //결제 시간
	        name : '${beauty.beautyReserveDesigner}',//디자이너 코드
	        amount : "${beauty.beautyReservePrice}",//가격
	        buyer_name : '${beauty.beautyReserveUserId}',//이름 
	        buyer_tel : '${sessionScope.loginUser.userPhone}'//전화번호 
			}, function(rsp){
				if(rsp.success){
					kakaoPay();
				} else {
					msg = '결제가 실패하였습니다.';
					msg += '에러내용 :' + rsp.error_msg;
					location.href="<%=request.getContextPath()%>/order/payFail";
					alert(msg);
				}
				});
			});

	//카카오페이
	function kakaoPay(){
		$.ajax({
			type : 'POST',
			url :"beautyKakaoPayment",
			data :{
				"beautyReserveDate":"${beauty.beautyReserveDate}",
				"beautyReserveTime":"${beauty.beautyReserveTime}",
				"beautyReserveAnimalKind" : "${beauty.beautyReserveAnimalKind}",
				"beautyReserveAnimalAge":${beauty.beautyReserveAnimalAge},
				"beautyReserveAnimalNote":"${beauty.beautyReserveAnimalNote}",
				"beautyReserveSubject":"${beauty.beautyReserveSubject}",
				"beautyReserveDesigner":"${beauty.beautyReserveDesigner}",
				"beautyReserveUserId":"${beauty.beautyReserveUserId}",
				"beautyReservePrice":${beauty.beautyReservePrice},
				"beautyReservePayment":"${beauty.beautyReservePayment}",
				"userId":"${sessionScope.loginUser.userId}",
				"userPoint":${sessionScope.loginUser.userPoint},
				"couponCode":"${coupon.couponCode}"
			   },
			   dataType : 'json',
			   success : function(){
				   alert("예약완료");
					window.close();
					},
				error:function(){
					alert("예약x");
					window.close();
					}
			});					
	}
</script>
</html>