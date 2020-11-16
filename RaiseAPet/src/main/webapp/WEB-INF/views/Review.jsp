
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트</title>
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


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
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
<script>
$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : "reviewLikeCheck",
		dataType : "json",
		success : function(result){
				likeCheck(result);
			},
		error : function(){
			console.log('좋아요 한 것 없음');
			}
	});
});

function likeCheck(result){
	for(var i in result){
		document.getElementById('like'+result[i].likeReviewNum).innerHTML = '<a onclick="unLikeBtn('+result[i].likeReviewNum+')"><img src="resources/svg/favourite-color.svg" width="30px" height="30px"/></a>';
	}
}
</script>
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
	
	
	
	
	
	
<!--/////////////////////////////////////// 값이 바뀔 구간 /////////////////////////////////////////////////-->	
<div id="all-div">
	<!-- 상단 메뉴 -->
	
	<br/>
	<br/>
	<div id="top-div" >
		<form action = "reviewList" name="search">
		<table style="width:100%;">
			<tr>
				<td width="100%" style="text-align:center;">
					<input type="text" name="searchData" value="${searchData }" style="text-align:center; width:80%; height:30px;background-color:transparent; border:0 solid black;text-align:center;" placeholder="검색어를 입력하세요."/>
					<a onclick="inputSubmit()"><img src="resources/svg/search.svg" width="30px" height="30px"/></a>
					<hr width="70%" align="center">
					
					
					
				</td>
			</tr>
			<tr>
				<td>
					<table style="border : solid 1px; text-align : center; width:88%; margin : 0 auto;background-color:transparent; border:0 solid black;text-align:center;">
					<tr>
						<td><input type="radio" name="reviewKind" value="" checked/></td>
						<td><input type="radio" name="reviewKind" value="호텔"/></td>
						<td><input type="radio" name="reviewKind" value="병원"/></td>
						<td><input type="radio" name="reviewKind" value="미용"/></td>
						<td><input type="radio" name="reviewKind" value="용품"/></td>
						<c:if test="${empty menu}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '호텔'}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='호텔']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '병원'}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='병원']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '미용'}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='미용']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${menu eq '용품'}">
							<script>
								$("input:radio[name='reviewKind']:radio[value='용품']").prop('checked', true);
							</script>
						</c:if>
					</tr>
					<tr>
						<td>전체</td>
						<td>호텔</td>
						<td>병원</td>
						<td>미용</td>
						<td>용품</td>
					</tr>
					</table>
				</td>
			</tr>
	
			<tr>

				<td>
					<select name="lineUp" id="lineUp" style="border: 2px solid #DDC3F7; border: none; margin-left:8%;">
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
		</table>
		</form>
	</div>
	<br/>
	<!-- 상단 메뉴 끝 -->
	<!-- 리뷰 컨테이너 -->
	<div id="container" style="width : 900px; height : 100%; margin : 0 auto;   " >
		<c:forEach var="review" items="${reviewList }" varStatus="status">
			<div class="box" >
				<table border="1" style="width :900px; height : 100%;	border : 2px solid #d3cfce; float:right;">
					<tr>
			 			<td rowspan="4" width="20%"><img src="resources/reviewFile/${review.reviewImage }"/></td>
			 			<th colspan="3" width="60%" height="20px">${review.reviewTitle }</th>
			 			<td rowspan="4" width="10%">
				 			<c:if test="${not empty sessionScope.loginUser }">
				 				<div id="like${review.reviewNum}"><!-- a.jax 구간 -->
					 				<a onclick="likeBtn(${review.reviewNum})"><img src="resources/svg/favourite.svg" width="30px" height="30px"/></a>
					 				<script>
										//라이크 버튼 눌렀을 때 실행
										function likeBtn(reviewNum){
											$.ajax({
												type : "POST",
												url : "reviewLike",
												data : {"reviewNum" : reviewNum},
												dataType : "json",
												success : function(result){
															if(result==1){
																likeResult(result, reviewNum);
															} else {
																alert("좋아요 안돼");
															}
														},
												error : function(){
													alert("좋아요 실패");
													}
											});
										}
										
										//라이크 처리가 되면 실행
										function likeResult(result, reviewNum){
											var output="";
											output="<a onclick='unLikeBtn("+reviewNum+
													")'><img src='resources/svg/favourite-color.svg' width='30px' height='30px'/></a>";
													
											document.getElementById("like"+reviewNum).innerHTML = output;
										}
										
										//언라이크 버튼 눌렀을 때 실행
										function unLikeBtn(reviewNum){
											$.ajax({
												type : "POST",
												url : "reviewUnLike",
												data : {"reviewNum" : reviewNum},
												dataType : "json",
												success : function(result){
															if(result==1){
																unLikeResult(result, reviewNum);
															} else {
																alert("좋아요 취소 안돼");
															}
														},
												error : function(){
													alert("좋아요 취소 실패");
													}
											});
										}
										
										//언라이크 처리가 되면 실행
										function unLikeResult(result, reviewNum){
											var output="";
											output="<a onclick='likeBtn("+reviewNum+
													")'><img src='resources/svg/favourite.svg' width='30px' height='30px'/></a>";
											document.getElementById("like"+reviewNum).innerHTML = output;
										}
										</script>
					 				<!-- 좋아요 버튼 끝 -->
				 				</div>
				 				<!-- 신고 -->
				 				<c:if test="${sessionScope.loginUser.userId ne review.reviewUserId }">
				 					<a onclick="reportBtn(${review.reviewNum})"><img src="resources/svg/horn.svg" width="30px" height="30px"/></a>
				 					<script>
										function reportBtn(reviewNum){
											window.open("reviewReportForm?reviewNum="+reviewNum,'reviewReport', 'width=800, height=500');
										}
									</script>
				 				</c:if>
				 				<!-- 신고 끝 -->
				 				<!-- 수정 -->
				 				<c:if test="${sessionScope.loginUser.userId eq review.reviewUserId }">
				 					<button onclick="window.open('reviewModifyForm?reviewNum=${review.reviewNum}','window팝업','width=700, height=850, menubar=no, status=no, toolbar=no')">
				 					<img src="resources/svg/new.svg" width="30px" height="30px" />
				 					</button>
				 				
				 					
				 				
				 				</c:if>
				 				<!-- 삭제 -->
				 				<c:if test="${sessionScope.loginUser.userId eq review.reviewUserId }">
				 					<a href="reviewDelete?reviewNum=${review.reviewNum }"><img src="resources/svg/delete.svg" width="30px" height="30px" /></a>
				 				</c:if>
			 				</c:if>
			 			</td>
					</tr>
					<tr>
						<td  rowspan="2"  style="width:1%;"><img src="resources/reviewFile/${review.reviewRating }.png" style="width:40px;"></td>
						<td style="height : 10px;">${review.reviewDate }</td>
					</tr>
					<tr>
						
						<td width="20%"  height="20px">${review.reviewUserId }</td>
					</tr>
					<tr>
						<td colspan="2" style="word-break:break-all">${review.reviewContents }</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<!-- 리뷰 컨테이너 끝 -->
	<!-- 페이징 구간 -->
	<div id="paging" style="text-align : center;">
		<c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
		<c:if test="${paging.page>1 }">
			<a href="reviewList?searchData=${searchData}&reviewKind=${menu}&lineUp=${lineUp}&count=${count}&page=${paging.page-1}">[이전]</a>&nbsp;
		</c:if> 
		<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page }">	
					[${i}]								
				</c:when>
				<c:otherwise>
					<a href="reviewList?searchData=${searchData}&reviewKind=${menu}&lineUp=${lineUp}&count=${count}&page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach> 
		<c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
		<c:if test="${paging.page<paging.maxPage}">
			&nbsp;<a href="reviewList?searchData=${searchData}&reviewKind=${menu}&lineUp=${lineUp}&count=${count}&page=${paging.page+1}">[다음]</a>
		</c:if>
	</div>
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


</body>
<script>
	function inputSubmit(){
		search.submit();
	}
	var popUpBtnBasket = document.getElementById("popUpBtnBasket");
	var mywindow;

	var popupX = (window.screen.width / 2) - (900 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var popupY= (window.screen.height /2) - (600 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	// 장바구니
	popUpBtnBasket.addEventListener("click", function(){
		mywindow = window.open("memberBasketList", "mywindow", "width=900, height=600, left=" + popupX + ", top=" + popupY);
	});
</script>

</html>