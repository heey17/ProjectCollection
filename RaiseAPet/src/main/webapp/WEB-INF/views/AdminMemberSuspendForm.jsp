<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정지 선택</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function suspendSubmit(reviewUserId, reviewNum, reportUserId){
	var suspendDeadLine = $('#suspendDeadLine').val();
	
	$.ajax({
		type:"POST",
		url:"adminMemberSuspend",
		data:{
				"reviewUserId" : reviewUserId,
				"reviewNum" : reviewNum,
				"suspendDeadLine" : suspendDeadLine,
				"reportUserId" : reportUserId
				},
		dataType:"json",
		success : function(result){
					if(result>=1){
						alert('회원이 정지 되었습니다.');
						window.close();
					} else {
						alert('이미 정지된 회원입니다.');
						window.close();
					}
				},
		error : function(){
					alert('회원 정지에 실패하였습니다.');
				}
	});
};
</script>
<style>
	table{
    	margin:10% auto; 
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
			<td style="width:40%;">리뷰 작성자</td><td>${report.reviewUserId}</td>
			<td rowspan="3" style="text-align:center;">
				<select id="suspendDeadLine">
					<option value="1">1일</option>
					<option value="3">3일</option>
					<option value="5">5일</option>
					<option value="7">7일</option>
					<option value="10">10일</option>
					<option value="15">15일</option>
					<option value="30">30일</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>리뷰 신고 사유</td><td>${report.reportKind }</td>
		</tr>
		<tr>
			<td>신고자</td><td>${report.reportUserId}</td>
		</tr>
		
		<tr>
			<td colspan="3"><button onclick="suspendSubmit('${report.reviewUserId}',${report.reviewNum },'${report.reportUserId}')">정지</button></td>
		</tr>
	</table>
</body>
</html>