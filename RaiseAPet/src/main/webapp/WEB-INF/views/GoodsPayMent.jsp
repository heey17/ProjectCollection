<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Raise A Pet</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shorcut icon" href="resources/favicon.ico">
<meta charset="UTF-8">
<!-- Font -->

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">


<!-- Stylesheets -->
<link href="resources/common-css/bootstrap.css" rel="stylesheet">
<link href="resources/common-css/ionicons.css" rel="stylesheet">
<link href="resources/common-css/layerslider.css" rel="stylesheet">
<link href="resources/01-homepage/css/styles.css" rel="stylesheet">
<link href="resources/01-homepage/css/responsive.css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js">
</script>
<style>
span {
	width: 60px;
	display: inline-block;
}

textarea {
	width: 40%;
	height: 280px;
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
	input[type=radio]{
	display: none;
	}
	input[type=radio]+label{
	display:inline-block;
	font-size: 14px;
	width: 120px;
	height: 40px;
	border: none;
	background-color: #f3d4ff;
	border-radius: 12px;
	padding-top: 10px;
	}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<!-- 우편주소 API script start -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 카카오페이 가맹점 식별코드 -->
<script>
	var IMP = window.IMP;
	IMP.init('imp23418340'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	var msg;
</script>
<script>
	//포인트 폼
	function Point22() {
		var data = "";
		data +="<table style='margin:2% auto; text-align: center;'><tr>"
		data += "<th>포인트적용</th>";
		data += "<input type='hidden' name='userId' value='${sessionScope.loginUser.userId}'>";
		data += "<th><small style='font-size:14px;' id='userPoint'>잔여포인트:<a onclick='all_point()' id='point'>"+${sessionScope.loginUser.userPoint}+"</a></small><br/>";
		data += "<input type='text' id='goodsReservePointUseing' name='userPoint' value='0'><a onclick='usePoint()'>사용</a></th></tr></table>";
		$('#goodsReservePointCouponForm').html(data);
	}

	//쿠폰사용
	function Coupon22(){
		//쿠폰조회
		$.ajax({
			type : "GET",
			url : "medicalReserveCouponList",
			data : {
				"userId" : "${sessionScope.loginUser.userId}"
					},
			dataType : "json",
			success : function(result) {
				medicalReserveCouponList(result);
			},
			error : function() {
				alert("쿠폰조회 실패");
			}
		});
	}
	//쿠폰 폼
	function medicalReserveCouponList(result){
		var output = "";
		output += "<table style='margin:2% auto; text-align: center;'><tr>";
			if (result != null) {
				for (var i in result) {
					output += "<th>쿠폰적용</th>";
					output += "<td><input type='hidden' id='CouponSale"+i+"' name='CouponSale' value='"+result[i].couponSale+"'>";
					output += result[i].couponName+"<input type='radio'  name='couponCode' value='"+result[i].couponCode+"'onclick='couponUse("+i+")'></td>";
				}
			} else {
				output += "<td>쿠폰이 없습니다.</td>";
			}
		output += "</tr></table>";
		$('#goodsReservePointCouponForm').html(output);
	}

	//쿠폰 적용시키기
	function couponUse(j) {

		//사용할려는 포인트
		var CouponSale = (100 - document.getElementById('CouponSale' + j).value) / 100;
		//초기값
		var price = document.getElementById('price').value;
		//가격 변동
		var total_sum = price * CouponSale;

		//적용시킨 값으로 띄워주기
		document.getElementById('buyPrice').value = total_sum;
		document.getElementById("total_sum").innerHTML = total_sum + "원";
		$("#goodsReservePointCouponForm").hide();
	}

	//전액 포인트 사용
	function all_point() {
		var userPoint = ${sessionScope.loginUser.userPoint};
		document.getElementById('point').value = 0;
		document.getElementById("point").innerHTML = 0;
		document.getElementById('goodsReservePointUseing').value = userPoint;
		document.getElementById("goodsReservePointUseing").innerHTML = userPoint;
	}

	//포인트 적용
	function usePoint() {
		//현재 포인트
		var Point = ${sessionScope.loginUser.userPoint};
		//사용할려는 포인트
		var goodsReservePointUseing = document.getElementById('goodsReservePointUseing').value;
		//포인트 변동
		var userPoint = Point - goodsReservePointUseing;

		//현재 가격
		var price = document.getElementById('price').value;

		//가격 변동
		var total_sum = price - goodsReservePointUseing;

		//사용할려는 포인트가 현재포인트보다 높을땐 포인트 초과창을 띄우게 되고 아니면 총가격에서 사용할려는 포인트를 빼준다.
		console.log(Point >= goodsReservePointUseing);
		console.log(price > goodsReservePointUseing);
		console.log(price);
		console.log(goodsReservePointUseing);
		console.log(goodsReservePointUseing >= 0);

		if (Point >= goodsReservePointUseing & goodsReservePointUseing >= 0) {
			document.getElementById('point').value = userPoint;
			document.getElementById("point").innerHTML = userPoint;

			document.getElementById('buyPrice').value = total_sum;
			document.getElementById("total_sum").innerHTML = total_sum + "원";
			$("#goodsReservePointCouponForm").hide();
		} else {
			alert('포인트가 사용할수 없습니다.');
			document.getElementById('point').value = Point;
			document.getElementById("point").innerHTML = Point;
			document.getElementById('goodsReservePointUseing').value = 0;
			document.getElementById("goodsReservePointUseing").innerHTML = 0;
			document.getElementById('buyPrice').value = price;
			document.getElementById("total_sum").innerHTML = "총금액  : " + price;
		}

	}


//카카오페이
function payment(){
	var goodsName = document.getElementById('goodsName').value;//용품 번호
	var buyUserId = document.getElementById('buyUserId').value;//아이디값
	var buyPrice = document.getElementById('buyPrice').value;//가격
	var buyGoodsNum = document.getElementById('buyGoodsNum').value;//용품 번호
	 IMP.request_pay({
	 pg : 'inicis',
	 pay_method : 'card',
	 merchant_uid : 'merchant_' + new Date().getTime(),
	 name : goodsName,// 상품이름
	 amount : buyPrice, // 가격
	 buyer_name : buyUserId
	  // 이름
	 }, function(rsp) {
	    if (rsp.success){
	    	GoodsInsert();
	    }else{
		msg = '결제를 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
		location.href = "goodsView?goodsNum="+buyGoodsNum;
		alert(msg);
		}

	});
}
//ajax로 결제 정보 db에 저장하기
function GoodsInsert(){
var buyGoodsNum = document.getElementById('buyGoodsNum').value;//용품 번호
var buyUserId = document.getElementById('buyUserId').value;//아이디값
var buyPayMent = document.getElementById('buyPayment').value;//결제내용
var buyAddress = document.getElementById('address').value;//주소
var buyDelivery = document.getElementById('buyDelevery').value;
var buyCount = document.getElementById('buyCount').value;//용품갯수
var buyPrice = document.getElementById('buyPrice').value;//가격
	$.ajax({
	type : "POST",
	url : "goodsPayMents",
	dataType : "json",
	data : {
			"buyGoodsNum" : buyGoodsNum,
			"buyUserId" : buyUserId,
			"buyPayMent" : buyPayMent,
			"buyAddress" : buyAddress,
			"buyDelivery" : buyDelivery,
			"buyCount" : buyCount,	
			"buyPrice" : buyPrice,
			},
	success : function(result) {
			alert("결제되었습니다.");
			location.href = "goodsView?goodsNum="+buyGoodsNum;
			},
	error   : function() {
			alert("결제x");
			}
	});
}


// 기존 배송 정보
function address(){

   if(${sessionScope.loginUser.userAddress.equals("정보 없음")}){
      alert("배송지 정보가 없습니다 배송지를 적어주세요");

      var output = "<div>";
      output += "<input type='text' id='postcode' name='postcode' placeholder='우편번호'>";
      output += "<input type='button' onclick='execDaumPostcode()' value='우편번호 찾기'><br>";
      output += "<input type='text' id='address' name='address' placeholder='주소'><br>";
      output += "<input type='text' id='detailAddress' name='detailAddress' placeholder='상세주소'>";
      output += "<input type='text' id='extraAddress' name='extraAddress' placeholder='참고항목'>";
      output += "<input type='button' onclick='addressUpdate()' value='등록'>";
      output += "</div>";
      $("#addressChange").html(output);
   }else{
   
      var output = "<div>";
      output += "${sessionScope.loginUser.userAddress}";
      output += "<input type='hidden' id='address' name='buyAddress' value='${sessionScope.loginUser.userAddress}'>";
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
   output += "<input type='text' id='postcode' name='postcode' placeholder='우편번호'>";
   output += "<input type='button' onclick='execDaumPostcode()' value='우편번호 찾기'><br>";
   output += "<input type='text' id='address' name='address' placeholder='주소'><br>";
   output += "<input type='text' id='detailAddress' name='detailAddress' placeholder='상세주소'>";
   output += "<input type='text' id='extraAddress' name='extraAddress' placeholder='참고항목'>";
   output += "<input type='button' onclick='addressUpdate()' value='등록'>";
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
      url : "goodsAddressUpdate",
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
//주소 api
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

<body>
	<header style="height: 20%; ">
			<div style="height: 100%; width: 39%; margin: 0 auto; text-align: center;">
				<a href="./" class="logo" style="height: 100%; padding: 0;"> 
				<img src="resources/images/logo.png" alt="Logo Image" style="float: center; height: 100%;">
				</a>
			</div>	
		<!-- conatiner -->
	</header>


<div style="width:40%; margin:2% auto; text-align: center;">

	<h3>결제페이지</h3>
		<input type="hidden" name="buyGoodsNum" id="buyGoodsNum" value="${goodsPayMent.goodsNum}">
		<input type="hidden" name="buyPayment" id="buyPayment" value="온라인결제"> 
		<input	type="hidden" name="buyDelevery" id="buyDelevery" value="배송준비중">
		<input type="hidden" id="buyCount" name="buyCount" value="${goodsPayMent.buyCount}">
		
	<table style="text-align: center; margin:2% auto; width:100%;">
		<tr>
			<td>상품명</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td>아이디</td>
		</tr>
		<tr>
			<td><img src="resources/goodsFile/${goodsView.goodsImage1}" style="width:150px; height:150px;"/><br/><input type="hidden" name="goodsName" id="goodsName" value="${goodsView.goodsName}">${goodsView.goodsName}</td>
			<td>${sessionScope.loginUser.userEmail}</td>
			<td>${sessionScope.loginUser.userPhone}</td>
			<td><input type="hidden" name="buyUserId" id="buyUserId" value="${sessionScope.loginUser.userId}">${sessionScope.loginUser.userId}</td>
		</tr>
	</table >
      <!-- 주소지 -->
      <table style="width:60%; margin:2% auto; text-align: center;">
      <tr>
         <td>
         <input type="radio" name="address"><label for="radios1" onclick="address()">기본배송지 설정</label>
         <input type="radio" name="address"><label for="radios1" onclick="newAddress()">새로운 배송지 설정</label>
         <input type="hidden" id="addressCheckResult" value=0> <!-- 배송지 어떤 걸로 선택 했는 지 -->
         
         <div id="addressChange">
            ${sessionScope.loginUser.userAddress}
            <input type='hidden' name='buyAddress' value='${sessionScope.loginUser.userAddress}'>
         </div><br>
         <div id="addressResult"></div>
         </td>
      </tr>
      </table>


	<!--쿠폰,포인트 사용여부  -->
	<table style="width:60%; margin:2% auto; text-align: center;">
		<tr>
			<td>
				<input type='radio' name='PointCoupon' value='포인트사용하기'><label for="radios1" onclick='Point22()'>포인트 사용하기</label>
				<input type='radio' name='PointCoupon' value='쿠폰사용하기'><label for="radios1" onclick='Coupon22()'>쿠폰사용하기</label>		
			</td>
		</tr>
		<tr>
			<td id="goodsReservePointCouponForm"></td>
		</tr>
		<tr>
			<td>
				<!--변경된 값,넘겨주는 값-->
				<input type="hidden" id="price" name="buyPrice" value="${goodsPayMent.buyPrice}">
				<input type="hidden" id="buyPrice" name="buyPrice" value="${goodsPayMent.buyPrice}">
			</td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="buyCount" value="${goodsPayMent.buyCount}">${goodsView.goodsName}+${goodsPayMent.buyCount}
			</td>
		</tr>
		<tr>
			<td id="total_sum">
				총금액 : ${goodsPayMent.buyPrice}
			</td>
		</tr>
		<tr>
			<td>
			<!--초기값,보여주는 값  -->
				<button onclick="payment()">결제</button>
				<button onclick="location.href='goodsView?goodsNum=${goodsPayMent.goodsNum}'">취소</button>
			</td>
		</tr>
	</table>
	
</div>
	
	<!-- SCIPTS -->

	<script src="resources/common-js/jquery-3.1.1.min.js"></script>

	<script src="resources/common-js/tether.min.js"></script>

	<script src="resources/common-js/bootstrap.js"></script>

	<script src="resources/common-js/layerslider.js"></script>

	<script src="resources/common-js/scripts.js"></script>
</body>
</html>