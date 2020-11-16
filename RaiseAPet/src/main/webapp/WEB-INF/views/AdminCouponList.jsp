<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 리스트</title>
</head>
<body>
	<table>
		<tr>
			<th>쿠폰 이름</th>
			<td><input type="text" name="couponName" /></td>
		</tr>
		<tr>
			<th>유효기간</th>
			<td><input type="date" name="couponDate" /></td>
		</tr>
		<tr>
			<th>쿠폰 내용</th>
			<td><textarea name="couponContents"></textarea></td>
		</tr>
		<tr>
			<th>할인율</th>
			<td><input type="text" name="couponSale" />%</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="작성" /></td>
		</tr>
	</table>
</body>
</html>