<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goProdManager(관리자용 보험상품관리화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		
		// 보험상품 보러 가기 버튼을 클릭하였을때 반응하는 부분
		$("#prodSelectBtn1_1_1").click(function(){
			// input에 넣어 놨던 id값을 가지고 오기 
			var prodSelectId = $("#prodId").val();
			
			if(prodSelectId == ""){
				alert("상세내역을 확인하실 상품의 체크박스를 클릭하시기 바랍니다.");
			}else{
				selectTr(prodSelectId);
			}
		});
		
		// 보험상품 추가하기 버튼을 클릭 하였을때 반응하는 부분
		$("#prodSelectBtn1_1_2").click(function(){
			goInsProdInsert();
		});
		
		// 보험상품 삭제하기 버튼을 클릭하였을때 반응하는 부분
		$("#prodSelectBtn1_1_3").click(function(){
			// input에 넣어 놨던 id값을 가지고 오기 
			var prodId = $("#prodId").val();
			if(prodId == ""){
				alert("상세내역을 확인하실 상품의 체크박스를 클릭하시기 바랍니다.");
			}else{
				goInsProdDel(prodId);
			}
		});

		//input을 문서 실행하면 먼저 실행되게끔 처리하기 
		var pageSize = 10;
		var petKind = "강아지";
		
		// input에 값을 가지고 와서 함수로 뺴기 
		$(".petKind").click(function(){
			if($(this).val()== "강아지"){
				petKind = "강아지";
			}
			if($(this).val() == "고양이"){
				petKind = "고양이";
			}
			getProdKindPageListAjaxHtml(1,petKind,pageSize);
				
			if($(this).val()== "전체"){
				getProdListHtml(1);
			}
		});
		
		// 첫페이지는 무조건 실행되야 하기 떄문에 설정
		getProdListHtml(1); //  html로 리턴해주는 함수 
});

//해당 행을 클릭하였을때 보험상품의 내용으로 이동하는 부분
function selectTr(prodId){
	var prodId = prodId;
	location.href = '/isr/productDetail2?prodId='+prodId;
}

// 보험상품 추가하기 버튼을 클릭 하였을때 반응하는 부분
function goInsProdInsert(){
	location.href = '/isr/goInsProdInsert';
}

// 보험상품 삭제하기 버튼을 클릭하였을때 반영되는 부분
function goInsProdDel(prodId){
	var prodId = prodId;
	location.href = '/isr/goInsProdDel?prodId='+prodId;
}


// 페이지 리스트가 나오는 html
function getProdListHtml(page) {
	var pageSize = 10;

	$.ajax({
		url : "/isr/prodPageListAjaxHtml2",
		type : "get",
		data : "page=" + page + "&pageSize=" + pageSize,
		success : function(dt) {
			$("#prodList").html(dt);
			getProdPagenationHtml(page, pageSize); // 해당 페이지의 페이지 네이션 정보를 리턴해주는 함수 
			
			// 체크박스를 클릭하였을때 상품의 id 담아주기 
			$(".check").click(function(){
					var prodId = $(this).val();
					$("#prodId").val(prodId);
			});
		}
	});

}

// 페이지 처리
function getProdPagenationHtml(page, pageSize) {

	$.ajax({
		url : "/isr/paginationHtml2",
		type : "get",
		data : "page=" + page + "&pageSize=" + pageSize,
		success : function(dt) {
			$("#paginationHtml").html(dt);
		}
	});

}

// 조회조건주었을때 아작스 처리

// 페이지 리스트가 나오는 html
function getProdKindPageListAjaxHtml(page, petKind, pageSize) {
	
	// parameter --> json
	$.ajax({
		url : "/isr/prodKindPageListAjaxHtml2",
		type : "get",
		data : "page=" + page + "&pageSize=" + pageSize + "&petKind="+ petKind,
		success : function(dt) {
			$("#prodList").html(dt);
			
			// 체크박스를 클릭하였을때 상품의 id 담아주기 
			$(".check").click(function(){
					var prodId = $(this).val();
					$("#prodId").val(prodId);
			});
			
			getProdKindPagenationHtml(page, petKind, pageSize);
			
		}
	});
}

