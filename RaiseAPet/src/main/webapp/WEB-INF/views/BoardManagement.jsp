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

	<title>게시판 관리</title>

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


	<style>
		table{
			width:100%;
			text-align:center;
		}
		th, td {
		  border-bottom: 1px solid #ddd;
		  text-align:center;
		  height:50px;
		}
	</style>
</head>





<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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
            <h3 class="page-header"><i class="fa fa-table"></i>Board Management</h3>
            <ol class="breadcrumb">
              <li><a class="" href="hotelManagement">Hotel</a></li>
              <li><a class="" href="beautyManagement">Beauty</a></li>
              <li><a class="" href="medicalManagement">Medical</a></li>
              <li><a class="" href="educationManagement">Education</a></li>
              <li><a class="" href="goodsManagement">Goods</a></li>
              <li><a class="" href="eventManagement">Event</a></li>
            </ol>
          </div>
        </div>
        <!-- page start-->
        <div class="row">
          <div class="col-lg-12" style="width:60%; text-align:center; margin:0 auto;">
	
            <!-- 게시판 글 시작-->
            <!-- 글작성 버튼 -->
            <div style="width:100%; text-align:right;">
	            <c:choose>
	              <c:when test="${management.get(0).kind eq '미용'}">
	                <button onclick="location.href='goBeautyWrtieForm'">글작성</button>
	              </c:when>
	              <c:when test="${management.get(0).kind eq '병원'}">
	                <button onclick="location.href='goMedicalWrtieForm'">글작성</button>
	              </c:when>
	              <c:when test="${management.get(0).kind eq '용품'}">
	                <button onclick="location.href='goGoodsWrtieForm'">글작성</button>
	              </c:when>
	              <c:when test="${management.get(0).kind eq '이벤트'}">
	                <button onclick="location.href='goEventWrtieForm'">글작성</button>
	                <button onclick="window.open('goCouponWrtieForm')">쿠폰 생성</button>
	              </c:when>
	              <c:when test="${management.get(0).kind eq '교육'}">
	                <button onclick="location.href='goEducationWrtieForm'">글작성</button>
	              </c:when>
	              <c:otherwise>
	                <button onclick="location.href='goHotelWrtieForm'">글작성</button>
	              </c:otherwise>
	            </c:choose>
            </div>
            <table style="margin:0 auto;">
              <c:choose>
                <c:when test="${management.get(0).kind eq '미용'}">
                  <tr>
                    <th style="width:33%;">디자이너 코드</th>
                    <th style="width:33%;">디자이너 이름</th>
                    <th colspan="2" style="width:33%;"></th>
                  </tr>
                  <c:forEach var="management" items="${management}">
                    <tr>
                      <td>${management.designerCode }</td>
                      <td><a href="beautyBoardView?designerCode=${management.designerCode }">${management.designerName }</a></td>
                      <td><a href="beautyBoardModify?designerCode=${management.designerCode }">수정</a></td>
                      <td><a href="beautyBoardDelete?designerCode=${management.designerCode }">삭제</a></td>
                    </tr>
                  </c:forEach>
                </c:when>
                <c:when test="${management.get(0).kind eq '병원'}">
                  <tr>
                    <th style="width:33%;">의사 코드</th>
                    <th style="width:33%;">의사 이름</th>
                    <th colspan="2" style="width:33%;"></th>
                  </tr>
                  <c:forEach var="management" items="${management}">
                    <tr>
                      <td>${management.doctorCode }</td>
                      <td><a href="medicalBoardView?doctorCode=${management.doctorCode }">${management.doctorName }</a></td>
                      <td><a href="medicalBoardModify?doctorCode=${management.doctorCode }">수정</a></td>
                      <td><a href="medicalBoardDelete?doctorCode=${management.doctorCode }">삭제</a></td>
                    </tr>
                  </c:forEach>
                </c:when>
                <c:when test="${management.get(0).kind eq '용품'}">
                  <tr>
                    <th>용품 번호</th>
                    <th>용품 이름</th>
                    <th>재고</th><th colspan="2"></th>
                  
                    </tr>
                  <c:forEach var="management" items="${management}">
                    <tr>
                      <td>${management.goodsNum }</td>
                      <td><a href="goodsBoardView?goodsNum=${management.goodsNum }">${management.goodsName}</a></td>
                      <td>${management.goodsStock}</td>
                      <td><a href="goodsBoardModify?goodsNum=${management.goodsNum }">수정</a></td>
                      <td><a href="goodsBoardDelete?goodsNum=${management.goodsNum }">삭제</a></td>
                    </tr>
                  </c:forEach>
                </c:when>
                <c:when test="${management.get(0).kind eq '이벤트'}">
                  <tr>
                    <th>글번호</th>
                    <th>글제목</th>
                    <th>조회수</th>
                    <th colspan="2"></th>
                  </tr>
                  <c:forEach var="management" items="${management}">
                    <tr>
                      <td>${management.eventNum }</td>
                      <td><a href="eventBoardView?eventNum=${management.eventNum }">
                          <img src="resources/eventFile/${management.eventTitleImage }" alt="이벤트 제목 사진" width="100px"/>
                        </a></td>
                      <td>${management.eventHit}</td>
                      <td><a href="eventBoardModify?eventNum=${management.eventNum }">수정</a></td>
                      <td><a href="eventBoardDelete?eventNum=${management.eventNum }">삭제</a></td>
                    </tr>
                  </c:forEach>
                </c:when>
                <c:when test="${management.get(0).kind eq '교육'}">
                  <tr>
                  	<td colspan="4">
                  		<table>
                  			<tr>
                  				<form action="educationManagement" method="GET" id="eduForm">
                  					<td style="float:left;"><input type="radio" value=""  name="eduAnimalKind"/> &nbsp;전체 &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                  						<input type="radio" value="강아지" name="eduAnimalKind"/> &nbsp;강아지 &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                  						<input type="radio" value="고양이" name="eduAnimalKind"/> &nbsp;고양이 &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                  						<input type="submit" value="검색"/></td>
                  				</form>
                  				<!-- checked -->
                  				<c:choose>
			                    <c:when test="${eduAnimalKind eq '강아지' }">
			                      <script>
			                        $("input:radio[name='eduAnimalKind']:radio[value='강아지']").prop('checked', true);
			                      </script>
			                    </c:when>
			                    <c:when test="${eduAnimalKind eq '고양이' }">
			                      <script>
			                        $("input:radio[name='eduAnimalKind']:radio[value='고양이']").prop('checked', true);
			                      </script>
			                    </c:when>
			                    <c:otherwise>
			                    	<script>
			                        $("input:radio[name='eduAnimalKind']:radio[value='']").prop('checked', true);
			                      </script>
			                    </c:otherwise>
			                    </c:choose>
                  			</tr>
                  		</table>
                  	</td>
                  </tr>
                  <tr>
                    <th>글번호</th>
                    <th>글제목</th>
                    <th>조회수</th>
                    <th colspan="2"></th>
                  </tr>
                  <c:forEach var="management" items="${management}">
                    <tr>
                      <td>${management.eduNum }</td>
                      <td><a href="educationBoardView?eduNum=${management.eduNum }">${management.eduTitle }</a></td>
                      <td>${management.eduHit}</td>
                      <td><a href="educationBoardModify?eduNum=${management.eduNum }">수정</a></td>
                      <td><a href="educationBoardDelete?eduNum=${management.eduNum }">삭제</a></td>
                    </tr>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <tr>
                    <th>방코드</th>
                    <th>방이름</th>
                    <th>방크기</th>
                    <th colspan="2"></th>
                  </tr>
                  <c:forEach var="management" items="${management}">
                    <tr>
                      <td>${management.hotelCode }</td>
                      <td><a href="hotelBoardView?hotelCode=${management.hotelCode }">${management.hotelRoomName}</a></td>
                      <td>${management.hotelSize }</td>
                      <td><a href="hotelBoardModify?hotelCode=${management.hotelCode }">수정</a></td>
                      <td><a href="hotelBoardDelete?hotelCode=${management.hotelCode }">삭제</a></td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </table>
            <c:if test="${management.get(0).kind eq '용품'}">
              <!-- 페이징 구간 -->
              <div id="paging" style="text-align : center;">
                <c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
                <c:if test="${paging.page>1 }">
                  <a href="goodsManagement?page=${paging.page-1}">[이전]</a>&nbsp;
                </c:if> 
                <c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
                  <c:choose>
                    <c:when test="${i eq paging.page }">	
                      [${i}]								
                    </c:when>
                    <c:otherwise>
                      <a href="goodsManagement?page=${i}">${i}</a>
                    </c:otherwise>
                  </c:choose>
                </c:forEach> 
                <c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
                <c:if test="${paging.page<paging.maxPage}">
                  &nbsp;<a href="goodsManagement?page=${paging.page+1}">[다음]</a>
                </c:if>
              </div>
              <!-- 페이징 구간 끝 -->
            </c:if>
            <c:if test="${management.get(0).kind eq '교육'}">
              <!-- 페이징 구간 -->
              <div id="paging" style="text-align : center;">
                <c:if test="${paging.page<=1 }">[이전]&nbsp;</c:if>
                <c:if test="${paging.page>1 }">
                  <a href="educationManagement?page=${paging.page-1}&eduAnimalKind=${eduAnimalKind}">[이전]</a>&nbsp;
                </c:if> 
                <c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="i" step="1">
                  <c:choose>
                    <c:when test="${i eq paging.page }">	
                      [${i}]								
                    </c:when>
                    <c:otherwise>
                      <a href="educationManagement?page=${i}&eduAnimalKind=${eduAnimalKind}">${i}</a>
                    </c:otherwise>
                  </c:choose>
                </c:forEach> 
                <c:if test="${paging.page>=paging.maxPage}">&nbsp;[다음]</c:if> 
                <c:if test="${paging.page<paging.maxPage}">
                  &nbsp;<a href="educationManagement?page=${paging.page+1}&eduAnimalKind=${eduAnimalKind}">[다음]</a>
                </c:if>
              </div>
              <!-- 페이징 구간 끝 -->
            </c:if>
            <!-- 게시판 글 끝-->

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