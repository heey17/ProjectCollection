<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역</title>
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
	
	.all{
		text-align: center;
		margin : 0 auto;
		width : -33%
	}	
	
	fieldset{
		border-top: 1px solid;
		border-left: none;
		border-right: none;
		border-bottom: none;
		border-color: #c886d1;
		top: 1%;
		position: relative;
	}
	
	legend{
		padding-left: 1%;
		padding-right: 1%;
		font-size: 18px;
	}
	
	header{
		margin-top: 1%
	}
	
	.btn{
		margin-top: 5px;
		margin-bottom: 5px;
		font-size: 15px;
		width: 70px;
		height: 20px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
</style>
<!-- ///////////////////////////////////////////// CSS ////////////////////////////////////////////// -->
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script>
	// 호텔 리뷰 작성 시 중복 검사
	function hotelReview(hotelCode, kind, hotelReserveNum){

		// hotelcode, kind는 리뷰 작성 jsp로 이동 할 때 사용
		// hotelReserveNum은 중복 검사 할 때 사용

		$.ajax({
			type : "POST", // POST 방식으로
			url : "hotelReviewCheck", // Controller에 idoverlap이라는 value로 보낸다.
			data : {"hotelReserveNum" : hotelReserveNum
				},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					goHotelReviewForm(hotelCode, kind, hotelReserveNum);
				} else{
					alert("이미 리뷰를 작성 하셨습니다.");
					}
				}, 

			// 실패 시
			error : function(){
				alert("리뷰 함수 통신 실패");
				}
			}); // end Ajax
	}

	//희영 추가-form
	function goHotelReviewForm(hotelCode, kind, hotelReserveNum){
	                var form=document.createElement("form");
	                form.setAttribute("method", "GET");
	                form.setAttribute("action", "reviewWriteForm");
	                form.setAttribute("target", "reviewWriteForm");
	                
	                
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="code";
	                input.value= hotelCode;
	                form.appendChild(input);
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="reviewKind";
	                input.value= kind;
	                form.appendChild(input);
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="reserveNum";
	                input.value= hotelReserveNum;
	                form.appendChild(input);
	                
	                document.body.appendChild(form);
	                window.open("reviewWriteForm", "reviewWriteForm", "width=600, height=500");
	                 form.submit();
	          
	       }

	
	// 병원 리뷰 작성 시 중복 검사
	function medicalReview(medicalReserveDoctor, kind, medicalReserveNum){

		// medicalReserveDoctor, kind는 리뷰 작성 jsp로 이동 할 때 사용
		// medicalReserveNum은 중복 검사 할 때 사용

		$.ajax({
			type : "POST", // POST 방식으로
			url : "medicalReviewCheck", // Controller에 idoverlap이라는 value로 보낸다.
			data : {"medicalReserveNum" : medicalReserveNum
				},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					goMedicalReviewForm(medicalReserveDoctor, kind, medicalReserveNum);
				} else{
					alert("이미 리뷰를 작성 하셨습니다.");
					}
				}, 

			// 실패 시
			error : function(){
				alert("리뷰 함수 통신 실패");
				}
			}); // end Ajax
	}

	//희영 추가-form
	function goMedicalReviewForm(medicalReserveDoctor, kind, medicalReserveNum){

	                var form=document.createElement("form");
	                form.setAttribute("method", "GET");
	                form.setAttribute("action", "reviewWriteForm");
	                form.setAttribute("target", "reviewWriteForm");
	                
	                
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="code";
	                input.value= medicalReserveDoctor;
	                form.appendChild(input);
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="reviewKind";
	                input.value= kind;
	                form.appendChild(input);
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="reserveNum";
	                input.value= medicalReserveNum;
	                form.appendChild(input);
	                
	                document.body.appendChild(form);
	                window.open("reviewWriteForm", "reviewWriteForm", "width=600, height=500");
	                 form.submit();
	          
	       }

	// 미용 리뷰 작성 시 중복 검사
	function beautyReview(beautyReserveDesigner, kind, beautyReserveNum){

		// beautyReserveDesigner, kind는 리뷰 작성 jsp로 이동 할 때 사용
		// beautyReserveNum은 중복 검사 할 때 사용

		$.ajax({
			type : "POST", // POST 방식으로
			url : "beautyReviewCheck", // Controller에 idoverlap이라는 value로 보낸다.
			data : {"beautyReserveNum" : beautyReserveNum
				},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					goBeautyReviewForm(beautyReserveDesigner, kind, beautyReserveNum);
				} else{
					alert("이미 리뷰를 작성 하셨습니다.");
					}
				}, 

			// 실패 시
			error : function(){
				alert("리뷰 함수 통신 실패");
				}
			}); // end Ajax
	}

	//희영 추가-form
	function goBeautyReviewForm(beautyReserveDesigner, kind, beautyReserveNum){
	                var form=document.createElement("form");
	                form.setAttribute("method", "GET");
	                form.setAttribute("action", "reviewWriteForm");
	                form.setAttribute("target", "reviewWriteForm");
	                
	                
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="code";
	                input.value= beautyReserveDesigner;
	                form.appendChild(input);
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="reviewKind";
	                input.value= kind;
	                form.appendChild(input);
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="reserveNum";
	                input.value= beautyReserveNum;
	                form.appendChild(input);
	                
	                document.body.appendChild(form);
	                window.open("reviewWriteForm", "reviewWriteForm", "width=600, height=500");
	                 form.submit();
	          
	       }

	// 용품 리뷰 작성 시 중복 검사
	function goodsReview(buyGoodsNum, kind, goodsBuyNum){

		// buyGoodsNum, kind는 리뷰 작성 jsp로 이동 할 때 사용
		// reserveNum은 중복 검사 할 때 사용

		$.ajax({
			type : "POST", // POST 방식으로
			url : "goodsReviewCheck", // Controller에 idoverlap이라는 value로 보낸다.
			data : {"goodsBuyNum" : goodsBuyNum
				},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					goGoodsReviewForm(buyGoodsNum, kind, goodsBuyNum);
				} else{
					alert("이미 리뷰를 작성 하셨습니다.");
					}
				}, 

			// 실패 시
			error : function(){
				alert("리뷰 함수 통신 실패");
				}
			}); // end Ajax
	}

	//희영 추가-form
	function goGoodsReviewForm(buyGoodsNum, kind, goodsBuyNum){
	                var form=document.createElement("form");
	                form.setAttribute("method", "GET");
	                form.setAttribute("action", "reviewWriteForm");
	                form.setAttribute("target", "reviewWriteForm");
	                
	                
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="num";
	                input.value= buyGoodsNum;
	                form.appendChild(input);
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="reviewKind";
	                input.value= kind;
	                form.appendChild(input);
	                var input = document.createElement('input');
	                input.type="hidden";
	                input.name="reserveNum";
	                input.value= goodsBuyNum;
	                form.appendChild(input);
	                
	                document.body.appendChild(form);
	                window.open("reviewWriteForm", "reviewWriteForm", "width=600, height=500");
	                 form.submit();
	          
	       }
