<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 답변 폼</title>
</head>
<style>
	table{
    	margin:0 auto; 
    	width:100%;
    }
    th{
    	width:50%;
    	 text-align:center;
    }
    th, td{
    	border-bottom: 1px solid #ddd;
    	height : 40px;
    	
		
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<body style="background-color: #eeeeee;">
<table>
	<tr>
		<th>문의 글 번호</th><td>${goods.askNum }</td>
	</tr>
	<tr>
		<th>문의자</th><td>${goods.askUserId }</td>
	</tr>
	<tr>
		<th>답변내용</th><td><textarea id="askAnswer" rows="10" cols="40"></textarea></td>
	</tr>
	<tr><td colspan="2"><button onclick="cancel()">취소</button><button onclick="answerSubmit(${goods.askNum})">작성</button></td></tr>
</table> 
</body>
<script>
	function answerSubmit(askNum){
		var askAnswer = $('#askAnswer').val();
		$.ajax({
			type : "POST",
			url : "adminAskAnswer",
			data : {
					"askNum" : askNum,
					"askAnswer" : askAnswer
					},
			dataType : "json",
			success : function(result) {
				if(result==1){
					alert('답변 작성이 완료 되었습니다.');
				} else {
					alert('답변 작성이 실패하였습니다.')
				}
				window.close();
			},
			error : function() {
				alert('컨트롤러 확인 요망');
			}
		});
	}
	function cancel(){
		window.close();
	}
</script>
</html>