<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

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
	<div id="all-div">
		<!-- 상단 메뉴 -->
		<div id="top-div" style="width: 60%; height: 100%; margin:2% auto">
			<form action="goodsList" name="search">
				<table style="width: 100%; height: 100%; text-align: center; margin:2% auto;">
					<tr>
						<td width="50%" style="text-align: center;">
						<input	type="text" name="searchData" value="${searchData}" style="text-align: center; width: 83%; height: 30px;border:1px solid #D6DBDF;" placeholder="검색어를 입력하세요." /> 
						<a onclick="inputSubmit()"><img	src="resources/svg/search.svg" width="30px" height="30px" /></a></td>
					</tr>
					<tr>
						<td>
							<table style="text-align: center; width: 88%; margin: 0 auto; border:1px solid #D6DBDF; ">
								<tr>	
									<td><input type="radio" name="goodsAnimalKind" value="" checked></td>
									<td><input type="radio" name="goodsAnimalKind" value="강아지"></td>
									<td><input type="radio" name="goodsAnimalKind" value="고양이"></td>
									<c:if test="${empty menu2}">
										<script>
											$("input:radio[name='goodsAnimalKind']:radio[value='']").prop('checked', true);
										</script>
					 				</c:if>
									<c:if test="${menu2 eq '강아지'}">
										<script>
											$("input:radio[name='goodsAnimalKind']:radio[value='강아지']").prop('checked', true);
										</script>
									</c:if>
									<c:if test="${menu2 eq '고양이'}">
										<script>
											$("input:radio[name='goodsAnimalKind']:radio[value='고양이']").prop('checked', true);
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
							<table style=" text-align: center; width: 88%; margin: 0 auto;border:1px solid #D6DBDF; ">
								<tr>
									<td><input type="radio" name="goodsCategory" value="" checked /></td>
									<td><input type="radio" name="goodsCategory" value="간식" /></td>
									<td><input type="radio" name="goodsCategory" value="사료" /></td>
									<td><input type="radio" name="goodsCategory" value="미용" /></td>
									<td><input type="radio" name="goodsCategory" value="장난감" /></td>
									<td><input type="radio" name="goodsCategory" value="용품" /></td>
									<c:if test="${empty menu}">
										<script>
											$("input:radio[name='goodsCategory']:radio[value='']").prop('checked', true);
										</script>
									</c:if>
									<c:if test="${menu eq '간식'}">
										<script>
											$("input:radio[name='goodsCategory']:radio[value='간식']").prop('checked', true);
										</script>
									</c:if>
									<c:if test="${menu eq '사료'}">
										<script>
											$("input:radio[name='goodsCategory']:radio[value='사료']").prop('checked', true);
										</script>
									</c:if>
									<c:if test="${menu eq '악세사리'}">
										<script>
											$("input:radio[name='goodsCategory']:radio[value='악세사리']").prop('checked', true);
										</script>
									</c:if>
									<c:if test="${menu eq '장난감'}">
										<script>
											$("input:radio[name='goodsCategory']:radio[value='장난감']").prop('checked', true);
										</script>
									</c:if>
									<c:if test="${menu eq '기타'}">
										<script>
											$("input:radio[name='goodsCategory']:radio[value='기타']").prop('checked', true);
										</script>
									</c:if>
								</tr>
								<tr>
									<td>전체</td>
									<td>간식</td>
									<td>사료</td>
									<td>악세사리</td>
									<td>장난감</td>
									<td>기타</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table style=" width:30; margin-left: 77.99% ">
								<tr>
									<td><select name="lineUp" id="lineUp">
										<option value="최신순" selected="selected">최신순</option>
										<option value="오래된순">오래된순</option>
										<option value="좋아요순">좋아요순</option>
									</select> <script>
										$('#lineUp').val("${lineUp}").change();
									</script>
										<select name="count" id="count">
										<option value="4" selected="selected">4개로 보기</option>
										<option value="8">8개로 보기</option>
										<option value="12">12개로 보기</option>
									</select> <script>
										$('#count').val("${count}").change();
									</script></td>
								</tr>
							</table>		
						</td>
					</tr>
		<!-- 상단 메뉴 끝 -->
		<!-- 리뷰 컨테이너 -->
		<!--용품-->
			<tr>
				<td>
					<c:forEach var="goods" items="${goodsList}">
						<table style="text-align: center; width: 20%; height: 20%; margin: 2% auto; float: left;">
							<tr>
								<td >
									<a	onclick="location.href='goodsView?goodsNum=${goods.goodsNum}&page=${paging.page}&userId=${sessionScope.loginUser.userId}'">
									<img src="resources/goodsFile/${goods.goodsImage1}"/></a> <br />
									<img src="resources/svg/eye.svg" style="width:10%">${goods.goodsHit} &nbsp;<img src="resources/svg/favourite-color.svg" style="width:9%">${goods.goodsLike}<br/>
									${goods.goodsName}<br />${goods.goodsPrice}원
								</td>
							</tr>
						</table>
					</c:forEach>
				</td>
			</tr>
			</table>
			</form>
		</div>
		<!-- 리뷰 컨테이너 끝 -->
		<!-- 페이징 구간 -->
		<div id="paging" style="text-align: center;">
			<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
			<c:if test="${paging.page>1 }">
				<a
					href="goodsList?searchData=${searchData}&goodsCategory=${menu}&goodsAnimalKind=${menu2}&lineUp=${lineUp}&count=${count}&page=${paging.page-1}">[이전]</a>&nbsp;
		</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
				var="i" step="1">
				<c:choose>
					<c:when test="${i eq paging.page }">	
					[${i}]								
				</c:when>
					<c:otherwise>
						<a
							href="goodsList?searchData=${searchData}&goodsCategory=${menu}&goodsAnimalKind=${menu2}&lineUp=${lineUp}&count=${count}&page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if>
			<c:if test="${paging.page<paging.maxPage}">
			&nbsp;<a
					href="goodsList?searchData=${searchData}&goodsCategory=${menu}&goodsAnimalKind=${menu2}&lineUp=${lineUp}&count=${count}&page=${paging.page+1}">[다음]</a>
			</c:if>
		</div>
		<!-- 페이징 구간 끝 -->
	</div>


	<!-- 여기부터 하단 내용 -->
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
	<script>
	function inputSubmit() {
		search.submit();
	}
</script>

</body>
</html>