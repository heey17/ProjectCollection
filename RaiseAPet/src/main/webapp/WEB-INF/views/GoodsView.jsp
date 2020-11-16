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
	<style>
	/* 브라우저 마진과 패딩 리셋 */
	* {margin:0;padding:0;}

	/* INPUT 가리기 */
	.section input[id*="slide"] {display:none;}

	/* 슬라이드 영역 - max-width 크기를 조절해주면 됩니다*/
	.section .slidewrap {max-width:1200px;margin:0 auto;overflow:hidden;}
	.section .slidelist {white-space:nowrap;font-size:0;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:100%;}

	/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
	.section .slidelist label {position:absolute;z-index:1;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slidelist .left {left:30px;background:url('resources/goodsFile/left2.svg') center center / 100% no-repeat;}
	.section .slidelist .right {right:30px;background:url('resources/goodsFile/right2.svg') center center / 100% no-repeat;}

	/* INPUT 체크되면 변화값이 li까지 전달되는 스타일 */
	.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
	.section input[id="slide04"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-300%);}
	.section input[id="slide05"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-400%);}
	

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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js">
</script>
</head>
<body onload="init();">
	<script>
// 문의 목록
function goodsAskList(result){
	var output="";
		output +="<h3>문의글</h3>"
		output +="<table style='border-bottom: 1px solid #DDC3F7; text-align: center; width:100%; margin:2% auto;'>";
		output +="<tr style='border-bottom: 1px solid #DDC3F7;'>";
		output +="<td style=''>번호</td>";
		output +="<td colspan='2'>내용</td>";
		output +="<td style=''>공개여부</td>";
		output +="<td style=''>작성자</td>";
		output +="<td style=''>답변확인</td>";
		output +="</tr>";
		for(var i in result) {
			if(result[i].askSecret=="일반글"){
			output +="<tr style='border-bottom: 1px solid #DDC3F7;'>";
			output +="<td>"+result[i].askGoodsNum+"</td>";
			output +="<td colspan='2'>"+result[i].askContents+"</td>";
			output +="<td>"+result[i].askSecret+"</td>";
			output +="<td>"+result[i].askUserId+"</td>";
				if(result[i].askAnswer==null){
				output += "<td>답변을 기다리는 중입니다.</td>";	
				}else{
				output += "<td>"+result[i].askAnswer+"</td>";
				}
			}else{
				output +="<tr style='border-bottom: 1px solid #DDC3F7;'>";
				output +="<td>"+result[i].askGoodsNum+"</td>";
				output +="<td id='secret'>비밀글 입니다<a onclick='secret("+result[i].askPw+","+i+","+result[i].askNum+")'>&#128274;</a><td>";
				output +="<div id='goodsAskList2"+i+"'></div>";
				output +="<td>"+result[i].askSecret+"</td>";
				output +="<td>"+result[i].askUserId+"</td>";
					if(result[i].askAnswer==null){
					output += "<td>답변을 기다리는 중입니다.</td>";	
					}else{
					output += "<td>"+result[i].askAnswer+"</td>";
					}
				output +="</tr>";
			}
		}
		output +="</table>";
		$('#goodsAskList').html(output);
	}
	
//비밀번호 확인
function secret(data,i,data2){
	console.log(data);
	var output="";
	output += "<input type='password' name='Pw' id='Pw' placeholder='문의글비밀번호'><button onclick='secret2("+data+","+i+","+data2+")'>확인</button>";
	$('#goodsAskList2'+i).html(output);
}

//비밀번호 확인(ajax)
function secret2(data,i,data2){
	var pw = document.getElementById('Pw').value;
	var confirmPw = data;
	var askNum = data2;

		if(confirmPw == pw){
			$.ajax({
				type:"GET",
				url: "goodsAskSecret",
				data:{
					"askPw" : pw,
					"askGoodsNum":${goodsView.goodsNum},
					"askNum":askNum,
					"askUserId":"${sessionScope.loginUser.userId}"
					},
				dataType:"json",
				success : function(result){
					confirm2(result,i);
					$('#goodsAskList2'+i).hide();
					},
				error : function(){
					alert("문의글 조회 실패");
					}
			});	
		}else{
			alert('비밀번호가 틀렸습니다');
			var output="";
			output += "";
			$('#goodsAskList2').html(output);
			}
		
}
//비밀글 
function confirm2(result,i){
	var data = "";
	data += result.askContents;
	$('#secret').html(data);
	$('#goodsAskList2'+i).hide();
}


