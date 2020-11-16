<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    margin-left: -5px;
  	}
  	
 	th, td {
    border-bottom: 1px solid #D6DBDF;
    padding: 10px;
 
  	}
</style>
<script>
//로그인 후 이용
function LoginForm(){
	alert("로그인 해주세요");
}
</script>
</head>
<body>

<header>
   <div style="height:100%;  width:11.8%;">
      <a class="logo" style=" height: 100%; padding:0;">
         <img src="resources/images/logo.png" alt="Logo Image" style="margin-left:175px; height : 110px;">
      </a>
   </div>      
</header>

<input type='hidden' name='doctorCode' value='${doctor.doctorCode}'>
<table>
<tr><th>이름</th><td>${doctor.doctorName}</td></tr>
<tr><th>휴무일</th><td>${doctor.doctorOff}</td></tr>
<tr><th>전문분야</th><td>${doctor.doctorSubject}</td></tr>
<tr><th>경력</th><td>${doctor.doctorCareer}</td></tr>
</table>

<c:choose>
   	
   	<c:when test="${not empty sessionScope.loginUser.userId}">
       <button style="border: 1px solid #DDC3F7; margin:2% 40%;"  onclick="location.href='medicalReservation?doctorCode=${doctor.doctorCode}'">예약하기</button>  	
   	</c:when>
   	
   	<c:otherwise>
       <button style="color:#DDC3F7" onclick="LoginForm()">예약하기</button>
   	</c:otherwise>
   	
</c:choose>
</body>
</html>