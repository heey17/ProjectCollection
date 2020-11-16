<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Raise A Pet</title>
<style>
	th{
		background: #DDC3F7;
	}
	td{
		font-family: monospace;
	}
	table {
    width: 100%;
    border-top: 1px solid #D6DBDF;
    border-collapse: collapse;
    width:100%; height:100%;
    text-align: center;
    margin-left: -5px;
  	}
  	
 	th, td {
    border-bottom: 1px solid #D6DBDF;
    padding: 10px;
 	text-align: center;
  	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
//달력
$(document).ready(function () {
	   $.datepicker.setDefaults($.datepicker.regional['ko']); 
	   $( "#startDate" ).datepicker({
	       changeMonth: true, 
	       changeYear: true,
	       nextText: '다음 달',
	       prevText: '이전 달', 
	       dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	       dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	       monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	       dateFormat: "yymmdd",
	       maxDate: "+1M",        // 선택할수있는 최대날짜
	       minDate: 1,             //선택할수있는 최소 날짜 ( 0 : 오늘 이후 날짜 선택 불가)
	       onClose: function(selectedDate) { 
	         //달력이 선택 되었으면 날짜조회(ajax)  
	          medicalReserveDate(selectedDate);
	          //날짜 조회 성공하면 예약 날짜가 가능한 날짜만 보여지게 됌
	             var output = "";
	             output += "<th>예약시간</th>";
	            output += "<td><input type='radio' id='medicalReserveTime1' name='medicalReserveTime' value='1타임'/>1타임(AM9:00  ~ AM10:30)<br/>";
	            output += "<input type='radio' id='medicalReserveTime2' name='medicalReserveTime' value='2타임'/>2타임(AM11:00 ~ PM12:30)<br/>";
	            output += "<input type='radio' id='medicalReserveTime3' name='medicalReserveTime' value='3타임'/>3타임(PM2:00  ~ PM3:30 )<br/>";
	            output += "<input type='radio' id='medicalReserveTime4' name='medicalReserveTime' value='4타임'/>4타임(PM4:00  ~ PM5:30 )</td>";
	            $("#medicalReserveTimes").html(output);
	       }
	   });

	});

//날짜조회(ajax)
function medicalReserveDate(selectedDate){
//해당 날짜에 예약된 날짜 조회
	$.ajax({
	type:"get",
	url:"medicalReserveResult",
	data:{"medicalReserveDate":selectedDate},
	dateType:"json",
	success:function(result){	
		 //날짜 조회 성공하면 예약 날짜가 가능한 날짜만 보여지게 됌
			for(var i in result){
				for(var j = 1; j<=4; j++ ){
					if(result[i].medicalReserveTime == j+"타임"){
						$("#medicalReserveTime"+j).hide();
					}
				}						
			}
	},
	error:function(){
			alert("날짜 조회 실패");
	}
	});
}



//온라인 결제를 누르면 쿠폰,포인트 사용 여부확인
$(document).ready(function(){
$("input:radio[name=medicalReservePayment]:radio[value=온라인결제]").click(function(){
	var output = "";
	output += "<th>쿠폰,포인트여부</th>"
	output += "<td>포인트사용하기<input type='radio' name='PointCoupon' value='포인트사용하기' onclick='Point22()'>";
	output += "쿠폰사용하기<input type='radio' name='PointCoupon' value='쿠폰사용하기' onclick='Coupon22()'></td>";
    $('#medicalReservePointCoupon').html(output);
});
});

//현장결제를 눌렸을때
$(document).ready(function(){
	$("input:radio[name=medicalReservePayment]:radio[value=현장결제]").click(function(){
		//현재 가격
		var medicalReservePrice = document.getElementById('price').value;
		var data="";
		data += "";
		document.getElementById('medicalReservePrice').value = medicalReservePrice;
		document.getElementById("medicalReservePrice1").innerHTML = medicalReservePrice+"원";
		$('#medicalReservePointCoupon').html(data);	
		$('#medicalReservePointCouponForm').html(data);	
	});
});

//포인트 폼
function Point22(){
		var data="";
    	data += "<th>포인트적용</th>";
    	data +="<input type='hidden' name='userId' value='${sessionScope.loginUser.userId}'>";
		data +="<td><small>잔여포인트:<a onclick='all_point()' id='point'>"+${sessionScope.loginUser.userPoint}+"</a></small><br/>";
		data +="<input type='text' id='medicalReservePointUseing' name='userPoint' value='0'><a onclick='usePoint()'>사용</a></td>";
		$('#medicalReservePointCouponForm').html(data);			
}	

//쿠폰사용
function Coupon22(){
		//쿠폰조회
		$.ajax({
			 type:"GET",
			 url:"medicalReserveCouponList",
		     data:{"userId":"${sessionScope.loginUser.userId}"},
			 dataType:"json",
			 success:function(result){
				 medicalReserveCouponList(result);
		  	  },
		     error:function(){
				alert("쿠폰조회 실패");
			  }
		});
}
//쿠폰 폼
function medicalReserveCouponList(result){
	
	var output ="";
	output +="<th>쿠폰적용</th><td>";
	if(result.couponCode != null){
	for(var i in result){
		output += "<input type='hidden' id='CouponSale"+i+"' name='CouponSale' value='"+result[i].couponSale+"'>";
		output += result[i].couponName+"<input type='radio'  name='couponCode' value='"+result[i].couponCode+"' onclick='couponUse("+i+")'>&nbsp";
		console.log(i);
	}
	output +="</td>";
	}else{
		output +="쿠폰이 없습니다.</td>";
	}
    $('#medicalReservePointCouponForm').html(output);
}

//쿠폰 적용시키기
function couponUse(j){
	
	//사용할려는 포인트
	var CouponSale = (100-document.getElementById('CouponSale'+j).value)/100;
	//현재 가격
	var price = document.getElementById('price').value;
	//가격 변동
	var medicalReservePrice = price*CouponSale;

	//적용시킨 값으로 띄워주기
    document.getElementById('medicalReservePrice').value = medicalReservePrice;
	document.getElementById("medicalReservePrice1").innerHTML = medicalReservePrice+"원";
	$("#medicalReservePointCoupon").hide();
}
	
//전액 포인트 사용
function all_point(){
	var userPoint = ${sessionScope.loginUser.userPoint};
	 document.getElementById('medicalReservePointUseing').value = userPoint;
	 document.getElementById("medicalReservePointUseing").innerHTML =  userPoint;
}

//포인트 적용
function usePoint(){
	//현재 포인트
	var Point = ${sessionScope.loginUser.userPoint};
	//사용할려는 포인트
	var medicalReservePointUseing = document.getElementById('medicalReservePointUseing').value;
	//포인트 변동
	var userPoint = Point-medicalReservePointUseing;
	
	//현재 가격
	var price = document.getElementById('price').value;
	
	//가격 변동
	var medicalReservePrice = price-medicalReservePointUseing;

	//사용할려는 포인트가 현재포인트보다 높을때 포인트 초과창을 띄우게 되고 아니면 총가격에서 사용할려는 포인트를 빼준다.
	if(Point >= medicalReservePointUseing & price >= medicalReservePointUseing & medicalReservePointUseing >= 0 & medicalReservePointUseing < price*0.07){
		document.getElementById('point').value = userPoint;
		document.getElementById("point").innerHTML = userPoint;
		
		document.getElementById('medicalReservePrice').value = medicalReservePrice;
		document.getElementById("medicalReservePrice1").innerHTML = medicalReservePrice+"원";
		$("#medicalReservePointCoupon").hide();
	}else{
		alert('포인트가 사용할수 없습니다.');
		document.getElementById('medicalReservePointUseing').value = 0;
		document.getElementById("medicalReservePointUseing").innerHTML = 0;
	}
    
}
</script>


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
</head>
<body>
<header>
   <div style="height:100%;  width:11.8%;">
      <a class="logo" style=" height: 100%; padding:0;">
         <img src="resources/images/logo.png" alt="Logo Image" style="margin-left:175px; height : 110px;">
      </a>
   </div>      
</header>
	<form action="medicalReservationForm" method="POST">
      <table border='1'>
         <tr>
            <th>예약날짜</th>
            <td><input type="text" id="startDate" name="medicalReserveDate"></td>
         </tr>
         <tr id="medicalReserveTimes">            
         </tr>
         <tr>
            <th>동물종류</th>
            <td><input type='radio'  name='medicalReserveAnimalKind' value='dog'/> Dog
               <input type='radio'  name='medicalReserveAnimalKind' value='cat'/>Cat
            </td>
         </tr>
         <tr>
            <th>동물 나이</th>
            <td><select name="medicalReserveAnimalAge">
            <option value="">나이를 선택해주세요</option>
            <option value="1">1살</option>
            <option value="2">2살</option>
            <option value="3">3살</option>
            <option value="4">4살</option>
            <option value="5">5살</option>
            <option value="6">6살</option>
            <option value="7">7살</option>
            <option value="8">8살~</option>
            </select></td>
         </tr>
         <tr>
            <th>특이사항</th>
            <td><textarea rows="5" cols="40" name="medicalReserveAnimalNote"></textarea></td>
         </tr>
         <tr>
            <th>증상</th>
            <td><textarea rows="5" cols="40" name='medicalReserveSubject' placeholder='자세하게 적어주세요'></textarea></td>
            </tr>
         <tr>
            <th>닥터</th>
            <td><input type ="hidden" name ="medicalReserveDoctor" value="${doctor.doctorCode}">${doctor.doctorName}</td>
         </tr>
         <tr>
            <th>회원 아이디</th>
            <td><input type ="hidden"  name ="medicalReserveUserId" value="${sessionScope.loginUser.userId}">${sessionScope.loginUser.userId}</td>
         </tr>         
         <tr>
            <th>결제방식</th>
            <td>온라인결제 : <input type="radio" id="medicalReservePayment" name="medicalReservePayment" value ="온라인결제">
             현장결제 : <input type="radio" name="medicalReservePayment" value ="현장결제"></td>
         </tr>
         <!--포인트 쿠폰 선택 여부 -->
         <tr id="medicalReservePointCoupon">
         </tr>
         <!--쿠폰,포인트-->
         <tr id="medicalReservePointCouponForm">
         </tr>
         <tr>
            <th>가격</th>
            <td><input type="hidden"  id="price" value="25000">
               <input type="hidden"  id="medicalReservePrice" name="medicalReservePrice" value="25000">
               <div id='medicalReservePrice1'>25000원</div>
            </td>
         </tr>
         <tr>
            <td colspan='2'><input type="submit" value="예약"></td>
         </tr>
      </table>
   </form>
</body>
</html>