// 문의 조회
$(document).ready(function(){
	var askGoodsNum=${goodsView.goodsNum}
	$.ajax({
		type:"GET",
		url: "goodsAskList",
		data:{"askGoodsNum":askGoodsNum},
		dataType:"json",

		success : function(result){
			goodsAskList(result);
			},
		error : function(){
			alert("문의글 조회 실패")
			}
		});	
});

//좋아요 수 조회
$(document).ready(function(){
	$.ajax({
		type:"GET",
		url: "goodsLikeSelect",
		data:{
			"goodsNum":${goodsView.goodsNum},
			},
		dataType:"json",

		success : function(result){
			goodsLike(result);
			},
		error : function(){
			alert("좋아요 수 불러오기 실패");
			}

		});
});


// 용품 좋아요
function goodsLikeUp(){
	$.ajax({
		type:"GET",
		url:"goodsLike",
		data:{
			"goodsNum":${goodsView.goodsNum},
			"likeGoodsNum":${goodsView.goodsNum},
			"likeUserId":"${sessionScope.loginUser.userId}"
		},
		dataType:"json",
		success : function(result){
			
			},
		error : function(){
			alert("좋아요 실패");
			}	
		});
};



//좋아요 폼
function goodsLike(result){
	var data = "";
	data += "${goodsView.goodsHit}<img src='resources/svg/eye.svg' style='width:2%'>"+result.goodsLike+"<img src='resources/svg/favourite-color.svg' style='width:2%'>"
	$("#goodsLike").html(data);
}



var goodsPrices;
var buyCount;
var buyPrice;

function init() {
	goodsPrices = document.form.goodsPrices.value;
	buyCount = document.form.buyCount.value;
	document.form.buyPrice.value = goodsPrices;
	change();
}

function add () {
	hm = document.form.buyCount;
	buyPrice = document.form.buyPrice;
	hm.value ++ ;

	buyPrice.value = parseInt(hm.value) * goodsPrices;
}

function del () {
	hm = document.form.buyCount;
	sum = document.form.buyPrice;
		if (hm.value > 1) {
			hm.value -- ;
			buyPrice.value = parseInt(hm.value) * goodsPrices;
		}
}

function change () {
	hm = document.form.buyCount;
	sum = document.form.buyPrice;

		if (hm.value < 0) {
			hm.value = 0;
		}
		sum.value = parseInt(hm.value) * ${goodsView.goodsPrice};
}  
//장바구니
function goodBasket(){
var basketGoodsCount=document.getElementById('buyCount').value;
$.ajax({
	type:"get",
	url:"goodsBasket",
	data:{
		goodsNum:${goodsView.goodsNum},
		buyUserId:"${sessionScope.loginUser.userId}",
		basketGoodsCount:basketGoodsCount	
		},
	success:function(){
			alert("장바구니에 담겼습니다.");
		},
	error:function(){
		alert("로그인 후 이용해주세요.");
		location.href="memberLoginForm";
		}
});
}

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

	//로그인 후 이용
	function LoginForm(){
		console.log()
		/* var con = confirm("로그인 후 이용해주세요.");
		if(con == true){
			location.href="memberLoginForm";
		} */
	}
