<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shorcut icon" href="resources/favicon.ico">
	<meta charset="UTF-8">
<style>
	.box{
		width :900px; 
		height : 250px; 
		margin : 20px 0 20px 0 ;

	}
	#top-div{
	
		width : 55%;
		height : 170px;
		margin : 0 auto;		
		border : 2px solid #d3cfce;
	}
	#all-div{
		width : 90%;
		margin : 0 auto;

	}
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
	
<!--/////////////////////////////////////// 값이 바뀔 구간 /////////////////////////////////////////////////-->


	<!-- 상단 메뉴 -->
	<div style="width:70%; margin:2% auto; text-align: center;">
		<form action = "educationList" name="search">
		<table style="width:100%;">
			<tr>
				<td>
					<input type="text" name="searchData" value="${searchData }" style="text-align:center; width:76%; height:2%;background-color:transparent; border:1px solid #DDC3F7;text-align:center;" placeholder="검색어를 입력하세요...."/>
					<a onclick="inputSubmit()"><img src="resources/svg/search.svg" width="30px" height="30px"/></a>
					<br/>
					<br/>
					
				</td>
			</tr>
			<tr>
				<td>
					<table style="border : solid 1px #DDC3F7; text-align : center; width:80%; margin:1% auto;background-color:transparent;text-align:center;">
					<tr>
						<td><input type="radio" name="eduAnimalKind" value="" checked/></td>
						<td><input type="radio" name="eduAnimalKind" value="강아지"/></td>
						<td><input type="radio" name="eduAnimalKind" value="고양이"/></td>
			
						<c:if test="${empty menu}">
							<script>
								$("input:radio[name='eduAnimalKind']:radio[value='']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '강아지'}">
							<script>
								$("input:radio[name='eduAnimalKind']:radio[value='강아지']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '고양이'}">
							<script>
								$("input:radio[name='eduAnimalKind']:radio[value='고양이']").prop('checked', true);
							</script>
						</c:if>
					</tr>
					<tr>
						<td>전체</td>
						<td>강아지</td>
						<td>고양이</td>
					</tr>
					</table>
				</td>
			</tr>
	
			<tr>

				<td>
					<select name="lineUp" id="lineUp" style="border: 2px solid #DDC3F7; border: none; margin-left: 60%;">
						<option value="최신순" selected>최신순</option>
						<option value="오래된순">오래된순</option>
						<option value="좋아요순">좋아요순</option>
					</select>
					<script> $('#lineUp').val("${lineUp}").change();</script>
					<select name="count" id="count" style="border: 2px solid #DDC3F7; border: none; ">
						<option value="4">4개로 보기</option>
						<option value="8">8개로 보기</option>
						<option value="12">12개로 보기</option>
					</select>
					<script> $('#count').val("${count}").change();</script>
				</td>
			</tr>
			<tr>
				<td>
					
						<c:forEach var="eduResult" items="${eduResult}">
							<table style="text-align:center; margin-left:5%; margin-right:2%;  width:25%; height:25%; float:left;">
								<tr>
									<td>
										<br><a onclick="location.href='educationView?eduNum=${eduResult.eduNum}'"><img src="resources/educationFile/${eduResult.eduImage}"/>${eduResult.eduTitle}</a>
									</td>
								</tr>
							</table>
						</c:forEach>
					
				</td>
			</tr>
		</table>
	</form>

	<!-- 리뷰 컨테이너 끝 -->
	<!-- 페이징 구간 -->
	
		<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
		<c:if test="${paging.page>1 }">
			<a href="educationList?searchData=${searchData}&eduAnimalKind=${menu}&lineUp=${lineUp}&count=${count}&page=${paging.page-1}">[이전]</a>&nbsp;
		</c:if> 
		<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page }">	
					[${i}]								
				</c:when>
				<c:otherwise>
					<a href="educationList?searchData=${searchData}&eduAnimalKind=${menu}&lineUp=${lineUp}&count=${count}&page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach> 
		<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
		<c:if test="${paging.page<paging.maxPage}">
			&nbsp;<a href="educationList?searchData=${searchData}&eduAnimalKind=${menu}&lineUp=${lineUp}&count=${count}&page=${paging.page+1}">[다음]</a>
		</c:if>
	
	<!-- 페이징 구간 끝 -->

</div>
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
	<script>
	
	function inputSubmit(){
		search.submit();
	}
	</script>

</body>

</html>