// 페이지 처리(조회조건)
function getProdKindPagenationHtml(page, petKind, pageSize) {
	$.ajax({
		url : "/isr/kindPaginationHtml2",
		type : "get",
		data : "page=" + page + "&pageSize=" + pageSize + "&petKind="
				+ petKind,
		success : function(dt) {
			$("#paginationHtml").html(dt);
		}
	});
}

</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>

<!-- 체크박스를 클릭하였을때 상품의 id값 담아주는  input -->
<input type="hidden" value="" id="prodId">

<!-- header 시작 -->
<%@include file="../../common/header.jsp"%>
<!-- header 끝-->

<div id="main">	

	<div id="adminMain">
		<!-- 관리자 메뉴 -->
		<%@include file="../adminHeader.jsp"%>
					
			<!-- 관리자용 펫 보험 메뉴  -->
			<%@include file="insMenuSelect.jsp"%>
		
			<div id="adminInsMenu">
			
				<div id="productManagement1">
					<div id="productManagement1_1">보험상품 관리</div>
				</div>
				
				<div id="productManagement">

					<div id="productManagement2">
						<table id="currentStatus2">
							<tr>
								<th class="currentStatus1">전체 보험가입 가능 상품 수</th>
								<th colspan="2" class="currentStatus1">종별 보험상품 수</th>
								<th class="currentStatus1">가입 만료된 보험상품 수</th>
							</tr>
							<tr>
								<td><a class="prod">${caninsured}개</a></td>
								<td><a class="prod">${dogProd }개</a></td>
								<td><a class="prod">${catProd }개</a></td>
								<td><a class="prod">${expiration }개</a></td>
							</tr>
						</table>
					</div>
				
				<div id="lookup">
						<div id="condition">
							<div id="condition1">
								<label id="seach">조회조건</label>
							
								<div class="condition2" id="seach2">
										<label class="label2">애완동물 조회</label>
												<input class="label2 laber3 petKind" type="button" name="petKind" value="강아지"/>
												<input class="label2 laber3 petKind" type="button"  name="petKind"  value="고양이" />
												<input class="laber3 petKind" type="button"  name="petKind"  value="전체" />
												
								</div>	
							
							</div>
						</div>
				</div>
			</div>
			
			<div id="productList">
				<table id="example-table-1">
				<thead>
					<tr>
						<th class="chk">체크</th>
						<th class="tabel1">가입대상</th>
						<th class="tabel1">보험상품</th>
						<th class="tabel1">월 보험료 가격</th>
						<th class="tabel1">가입연령</th>
						<th class="tabel1">보장기간</th>
						<th class="tabel1">질병여부(Y/N)</th>
						<th class="tabel1">보험  만료여부</th>
						<th class="tabel1">가입자 수</th>
					</tr>
				</thead>

				<tbody id="prodList">
					<!-- 보험상품 리스트 아작스 처리한곳 -->
				</tbody>

						
				</table>
			</div>
			
			<div id="prodSelectBtn">
				<div id="prodSelectBtn1">
					<div class="prodSelectBtn1_1" id="prodSelectBtn1_2">
						<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_1" type="button" value="보험상품 보기">
					</div>
					<div class="prodSelectBtn1_1">
						<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_2" type="button" value="보험상품 추가">
					</div>
					<div class="prodSelectBtn1_1">
						<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_3" type="button" value="삭제하기">
					</div>
				</div>
			</div>
			
			<div id="pagenation">
					<div id="pagenation1" >
						<ul class="pagination" id="paginationHtml">  
							<!-- 페이징 아작스 처리한곳 -->
						</ul>
					</div>
			</div>
			
			
		
			
		
	</div>

</div>
	
	
	<!-- footer 시작 -->
	<%@include file="../../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>