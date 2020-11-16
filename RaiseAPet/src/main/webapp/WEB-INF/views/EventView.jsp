<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Event</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shorcut icon" href="resources/favicon.ico">
	<meta charset="UTF-8">
	<style>
	 .btn{
      font-size: 15px;
      width: 300px;
      height: 55px;
      border: none;
      background-color: #DDC3F7;
      border-radius: 12px;
      position: relative;
      bottom:60px;
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

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

	
	//댓글목록
	function commentList(result){
		var output="";
		for(var i in result){
			//이미지가 있을 때만 이미지를 뜨게한다.
			output += "<table border='1' style='width:100%; margin:auto; '>";
			output += "<tr><td rowspan='2' style='width:20%'>"+result[i].commentUserId+"</td>";
			output += "<td colspan='2' style='width:70%'>"+result[i].commentContents+"</td>";

			//로그인이 되어있어야지 좋아요 버튼을 누를수 있고 아니면 로그인을 하러간다.
			if(${sessionScope.loginUser.userId != null}){
					output += "<td rowspan='2' style='width:10%'>"+result[i].commentLike+"<button onclick='commentLike2("+result[i].commentNum+")'><img src='resources/svg/favourite-color.svg' style='width:20px'></button></td>";
			}else{
				output += "<td rowspan='2' style='width:10%'>"+result[i].commentLike+"<button onclick='LoginForm()'><img src='resources/svg/favourite.svg' style='width:20px'></button></td>";
			}
			
			if(result[i].commentUserId == "${sessionScope.loginUser.userId}"){
				output += "<td rowspan='2'><a onclick='commentModify("+result[i].commentNum+","+i+")'>수정</a></td>";	
				output += "<td rowspan='2'><a onclick='commentDelete("+result[i].commentNum+")'>삭제</a></td></tr>";			
				}
			/* output += "<td>"+result[i].commentDate+"</td></tr>"; */
			output += "</table><br/>";
			if(result[i].commentImage != null){	
				output += "<img src='resources/eventCommentFile/"+result[i].commentImage+"' style='width:300px; height:200px; '>";
			}
			//댓글을 단 아이디와 로그인 된 아이디가 같을 때만 수정과 삭제버튼을 누를수 있다.
			
			output += "<div id='commentModify1"+i+"'></div>";
		}
		$('#commentList1').html(output);
	}

	
	
	//댓글수정페이지(수정창)
	function commentModify(commentNum,i){
		var output="";
		output += "<textarea rows='1.5' cols='80' id='commentContents1' placeholder='수정할 댓글을 입력하세요...' ></textarea>";
		output += "<button  onclick='commentModifyProcess("+commentNum+")'>수정</button>";
		$('#commentModify1'+i).html(output);
	}
	
	//댓글 좋아요
	function commentLike2(commentNum){
		$.ajax({
			type:"GET",
			url:"commentLike",
			data:{
				"commentNum":commentNum,
				"commentEventNum":${eventView.eventNum},
				"commentUserId":"${sessionScope.loginUser.userId}"
				},
			success : function(result){
				commentList(result);
				},
			error : function(){
				alert("좋아여 실패");
				}	
			});
		}

	
	//댓글 삭제
	function commentDelete(commentNum){
		$.ajax({
			type:"GET",
			url:"commentDelete",
			data:{
				"commentNum" : commentNum,
				"commentEventNum" : ${eventView.eventNum}
				},
			dataType:"json",

			success : function(result){
						alert("삭제되었습니다.");
						commentList(result);
			},
			error 	: function(){
						alert("댓글 삭제 실패");
			}

		});
	}
	//댓글조회
	$(document).ready(function(){
		$.ajax({
			type:"GET",
			url:"commentList",
			data:{
				"commentEventNum":${eventView.eventNum}
				},
			dataType:"json",
			
			success : function(result){
				commentList(result);
				},
			error : function(){
				alert("댓글 조회 실패");
				}
			});
			
	});
	
	//댓글 수정
		function commentModifyProcess(commentNum){
			var commentContents = $('#commentContents1').val();
			$.ajax({
				type:"GET",
				url:"commnetModifyProcess",
				data:{
					"commentContents":commentContents,
					"commentNum":commentNum,
					"commentEventNum":${eventView.eventNum}
					},
				dataType:"json",

				success : function(result){
					alert("수정되었습니다.");
					commentList(result);
				},
				erorr : function(){
					alert("댓글 수정 실패");
					} 
				});
			}

		 //댓글 작성
	$(document).ready(function(){
		$('#commentWrite').click(function(){
		var formData = new FormData($("#fileForm")[0]);
		 	$.ajax({
				  type:'POST',
				  url:"commentWrite",
				  data:formData,  
				  processData: false, 
				  contentType: false, 
				  success: function(result){
					  		alert("댓글 작성되었습니다.");
					  		//댓글 초기화
					  		document.getElementById('commentContents').value ="";
							commentList(result);
					      },
				  error: function(){
							 alert("댓글 입력 실패");
					 	  }
			 });	
		});
	});	 



	//로그인 후 이용
	function LoginForm(){
		var con = confirm("로그인 후 이용해주세요.");
		if(con == true){
			location.href="memberLoginForm";
		}
	}
	//쿠폰지급
	function couponPayment(){
		$.ajax({
			type:"GET",
			url:"eventCouponPayment",
			data:{
				"eventCouponCode":"${eventView.eventCouponCode}",
				"userId":"${sessionScope.loginUser.userId}"
				},
			dataType:"json",
			success:function(result){
				alert("쿠폰이 지급되었습니다.");
				},
			error:function(){
				alert("이미 지급된 쿠폰입니다.");
				}
			
			});

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
	<!-- 이벤트 상세정보  -->
	<table style="width:50%; height:60%; text-align: center; margin:2% auto;">
		<tr>
			<td><img src="resources/svg/eye.svg" style="width:25px; height:25px">${eventView.eventHit}</td>
		</tr>
		<tr>
			<td colspan='2'><img src="resources/eventFile/${eventView.eventImage}"></td>
		</tr>
		<tr>
			<td colspan='2'>${eventView.eventContents}</td>
		</tr>
		<c:if test="${not empty eventView.eventCouponCode}">
		<c:choose>
			<c:when test="${empty sessionScope.loginUser.userId}">
				<tr>	
					<td colspan='2'><button onclick="LoginForm()" class="btn">쿠폰받기</button></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>	
					<td colspan='2'><button onclick="couponPayment()" class="btn">쿠폰받기</button></td>
				</tr>
			</c:otherwise>
		</c:choose>
		</c:if>
	</table><br /><br />
	<hr />
	<!-- 댓글작성창 -->
	<table style="width:50%; height:40%; margin: auto; text-align: center;">
	<tr><td>
	<form id="fileForm"  enctype="multipart/form-data">
		<input type="hidden" name="id" value="${sessionScope.loginUser.userId}">
		<input type="hidden" name="num" value="${eventView.eventNum}">
		<input type="file" id="commentImageFile" name="commentImageFile">
		<textarea rows="1.5" cols="80" id="commentContents" name="commentContents" placeholder="댓글 달기...."></textarea>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser.userId}">
				<a onclick="LoginForm()"><img src="resources/svg/new.svg"></a>
			</c:when>
			<c:otherwise>
				<input type="button" value="입력" id="commentWrite">
				<!--  <input type="image" id="commentWrite" src="resources/svg/new.svg"> -->
			</c:otherwise>
		</c:choose>
	</form>
	</td></tr>
	<!-- 댓글 리스트 -->
	<tr>
	<td><div id="commentList1"></div></td>
	</tr>
	</table>

<!-- 여기부터 하단 내용 -->
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
</html>