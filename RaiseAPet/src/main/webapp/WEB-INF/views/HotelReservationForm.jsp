<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shorcut icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>호텔예약</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("input:radio[name=hotelPayment]").click(function() {

			if ($("input[name=hotelPayment]:checked").val() == "온라인결제") {
				$('#cashiPayment').hide();
				$('#cardPayment').show();
			} else {
				$('#cardPayment').hide();
				$('#cashiPayment').show();
			}
		});
	});
</script>
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
<style>
    th{
    	 text-align:center;
    }
    th, td{
    	border-bottom: 1px solid #ddd;
    	height : 60px;
		
    }
</style>
<style>
#contents{
	padding-top:40px;
	width:45%;
	max-width: 1500px;
	min-width: 800px;
	margin:0 auto;
}
.main-menu-li:hover {
	font-color: #DDC3F7;
}
/* 브라우저 마진과 패딩 리셋 */
* {
	margin: 0;
	padding: 0;
}

/* INPUT 가리기 */
.section [id*="slide"] {
	display: none;
}

/* 슬라이드 영역 - max-width 크기를 조절해주면 됩니다*/
.section .slidewrap {
	max-width: 1200px;
	margin: 0 auto;
	overflow: hidden;
	position: relative;
}

.section .slidelist {
	white-space: nowrap;
	font-size: 0;
}

.section .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}
.section .slidelist>li>a {
	display: block;
	position: relative;
}
/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
.section .slide-control {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 10;
	width: 100%;
	height: 100%;
}
.section .slide-control label {
	position: absolute;
	z-index: 1;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}
