<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트게임</title>
<style>
 td{
 	width:250px;
 	height:250px;
 }
</style>
</head>
<body>
<table style="width:800px; float:left">
<tr>
	<td>
	벽돌부시기<br/>
	<button onclick="location.href='stonebreakgame'"><img src="resources/eventGame/벽돌부시기.PNG" style="width:250px;"></button>
	</td>
	<td>
	총 게임<br/>
	<button onclick="location.href='gunGame'"><img src="resources/eventGame/총게임.PNG" style="width:250px;"></button>
	</td>
</tr>
<tr>
	<td>
	룰렛<br/>
	<button onclick="location.href='tetrisGame'"><img src="resources/eventGame/테트리스.PNG" style="width:250px;"></button>
	</td>
	<td>
	카드맞추기<br/>
		<button onclick="location.href='cardGame'"><img src="resources/eventGame/카드맞추기.PNG" style="width:250px;"></button>
	</td>
</tr>

		
		
</table>
	


		

</body>
</html>