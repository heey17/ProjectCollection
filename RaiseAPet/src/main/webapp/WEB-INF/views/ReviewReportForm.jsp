<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 신고 폼</title>
<style>
table {
	width : 800px;
}

 #tr{
		margin: 3px 0;
 		text-align : center;
 }
 #reports{
		margin: 3px 0;
 		align : center; 
 }
 td {
 	text-align: center; 
 }
</style>

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->
	<link href="resources/common-css/bootstrap.css" rel="stylesheet">
	<link href="resources/common-css/ionicons.css" rel="stylesheet">
	<link href="resources/common-css/layerslider.css" rel="stylesheet">
	<link href="resources/01-homepage/css/styles.css" rel="stylesheet">
	<link href="resources/01-homepage/css/responsive.css" rel="stylesheet">


</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=reportKind]").click(function(){
        if($("input[name=reportKind]:checked").val() == "기타"){
            $('#reportText').show();
        }else{
        	$('#reportText').hide();
        }
    });
});
</script>
<body>
	<table style="width:800px;">
	
			<form id="report">
				<tr>		
					<td style="word-break:break-all">
						<table border="1" style="border : 2px solid #d3cfce;">
							<tr >
								<td rowspan="3" style="width:250px; height:250px;" ><img src="resources/reviewFile/${reviewView.reviewImage }" width="100%"  alt="리뷰 사진"/></td>
								<td>${reviewView.reviewTitle }</td></tr>
							<tr><td >${reviewView.reviewUserId }</td></tr>
							<tr><td style="width:350px;">${reviewView.reviewContents }</td></tr>
							<input type="hidden" id="reportReviewNum" value="${reviewView.reviewNum}"/>
						</table>
					</td>
				</tr>
				<tr>
					
				</tr>
				<tr>
				
					<td>
					<table>
					<tr>
							<th>신고 분류</th>
						</tr>
					</table>
					
						<table style="text-align:center; width:350px; margin: 0px 200px;">
					
						<tr id="reports" >
							<td><input type="radio" name="reportKind" id="reportKind1" value="욕설"/></td>
							<td><input type="radio" name="reportKind" id="reportKind2" value="허위사실"></td>
							<td><input type="radio" name="reportKind" id="reportKind3" value="악의적 비방"></td>
							<td><input type="radio" name="reportKind" id="reportKind4" value="기타"></td>
						</tr>
						<tr>
							<td>욕설</td>
							<td>허위사실</td>
							<td>악의적 비방</td>
							<td>기타</td>
						</tr>
						</table>
					</td>
				</tr>
				<!-- 기타 버튼을 누르면 작성 창이 나오게 -->
			<tr id="reportText" style="display: none;  text-align:center;">
			
				<td colspan="3">
						<textarea rows="3" cols="70" id="reportKindAnother"></textarea>
				</td>
			</tr>
				
			<input type="hidden" id="reportUserId" value="${sessionScope.loginUser.userId }"/>
		</form>
</table>
<table>
		<br>	
			<tr id="tr">
				<td colspan="2"><button id="reportSubmit" >신고</button>  <button  onclick="closeWindow()" >취소</button></td>
				
			</tr>
</table>
</body>
<script>
$(document).ready(function(){
	$("#reportSubmit").click(function(){
		var reportUserId = $("#reportUserId").val();
		var reportKind = "";
		if($("#reportKind1").prop('checked')){
			reportKind = '욕설';
	       }
	       else if($("#reportKind2").prop('checked')){
	    	   reportKind = '허위사실';
	       }
	       else if($("#reportKind3").prop('checked')){
	    	   reportKind = '악의적 비방';
	       } else{
	    	   reportKind=$("#reportKindAnother").val();
	       }
		var reportReviewNum = $("#reportReviewNum").val();
		
		$.ajax({
			type : "POST",
			url : "reviewReport",
			data : {"reportUserId" : reportUserId,
					"reportKind" : reportKind,
					"reportReviewNum" : reportReviewNum
 					},
			dataType : "json",
			success : function(result){
						if(result==1){
							alert("신고가 접수되었습니다.");
							window.close();
							}
						else {
							alert("이미 신고한 리뷰입니다.");
							window.close();
						}
					},
			error : function(){
						alert("신고 접수에 실패하였습니다. 작성 폼을 확인해주세요.");
					}
		});
	});
});
	
		

	function closeWindow(){
		window.close();
	}
</script>
</html>