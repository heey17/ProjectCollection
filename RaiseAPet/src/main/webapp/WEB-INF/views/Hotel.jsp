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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<title>HOTEL</title>
<style>
.main-menu-li:hover {
	font-color: #DDC3F7;
}

.track {
	width: 100%;
	height: 300px;
	overflow: hidden;
	background: linear-gradient(to top, #209cff 0%, #68e0cf 100%) no-repeat;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>


<!-- Font -->

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">

<!-- Stylesheets -->
<link href="resources/common-css/bootstrap.css" rel="stylesheet">
<link href="resources/common-css/ionicons.css" rel="stylesheet">
<link href="resources/01-homepage/css/styles.css" rel="stylesheet">
<link href="resources/01-homepage/css/responsive.css" rel="stylesheet">

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
<body>
	<header style="height: 40%;">

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

			<div class="menu-nav-icon" data-nav-menu="#main-menu">
				<i class="ion-navicon"></i>
			</div>

			<ul class="main-menu visible-on-click" id="main-menu">
				<li class="main-menu-li"><a href="hotelList">HOTEL</a></li>
				<li class="main-menu-li"><a href="medical">MEDICAL</a></li>
				<li class="main-menu-li"><a href="beauty">BEAUTY</a></li>
				<li class="main-menu-li"><a href="goodsList">GOODS</a></li>
				<li class="main-menu-li"><a href="educationList">EDUCATION</a></li>
				<li class="main-menu-li"><a href="reviewList">REVIEW</a></li>
				<li class="main-menu-li"><a href="eventList">EVENT</a></li>
				<li class="main-menu-li"><a href="noticeList">NOTICE</a></li>
			</ul>
			<!-- main-menu -->

		</div>
		<!-- conatiner -->
	</header>

	<!-- //////////////////////////////////////////////////////////////////////////////// -->
	<!-- slider -->
	<br>
	<br>
	<div class="w3-content w3-display-container">
		<table style="margin:0 auto;">
			<tr>
				<td >
					<button class="w3-button w3-black w3-display-left"onclick="plusDivs(-1, 0)" style="font-size:70px">&#10094;</button>
				</td>
				<td>
					<img class="mySlides1"src="resources/hotelFile/호텔작은방1.jpg"style="width: 800px; height:400px">
					<img class="mySlides1"src="resources/hotelFile/호텔작은방2.jpg"style="width: 800px; height:400px">
					<img class="mySlides1"src="resources/hotelFile/호텔작은방3.jpg"style="width: 800px; height:400px">
					<img class="mySlides1"src="resources/hotelFile/호텔작은방4.jpg"style="width: 800px; height:400px">
					<img class="mySlides1"src="resources/hotelFile/호텔작은방5.jpg"style="width: 800px; height:400px">
					<c:if test="${not empty sessionScope.loginUser}">
						<a class="btn" href="hotelReservation?code=${hotel1.hotelCode}" style="position: relative; bottom:60px; left:83%">예약하기</a>
					</c:if>
					<c:if test="${empty sessionScope.loginUser}">
						<a class="btn" onclick="goLoginForm()"style="position: relative; bottom:60px; left:83%">예약하기</a>
					</c:if>
				</td>
				<td><button class="w3-button w3-black w3-display-right"onclick="plusDivs(1, 0)" style="font-size:70px">&#10095;</button>
				</td>
			</tr>
		</table>
	</div>

	<div class="w3-content w3-display-container">
		<table style="margin:0 auto;">
			<tr>
				<td><button class="w3-button w3-black w3-display-left"
						onclick="plusDivs(-1, 1)" style="font-size:70px">&#10094; </button></td>
				<td id="slider2">
					<img class="mySlides2"src="resources/hotelFile/호텔중간방1.jpg"style="width: 800px; height:400px">
				    <img class="mySlides2"src="resources/hotelFile/호텔중간방2.jpg"style="width: 800px; height:400px">
				    <img class="mySlides2"src="resources/hotelFile/호텔중간방3.jpg"style="width: 800px; height:400px">
				    <img class="mySlides2"src="resources/hotelFile/호텔중간방4.jpg"style="width: 800px; height:400px">
					<img class="mySlides2"src="resources/hotelFile/호텔중간방5.jpg"style="width: 800px; height:400px">
					<c:if test="${not empty sessionScope.loginUser}">
						<a class="btn" href="hotelReservation?code=${hotel2.hotelCode}" style="position: relative; bottom:60px; left:83%">예약하기</a>
					</c:if>
					<c:if test="${empty sessionScope.loginUser}">
						<a class="btn" onclick="goLoginForm()" style="position: relative; bottom:60px; left:83%">예약하기</a>
				</c:if>	
				</td>
				<td><button class="w3-button w3-black w3-display-right"onclick="plusDivs(1, 1)" style="font-size:70px">&#10095;</button></td>
			</tr>
		</table>
			
	</div>
	<div class="w3-content w3-display-container">
		<table style="margin:0 auto;">
			<tr>
				<td><button class="w3-button w3-black w3-display-left"onclick="plusDivs(-1, 2)" style="font-size:70px">&#10094;</button></td>
					<td id="slider3">
						<img class="mySlides3"src="resources/hotelFile/호텔큰방1.jpg"style="width: 800px; height:400px">
						<img class="mySlides3"src="resources/hotelFile/호텔큰방2.jpg"style="width: 800px; height:400px">
						<img class="mySlides3"src="resources/hotelFile/호텔큰방3.jpg"style="width: 800px; height:400px">
						<img class="mySlides3"src="resources/hotelFile/호텔큰방4.jpg"style="width: 800px; height:400px">
						<img class="mySlides3"src="resources/hotelFile/호텔큰방5.jpg"style="width: 800px; height:400px">
						<c:if test="${not empty sessionScope.loginUser}">
							<a class="btn" href="hotelReservation?code=${hotel3.hotelCode}" style="position: relative; bottom:60px; left:83%">예약하기</a>
						</c:if>
						<c:if test="${empty sessionScope.loginUser}">
							<a class="btn" onclick="goLoginForm()" style="position: relative; bottom:60px; left:83%">예약하기</a>
						</c:if>
					</td>
				<td>
				<button class="w3-button w3-black w3-display-right"onclick="plusDivs(1, 2)" style="font-size:70px">&#10095;</button></td>
			</tr>
		</table>
	

	</div>
	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
						<ul class="social-icons"
						>
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
	<script>
		var slideIndex = [ 1, 1, 1];
		var slideId = [ "mySlides1", "mySlides2", "mySlides3"]
		showDivs(1, 0);
		showDivs(1, 1);
		showDivs(1, 2);

		function plusDivs(n, no) {
			showDivs(slideIndex[no] += n, no);
		}

		function showDivs(n, no) {
			var i;
			var x = document.getElementsByClassName(slideId[no]);
			if (n > x.length) {
				slideIndex[no] = 1
			}
			if (n < 1) {
				slideIndex[no] = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex[no] - 1].style.display = "block";
		}
	</script>
	

	<!-- SCIPTS -->
	<script>
		function goLoginForm() {
			alert('로그인후 이용가능합니다.');
			location.href = "memberLoginForm";
		}
	</script>
	<script src="resources/common-js/jquery-3.1.1.min.js"></script>

	<script src="resources/common-js/tether.min.js"></script>

	<script src="resources/common-js/bootstrap.js"></script>

	<script src="resources/common-js/layerslider.js"></script>

	<script src="resources/common-js/scripts.js"></script>

</body>
</html>