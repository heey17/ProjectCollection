<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 보기</title>
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

<body style="background-color:#eeeeee;">
<table>
	<tr>
		<th>아이디</th><td>${memberView.userId }</td>
	</tr>
	<tr>
		<th>이름</th><td>${memberView.userName }</td>
	</tr>
	<tr>
		<th>사진</th><td><img src="resources/memberFile/${memberView.userImage }"/></td>
	</tr>
	<tr>
		<th>생일</th><td>${memberView.userBirth }</td>
	</tr>
	<tr>
		<th>주소</th><td>${memberView.userAddress }</td>
	</tr>
	<tr>
		<th>성별</th><td>${memberView.userGender }</td>
	</tr>
	<tr>
		<th>이메일 주소</th><td>${memberView.userEmail }</td>
	</tr>
	<tr>
		<th>핸드폰 번호</th><td>${memberView.userPhone }</td>
	</tr>
	<tr>
		<th>정지 기간</th><td> ~ ${memberView.userLock }</td>
	</tr>
	<tr>
		<th>정지 횟수</th><td>${memberView.userLockCount }</td>
	</tr>
	<tr>
		<th>보유 포인트</th><td>${memberView.userPoint }</td>
	</tr>
</table>

</body>
</html>