</script>

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

	<div style="width: 60%; margin: 2% auto; text-align: center;">
		<form name="form" method="get" action="goodsPayMent">
			<table style="width: 100%; text-align: center;">
				<tr>
					<td>${goodsView.goodsName}</td>
				</tr>
				<tr>
					<td>
						<div class="section">
							<input type="radio" name="slide" id="slide01" checked>
							<input type="radio" name="slide" id="slide02">
							<input type="radio" name="slide" id="slide03">
							<input type="radio" name="slide" id="slide04">
							<input type="radio" name="slide" id="slide05">

						<div class="slidewrap">
							<ul class="slidelist">
								<li>
									<a>					
										<img src="resources/goodsFile/${goodsView.goodsImage1}" style="width:350px; height: 300px"/>
										<label for="slide02" class="right"></label>
									</a>
								</li>
								<li>
									<a>
										<label for="slide01" class="left"></label>
										<img src="resources/goodsFile/${goodsView.goodsImage2}" style="width:350px; height: 300px"/>
										<label for="slide03" class="right"></label>
									</a>
								</li>
								<li>
									<a>
										<label for="slide02" class="left"></label>
										<img src="resources/goodsFile/${goodsView.goodsImage3}" style="width:350px; height: 300px"/>
										<c:choose>
										<c:when test="${not empty goodsView.goodsImage4}">
										<label for="slide04" class="right"></label>
										</c:when>
										<c:otherwise>
										<label for="slide01" class="right"></label>
										</c:otherwise>
										</c:choose>
									</a>
								</li>
								<c:if test="${not empty goodsView.goodsImage4}">
								<li>
									<a>
										<label for="slide03" class="left"></label>
										<img src="resources/goodsFile/${goodsView.goodsImage4}" style="width:350px; height: 300px"/>
										<c:choose>
										<c:when test="${not empty goodsView.goodsImage5}">
										<label for="slide05" class="right"></label>
										</c:when>
										<c:otherwise>
										<label for="slide01" class="right"></label>
										</c:otherwise>
										</c:choose>
									</a>
								</li>
								</c:if>
								<c:if test="${not empty goodsView.goodsImage5}">
								<li>
									<a>
										<label for="slide04" class="left"></label>
										<img src="resources/goodsFile/${goodsView.goodsImage5}" style="width:350px; height: 300px"/>
										<label for="slide01" class="right"></label>
									</a>
								</li>
								</c:if>
							</ul>
						</div>
					</div>
					<td>
				</tr>
				<tr>
					<td id="goodsLike">
					</td>
				</tr>
				<tr>
					<td>판매가 :${goodsView.goodsPrice}</td>


				</tr>
				<tr>
					<td>택배배송비 : 2500원</td>
				</tr>
				<tr>
					<td id="goodsLike"></td>
				</tr>
				<tr>
					<td>수량 
					<input type="hidden" name="goodsNum" value="${goodsView.goodsNum}">
					<input type="button" value=" - " onclick="del();">
				    <input type="hidden" name="goodsPrices" value="${goodsView.goodsPrice}" id="goodsPrices">
				    <input type="text" id="buyCount" name="buyCount" value="1" size="3" onchange="change();">
				    <input type="button" value=" + " onclick="add();"><br> 
					총 상품금액: <input type="text" id="PayMent" name="buyPrice" size="11" readonly>원 
						<c:choose>
							<c:when test="${not empty sessionScope.loginUser.userId}">
								<input type="submit" value="결제">
							</c:when>

							<c:otherwise>
								<a onclick="LoginForm()">결제</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</form>
		
		
		<!--좋아요-->
	
			<c:if test="${not empty sessionScope.loginUser.userId}">
				<c:choose>
					<c:when test="${not empty likeUserId}">
						<a onclick="goodsLikeUp()"><img src='resources/svg/favourite-color.svg' width='2px'></a>
					</c:when>
				
					<c:otherwise>
						<a onclick="goodsLikeUp()"><img src='resources/svg/favourite.svg' width='2px'></a>
					</c:otherwise>
				</c:choose>
			</c:if>
	
		<!--장바구니-->
		<a onclick="goodBasket()"><img src="resources/svg/cart.svg" width="2px"></a>
		<hr>
		상세정보 <img src="resources/goodsFile/${goodsView.goodsContents}">
		<hr>
		<!--문의글 조회  -->
		<div id="goodsAskList"></div>
	
			<c:if test="${not empty sessionScope.loginUser}">
				<button style="margin-left: 95%;"
					onclick="window.open('goodsAsk?askUserId=${sessionScope.loginUser.userId}&askGoodsNum=${goodsView.goodsNum}&goodsImage1=${goodsView.goodsImage1}','window팝업','width=500, height=450,menubar=no,status=no, toolbar=no');"><img src="resources/svg/new.svg" width="2px"></button>
			</c:if>

		
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

</body>
</html>