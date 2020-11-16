<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	table {
	border-collapse:collapse;
	}
</style>

	<!-- Font -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->


	<link href="resources/01-homepage/css/styles.css" rel="stylesheet">
	<link href="resources/01-homepage/css/responsive.css" rel="stylesheet">
<meta charset="UTF-8">
<title>리뷰 수정 폼</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
	<table border="1" style="border : 2px solid #d3cfce; height : 500px; width:700px;">
		<form action = "reviewModifyProcess" id="review" method="POST" enctype="multipart/form-data">
			<tr>
				<th>리뷰 제목</th>
				<td>${reviewView.reviewTitle }</td>
			</tr>
			<tr>
				<th>리뷰 평점</th>
				<td>
					<table style="border-collapse:collapse;">
						<tr><img src="resources/reviewFile/1.png" style="width:21px; height:21px;"/><img src="resources/reviewFile/2.png"style="width:21px; height:21px;"/><img src="resources/reviewFile/3.png"style="width:21px; height:21px;"/><img src="resources/reviewFile/4.png"style="width:21px; height:21px;"/><img src="resources/reviewFile/5.png"style="width:21px; height:21px;"/>
							<br>
							<td>
								<input type="radio" value="1" name="reviewRating"/>
								<input type="radio" value="2" name="reviewRating"/>
								<input type="radio" value="3" name="reviewRating"/>
								<input type="radio" value="4" name="reviewRating"/>
								<input type="radio" value="5" name="reviewRating"/>
							</td>
						</tr>
						<tr></tr>
						<!-- checked -->
						<c:if test="${reviewView.reviewRating eq 1 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='1']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${reviewView.reviewRating eq 2 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='2']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${reviewView.reviewRating eq 3 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='3']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${reviewView.reviewRating eq 4 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='4']").prop('checked', true);
							</script>
						</c:if>
						<c:if test="${reviewView.reviewRating eq 5 }">
							<script>
								$("input:radio[name='reviewRating']:radio[value='5']").prop('checked', true);
							</script>
						</c:if>
					</table>
					</td>
			</tr>
			<tr>
				<th>리뷰 사진</th>
				<td><img src="resources/reviewFile/${reviewView.reviewImage }" alt="리뷰 사진"/>
					<input type="file" name="reviewImageFile"/></td>
			</tr>
			<tr>
				<th>리뷰 내용</th>
				<td><textarea rows="15" cols="70" name="reviewContents">${reviewView.reviewContents}</textarea></td>
			</tr>
			<input type="hidden" value="${reviewView.reviewNum }" name="reviewNum"/>
		</form>
			<tr>
				<td colspan="2"><button onclick="reviewSubmit()">수정</button><button onclick="reviewCancel()">취소</button></td>
			</tr>
	</table>
</body>
<script>
	function reviewSubmit(){
		review.submit();
	}
	function reviewCancel(){
		window.history.back();
	}
</script>
</html>