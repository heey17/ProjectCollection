<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
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
	
	.contents{
		padding: 0 10px 0 10px;
	}
	
	.all{
		text-align: center;
		margin : 0 auto;
		width : -33%
	}
	
	header{
		margin-top: 11%
	}
</style>
</head>
<!-- ///////////////////////////////////////////// CSS ////////////////////////////////////////////// -->
<header>
	<div style="height:100%;  width:20.1%; margin:0 auto;">
		<a class="logo" style=" height: 100%; padding:0;">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 110px;">
		</a>
	</div>		
</header>
<body>
	<div class="all">
		<table border="1" style="width: 700px">
			<tr>
				<th>용품 번호</th>
				<th>문의글 번호</th>
				<th>문의글 내용</th>
				<th>비밀글 여부</th>
				<th>문의글 답변</th>
			</tr>
			
			<!-- 문의 - 문의내역 출력 할 부분 -->
			<c:choose>
				<c:when test="${not empty askPagingList}">
					<c:forEach var="memberAskList" items="${askPagingList}">
						<tr>
							<td>${memberAskList.askGoodsNum}</td>
							<td><a href="goodsView?goodsNum=${memberAskList.askGoodsNum}">${memberAskList.askNum}</a></td>
							<td style="overflow: hidden;
							text-overflow: ellipsis; 
							white-space: nowrap;" 
							class="contents">
							${memberAskList.askContents}</td>
							<td>${memberAskList.askSecret}</td>
							<td style="overflow: hidden;
							text-overflow: ellipsis; 
							white-space: nowrap;" 
							class="contents">${memberAskList.askAnswer}</td>
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

		<!-- 페이징 처리 -->
		<c:if test="${paging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${paging.page > 1}"><a href="askPagingList?page=${paging.page-1}">[이전]</a>&nbsp;</c:if>
		
		${paging.page}&nbsp;
		
		<c:if test="${paging.page >= paging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${paging.page < paging.maxPage}"><a href="askPagingList?page=${paging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</div>
</body>
<!-- ///////////////////////////////////////////// body ////////////////////////////////////////////// -->
</html>