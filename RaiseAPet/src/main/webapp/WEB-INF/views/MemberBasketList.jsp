<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	.img{
		height: 80px;
		width: 80px;
		margin-right: 10px;
		margin-left: 10px;
	}

	table, tr, td, th{
		border-collapse: collapse;
		margin: 0 auto;
		border-width : medium;
		border : 1px solid #474747;
		border-left: none;
		border-right: none;
		border-color: gray;
		table-layout: fixed;
		/* 
			테이블의 크기 지정 및 고정 시켜야 할 경우에 사용한다
			td에서 문자열을 자르거나 숨길 수 있다.
		 */
		border-color: gray;
	}
	
	.contents{
		padding: 0 10px 0 10px;
	}
	
	th{
		background-color: #f1d2fc;
	}
	
	td{
		height: 10px;
	}
	
	.all{
		text-align: center;
		margin : 0 auto;
		width : -33%
	}	
	
	header{
		margin-top: 2%
	}
	
	.btn{
		margin-top: 5px;
		margin-bottom: 5px;
		font-size: 15px;
		width: 100px;
		height: 30px;
		border: none;
		background-color: #f3d4ff;
		border-radius: 12px;
	}
</style>
<!-- ///////////////////////////////////////////// CSS ////////////////////////////////////////////// -->
<script type="text/javaScript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<!-- 장바구니 개별 삭제 -->
<script>
	function basketDelete(goodsNum, page){
		
		$.ajax({
			type : "GET",
			url : "basketDelete",
			data : {"goodsNum" : goodsNum},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					location.href="basketPagingList?page="+page;
				}
			}, 

			// 실패 시
			error : function(){
				alert("장바구니 삭제 함수 통신 실패");
				}
			}); // end Ajax
	}
</script>

<!-- 장바구니 선택 삭제 -->
<script>
	function itemDelete(page){

		var count = $(".chkbox").length;
		var countLength = 0;

		for(var i = 0; i < count; i++){
			
			if($(".chkbox")[i].checked == true){
				countLength++;
			}
		}

		if(countLength == 0){ // check가 안되어 있을 경우
			alert("상품을 선택 하신 후 다시 시도 해주세요.")
		}else{ // check가 되어 있을 경우
			for(var i = 0; i < count; i++){
	
				if($(".chkbox")[i].checked == true){
					var result = $(".chBox")[i].value;
	
					$.ajax({
						type : "GET", // GET 방식으로
						url : "itemDelete",
						data : {"result" : result},
	
						// 성공 시
						success : function(data){
							if(data=="OK"){
								location.href="basketPagingList?page="+page;
							} else{
				
								}
							}, 
	
						// 실패 시
						error : function(){
							alert("장바구니 선택 삭제 함수 통신 실패");
							}
						}); // end Ajax
				}
			}
		}
	}
</script>

<!-- 장바구니 금액 총 합계 -->
<script>
	function itemSum(){

		var sum = 0;
		var count1 = 0;
		var count = $(".chkbox").length;
		
		for(var i = 0; i < count; i++){

			var result = $(".chkbox")[i].value.split(",");
			
			if($(".chkbox")[i].checked == true){
				
				sum += parseInt(result[0]);
				count1 += parseInt(result[1]);
			}
		}
		
		document.getElementById("totalSumResult").value = sum; // 총합
		document.getElementById("totalCountResult").value = count1; // 총갯수
		$("#total_sum").html("총합  : " + sum + "원");
		$("#total_count").html("총갯수  : " + count1 + "개");

	}
</script>

<!-- 장바구니 수량 변경 시 실행 되는 ajax -->
<script>
	function cartCountChange(goodsNum, page){
		
		// cartCount 뒤에 goodNum(PK)의 번호를 붙인다.
		var basketCount = document.getElementById("cartCount"+goodsNum).value;
		
		$.ajax({
			type : "GET",
			url : "cartCountChange",
			data : {"basketCount" : basketCount, "goodsNum" : goodsNum},

			// 성공 시
			success : function(data){
				if(data=="OK"){
					cartSumChange(page);
				}else{
					
				}
			}, 

			// 실패 시
			error : function(){
				alert("장바구니 수량 변경 함수 통신 실패");
				}
			}); // end Ajax
	}

	// 장바구니 내역 재조회
	function cartSumChange(page){
		location.href="basketPagingList?page="+page;
	}
</script>

<!-- 장바구니 수량 정규식 검사 -->
<script>
   function countCheck(goodsNum){

      var count = document.getElementById("cart"+goodsNum).value;

      if(count < 0){
         alert("0 이상부터 가능합니다.");
         $("input[name=cartCheck"+goodsNum+"]").val(0);
         $("input[name=cartCheck"+goodsNum+"]").focus();
      }
   }
</script>

<!-- 상품 개별 결제 -->
<script>
	function kakaoPay(goodsNum, goodsPrice, basketGoodsCount){

		var check = basketGoodsCount > 0;

		// 갯수가 0개 이하면 결제 페이지로 넘어가지 못함.
		if(check == true){
			location.href="basketGoodsBuy?goodsNum="+goodsNum+"&&goodsPrice="+goodsPrice+"&&basketGoodsCount="+basketGoodsCount;
		}else{
			alert("0개 이상부터 결제 가능합니다.");
		}
	}
</script>

