<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
<table>
   <tr>
     <td><img border="0" src="http://www.blueb.co.kr/SRC/javascript/image/roulette.jpg" width="152" height="216"></td>
     <td>
        <form name="fire">
         	총알에 갯수을 입력하세요.. (1-6): <input name="bullets" type="text" size=3 ><br>
         	<input name="message" type="button" value="방아쇠를 당깁니다.." onclick="fireit()">
        </form>     
     </td>
    </tr>
</table>
<script>
	//총게임
      function fireit(){
          var theone = Math.floor(Math.random()*6);
      
          if (theone == document.fire.bullets.value){
        	  document.fire.message.value="어휴!! 운이 좋군...";
          	  pointPayment();
          }else{
              alert("탕~~~! 당신은 죽었습니다..고인의 명복을...");
              location.href="eventGame";            
          }
      }
		//포인트 지급
      function pointPayment(){
    		$.ajax({
    			type:"GET",
    			url:"pointPayment",
    			data:{
    				"userId" : "${sessionScope.loginUser.userId}"
    				},
    			dataType:"json",
    			success:function(result){
    				alert(result.userId+"님께 100포인트 지급되었습니다.");
    				 location.href="eventGame";
    				},
    			error:function(){
    				alert("이미 지급된 포인트입니다.");
    				 location.href="eventGame";
    				}
    			});
    	}
      </script>
</body>
</html>