<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<head>
<style type="text/css">

	#main{
		width: 450px;
	    margin: 0 auto;
	}
	
	.ordsBtn{
		float: left;
		width: 55px;
	}
	
	#ords{
		margin-top: 10px;
	}
	
	.ords1{
		margin: 0 auto;
	    text-align: center;
	    background-color: #f1f1f1;
	    height: 20px;
	    width: 378px;
	}
	
	.ords2{
		margin: 0 auto;
		text-align: center;
	}
	
	.btn1{
		margin: 0 auto;
	    height: 30px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var cnt = '${cnt}';
		
		if(cnt == '1'){
			window.close();
		}
		
		$("#cancle").click(function() {
			window.close();
		})
		
		$("#ords_btn").click(function() {
			$("#ords").submit();
		})
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="main">
		<div class="ords1">
			<span>${btnVal } 사유</span>
		</div>
		<form action="/shop/reason" method="post" id="ords"> 
			<input type="hidden" value="${ords_id }" name="ords_id">
			<input type="hidden" value="${btnVal }" name="btnVal">
			
			<div class="ords2">
				<textarea rows="5" cols="50" name="ords_rea"></textarea>
			</div>
		</form>
		<div class="btn1">
			<div class="ordsBtn">
				<input type="button" value="${btnVal }" id="ords_btn">
			</div>
			<div class="ordsBtn">
				<input type="button" value="취소" id="cancle">
			</div>
		</div>
	</div>
</body>
</html>