<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">
<title>신고 가져오는 곳</title>
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
</head>
<style>
	table{
    	margin:0 auto; 
    	width:50%;
    }
    th{
    	width:30%;
    	 text-align:center;
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
    
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function reviewReportList(result) {
	var output = "";
	//용품 문의 구간
	for ( var i in result.askList) {
		output += '<table style="border: 1px solid #444444; width:50%; margin:2% auto"><tr><td rowspan="3" style="width: 80%"><table border="1" style="width: 100%; height: 100%;">'
				+ '<tr><td rowspan="3" width="30%"><img src="resources/goodsFile/';
		output += result.askList[i].goodsImage1;
		output +=' style="width:100px; height:100px"/></td> <th colspan="3" width="60%" height="20px">';
		output += result.askList[i].goodsName;
		output += '</th></tr><tr><td width="" colspan="2" height="15px"> 문의자 : ';
		output += result.askList[i].askUserId;
		output += '</td></tr><tr><td colspan="2">';
		output += result.askList[i].askContents;
		output += '</td></tr></table></td><td rowspan="3">';
		
		//답변 버튼
		output += '<a onclick="answer('+ result.askList[i].askNum+','+"'"+result.askList[i].askUserId +"'"+ ');">답변하기</a></td></tr></table>';
	}
	//페이징 구간
	output += '<div style="text-align: center;">';
	if (result.paging.page <= 1) {
		output += '[이전] ';
	} else {
		output += '<a onclick="askListPaging('+ (result.paging.page - 1) + ')">[이전]</a> ';
	}
	for (var i = result.paging.startPage; i <= result.paging.endPage; i++) {
		if (i == result.paging.page) {
			output += '[' + i + ']';
		} else {
			output += '<a onclick="askListPaging(' + i + ')">' + i
					+ '</a>';
		}
	}
	if (result.paging.page >= result.paging.maxPage) {
		output += ' [다음]';
	} else {
		output += ' <a onclick="askListPaging('
				+ (result.paging.page + 1) + ')">[다음]</a>';
	}
	output += '</div>';
	//페이징 구간 끝 

	$('#askArea').html(output);
}

$(document).ready(function() {
	$.ajax({
		type : "GET",
		url : "adminAskList",
		dataType : "json",
		success : function(result) {
			reviewReportList(result);
		},
		error : function() {
			alert('답변을 기다리는 문의글이 없습니다.');
		}
	});
});
// 페이징 처리해서 다시 불러오기
function askListPaging(page){
	$.ajax({
		type : "GET",
		url : "adminAskList",
		data : {"page" : page},
		dataType : "json",
		success : function(result) {
			reviewReportList(result);
		},
		error : function() {
			alert('답변을 기다리는 문의글이 없습니다.');
		}
	});
}

// 답변 작성 폼 window.open
function answer(askNum, askUserId){
	var form=document.createElement("form");
	form.setAttribute("method", "POST");
	form.setAttribute("action", "adminAnswerForm");
	form.setAttribute("target", "answerForm");
	
	
	var askNumInput = document.createElement('input');
	askNumInput.type="hidden";
	askNumInput.name="askNum";
	askNumInput.value= askNum;
	form.appendChild(askNumInput);
	
	var askUserIdInput = document.createElement('input');
	askUserIdInput.type="hidden";
	askUserIdInput.name="askUserId";
	askUserIdInput.value= askUserId;
	form.appendChild(askUserIdInput);
	
	document.body.appendChild(form);

	var couponX = (window.screen.width / 2) - (600 / 2);
	// &nbsp; 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var couponY= (window.screen.height /2) - (400 / 2);
	// &nbsp; 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	window.open("adminAnswerForm", "answerForm", "width=600, height=400, left="+couponX + ", top="+couponY);

	 form.submit();
}
</script>
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
            <h3 class="page-header"><i class="fa fa-table"></i>Member Management</h3>
            <ol class="breadcrumb">
              <li><a class="" href="adminMemberList">Member List</a></li>
              <li><a class="" href="goAdminMemberReport">Report List</a></li>
              <li><a class="" href="adminMemberSuspendList">Suspend List</a></li>
              <li><a class="" href="goAdminAskList">Ask List</a></li>
            </ol>
          </div>
        </div>
        <!-- page start-->
        <div class="row">
          <div class="col-lg-12" style="text-align:center;">

            <!-- 문의 목록 시작-->
            <div style="" id="askArea"></div>
            <!-- 문의 목록 끝-->

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