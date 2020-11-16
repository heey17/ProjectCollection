<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰내역</title>
<style>
	table, tr, td, th{
		border-collapse: collapse;
		margin: 0 auto;
		border-width : medium;
		border : 1px solid #474747;
		table-layout: fixed;
		/* 
			테이블의 크기 지정 및 고정 시켜야 할 경우에 사용한다
			td에서 문자열을 자르거나 숨길 수 있다.
		 */
		border-color: gray;
	}
		
	.img{
		height: 80px;
		width: 80px;
		margin-right: 10px;
		margin-left: 10px;
	}
	
	th{
		background-color: #f1d2fc;
	}
	
	td{
		width: 100px;
	}
	
	.contents{
		padding: 0 10px 0 10px;
	}
		
	.all{
		text-align: center;
		margin : 0 auto;
		width : -33%
	}
		
	header{
		margin-top: 1%
	}
</style>
</head>
<!-- ///////////////////////////////////////////// CSS ////////////////////////////////////////////// -->
<header>
	<div style="height:100%;  width:17.7%; margin:0 auto;">
		<a class="logo" style=" height: 100%; padding:0;">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 110px;">
		</a>
	</div>		
</header>
<body>
	<div class="all">
		<table border="1" style="width : 800px;">
			<tr>
				<th>번호</th>
				<th>리뷰 사진</th>
				<th>리뷰 제목</th>
				<th>리뷰 종류</th>
				<th>리뷰 평점</th>
				<th>리뷰 게시 날짜</th>
				<th>좋아요수</th>
			</tr>
			
			<!-- 리뷰 - 리뷰 내역 출력하는 부분 -->
			<c:choose>
				<c:when test="${not empty reviewPagingList}">
					<c:forEach var="memberReviewList" items="${reviewPagingList}">
						<tr>
							<td>${memberReviewList.reviewNum}</td>
							<td>
								<!-- 리뷰 작성 시 사진이 있을 경우 -->
								<c:if test="${not empty memberReviewList.reviewImage}">
									<img class="img" style="margin-left: 15%" src="resources/reviewFile/${memberReviewList.reviewImage}"/>
								</c:if>	
								<!-- 리뷰 작성 시 사진이 없을 경우 -->
								<c:if test="${empty memberReviewList.reviewImage}">
									<p>X</p>
								</c:if>	
							</td>
							<td class="contents">${memberReviewList.reviewTitle}</td>
							<td>${memberReviewList.reviewKind}</td>
							<td>${memberReviewList.reviewRating}점</td>
							<td>
							<fmt:parseDate var="reviewDate" value="${memberReviewList.reviewDate}" pattern="YYYY-mm-dd"></fmt:parseDate>
							<fmt:formatDate var="newFormatted" value="${reviewDate}" pattern="YYYY-mm-dd"/> 
							${newFormatted}
							</td>
							<td>${memberReviewList.reviewLike}</td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<td style="height: 100px" colspan="7">기록이 없습니다.</td>
				</c:otherwise>
			</c:choose>
		</table>
		
		<!-- 페이징 처리 -->
		<c:if test="${paging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${paging.page > 1}"><a href="reviewPagingList?page=${paging.page-1}">[이전]</a>&nbsp;</c:if>
		
		${paging.page}&nbsp;
		
		<c:if test="${paging.page >= paging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${paging.page < paging.maxPage}"><a href="reviewPagingList?page=${paging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</div>
</body>
<!-- ///////////////////////////////////////////// body ////////////////////////////////////////////// -->
</html>