<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">

	<title>리뷰 관리</title>

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
<style>
	table {
   		border: 1px solid #444444;
 	 }
	th, td{
    	border-bottom: 1px solid #ddd;
    	height : 60px;
		
    }
    input{
    	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
    	height : 30px;
    	padding: .8em .5em;
    }
    button{
    	float:right;
    }
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
            <h3 class="page-header"><i class="fa fa-table"></i>Review</h3>
            <ol class="breadcrumb">
              <li><a class="active" href="reviewBoardList?kind=호텔">Hotel Review</a></li>
              <li><a class="active" href="reviewBoardList?kind=미용">Beauty Review</a></li>
              <li><a class="active" href="reviewBoardList?kind=병원">Medical Review</a></li>
              <li><a class="active" href="reviewBoardList?kind=용품">Goods Review</a></li>
            </ol>
          </div>
        </div>
        <!-- page start-->
        <div class="row">
        
          <div class="col-lg-12">

            <!-- 리뷰 시작-->
            <c:forEach var="review" items="${reviewList }" varStatus="status">
              <div id="report${status.index +1}"><!-- a.jax 구간 -->
              <table style="width :50%; height : 100%; margin: 20px auto;">
                    <tr>
                      <td rowspan="4" width="30%" style="border-bottom: 1px solid #444444;"><img src="resources/reviewFile/${review.reviewImage }" style="width:100px; height:100px"/></td>
                      <th colspan="3" width="60%" height="20px">${review.reviewTitle }</th>
                      <td rowspan="4" width="10%" style="border-bottom: 1px solid #444444;">
                        <!-- 블라인드 버튼 -->
                        <c:if test="${review.reviewBlind ne 'BLIND' }">
                          <button onclick="reviewBlind(${review.reviewNum},${status.index +1})">BLIND</button>
                        </c:if>
                        <c:if test="${review.reviewBlind eq 'BLIND' }">
                          이미 블라인드 처리된 리뷰입니다.
                        </c:if>
                      </td>
                    </tr>
                    <tr>
                      <td width="" colspan="2" height="15px">${review.reviewRating }</td>
                    </tr>
                    <tr>
                      <td>${review.reviewDate }</td>
                      <td width="20%"  height="20px">${review.reviewUserId }</td>
                    </tr>
                    <tr>
                      <td colspan="2" style="border-bottom: 1px solid #444444;">${review.reviewContents }</td>
                    </tr>
                  </table>
            </div>
            <script>
              function reviewBlind(reviewNum,index){
                $.ajax({
                type : "GET",
                url : "reviewBlind",
                data : {"reviewNum" : reviewNum},
                dataType : "json",
                success : function(result){
                      if(result==0){
                        alert("이미 블라인드 처리 된 리뷰입니다.");
                      }else{
                        alert("블라인드 처리가 완료되었습니다.");
                        report.HTML.hide();
                        $("'#report"+index+"'").hide();
                      }
                    },
                error : function(){
                    alert("블라인드 처리에 실패했습니다.");
                    }
                });
              }
            </script>
            </c:forEach>
            <div>
              <!-- 페이징 구간 -->
              <c:if test="${not empty reviewList}">
                <!-- 호텔 리뷰 페이징 -->
                <c:if test="${reviewList.get(0).reviewKind eq '호텔'}">
                  <div id="paging" style="text-align : center;">
                    <c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
                    <c:if test="${paging.page>1 }">
                      <a href="reviewBoardList?kind=호텔&page=${paging.page-1}">[이전]</a>&nbsp;
                    </c:if> 
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
                      <c:choose>
                        <c:when test="${i eq paging.page }">	
                          [${i}]								
                        </c:when>
                        <c:otherwise>
                          <a href="reviewBoardList?kind=호텔&page=${i}">${i}</a>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach> 
                    <c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
                    <c:if test="${paging.page<paging.maxPage}">
                      &nbsp;<a href="reviewBoardList?kind=호텔&page=${paging.page+1}">[다음]</a>
                    </c:if>
                  </div>
                </c:if>
                <!-- 미용 리뷰 페이징 -->
                <c:if test="${reviewList.get(0).reviewKind eq '미용'}">
                  <div id="paging" style="text-align : center;">
                    <c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
                    <c:if test="${paging.page>1 }">
                      <a href="reviewBoardList?kind=미용&page=${paging.page-1}">[이전]</a>&nbsp;
                    </c:if> 
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
                      <c:choose>
                        <c:when test="${i eq paging.page }">	
                          [${i}]								
                        </c:when>
                        <c:otherwise>
                          <a href="reviewBoardList?kind=미용&page=${i}">${i}</a>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach> 
                    <c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
                    <c:if test="${paging.page<paging.maxPage}">
                      &nbsp;<a href="reviewBoardList?kind=미용&page=${paging.page+1}">[다음]</a>
                    </c:if>
                  </div>
                </c:if>
                <!-- 병원 리뷰 페이징 -->
                <c:if test="${reviewList.get(0).reviewKind eq '병원'}">
                  <div id="paging" style="text-align : center;">
                    <c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
                    <c:if test="${paging.page>1 }">
                      <a href="reviewBoardList?kind=병원&page=${paging.page-1}">[이전]</a>&nbsp;
                    </c:if> 
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
                      <c:choose>
                        <c:when test="${i eq paging.page }">	
                          [${i}]								
                        </c:when>
                        <c:otherwise>
                          <a href="reviewBoardList?kind=병원&page=${i}">${i}</a>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach> 
                    <c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
                    <c:if test="${paging.page<paging.maxPage}">
                      &nbsp;<a href="reviewBoardList?kind=병원&page=${paging.page+1}">[다음]</a>
                    </c:if>
                  </div>
                </c:if>
                <!-- 용품 리뷰 페이징 -->
                <c:if test="${reviewList.get(0).reviewKind eq '용품'}">
                  <div id="paging" style="text-align : center;">
                    <c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
                    <c:if test="${paging.page>1 }">
                      <a href="reviewBoardList?kind=용품&page=${paging.page-1}">[이전]</a>&nbsp;
                    </c:if> 
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
                      <c:choose>
                        <c:when test="${i eq paging.page }">
                          [${i}]								
                        </c:when>
                        <c:otherwise>
                          <a href="reviewBoardList?kind=용품&page=${i}">${i}</a>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach> 
                    <c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
                    <c:if test="${paging.page<paging.maxPage}">
                      &nbsp;<a href="reviewBoardList?kind=용품&page=${paging.page+1}">[다음]</a>
                    </c:if>
                  </div>
                </c:if>
              </c:if>
            <!-- 페이징 구간 끝 -->
            </div>
            <!-- 리뷰 끝-->

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