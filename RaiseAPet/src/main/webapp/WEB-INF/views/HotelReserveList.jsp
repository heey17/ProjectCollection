<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">

  <title>호텔 예약 리스트</title>

  <!-- Bootstrap CSS -->
  <link href="resources/admin/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/admin/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="resources/admin/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="resources/admin/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="resources/admin/css/style.css" rel="stylesheet">
  <link href="resources/admin/css/style-responsive.css" rel="stylesheet" />

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
  <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->

    <!-- =======================================================
      Theme Name: NiceAdmin
      Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      Author: BootstrapMade
      Author URL: https://bootstrapmade.com
    ======================================================= -->
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
  <!-- container section start -->
  <section id="container" class="">
    <!--header start-->
    <header class="header dark-bg">
      <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
      </div>

      <!--logo start-->
      <a href="goAdminDashboard" class="logo" style="color: #DDC3F7;">Raise A Pet</a>
      <!--logo end-->

      

      <div class="top-nav notification-row">
        
          <!-- user login dropdown start-->
          <li class="dropdown" style=" list-style-type:none;">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="img/avatar1_small.jpg">
                            </span>
                            <span class="username">Admin</span>
                            <b class="caret"></b>
                        </a>
            <ul class="dropdown-menu extended logout">
              <div class="log-arrow-up"></div>
              <li class="eborder-top">
                <a href="#"><i class="icon_profile"></i> My Profile</a>
              </li>
              <li>
                <a href="memberLogout"><i class="icon_key_alt"></i> Log Out</a>
              </li>
            </ul>
          </li>
          <!-- user login dropdown end -->
        </ul>
        <!-- notificatoin dropdown end-->
      </div>
      
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li class="">
            <a class="" href="goAdminDashboard">
                          <i class="icon_house_alt"></i>
                          <span>Dashboard</span>
                      </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Board Manage</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="hotelManagement">Hotel</a></li>
              <li><a class="" href="beautyManagement">Beauty</a></li>
              <li><a class="" href="medicalManagement">Medical</a></li>
              <li><a class="" href="educationManagement">Education</a></li>
              <li><a class="" href="goodsManagement">Goods</a></li>
              <li><a class="" href="eventManagement">Event</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Member Manage</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="adminMemberList">Member List</a></li>
              <li><a class="" href="goAdminMemberReport">Report List</a></li>
              <li><a class="" href="adminMemberSuspendList">Suspend List</a></li>
              <li><a class="" href="goAdminAskList">Ask List</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>Review Manage</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="reviewBoardList?kind=호텔">Hotel Review</a></li>
              <li><a class="" href="reviewBoardList?kind=미용">Beauty Review</a></li>
              <li><a class="" href="reviewBoardList?kind=병원">Medical Review</a></li>
              <li><a class="" href="reviewBoardList?kind=용품">Goods Review</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_table"></i>
                          <span>Reserve And Buy</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="active" href="hotelReserveList">Hotel Reservation</a></li>
              <li><a class="active" href="beautyReserveList">Beauty Reservation</a></li>
              <li><a class="active" href="medicalReserveList">Medical Reservation</a></li>
              <li><a class="active" href="goodsBuyList">Goods Reservation</a></li>
            </ul>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
<!--////////////////////////////////////////////////////////////////////////////////////////////-->
<!--바뀔 구간-->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-table"></i>Reserve And Buy</h3>
            <ol class="breadcrumb">
              <li><a class="active" href="hotelReserveList">Hotel Reservation</a></li>
              <li><a class="active" href="beautyReserveList">Beauty Reservation</a></li>
              <li><a class="active" href="medicalReserveList">Medical Reservation</a></li>
              <li><a class="active" href="goodsBuyList">Goods Reservation</a></li>
            </ol>
          </div>
        </div>
        <!-- page start-->
        <div class="row">
          <div class="col-lg-12">

            <!--예약 시작-->
            <div style="height:100%">
              <div style="text-align:center; ">
                <c:forEach var="reserveList" items="${hotelReserveList}">
                  <table style="width:60%;  margin:1% auto; border: 1px solid #444444;">
                    <tr><td rowspan="6" style="width:50%; text-align:center"><img src="resources/hotelFile/${reserveList.hotelRoomImage1 }" alt="호텔 사진" style="hegith:100px; width:300px"/></td>
                      <td colspan="3">${reserveList.hotelRoomName }</td></tr>
                    <tr><td colspan="3"><a onclick="goMemberView('${reserveList.hotelUserId}')">${reserveList.hotelUserId}</a></td></tr>
                          <!-- 호텔 예약한 회원 정보 불러오기 -->
                          <script>
                            function goMemberView(userId){
                              var form=document.createElement("form");
                              form.setAttribute("method", "POST");
                              form.setAttribute("action", "adminMemberView");
                              form.setAttribute("target", "memberForm");
                              
                              
                              var input = document.createElement('input');
                              input.type="hidden";
                              input.name="userId";
                              input.value= userId;
                              form.appendChild(input);
                              
                              document.body.appendChild(form);

                              var couponX = (window.screen.width / 2) - (600 / 2);
                              // &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
                              
                              var couponY= (window.screen.height /2) - (400 / 2);
                              // &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
                              
                              window.open("adminMemberView", "memberForm", "width=600, height=400, left="+couponX + ", top="+couponY);
                            
                               form.submit();
                            }
                            </script>
                    <tr><td>${reserveList.hotelCheckIn }</td>
                      <td>~</td>
                      <td>${reserveList.hotelCheckOut }</td></tr>
                    <tr><td colspan="3">${reserveList.hotelPayment }</td></tr>
                    <tr><td colspan="3">${reserveList.hotelAnimalKind }</td></tr>
                    <tr><td colspan="3">${reserveList.hotelSpecialNote }</td></tr>
                  </table>
                </c:forEach>
                <!-- 페이징 구간 -->
                <div id="paging" style="text-align : center;">
                  <c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
                  <c:if test="${paging.page>1 }">
                    <a href="hotelReserveList?page=${paging.page-1}">[이전]</a>&nbsp;
                  </c:if> 
                  <c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
                    <c:choose>
                      <c:when test="${i eq paging.page }">	
                        [${i}]								
                      </c:when>
                      <c:otherwise>
                        <a href="hotelReserveList?page=${i}">${i}</a>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach> 
                  <c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
                  <c:if test="${paging.page<paging.maxPage}">
                    &nbsp;<a href="hotelReserveList?page=${paging.page+1}">[다음]</a>
                  </c:if>
                </div>
                <!-- 페이징 구간 끝 -->
              </div>

            </div>
            <!--예약 끝-->

          </div>
        </div>
        <!-- page end-->
      </section>
    </section>
    <!--main content end-->
    <div class="text-right">
      <div class="credits">
          <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>
  </section>
  <!-- container section end -->
  <!-- javascripts -->
  <script src="resources/admin/js/jquery.js"></script>
  <script src="resources/admin/js/bootstrap.min.js"></script>
  <!-- nicescroll -->
  <script src="resources/admin/js/jquery.scrollTo.min.js"></script>
  <script src="resources/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
  <!--custome script for all page-->
  <script src="resources/admin/js/scripts.js"></script>


</body>
</html>