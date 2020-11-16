<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰함</title>
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
	
	th{
		background-color: #f1d2fc;
	}
	
	.th{ /* 상단 고정 */
		position: sticky;
		top: 0;
	}
	
	.all{
		text-align: center;
		margin : 0 auto;
		width : -33%
	}
	
	header{
		margin-top: 11%
	}
	
	.contents{
		padding: 0 10px 0 10px;
	}
</style>
<!-- ///////////////////////////////////////////// CSS ////////////////////////////////////////////// -->
</head>
<header>
	<div style="height:100%;  width:21%; margin:0 auto;">
		<a class="logo" style=" height: 100%; padding:0;">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 110px;">
		</a>
	</div>		
</header>
<body>
	<div class="all">
		<table style="width: 700px;">
			<tr class="th">
				<th>코드</th>
				<th>이름</th>
				<th>유효기간</th>
				<th>할인내용</th>
				<th>상세내용</th>
			</tr>
			
			<!-- 쿠폰함 - 쿠폰 내용 출력 할 부분 -->
			<c:choose>
				<c:when test="${not empty memberCouponList}">
					<c:forEach var="memberCouponList" items="${memberCouponList}">
						<tr>
							<td>${memberCouponList.couponCode}</td>
							<td style="overflow: hidden;
							text-overflow: ellipsis; 
							white-space: nowrap;" class="contents">${memberCouponList.couponName}</td>
							<fmt:parseDate var="couponDate" value="${memberCouponList.couponDate}" pattern="YYYY-mm-dd"></fmt:parseDate>
							<fmt:formatDate var="newFormatted" value="${couponDate}" pattern="YYYY-mm-dd"/> 
							<td>${newFormatted}</td>
							<td style="overflow: hidden;
							text-overflow: ellipsis; 
							white-space: nowrap;" class="contents">${memberCouponList.couponContents}</td>
							<fmt:formatNumber var="couponSale" value="${memberCouponList.couponSale}"/> 	
							<td>${couponSale}</td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr style="height: 100px">
						<td colspan="5">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
<!-- ///////////////////////////////////////////// body ////////////////////////////////////////////// -->
</html>