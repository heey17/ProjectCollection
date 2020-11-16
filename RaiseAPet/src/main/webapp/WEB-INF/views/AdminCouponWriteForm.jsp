<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 작성 폼</title>
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
	<form action="couponWrite" method="POST">
		<table>
			<tr>
				<th>쿠폰 이름</th><td><input type="text" name="couponName" /></td>
			</tr>
			<tr>
				<th>유효기간</th><td><input type="date" name="couponDate" /></td>
			</tr>
			<tr>
				<th>쿠폰 내용</th><td><textarea name="couponContents"></textarea></td>
			</tr>
			<tr>
				<th>할인율</th><td><input type="text" name="couponSale"/>%</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성"/></td>
			</tr>			
		</table>
	</form>
</body>
</html>