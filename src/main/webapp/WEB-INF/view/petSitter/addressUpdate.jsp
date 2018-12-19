<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addressUpdate.jsp</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="/css/commonCss.css" rel ="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
/* 	내가한거 */
	*{
		margin : 0 auto;
	}

	#updateMain{
		margin : 0 auto;
		width : 100%;
		height : 100%;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	#utitle{
		margin : 0 auto;
		width : 100%;
		height : 50px;
		text-align: center;
		line-height : 50px;
	}
	
	#utitle > span{
		font-size : 20px;
	}
	
	#uSearch{
		width : 100%;
		padding-top : 5px;
		padding-bottom : 5px;
	}
	#uSearchBtn{
		width : 100%;
	    padding: 15px 133px 15px 133px;
	    border: 1px solid #a5a5a5;
	    background-color: #fff;
	    cursor: pointer;
	    font-size: 18px;
	    letter-spacing: 5px;
	}
	
	#uAddressMain{
		width : 100%;
		margin-top : 24px;
	}
	
	#addr1{
		outline: none;
		margin-top : 5px;
		width : 100%;
		height: auto; 
		line-height: normal;
		padding: 3px;
		-webkit-appearance: none;
		border : none;
		border-bottom : 1px solid #9c9a9a;
	}
	
	#uAddressDetail{
		margin-top : 10px;
	}
	
	#addr2{
		outline: none;
		margin-top : 5px;
		width : 100%;
		height: auto; 
		line-height: normal;
		padding: 3px;
		-webkit-appearance: none;
		border : none;
		border-bottom : 1px solid #9c9a9a;
	}
	
	#uFinish{
		width : 100%;
		padding-top : 5px;
		padding-bottom : 5px;
		margin-top : 20px;
	}
	
	#uFinishBtn{
		width : 100%;
		padding: 15px 133px 15px 133px;
		border : 1px solid #17aaff;
		background-color: #17aaff;
		cursor : pointer;
		font-size : 18px;
		letter-spacing: 5px;
		color:#fff;
	}
	
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#addr1").val("${memVo.mem_addr}");
	$("#addr2").val("${memVo.mem_addr2}");
	
	// 주소 검색 버튼 클릭이벤트가 발생 했을 때 실행
	$("#uSearchBtn").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 주소 input value 설정 : data.roadAddress
				$("#addr1").val(data.roadAddress);
				// 우편 input value 설정 : data.zonecode
// 				$("#zipcd").val(data.zonecode);
			}
		}).open();
	});
	var cnt = "${updateCnt}";
	if(cnt != 0){
		window.opener.location.reload();
		window.close();
	}
});
</script>
</head>
<body>
<form action="/sit/addressUpdate" method="POST" id="frm">
	<div id="updateMain">
		<div id="utitle">
			<span>주소 변경</span>
		</div>
		<div id="uSearch">
			<input type="button" id="uSearchBtn" value="주소검색"/>
		</div>
		<div id="uAddressMain">
			<div id="uAddress">
				<span>주소</span> <br>
				<input type="text" id="addr1" name="mem_addr1" readonly />
			</div>
			<div id="uAddressDetail">
				<span>상세 주소</span><br>
				<input type="text" id="addr2" name="mem_addr2" />
			</div>
		</div>
		<div id="uFinish">
			<input type="submit" id="uFinishBtn" value="수정완료" />
		</div>
	</div>
</form>
</body>
</html>