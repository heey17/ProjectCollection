<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>TITLE</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shorcut icon" href="resources/favicon.ico">
	<meta charset="UTF-8">
	<style>
		.main-menu-li:hover{
			font-color:#DDC3F7;
		}
		
		iframe {
			width:900px;
			height:500px;
			margin: 0 55%;
		}
		hr {
			border-top : 1px solid #F2F3F4;
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
	<!-- 상세정보 -->
	<br>
	<br>
	<br>

		<table>
			<tr>
				<th>${educationView.eduVideo}</th>
			</tr>
		</table>
	<div style="margin:0px 26%;">
		<table>
			<tr>
				<th><h4>${educationView.eduTitle}</h4></th>                                        
				
			</tr>
		</table>
	</div>	
	<div style="margin:0px 72%; width:1.5%;">
		<table>
			<tr>
				<th id="eduLike" ></th>
			</tr>
		</table>
	</div>
	
	
	<hr width="55%" align="center">
		<table style="margin:0px 26%;">
			<tr>
				<th><h6>${educationView.eduContents}</h6></th>
			</tr>
		</table>
	<div style="margin:0px 26%;">
	<br/>
	<br/>
	<!-- 댓글작성 -->
		<h4>작성자 : ${sessionScope.loginUser.userId}</h4>
		 <textarea rows="6" cols="120" id="commentContents" name="commentContents"></textarea>
		<input type="button" value="입력" onclick="educationComment()">
	</div>
	<hr width="55%" align="center">
	<div id="educationCommentList" style="margin: 0px 26%;">
	</div>
	<hr>
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

	var popupX = (window.screen.width / 2) - (900 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var popupY= (window.screen.height /2) - (600 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	// 장바구니
	popUpBtnBasket.addEventListener("click", function(){
		mywindow = window.open("memberBasketList", "mywindow", "width=900, height=600, left=" + popupX + ", top=" + popupY);
	});
</script>

<!-- 교육 스크립트 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js">
</script>
<script>
	// 댓글 목록
	function educationCommentList(result){
		var output="";
		output += "<table>";
		for(var i in result){
		output += "<tr><td><STRONG>"+result[i].commentUserId+"</STRONG></td></tr>";
		output +="<tr><td colspan='2'>"+result[i].commentContents+"</td></tr>";
		output +="<tr><td>"+result[i].commentLike+"<button onclick='commentLike2("+result[i].commentNum+")'><img src='resources/svg/favourite-color.svg' width='20px' height='20px'/></button></td>"
		output += "<td>"+result[i].commentDate+"</td></tr>";
		if(result[i].commentUserId == "${sessionScope.loginUser.userId}"){
			output += "<tr><td><button onclick='commentModify("+result[i].commentNum+","+i+")'>수정</button>";
			output += "<button onclick='commentDelete("+result[i].commentNum+")'>삭제</button></td></tr>";
			}
		output += "<tr><td colspan='2'><div id='commentModify1"+i+"'></div></td></tr>";
		
			}
		output += "</table>";
		$('#educationCommentList').html(output);
		}

	// 댓글 수정페이지
	function commentModify(commentNum,i){
		var output="";
		output += "<textarea rows='1.5' cols='80' id='commentContents1' placeholder='수정할 댓글을 입력하세요...' ></textarea>";
		output += "<button  onclick='educationCommentModify("+commentNum+")'>수정</button>";
		$('#commentModify1'+i).html(output);
		}
	

	// 댓글 삭제
	function commentDelete(commentNum){
		$.ajax({
			type:"GET",
			url:"educationCommentDelete",
			data:{
				"commentNum" : commentNum,
				"commentEduNum" : ${educationView.eduNum}
				},
			dataType:"json",

			success : function(result){
				alert("삭제되었습니다.");
				educationCommentList(result);
				},
			error : function(){
				alert("댓글 삭제 실패");
				}
			});
		}

	// 댓글 좋아요
	function commentLike2(commentNum){
		$.ajax({
			type:"GET",
			url:"educationCommentLike",
			data:{
				"commentNum":commentNum,
				"commentEduNum":${educationView.eduNum},
				"commentUserId":"${sessionScope.loginUser.userId}"
				},
			success : function(result){
				educationCommentList(result);
				},
			error : function(){
				alert("좋아요 실패");
				}
			});
		}

	// 뎃글조회
	$(document).ready(function(){
		var commentEduNum=${educationView.eduNum};
		$.ajax({
			type:"GET",
			url:"educationCommentList",
			data:{"commentEduNum":commentEduNum},
			dataType:"json",

			success : function(result){
				educationCommentList(result);
				},
			error : function(){
				alert("댓글 조회 실패")
				}
			});
		});

	// 댓글 쓰기
	function educationComment(){
		var commentContents = document.getElementById("commentContents").value;
		$.ajax({
			type:'post',
			url:"educationComment",
			data:{
				"commentContents": commentContents,
				"commentEduNum" : ${educationView.eduNum},
				"commentUserId" : "${sessionScope.loginUser.userId}"
				},
			dataType:"json",
			success : function(result){
					alert("댓글 작성되었습니다.");
					//댓글 초기화
			  		document.getElementById('commentContents').value ="";
					educationCommentList(result);
			},
			error : function(){
					alert("댓글 입력 실패");
				}
			});
		}
	
	// 댓글 수정
	function educationCommentModify(commentNum){
		var commentContents = $('#commentContents1').val();
		$.ajax({
			type:"GET",
			url:"educationCommentModify",
			data:{
				"commentContents" : commentContents,
				"commentNum" : commentNum,
				"commentEduNum" : ${educationView.eduNum}
				},
			dataType:"json",

			success : function(result){
				alert("수정되었습니다.");
				educationCommentList(result);
				},
			error : function(){
				alert("댓글 수정 실패");
				}
			});
		}
	
	// 좋아요수 조회
	$(document).ready(function(){
			$.ajax({
			type:"GET",
			url:"eduLike",
			data:{
				"eduNum":${educationView.eduNum},
				"likeUserId":"${sessionScope.loginUser.userId}"
				},
			dataType:"json",

			success : function(result){
				eduLike(result);
				},
			error : function(){
				alert("좋아요 조회 실패")
				}
			});
		});

	//좋아요수
	function eduLike(result){
		var output="";
		output += result.eduLike;		
	
			console.log(result.eduLike);
			console.log(result.likeUserId);
			if(result.likeUserId == "${sessionScope.loginUser.userId}"){
				output +="<button onclick='educationUnLike()'><img src='resources/svg/favourite-color.svg' style='max-width: 30px; height: auto;''/></button>";
			}else{
				output +="<button onclick='educationLike()'><img src='resources/svg/favourite.svg' style='max-width: 30px; height: auto;''/></button>";	
			}
	
		$('#eduLike').html(output);
		}
		
	// 교육 게시글 좋아요
	function educationLike(){
		$.ajax({
			type:"GET",
			url:"educationLike",
			data:{
				"eduNum":${educationView.eduNum},
				"likeEduNum":${educationView.eduNum},
				"likeUserId":"${sessionScope.loginUser.userId}"
			},
			dataType:"json",
			success : function(result){
				 eduLike(result);
				},
			error : function(){
				alert("좋아요 실패");
				}
				
			});
		};
	// 교육 게시글 좋아요 취소
	function educationUnLike(){
		$.ajax({
			type:"GET",
			url:"educationUnLike",
			data:{
				"eduNum":${educationView.eduNum},
				"likeEduNum":${educationView.eduNum},
				"likeUserId":"${sessionScope.loginUser.userId}"
				},
				dataType:"json",
				success : function(result){
					 eduLike(result);
					},
				error : function(){
					alert("좋아요 취소 실패");
					}
			});
		};

</script>
</html>