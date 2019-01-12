<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		memExit(1);
	});

	function Exit(){
		memExit(1);
	}
	function Right(){
		memRight(1);
	}
	
	function chart(){
		chartView();
	}
	
	function chartView(){
		$.ajax({
			type : "post",
			url : "/mem/chartView",
			success : function(dt) {
				$("#contextMain").html(dt);
			}
		});
	}
	
	function memExit(page) {
		var pageSize = 10;
		$.ajax({
			type : "post",
			url : "/mem/memExit",
			data : "page=" + page + "&pageSize=" + pageSize,
			success : function(dt) {
				$("#contextMain").html(dt);
				memPage(page);
			}
		});
	}

	function memPage(page) {
		var pageSize = 10;
		$.ajax({
			type : "post",
			url : "/mem/memPage",
			data : "page=" + page + "&pageSize=" + pageSize,
			success : function(dt) {
				$(".pagination").html(dt);
			}
		});
	}

	function memDelete() {
		var val = [];
		var k = "";
		$(':checkbox:checked').each(function(i) {
			val[i] = $(this).val();
			k += val[i] + " ";
		});
		memberDelete(1, k);

	}

	function memberDelete(page, mem_id) {
		var pageSize = 10;
		$.ajax({
			type : "post",
			url : "/mem/memDelete",
			data : "page=" + page + "&pageSize=" + pageSize + "&mem_id="
					+ mem_id,
			success : function(dt) {
				memExit(page);
			}
		});
	}

	function memBlack() {
		var val = [];
		var k = "";
		$(':checkbox:checked').each(function(i) {
			val[i] = $(this).val();
			k += val[i] + " ";
		});
		memberBlack(1, k);
	}

	function memWhite() {
		var val = [];
		var k = "";
		$(':checkbox:checked').each(function(i) {
			val[i] = $(this).val();
			k += val[i] + " ";
		});
		memberWhite(1, k);
	}

	function memberBlack(page, mem_id) {
		var pageSize = 10;
		$.ajax({
			type : "post",
			url : "/mem/memBlack",
			data : "page=" + page + "&pageSize=" + pageSize + "&mem_id="
					+ mem_id,
			success : function(dt) {
				memExit(page);
			}
		});
	}

	function memberWhite(page, mem_id) {
		var pageSize = 10;
		$.ajax({
			type : "post",
			url : "/mem/memWhite",
			data : "page=" + page + "&pageSize=" + pageSize + "&mem_id="
					+ mem_id,
			success : function(dt) {
				memExit(page);
			}
		});
	}

	function memRight(page) {
		var pageSize = 10;
		$.ajax({
			type : "post",
			url : "/mem/memRight",
			data : "page=" + page + "&pageSize=" + pageSize,
			success : function(dt) {
				$("#contextMain").html(dt);
				memRightPage(page);
			}
		});
	}

	function memRightPage(page) {
		var pageSize = 10;
		$.ajax({
			type : "post",
			url : "/mem/memRightPage",
			data : "page=" + page + "&pageSize=" + pageSize,
			success : function(dt) {
				$(".pagination").html(dt);
			}
		});
	}
	
	function memberUpdate(page, mem_id, mem_sit, mem_shop, mem_hair){
		var pageSize = 10;
		$.ajax({
			type : "post",
			url : "/mem/memberUpdate",
			data : "page=" + page + "&pageSize=" + pageSize+"&mem_id="+mem_id+"&mem_sit="+mem_sit+"&mem_shop="+mem_shop+"&mem_hair="+mem_hair,
			success : function(dt) {
				memRight(page);
			}
		});
	}
	
	
	
</script>
<style type="text/css">
.adpetSitterMenu {
	width: 200px;
	height: 30px;
	line-height: 30px;
	font-size: 18px;
	font-family: 'Jeju Gothic', sans-serif;
	text-align: center;
	float: left;
	margin-right: 20px;
	background-color: #565656;
	border-radius: 10px;
	color: white;
	outline: none;
	cursor: pointer;
}

.pagination {
	padding: 0;
	font-family: 'Work Sans', sans-serif;
	font-size: 20px;
	text-align: center;
}

.pagination>li {
	display: inline-block;
}

.pagination>li>a {
	float: left;
	margin: 0 auto;
}

#reservationTable {
	margin-top: 10px;
	width: 100%;
	border-collapse: collapse;
}

.th {
	border: 1px solid #d1d1d1;
	font-size: 20px;
	background-color: #fff3f3;
}

.td {
	border: 1px solid #d1d1d1;
	text-align: center;
	vertical-align: middle;
	font-size: 14px;
	height: 30px;
}

.mypageBtn {
	width: 130px;
	height: 40px;
	border: 1px solid black;
	background-color: #000;
	color: #fff;
	font-size: 16px;
	border-radius: 15px;
	box-shadow: 2px 2px #a1a1a1;
	outline: none;
}

.mypageBtn:active {
	width: 130px;
	height: 40px;
	border: 1px solid #a1a1a1;
	background-color: #a1a1a1;
	color: #fff;
	font-size: 16px;
	border-radius: 15px;
	box-shadow: 2px 2px #000;
	outline: none;
}

.mypageBtn2 {
	width: 80px;
	height: 40px;
	border: 1px solid black;
	background-color: #000;
	color: #fff;
	font-size: 16px;
	border-radius: 15px;
	box-shadow: 2px 2px #a1a1a1;
	outline: none;
}

.mypageBtn2:active {
	width: 80px;
	height: 40px;
	border: 1px solid #a1a1a1;
	background-color: #a1a1a1;
	color: #fff;
	font-size: 16px;
	border-radius: 15px;
	box-shadow: 2px 2px #000;
	outline: none;
}
.hidden {
	display: none;
}
</style>
</head>
<body>
	<%@include file="../../common/header.jsp"%>
	<div id="main">

		<div id="adminMain">

			<!-- 관리자 메뉴 -->
			<%@include file="../adminHeader.jsp"%>
			<div id="insTitle">MYPET 회원 관리</div>
			<div id="insMenu">
				<div style="width : 660px; margin:0 auto; overflow: hidden;">
					<div>
						<input class="adpetSitterMenu" onclick="Exit()"	type="button" value="1.회원 탈퇴/블랙리스트">
					</div>
					<div>
						<input class="adpetSitterMenu" type="button" onclick="Right()" value="2.회원 권한">
					</div>
					<div>
						<input class="adpetSitterMenu" type="button" onclick="chart()" value="3. 통계">
					</div>
				</div>
			</div>
			<div id="contextMain">
				
				
			</div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>