</script>
<!-- ///////////////////////////////////////////// script ////////////////////////////////////////////// -->
</head>
<header>
	<div style="height:100%;  width:11.8%; margin:0 auto;">
		<a class="logo" style=" height: 100%; padding:0;">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 110px;">
		</a>
	</div>		
</header>
<body>
	<div class="all">
	
	<!-- 호텔 -->
	<div id="hotelForm">
	<fieldset>
		<legend>[HOTEL]</legend>
		<table border="1" style="width: 1250px">
			<tr>
				<th>예약자</th>
				<th>전화번호</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>동물 종류</th>
				<th>특이사항</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>포인트</th>
				<th>R&P</th>
			</tr>
			
			<!-- 호텔 - 결제내역 출력 할 부분 -->
			<c:choose>
				<c:when test="${not empty hotelPagingList}">
					<c:forEach var="hotelPaymentList" items="${hotelPagingList}">
						<tr>
							<td>${hotelPaymentList.hotelUserName}</td>
							<td>${hotelPaymentList.hotelUserPhone}</td>
							
							<fmt:parseDate var="parsedDateCheckIn" value="${hotelPaymentList.hotelCheckIn}" pattern="yyyy-MM-dd HH:mm"></fmt:parseDate>
							<fmt:formatDate var="newFormattedDateCheckIn" value="${parsedDateCheckIn}" pattern="yyyy-MM-dd HH:mm"/> 
							<td>${newFormattedDateCheckIn}</td>

							<fmt:parseDate var="parsedDateCheckOut" value="${hotelPaymentList.hotelCheckOut}" pattern="yyyy-MM-dd HH:mm"></fmt:parseDate>
							<fmt:formatDate var="newFormattedDateCheckOut" value="${parsedDateCheckOut}" pattern="yyyy-MM-dd HH:mm"/> 
							<td>${newFormattedDateCheckOut}</td>
							
							<td>${hotelPaymentList.hotelAnimalKind}</td>
							<td style="overflow: hidden;
							text-overflow: ellipsis; 
							white-space: nowrap;">${hotelPaymentList.hotelSpecialNote}</td>
							<td>${hotelPaymentList.hotelPayment}</td>
							<!-- 추가 -->
							<fmt:formatNumber var="hotelReservePrice" value="${hotelPaymentList.hotelReservePrice}"/> 	
							<td>${hotelReservePrice}원</td>
							<fmt:formatNumber var="hotelPayment_point" value="${hotelPaymentList.hotelReservePrice * 0.05}"/> 	
							<td>${hotelPayment_point}점</td>
							<td>
							<button class="btn" onclick="hotelReview('${hotelPaymentList.hotelCode}', '${hotelPaymentList.kind}', ${hotelPaymentList.hotelReserveNum})">리뷰</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr style="height: 100px">
						<td colspan="10">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
				
		<!-- 페이징 처리 -->
		<c:if test="${hotelPaging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${hotelPaging.page > 1}"><a href="paymentPagingList?hotelPage=${hotelPaging.page-1}">[이전]</a>&nbsp;</c:if>
			
		${hotelPaging.page}&nbsp;	
		
		<c:if test="${hotelPaging.page >= hotelPaging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${hotelPaging.page < hotelPaging.maxPage}"><a href="paymentPagingList?hotelPage=${hotelPaging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</fieldset>
	</div>
	
	<!-- 병원 -->
	<div id="medicalForm">
	<fieldset>
		<legend>[MEDICAL]</legend>
		<table border="1" style="width: 1250px">
			<tr>
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>동물 종류</th>
				<th>동물 나이</th>
				<th>특이사항</th>
				<th>진료의사</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>포인트</th>
				<th>R&P</th>
			</tr>
			
			<!-- 병원 - 결제내역 출력 할 부분 -->
			<c:choose>
				<c:when test="${not empty medicalPagingList}">
					<c:forEach var="medicalPaymentList" items="${medicalPagingList}">
						<tr>
							<fmt:parseDate var="medicalReserveDate" value="${medicalPaymentList.medicalReserveDate}" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate var="newFormattedDate" value="${medicalReserveDate}" pattern="yyyy-MM-dd"/> 
							<td>${newFormattedDate}</td>
					
							<td>${medicalPaymentList.medicalReserveTime}</td>
							
							<td>${medicalPaymentList.medicalReserveAnimalKind}</td>
							<td>${medicalPaymentList.medicalReserveAnimalAge}</td>
							<td style="overflow: hidden;
							text-overflow: ellipsis; 
							white-space: nowrap;">${medicalPaymentList.medicalReserveAnimalNote}</td>
							<td>${medicalPaymentList.medicalReserveDoctor}</td>
							<td>${medicalPaymentList.medicalReservePayment}</td>
							<fmt:formatNumber var="medicalReservePrice" value="${medicalPaymentList.medicalReservePrice}"/> 	
							<td>${medicalReservePrice}원</td>
							<fmt:formatNumber var="medicalPayment_point" value="${medicalPaymentList.medicalReservePrice * 0.05}"/> 	
							<td>${medicalPayment_point}점</td>
							<td>
							<button class="btn" onclick="medicalReview('${medicalPaymentList.medicalReserveDoctor}', '${medicalPaymentList.kind}', ${medicalPaymentList.medicalReserveNum})">리뷰</button></td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr style="height: 100px">
						<td colspan="10">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>	
		
		<!-- 페이징 처리 -->
		<c:if test="${medicalPaging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${medicalPaging.page > 1}"><a href="paymentPagingList?medicalPage=${medicalPaging.page-1}">[이전]</a>&nbsp;</c:if>
			
		${medicalPaging.page}&nbsp;
			
		<c:if test="${medicalPaging.page >= medicalPaging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${medicalPaging.page < medicalPaging.maxPage}"><a href="paymentPagingList?medicalPage=${medicalPaging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</fieldset>
	</div>
	
	<!-- 미용 -->
	<div id="beautyForm">
	<fieldset>
		<legend>[BEAUTY]</legend>
		<table border="1" style="width: 1250px">
			<tr>
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>동물 종류</th>
				<th>동물 나이</th>
				<th>특이사항</th>
				<th>예약 디자인</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>포인트</th>
				<th>R&P</th>
			</tr>
				
			<!-- 미용 - 결제내역 출력 할 부분 -->	
			<c:choose>
				<c:when test="${not empty beautyPagingList}">
					<c:forEach var="beautyPaymentList" items="${beautyPagingList}">
						<tr>
							<fmt:parseDate var="beautyReserveDate" value="${beautyPaymentList.beautyReserveDate}" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate var="newFormattedDate" value="${beautyReserveDate}" pattern="yyyy-MM-dd"/> 
							<td>${newFormattedDate}</td>
	
							<td>${beautyPaymentList.beautyReserveTime}</td>
							
							<td>${beautyPaymentList.beautyReserveAnimalKind}</td>
							<td>${beautyPaymentList.beautyReserveAnimalAge}</td>
							<td style="overflow: hidden;
							text-overflow: ellipsis; 
							white-space: nowrap;">${beautyPaymentList.beautyReserveAnimalNote}</td>
							<td>${beautyPaymentList.beautyReserveSubject}</td>
							<td>${beautyPaymentList.beautyReservePayment}</td>
							<fmt:formatNumber var="beautyReservePrice" value="${beautyPaymentList.beautyReservePrice}"/> 	
							<td>${beautyReservePrice}원</td>
							<fmt:formatNumber var="beautyPayment_point" value="${beautyPaymentList.beautyReservePrice * 0.05}"/> 	
							<td>${beautyPayment_point}점</td>
							<td>
							<button class="btn" onclick="beautyReview('${beautyPaymentList.beautyReserveDesigner}', '${beautyPaymentList.kind}', ${beautyPaymentList.beautyReserveNum})">리뷰</button></td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr style="height: 100px">
						<td colspan="10">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
				
		<!-- 페이징 처리 -->
		<c:if test="${beautyPaging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${beautyPaging.page > 1}"><a href="paymentPagingList?beautyPage=${beautyPaging.page-1}">[이전]</a>&nbsp;</c:if>
		
		${beautyPaging.page}&nbsp;
			
		<c:if test="${beautyPaging.page >= beautyPaging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${beautyPaging.page < beautyPaging.maxPage}"><a href="paymentPagingList?beautyPage=${beautyPaging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</fieldset>
	</div>
	
	<!-- 용품 -->
	<div id="goodsForm">
	<fieldset>
		<legend>[GOODS]</legend>
		<table border="1" style="width: 1250px">
			<tr>
				<th>번호</th>
				<th>용품 사진</th>
				<th>용품 이름</th>
				<th>용품 종류</th>
				<th>용품 갯수</th>
				<th>배송지</th>
				<th>배송현황</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>포인트</th>
				<th>R&P</th>
			</tr>
			
			<!-- 용품 - 결제내역 출력 할 부분 -->
			<c:choose>
				<c:when test="${not empty goodsPagingList}">
					<c:forEach var="goodsPaymentList" items="${goodsPagingList}">
						<tr>
							<td>${goodsPaymentList.buyGoodsNum}</td>
							<td><a href="goodsView?goodsNum=${goodsPaymentList.buyGoodsNum}">
							<img class="img" style="margin-left: 15%" src="resources/goodsFile/${goodsPaymentList.goodsImage1}"/></a></td>
							<td>${goodsPaymentList.goodsName}</td>
							<td>${goodsPaymentList.goodsCategory}</td>
							<td>${goodsPaymentList.buyCount}</td>
							<td style="width: 50px">${goodsPaymentList.buyAddress}</td>
							<td>${goodsPaymentList.buyDelevery}</td>
							<td>${goodsPaymentList.buyPayment}</td>
							<fmt:formatNumber var="buyPrice" value="${goodsPaymentList.buyPrice + 2500}"/> 	
							<td>${buyPrice}원</td>
							<fmt:formatNumber var="goodsPayment_point" value="${(goodsPaymentList.buyPrice + 2500) * 0.05}"/> 	
							<td>${goodsPayment_point}점</td>
							<td>
							<button class="btn" onclick="goodsReview('${goodsPaymentList.buyGoodsNum}', '${goodsPaymentList.kind}', ${goodsPaymentList.goodsBuyNum})">리뷰</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr style="height: 100px">
						<td colspan="11">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
				
		<!-- 페이징 처리 -->
		<c:if test="${goodsPaging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${goodsPaging.page > 1}"><a href="paymentPagingList?goodsPage=${goodsPaging.page-1}">[이전]</a>&nbsp;</c:if>
		
		${goodsPaging.page}&nbsp;
		
		<c:if test="${goodsPaging.page >= goodsPaging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${goodsPaging.page < goodsPaging.maxPage}"><a href="paymentPagingList?goodsPage=${goodsPaging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</fieldset>
	</div>
	</div>
</body>
<!-- ///////////////////////////////////////////// body ////////////////////////////////////////////// -->
</html>