<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>DOG</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shorcut icon" href="resources/favicon.ico">
<meta charset="UTF-8">
<style>
.main-menu-li:hover {
	font-color: #DDC3F7;
}
#content{

	width:50%;
	max-width: 1500px;
	min-width: 800px;
	margin:0 auto;
}
.notice{
     display: list-item;
     padding-top: 15px; 
}
.dogbtn{
	width: 70px;
	margin-left: 65px;
	font-size:15px;
	height:35px;
	background-color:white;
	color:black;
	border-radius: 7px;
}

.dogbtn:hover{
	color: #DDC3F7;
	border-radius: 7px;
	cursor: pointer;
}

.bttn button{
	border:1px solid skyblue;
	background-color:rgda(0,0,0,0);
	color:skyblue;
	padding:5px;
}
.bttn button:hover{
	border:1px solid #fff;
	background-color:skyblue;
	color:#fff;
	padding:5px;
}
</style>


<!-- Font -->

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">


<!-- Stylesheets -->
<link href="resources/common-css/bootstrap.css" rel="stylesheet">
<link href="resources/common-css/ionicons.css" rel="stylesheet">
<link href="resources/common-css/layerslider.css" rel="stylesheet">
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
						<a href="reviewList">리뷰 리스트</a>
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






	<!--/////////////////////////////////////// 값이 바뀔 구간 /////////////////////////////////////////////////-->
	<div id="content" style="margin:0 auto; height:1000px; display: block;">
		<div style="width:15%; float:left; height: 100%; text-align: center; background-color: gray;">
			<ul class="bttn" id="main-menu" style="dispaly:block; padding-bottom: 40px;">
				<li class="notice"><button  onclick="location.href='noticeList'" style="margin:10px;line-height: 100%;">제휴사</button></li>
				<li class="notice"><button  onclick="location.href='DOG'" style="margin:10px;line-height: 100%;">강아지</button></li>
				<li class="notice"><button  onclick="location.href='CAT'" style="margin:10px;line-height: 100%;">고양이</button></li>
			</ul>
		</div>
		<div style="width: 80%;">
			<ul style="float:right; padding-bottom: 40px; padding-top: 40px" >
				<li class=""><button class="dogbtn" id="HOTEL" onclick="HOTEL()">기본사항</button></li>
				<li class=""><button class="dogbtn" id="MEDICAL" onclick="MEDICAL()">기본용품</button></li>
				<li class=""><button class="dogbtn" id="BEAUTY" onclick="BEAUTY()">예방접종</button></li>
				<li class=""><button class="dogbtn" id="GOODS" onclick="GOODS()">행동수칙</button></li>
			</ul>
		</div>
		<div style="float:right; width:80%;margin-left: 5%
		">
			<p class="HOTEL"><img src="resources/images/dog_기본사항.png" alt="기본수칙" height= "700px"></p>
			<p class="MEDICAL"><img src="resources/images/dog_기본용품.png" alt="주의사항" height= "700px"></p>
			<p class="BEAUTY"><img src="resources/images/dog_예방접종.png" alt="예방접종" height= "700px"></p>
			<p class="GOODS"><img src="resources/images/dog_행동수칙.png" alt="필요용품" height= "700px"></p>
		</div>
	</div>
	<!--/////////////////////////////////////// 값이 바뀔 구간 끝 /////////////////////////////////////////////////-->

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

	<script src="resources/common-js/jquery-3.1.1.min.js"></script>

	<script src="resources/common-js/tether.min.js"></script>

	<script src="resources/common-js/bootstrap.js"></script>

	<script src="resources/common-js/layerslider.js"></script>

	<script src="resources/common-js/scripts.js"></script>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef7896fb022af286c2893272a2bfe30e"></script>
<script>
	// 페이지 시작시 실행 펑션
	$(document).ready(function() {
		$(".HOTEL").show();
		$(".MEDICAL").hide();
		$(".BEAUTY").hide();
		$(".GOODS").hide();

		
	});

	// 호텔 지도
	function HOTEL() {
		$(".HOTEL").show();
		$(".MEDICAL").hide();
		$(".BEAUTY").hide();
		$(".GOODS").hide();
		
	};

	// 병원지도
	function MEDICAL() {
		$(".HOTEL").hide();
		$(".MEDICAL").show();
		$(".BEAUTY").hide();
		$(".GOODS").hide();
		
	};

	// 미용실 지도
	function BEAUTY() {
		$(".HOTEL").hide();
		$(".MEDICAL").hide();
		$(".BEAUTY").show();
		$(".GOODS").hide();
		

	};

	// 상품 지도
	function GOODS() {
		$(".HOTEL").hide();
		$(".MEDICAL").hide();
		$(".BEAUTY").hide();
		$(".GOODS").show();
		
	};
</script>
</html>
