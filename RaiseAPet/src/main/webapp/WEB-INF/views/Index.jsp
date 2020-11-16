<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>Raise A Pet</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shorcut icon" href="resources/favicon.ico">
	<meta charset="UTF-8">
	<style>
		.main-menu-li:hover{
			font-color:#DDC3F7;
		}
	</style>


	<!-- Font -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->
	<link href="resources/common-css/bootstrap.css" rel="stylesheet">
	<link href="resources/common-css/ionicons.css" rel="stylesheet">
	<link href="resources/common-css/layerslider.css" rel="stylesheet">
	<link href="resources/01-homepage/css/styles.css" rel="stylesheet">
	<link href="resources/01-homepage/css/responsive.css" rel="stylesheet">

</head>


<!-- 추가 -->

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

	<header style=" height:40%; position:absolute">

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
	
	
	
	
	
	
<!--/////////////////////////////////////// 값이 바뀔 구간 /////////////////////////////////////////////////-->	
	<div class="main-slider" style="position : relative;">
		<div id="slider">

			<div class="ls-slide" data-ls="bgsize:cover; bgposition:50% 50%; duration:4000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/notice/hotel.png" class="ls-bg" alt="호텔 정보 사진"/>

					<div class="slider-content ls-l" style="top:60%; left:30%;" data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
						<a class="btn" href="hotelList">RESERVATION</a>
						<h3 class="title"><b>Love, Happy, Hotel</b></h3>
						<h6>우리 호텔은 반려동물은 위해 최선을 다합니다.</h6>
					</div>

			</div><!-- ls-slide -->
			<div class="ls-slide" data-ls="bgsize:cover; bgposition:50% 50%; duration:4000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/notice/medical.jpg" class="ls-bg" alt="" />

					<div class="slider-content ls-l" style="top:60%; left:30%;" data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
						<a class="btn" href="medicalDoctorList">RESERVATION</a>
						<h3 class="title"><b>Medical, Love, Pet</b></h3>
						<h6>우리 병원은 최신식 기계와 자동화 장치를 통해 반려동물의 건강을 책임집니다.</h6>
					</div>
			</div>
			<div class="ls-slide" data-ls="bgsize:cover; bgposition:50% 50%; duration:4000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/notice/beauty.png" class="ls-bg" alt="" />

					<div class="slider-content ls-l" style="top:60%; left:30%;" data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
						<a class="btn" href="beautyList">RESERVATION</a>
						<h3 class="title"><b>Beautiful, Like, Pet</b></h3>
						<h6>우리 미용실은 반려동물 각각의 성향을 존중합니다.</h6>
					</div>
			</div>
			<div class="ls-slide" data-ls="bgsize:cover; bgposition:50% 50%; duration:4000; transition2d:104; kenburnsscale:1.00;">
				<img src="resources/notice/goods.jpg" class="ls-bg" alt="" />

					<div class="slider-content ls-l" style="top:60%; left:30%;" data-ls="offsetyin:100%; offsetxout:-50%; durationin:800; delayin:100; durationout:400; parallaxlevel:0;">
						<a class="btn" href="goodsList">BUY</a>
						<h3 class="title"><b>Goods, Exciting, Love it</b></h3>
						<h6>반려동물의 쾌적한 한경을 위해 항상 노력합니다.</h6>
					</div>
			</div>
			<!-- ls-slide -->

		</div><!-- slider -->
	</div><!-- main-slider -->
	<a onclick="window.open('http://pf.kakao.com/_BxlJxlK/chat','kakaochatbot','width=500, height=700, menubar=no, status=no, toolbar=no');"><img src="https://developers.kakao.com/assets/img/about/logos/channel/consult_small_yellow_pc.png" alt="카카오톡 채널 1:1 채팅 버튼" title="카카오톡 채널 1:1 채팅 버튼"></a>
<!--/////////////////////////////////////// 값이 바뀔 구간 끝 /////////////////////////////////////////////////-->	





	<footer>
		<div class="container">
			<div class="row">

				<div class="col-sm-6">
					<div class="footer-section">
						<p class="copyright">Juli &copy; 2018. All rights reserved | Made with <i class="ion-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a></p>
					</div><!-- footer-section -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-sm-6">
					<div class="footer-section">
						<ul class="social-icons">
							<li><a href="#"><i class="ion-social-facebook-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-twitter-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-vimeo-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-pinterest-outline"></i></a></li>
						</ul>
					</div><!-- footer-section -->
				</div><!-- col-lg-4 col-md-6 -->

			</div><!-- row -->
		</div><!-- container -->
	</footer>


	<!-- SCIPTS -->

	<script src="resources/common-js/jquery-3.1.1.min.js"></script>

	<script src="resources/common-js/tether.min.js"></script>

	<script src="resources/common-js/bootstrap.js"></script>

	<script src="resources/common-js/layerslider.js"></script>

	<script src="resources/common-js/scripts.js"></script>

</body>
<!-- 팝업창 띄우기 start -->
<script>
	var popUpBtnBasket = document.getElementById("popUpBtnBasket");
	var mywindow;

	var popupX = (window.screen.width / 2) - (1100 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var popupY= (window.screen.height /2) - (800 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	// 장바구니
	popUpBtnBasket.addEventListener("click", function(){
		mywindow = window.open("memberBasketList", "mywindow", "width=1100, height=800, left=" + popupX + ", top=" + popupY);
	});
</script>
</html>
