<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공 페이지</title>
<style>	
	.all{
		text-align : center;
		margin : 18% 12% 0% 12.5%; /* 밖 */
		padding-top : 2%; /* 안 */
		padding-left : 2%;
		padding-right : 2%;
		padding-bottom : 2%; 
		border: 1px solid #c886d1;
		font-size: 25px;
		border-width: 300; /* border 굵기 */
	}
</style>
</head>
<!-- 타이머 설정 -->
<script>
	var x = 5;
	var msg = document.getElementById("count");

    setInterval(function(){
        x--;
        msg.innerHTML = x;
    }, 1000);
    
    setTimeout(function(){
        window.close();
    }, 3000)
</script>
<body>
	<div class="all">
	
		<div style="height:100%;  width:26%; margin:0 auto;">
			<a class="logo" style=" height: 100%; padding:0;">
				<img src="resources/images/logo.png" alt="Logo Image" style="float:center; height : 80px;">
			</a>
		</div>	
		<small><span id="count">3초 후 페이지가 종료 됩니다.</span></small><br>
		결제 성공<br>
		마이페이지 - 결제내역에서 확인 가능합니다.<br>
		이용 해주셔서 감사합니다.<br>
	</div>
</body>
</html>