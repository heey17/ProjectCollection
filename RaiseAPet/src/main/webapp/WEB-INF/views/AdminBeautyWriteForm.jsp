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
  <meta name="robots" content="noindex, nofollow">
  <script src="https://cdn.ckeditor.com/4.15.0/standard-all/ckeditor.js"></script>

	<title>디자이너 작성</title>

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
    	width:70%;
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
        <div class="row">
          <div class="col-lg-12">
            <table>
              <form action="beautyBoardWrite" id="writeForm" method="POST" enctype="multipart/form-data">
                <tr>
                  <th>디자이너 이름</th>
                  <td><input type="text" name="designerName"/></td>
                </tr>
                <tr>
                  <th>디자이너 코드</th>
                  <td><input type="text" name="designerCode"/></td>
                </tr>
                <tr>
                  <th>디자이너 사진</th>
                  <td><input type="file" name="designerImageFile"/></td>
                </tr>
                <tr>
                  <th>디자이너 휴무일</th>
                  <td><input type="text" name="designerOff"/></td>
                </tr>
                <tr>
                  <th>디자이너 경력</th>
                  <td><textarea name="designerCareer" cols="40" id="editor1" name="editor1" rows="10" data-sample-short></textarea></td>
                </tr>
                </form>
                <tr>
                  <td colspan="2"><button onclick="window.history.back()"">취소</button><button onclick="writeForm.submit()">작성</button>
                  					</td>
                </tr>
              
              </table>



          </div>
        </div>
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
<script>
    CKEDITOR.plugins.addExternal('a11ychecker', 'https://ckeditor.com/docs/ckeditor4/4.15.0/examples/assets/plugins/a11ychecker/', 'plugin.js');

    // Performance optimization:
    // Send a request for tests JSON file ASAP, so it's likely to be ready when the user runs Acessibility Checker.
    $.getJSON('https://ckeditor.com/docs/vendors/4.15.0/ckeditor/assets/plugins/a11ychecker/libs/quail/tests.json');

    CKEDITOR.replace('editor1', {
      extraPlugins: 'a11ychecker',
      removePlugins: 'scayt,wsc',
      height: 500,
      a11ychecker_quailParams: {
        jsonPath: 'assets/plugins/a11ychecker/libs/quail',
        // Override Accessibility Checker guidelines from the default configuration.
        guideline: [
          'imgNonDecorativeHasAlt',
          'imgImportantNoSpacerAlt',
          'aTitleDescribesDestination',
          'aAdjacentWithSameResourceShouldBeCombined',
          'aImgAltNotRepetitive',
          'aMustNotHaveJavascriptHref',
          'aSuspiciousLinkText',
          'blockquoteNotUsedForIndentation',
          'documentVisualListsAreMarkedUp',
          'headerH1',
          'headerH2',
          'headerH3',
          'headerH4',
          'imgAltIsDifferent',
          'imgAltIsTooLong',
          'imgAltNotEmptyInAnchor',
          'imgAltTextNotRedundant',
          'imgHasAlt',
          'imgShouldNotHaveTitle',
          'linkHasAUniqueContext',
          'pNotUsedAsHeader',
          'tableDataShouldHaveTh',
          'imgWithEmptyAlt'
        ]
      },
      contentsCss: [
        'http://cdn.ckeditor.com/4.15.0/full-all/contents.css',
        'https://ckeditor.com/docs/vendors/4.15.0/ckeditor/assets/accessibilitychecker/contents.css'
      ]
    });
  </script>

</body>
</html>