.section .slide-control .left {
	left: 30px;
	background: url('resources/images/left.png') center center/100% no-repeat;
}
.section .slide-control .right {
	right: 30px;
	background: url('resources/images/right.png') center center/100% no-repeat;
}
.section .slide-control [class*="control"] {
	display: none;
}
/* INPUT이 체크되면 변화값이 li까지 전달되는 스타일 */
.section [id="slide01"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(0%);
}
.section [id="slide02"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-100%);
}
.section [id="slide03"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-200%);
}
.section [id="slide04"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-300%);
}
.section [id="slide05"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-400%);
}
/*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
.section [id="slide01"]:checked ~ .slidewrap .control01 {
	display: block;
}
.section [id="slide02"]:checked ~ .slidewrap .control02 {
	display: block;
}
.section [id="slide03"]:checked ~ .slidewrap .control03 {
	display: block;
}
.section [id="slide04"]:checked ~ .slidewrap .control04 {
	display: block;
}
.section [id="slide05"]:checked ~ .slidewrap .control05 {
	display: block;
}
</style>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">

<!-- Stylesheets -->
<link href="resources/common-css/bootstrap.css" rel="stylesheet">
<link href="resources/common-css/ionicons.css" rel="stylesheet">
<link href="resources/common-css/layerslider.css" rel="stylesheet">
<link href="resources/01-homepage/css/styles.css" rel="stylesheet">
<link href="resources/01-homepage/css/responsive.css" rel="stylesheet">
<script src="resources/common-js/jquery-3.1.1.min.js"></script>
<script src="resources/common-js/tether.min.js"></script>
<script src="resources/common-js/bootstrap.js"></script>
<script src="resources/common-js/scripts.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>
	<header style=" height:40%;">

		<div class="middle-menu center-text" style=" height:77%;">
				<div style="width:20%; height:25px; float:right;">	
					<c:if test="${empty sessionScope.loginUser }">
						<a href="memberJoinForm"><img src="resources/svg/add.svg" alt="Join Image" style="width:25px; height:25px; float:right;"></a>
						<a href="memberLoginForm"><img src="resources/svg/lock.svg" alt="Login Image" style="width:25px; height:25px; float:right;"></a>
					</c:if>
					<c:if test="${not empty sessionScope.loginUser }">
					<!-- 추가 -->
						<a id="popUpBtnBasket"><img src="resources/svg/cart.svg" alt="Cart Image" style="width:25px; height:25px; float:right;"></a>
						<!-- 추가 -->
						<a onclick="couponCount()"><img src="resources/svg/user.svg" alt="MyPage Image" style="width:25px; height:25px; float:right;"></a>
						<a href="memberLogout"><img src="resources/svg/lock-open.svg" alt="Logout Image" style="width:25px; height:25px; float:right;"></a>
					</c:if>
				</div>
			<div style="height:100%;  width:39%; margin:0 auto;">
				<a href="./" class="logo" style=" height: 100%; padding:0;">
					<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 100%;">
				</a>
			</div>	
		</div>
		

		<div class="bottom-area">

			<div class="menu-nav-icon" data-nav-menu="#main-menu"><i class="ion-navicon"></i></div>

			<ul class="main-menu visible-on-click" id="main-menu" >
				<li class="main-menu-li"><a href="hotelList">HOTEL</a></li>
				<li class="main-menu-li"><a href="medical">MEDICAL</a></li>
				<li class="main-menu-li"><a href="beauty">BEAUTY</a></li>
				<li class="main-menu-li"><a href="goodsList">GOODS</a></li>
				<li class="main-menu-li"><a href="educationList">EDUCATION</a></li>
				<li class="main-menu-li"><a href="reviewList">REVIEW</a></li>
				<li class="main-menu-li"><a href="eventList">EVENT</a></li>
				<li class="main-menu-li"><a href="noticeList">NOTICE</a></li>
			</ul><!-- main-menu -->

		</div><!-- conatiner -->
	</header>
	<!-- /////////////////////////////////////////////////////////////////////////// -->

<div class="section" id="contents">
			<input type="radio" name="slide" id="slide01" checked>
			<input type="radio" name="slide" id="slide02"> 
			<input type="radio"	name="slide" id="slide03">
			<input type="radio" name="slide"id="slide04"> 
			<input type="radio" name="slide" id="slide05">
			<div class="slidewrap" style="width: 800px; height:400px">
				<ul class="slidelist">
					<li><a> <img
							src="resources/hotelFile/${hotel.hotelRoomImage1}">
					</a></li>
					<li><a> <img
							src="resources/hotelFile/${hotel.hotelRoomImage2}">
					</a></li>
					<li><a> <img
							src="resources/hotelFile/${hotel.hotelRoomImage3}">
					</a></li>
					<li><a> <img
							src="resources/hotelFile/${hotel.hotelRoomImage4}">
					</a></li>
					<li><a> <img
							src="resources/hotelFile/${hotel.hotelRoomImage5}">
					</a></li>
				</ul>
				<div class="slide-control">
					<div class="control01">
						<label for="slide05" class="left"></label> <label for="slide02"
							class="right"></label>
					</div>
					<div class="control02">
						<label for="slide01" class="left"></label> <label for="slide03"
							class="right"></label>
					</div>
					<div class="control03">
						<label for="slide02" class="left"></label> <label for="slide04"
							class="right"></label>
					</div>
					<div class="control04">
						<label for="slide03" class="left"></label> <label for="slide05"
							class="right"></label>
					</div>
					<div class="control05">
						<label for="slide04" class="left"></label> <label for="slide01"
							class="right"></label>
					</div>
				</div>
			</div>
			<div style=" margin-bottom: 20px; margin-top: 30px">
			<input type="radio" name="hotelPayment" value="온라인결제">&nbsp;&nbsp;온라인결제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="hotelPayment" value="현장결제">&nbsp;&nbsp;현장결제 
			<!-- 온라인 결제 선택시 표출 -->
			<div id="cardPayment" style="display: none;  padding:5px; ">
				<form action="kakaopay" method="POST" name="kakaopay">
					<table style="border:#DDC3F7; border-color: puple;">
						<tr>
							<td style="width:15%">입실날짜</td>
							<td><input type="text" id="startDatepicker" name="hotelCheckIn"></td>
							<td rowspan="7" style="padding-left:5px; ">${hotel.hotelContents}</td>
						</tr>
						<tr>
							<td>퇴실날짜</td>
							<td><input type="text" id="lastDatepicker" name="hotelCheckOut"></td>
						</tr>
									<input type="hidden" name="hotelCode"value="${hotel.hotelCode}">
									<input type="hidden" name="hotelUserName"value="${sessionScope.loginUser.userName}">
									<input type="hidden" name="hotelUserPhone"value="${sessionScope.loginUser.userPhone}">
									<input type="hidden" name="hotelUserId"value="${sessionScope.loginUser.userId}">
									<input type="hidden" name="hotelPrice"value="${hotel.hotelPrice}">
									<input type="hidden" name="hotelPayment" value="온라인결제">
									<input type="hidden" name="hotelRoomName"value="${hotel.hotelRoomName}">
									<tr>
										<td>방 이름</td>
										<td>${hotel.hotelRoomName}</td>
									</tr>
									<tr>
										<td>방크기</td>
										<td>${hotel.hotelSize}</td>
									</tr>
			
									<tr>
										<td>가격</td>
										<td>${hotel.hotelPrice}</td>
									</tr>
									<tr>
										<td>애완동물 종류</td>
										<td><input type="radio" name="hotelAnimalKind" value="강아지">강아지<br/>
											<input type="radio" name="hotelAnimalKind" value="고양이">고양이
										</td>
									</tr>
									<tr>
										<td>특이사항</td>
										<td><textarea name="hotelSpecialNote" rows="10" cols="40" style="resize: none;"></textarea></td>
									</tr>
								<tr><td colspan="3"><input type="submit" value="결제하기" style="position: relative; left:190px"></td></tr>
					</table>
				</form>
			</div>
	
			<!-- 현장결제 선택시 표출 -->
			<div id="cashiPayment" style="display: none; padding:5px;">
			<form action="cashiPayment" method="POST" name="cardPayment">
					<table style="border:#DDC3F7; border-color: puple;">
						<tr>
							<td style="width:15%">입실날짜</td>
							<td><input type="text" id="ofDatepicker" name="hotelCheckIn"></td>
							<td rowspan="7" style="padding-left:5px; ">${hotel.hotelContents}</td>
						</tr>
						<tr>
							<td>퇴실날짜</td>
							<td><input type="text" id="ifDatepicker" name="hotelCheckOut"></td>
						</tr>
							<input type="hidden" name="hotelCode"value="${hotel.hotelCode}">
						    <input type="hidden" name="hotelUserName"value="${sessionScope.loginUser.userName}">
							<input type="hidden" name="hotelUserPhone"value="${sessionScope.loginUser.userPhone}">
							<input type="hidden" name="hotelUserId"	value="${sessionScope.loginUser.userId}">
							<input type="hidden" name="hotelPrice"value="${hotel.hotelPrice}">
							<input type="hidden" name="hotelPayment" value="현장결제">
							<input type="hidden" name="hotelRoomName"value="${hotel.hotelRoomName}">
							<input type="hidden" name="hotelPrice" value="${hotel.hotelPrice}">				
						<tr>
							<td>방 이름</td>
							<td>${hotel.hotelRoomName}</td>
						</tr>
						<tr>
							<td>방크기</td>
							<td>${hotel.hotelSize}</td>
						</tr>
						<tr>
							<td>가격</td>
							<td>${hotel.hotelPrice}</td>
						</tr>
						<tr>
							<td>애완동물 종류</td>
							<td><input type="radio" name="hotelAnimalKind" value="강아지">강아지<br/>
								<input type="radio" name="hotelAnimalKind" value="고양이">고양이</td>
						</tr>
						<tr>
							<td>특이사항</td>
							<td><textarea name="hotelSpecialNote" rows="10" cols="40" style="resize: none;"></textarea></td>
						</tr>
						<tr><td colspan="3"><input type="submit" value="결제하기" style="position: relative; left:190px"></td></tr>
				</table>
			</form>
		</div>
	</div>
</div>
			
	
	<!-- //////////////////////////////////////////////////////////////////////////////// -->
	<!-- 푸터 -->
	<footer>
		<div class="container">
			<div class="row">

				<div class="col-sm-6">
					<div class="footer-section">
						<p class="copyright">
							Juli &copy; 2018. All rights reserved | Made with <i
								class="ion-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a> &amp;
							distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
						</p>
					</div>
					<!-- footer-section -->
				</div>
				<!-- col-lg-4 col-md-6 -->

				<div class="col-sm-6">
					<div class="footer-section">
						<ul class="social-icons">
							<li><a href="#"><i class="ion-social-facebook-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-twitter-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-vimeo-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-pinterest-outline"></i></a></li>
						</ul>
					</div>
					<!-- footer-section -->
				</div>
				<!-- col-lg-4 col-md-6 -->

			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</footer>

	<!-- SCIPTS -->
	<script>
		$(function() {
			//모든 datepicker에 대한 공통 옵션 설정
			var thisDate = new Date();
			var thisYear = thisDate.getFullYear(); //해당 연
			var thisMonth = thisDate.getMonth() + 1; //해당 월

			$.datepicker.setDefaults({
				dateFormat : 'yy-mm-dd' //Input Display Format 변경
				,
				showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				,
				showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
				,
				changeYear : true //콤보박스에서 년 선택 가능
				,
				changeMonth : true //콤보박스에서 월 선택 가능         
				,
				yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
				,
				monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
						'9', '10', '11', '12' ] //달력의 월 부분 텍스트
				,
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
				,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
				,
				dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ]
			//달력의 요일 부분 Tooltip 텍스트
			});

			// 온라인 결제 달력
			//시작일의 초기값을 설정
			$('#startDatepicker').datepicker(
					{
						minDate : 0,
						onClose : function(selectedDate) {
							$("#lastDatepicker").datepicker("option",
									"minDate", selectedDate);
							// 시작일(sDatepicker) datepicker가 닫힐때
							// 종료일(eDatepicker)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
						}
					});
			$('#startDatepicker').datepicker('setDate',
					thisYear + '-' + thisMonth + '-01'); //시작일 초기값 셋팅

			//종료일의 초기값을 내일로 설정
			$('#lastDatepicker').datepicker(
					{
						onClose : function(selectedDate) {
							$("#startDatepicker").datepicker("option",
									"maxDate", selectedDate);
							// 종료일(eDatepicker) datepicker가 닫힐때
							// 시작일(eDatepicker)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
						}
					});
			$('#lastDatepicker').datepicker('setDate', 'today'); //끝일 초기값 셋팅

			// 현장결제 달력
			//시작일의 초기값을 설정
			$('#ofDatepicker').datepicker(
					{
						minDate : 0,
						onClose : function(selectedDate) {
							$("#ifDatepicker").datepicker("option", "minDate",
									selectedDate);
							// 시작일(sDatepicker) datepicker가 닫힐때
							// 종료일(eDatepicker)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
						}
					});
			$('#ofDatepicker').datepicker('setDate',
					thisYear + '-' + thisMonth + '-01'); //시작일 초기값 셋팅

			//종료일의 초기값을 내일로 설정
			$('#ifDatepicker').datepicker(
					{
						onClose : function(selectedDate) {
							$("#ofDatepicker").datepicker("option", "maxDate",
									selectedDate);
							// 종료일(eDatepicker) datepicker가 닫힐때
							// 시작일(eDatepicker)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
						}
					});
			$('#ifDatepicker').datepicker('setDate', 'today'); //끝일 초기값 셋팅
		});
	</script>
</body>
</html>