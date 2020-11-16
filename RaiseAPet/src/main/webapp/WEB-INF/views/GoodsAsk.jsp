<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Raise A Pet</title>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js">
</script>
<style>
table,tr,td{
text-align: center; margin:0 auto; border:1px solid #D6DBDF; border-collapse:collapse; width:500px;
}

</style>
</head>
<script>
//
$(document).ready(function(){
$('#askSecret').click(function(){
	if($('input:checkbox[id="askSecret"]').is(":checked")==true){
		$("#askPw").show();
	}else{
		document.getElementById('askPw').value=0;
		$("#askPw").hide();
	}
 });
});


//문의글 작성
function goodsAsk(){
	var askContents = document.getElementById("askContents").value;
	var askSecret = '';
    var askPw = 0;
	if($('input:checkbox[id="askSecret"]').is(":checked")==true){
		askSecret = document.getElementById("askSecret").value;
		var askPw = document.getElementById("askPw").value;
	}
    if(askSecret==''){
		askSecret = "일반글";
     }
	
	$.ajax({
		type:'get',
		url: "goodsAskWrite",
		data:{
			"askContents":askContents,
			"askSecret":askSecret,
			"askPw":askPw,
			"askGoodsNum":${goodsAsk.askGoodsNum},
			"askUserId":"${sessionScope.loginUser.userId}"
			},
		dataType:"json",
		success : function(result){
			alert("문의글 작성되었습니다.");
			window.close();
			},
			error : function(){
				alert("이미 작성하였습니다.");
				window.close();
			}
		});
}
</script>
<body>
<h3 style="text-align: center; margin:0 auto;">상품문의</h3>
<img src="resources/goodsFile/${goodsAsk.goodsImage1}" width="250px" height="150px" style=" margin-left:25%"/>
<table>
<tr>
	<td>작성자</td>
	<td colspan='2'><input type="hidden" name="askUserId" value="${sessionScope.loginUser.userId}">${sessionScope.loginUser.userId}</td>
</tr>
<tr>
	<td>문의글내용</td>
	<td><textarea rows="6" cols="40" id="askContents" name="askContents" style="border:1px solid #D6DBDF;"></textarea></td>
	<td><input type="checkbox"  id="askSecret"  name="askSecret"  value="비밀글">비밀글
	</td>
</tr>
<tr>
<td>비밀번호</td>
<td colspan='3'><input style="display:none" type="password" name="askPw" id="askPw" placeholder="문의글비밀번호"></td>
</tr>
<tr>
	<td colspan='3'><input  type="button" value="입력" onclick="goodsAsk()"></td>
</tr>
</table>
</body>

</html>