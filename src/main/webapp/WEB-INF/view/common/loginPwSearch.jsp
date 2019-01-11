<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
	html, body{
		margin : 0 auto;
		padding : 0;
	}
	#popUpMain{
		width : 100%;
	}
	#mem_id{
		width : 200px;
	}
	.mem_hp{
		width : 50px;
	}
	#pwSearchBtn{
		padding : 10px 40px 10px 40px;
		background-color: #44b3ff;
		color : #fff;
		border-color: #44b3ff;
		box-shadow: 1px 1px #157cb7;
		border-radius: 10px;
		margin-left : 63px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var cnt = "${cnt}";
		if(cnt == "1"){
			window.close();
		}
		
		$("#pwSearchBtn").click(function(){
			
			var mem_id = $("#mem_id").val();
			var mem_hp1 = $("#mem_hp1").val();
			var mem_hp2 = $("#mem_hp2").val();
			var mem_hp3 = $("#mem_hp3").val();
			
			if(mem_id == '' || mem_id == null){
				alert("이메일을 입력해주세요.");
				return;
			} else if(mem_hp1 == '' || mem_hp2 == '' || mem_hp3 == ''){
				alert("연락처를 입력해주세요.");
				return;
			}
			
			$("#pwFrm").submit();
		});
	});
</script>
</head>
<body>
	<form action="/mem/pwSearch" method="post" id="pwFrm">
		<div id="popUpMain">
			<div style="width : 300px; margin:0 auto; margin-top : 35px;">
				<span>이메일</span> <input type="text" id="mem_id" name="mem_id" placeholder="test@naver.com"/>			
			</div>
			<div style="width : 300px; margin:0 auto; margin-top : 30px;">
				<span>연락처</span> <input type="text" class="mem_hp" id="mem_hp1" name="mem_hp1" placeholder="010" /> - <input type="text" id="mem_hp2" class="mem_hp" name="mem_hp2" placeholder="0000" /> - <input type="text" id="mem_hp3" class="mem_hp" name="mem_hp3" placeholder="0000"/>
			</div>
			<div style="width : 300px; margin:0 auto; margin-top : 30px;">
				<input type="button" id="pwSearchBtn" value="비밀번호 찾기" />
			</div>
		</div>
	</form>
</body>
</html>