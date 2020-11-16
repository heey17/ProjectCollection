<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    table,
    td {
      border: 1px solid gray;
    }

    table {
      border-collapse: collapse;
      border-spacing: 0;
      margin: 100px auto;
    }
  </style>
  <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
</head>
<body>
 	<div id="Life"></div>
 <table>
    <tr id="board"></tr>
  </table>

 <script>
    var model = [
      "pic00.png", "pic00.png",
      "pic01.png", "pic01.png",
      "pic02.png", "pic02.png",
      "pic03.png", "pic03.png",
      "pic04.png", "pic04.png",
      "pic05.png", "pic05.png",
    ];
    
    window.addEventListener("load", function () {
        
	  //목숨 보여주기
	  var lifeCount = 3; 
	  var output = "<span>Life:"+lifeCount+"</span>";
      $('#Life').html(output);
      
      //모델 섞기
      for (var a = 0; a < 10000; a++) {
        var ran = Math.floor(Math.random() * 12);  //카드 갯수만큼 곱한다.
        var tmp = model[0];
        model[0] = model[ran];
        model[ran] = tmp;
      }
      //모델을 화면에 뿌린다
      var board = document.querySelector("#board");
      for (var b = 0; b < model.length; b++) {
        board.innerHTML += "<td><input class='pic' type='image' src='http://malonmiming.dothome.co.kr/wp-content/uploads/2020/02/" + model[b] + "' value='" + model[b] + "'></td>";
      }

      var pic = document.querySelectorAll(".pic");
      //이미지의 투명도가 1초후에 0이 된다.
      setTimeout(function () {
        for (var c = 0; c < pic.length; c++) {
          pic[c].style = "opacity:0.01";
        }
      }, 2000);

      var count = 0;
      var success = 0;    // success == model.length/2
      //이미지 클릭에 반응하도록
      for (var d = 0; d < pic.length; d++) {
        var onePic = null;
        var twoPic = null;
        pic[d].addEventListener("click", function () { //하나의 객체에 여러개 이벤트 쓸때 
          console.log(this.value);
          this.style = "opacity:1";
          //첫번째 이미지인지, 두번째 이미지인지 확인
          count++;
          console.log(count);
          if (1 == count) {
            //첫번째 데이터 저장
            onePic = this;
          } else if (2 == count) {
            twoPic = this;
            //게임 진행
            if (onePic.value == twoPic.value) {
              // success값 1 증가
              success++;
              if (success == model.length / 2) {
            	pointPayment();
                alert("성공!");
              }
              // onePic, twoPic의 클릭이벤트 종료
              event.stopPropagation();
              event.preventDefault();
              /* onePic.disabled = true;
              twoPic.disabled = true; */

            } else {
              //오답일 경우 0.3초 뒤에 사진 투명해짐
              setTimeout(function () {
                onePic.style = "opacity:0.01";
                twoPic.style = "opacity:0.01";
              }, 300);
              	lifeCount--;
              	output = "<span>Life:"+lifeCount+"</span>";
                $('#Life').html(output);
      			if(lifeCount == 0){
      			alert("다음기회에!");
      			location.href="eventGame";
      			}	
            }
            count = 0;
          } else {
            alert("버그!");
          }
        });
      }

    });


   
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