<!-- 장바구니 선택 결제 -->
<script>
	function itemPay(){

		var count = $(".chkbox").length;
		var arr = new Array;
		var countLength = 0;

		for(var i = 0; i < count; i++){
			
			if($(".chkbox")[i].checked == true){
				countLength++;
			}
		}

		if(countLength == 0){ // check가 안되어 있을 경우
			alert("상품을 선택 하신 후 다시 시도 해주세요.");
		}else{ // check가 되어 있을 경우
			for(var i = 0; i < count; i++){
	
				if($(".chkbox")[i].checked == true){
					var result = $(".chBox")[i].value;
	
					arr[i] = result;
					// 배열에 goodsNum을 담는다.
					// 배열 길이
				}
			}
	
			var arrLength = arr.length
			var totalSum = document.getElementById("totalSumResult").value;
			// 총합
			var totalCount = document.getElementById("totalCountResult").value;
			// 총갯수
	
			location.href="itemSum?arr="+arr+"&&arrLength="+arrLength+"&&totalSum="+totalSum+"&&totalCount="+totalCount;
		}
	}
</script>
<!-- ///////////////////////////////////////////// script ////////////////////////////////////////////// -->
</head>
<header>
	<div style="height:100%;  width:14%; margin:0 auto;">
		<a class="logo" style=" height: 100%; padding:0;">
			<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 110px;">
		</a>
	</div>		
</header>
<body>
	<div class="all">
		<table border="1" style="width: 700px">
			<tr>
				<th colspan="1">모두 선택<input type="checkbox" name="allCheck" id="allCheck">
					<!-- 장바구니 모두 선택 스크립트 -->
					<script>
						$("#allCheck").click(function(){
							var chk = $("#allCheck").prop("checked");
							if(chk){
								$(".chkbox").prop("checked", true);
								itemSum();
							}else{
								$(".chkbox").prop("checked", false);
								itemSum();
							}
						})			
					</script>
				</th>
				
				<th colspan="6">
					Raise A Pet
				</th>
			</tr>
			
			<!-- 용품 - 장바구니 내역 출력 부분 -->
			<c:choose>
				<c:when test="${not empty basketPagingList}">
					<c:forEach var="memberBasketList" items="${basketPagingList}">
						<tr>
							<!-- 체크박스 -->
							<td class="product-close">
								<input type="checkbox" onclick="itemSum()" class="chkbox" id="basketCheckBox" name="basketCheckBox" 
								value="${memberBasketList.goodsPrice * memberBasketList.basketGoodsCount},${memberBasketList.basketGoodsCount}">
								<!-- 상품 번호 -->
								<input type="hidden" class="chBox" id="goodsNum" value="${memberBasketList.goodsNum}"> <!-- 장바구니 선택 삭제, 결제 -->
								<input type="hidden" class="kakaoCount" value="${memberBasketList.basketGoodsCount}">
							</td>

							<!-- 상품 사진 -->
							<td>
								<input type="hidden" id="userId" value="${loginUser.userId}">
								<a href="goodsView?goodsNum=${memberBasketList.goodsNum}">
								<img class="img" src="resources/goodsFile/${memberBasketList.goodsImage1}"/></a>	
							</td>
							<!-- 상품 이름 -->
							<td class="contents">${memberBasketList.goodsName}</td>
							<!-- 상품 종류 -->
							<td>${memberBasketList.goodsCategory}</td>
							<!-- 수량 -->
							<td>
								<input style="width: 35px" type="number" min="0" placeholder="수량" id="cartCount${memberBasketList.goodsNum}" 
								name="cartCheck${memberBasketList.goodsNum}" onchange="countCheck(${memberBasketList.goodsNum})" onblur="cartCountChange(${memberBasketList.goodsNum}, ${paging.page})" value="${memberBasketList.basketGoodsCount}">
								개
							</td>
							<!-- 가격 -->
							<fmt:formatNumber var="goodsPrice" value="${memberBasketList.goodsPrice}"/> 	
							<td>${goodsPrice}원</td>
							<!-- 총합 -->
							<td>${memberBasketList.goodsPrice * memberBasketList.basketGoodsCount}원</td>
						</tr>				
		
					</c:forEach>
					
					<!-- 선택 삭제, 선택 결제 -->
					<tr>
						<td colspan="7">
							<input class="btn" type="button" onclick="itemDelete(${paging.page})" value="삭제">&nbsp;
							
							<input class="btn" type="button" onclick="itemPay()" value="결제">
							<input type="hidden" id="totalSumResult" value="0">
							<input type="hidden" id="totalCountResult" value="0">
						</td>
					</tr>
					
					<!-- 체크박스를 하나라도 풀면 전체 선택 체크박스를 푸는 스크립트 -->
					<!-- forEach문 밑에 써줘야 한다. -->
					<script>
						$(".chkbox").click(function(){
							$("#allCheck").prop("checked", false);
						});
					</script>
				</c:when>
				
				<c:otherwise>
					<tr>	
						<td style="height: 100px" colspan="7">기록이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			<tr>
				<td colspan="7">
					<p id="total_count">총갯수 : 0개</p><p id="total_sum">총합 : 0원</p>
				</td>
			</tr>
		</table>
		
		<!-- 페이징 처리 -->
		<c:if test="${paging.page <= 1}">[이전]&nbsp;</c:if>
		<c:if test="${paging.page > 1}"><a href="basketPagingList?page=${paging.page-1}">[이전]</a>&nbsp;</c:if>
		
		${paging.page}&nbsp;
		
		<c:if test="${paging.page >= paging.maxPage}">[다음]&nbsp;</c:if>
		<c:if test="${paging.page < paging.maxPage}"><a href="basketPagingList?page=${paging.page+1}">[다음]</a>&nbsp;</c:if>
		<!-- 페이징 처리 -->
	</div>
</body>
<!-- ///////////////////////////////////////////// body ////////////////////////////////////////////// -->
</html>