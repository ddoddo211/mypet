<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		//input을 문서 실행하면 먼저 실행되게끔 처리하기 
		var pageSize = 10;
		
		// input에 값을 가지고 와서 함수로 뺴기 
		$(".petKind").click(function(){
			if($(this).val()== "강아지"|| $(this).val() == "고양이"){
				getProdKindPageListAjaxHtml(1, $(this).val(),pageSize);
			}
			if($(this).val()== "전체"){
				getProdListHtml(1);
			}
		});
		
		
		
		//우리아이 보험상품 추천 
		var petKind = "";
		var birth = "";
		var petSick = "";
		
		$(".kind").click(function(){
			petKind = $(this).val();
		});
				
		$(".petSick").click(function(){
			petSick = $(this).val();
		});
		
		$("#productBtn").click(function(){
			birth = $("#date1").val();
			
			//생년월일을 입력하지 않고 보험상품 추천 버튼을 클릭하였을때 처리해야 하는 부분
			if($("#date1").val() == ""){
				alert("생년월일을 입력하시기 바랍니다");
				event.preventDefault();	// 이벤트 제거 하기 
				return false;
			}
			getProdRecommendation(1,10,petKind,birth,petSick);
		});
		

		// 달력 옵션 설정
		$("#date1").datepicker({ // 달력에 옵션 설정하기
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일에 표시되는 형식 설정
			dateFormat : "yy-mm-dd", //날짜 형식 설정
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
			"8월", "9월", "10월", "11월", "12월" ], //월표시 형식 설정
			showAnim : "fold" //애니메이션효과
		});
		
		
		// 첫페이지는 무조건 실행되야 하기 떄문에 설정
		getProdListHtml(1);	//  html로 리턴해주는 함수 
		
		
		
});		
		
		// 페이지 리스트가 나오는 html
		function getProdListHtml(page){
			var pageSize = 10;
			
			// parameter --> json
			$.ajax({
				url : "/isr/prodPageListAjaxHtml",
				type : "get" ,
				data : "page="+page+"&pageSize="+pageSize,
				success : function(dt){
					$("#prodList").html(dt);
					getProdPagenationHtml(page,pageSize);	// 해당 페이지의 페이지 네이션 정보를 리턴해주는 함수 
				}
			});
			
		}


		// 페이지 처리
			function getProdPagenationHtml(page,pageSize){

				$.ajax({
					url : "/isr/paginationHtml",
					type : "get" ,
					data : "page="+page+"&pageSize="+pageSize,
					success : function(dt){
						$("#paginationHtml").html(dt);
					}
				});
				
			}
		
		
		// 조회조건주었을때 아작스 처리
		
			// 페이지 리스트가 나오는 html
			function getProdKindPageListAjaxHtml(page, petKind ,pageSize){
				// parameter --> json
				$.ajax({
					url : "/isr/prodKindPageListAjaxHtml",
					type : "get" ,
					data : "page="+page+"&pageSize="+pageSize+"&petKind="+petKind,
					success : function(dt){
						$("#prodList").html(dt);
						getProdKindPagenationHtml(page,petKind,pageSize);	// 해당 페이지의 페이지 네이션 정보를 리턴해주는 함수 
					}
				});
				
			}

			// 페이지 처리(조회조건)
				function getProdKindPagenationHtml(page,petKind, pageSize){
					$.ajax({
						url : "/isr/kindPaginationHtml",
						type : "get" ,
						data : "page="+page+"&pageSize="+pageSize+"&petKind="+petKind,
						success : function(dt){
							$("#paginationHtml").html(dt);
						}
					});
					
				}
			
			// 우리아이 보험상품 추천 
				// 우리아이 보험상품 추천 리스트
				function getProdRecommendation(page,pageSize,petKind,birth,petSick){
					$.ajax({
						url : "/isr/prodProductRecommendation",
						type : "get" ,
						data : "page="+page+"&pageSize="+pageSize+"&petKind="+petKind+"&petBirth="+birth+"&petSick="+petSick,
						success : function(dt){
							$("#prodList").html(dt);
							getProdRPagenation(page,pageSize,petKind,birth,petSick);	// 해당 페이지의 페이지 네이션 정보를 리턴해주는 함수 
						}
					});
				}
				
			    // 우리아이 보험상품 추천 페이징 
				function getProdRPagenation(page,pageSize,petKind,birth,petSick){
					$.ajax({
						url : "/isr/getProdRPagenation",
						type : "get" ,
						data : "page="+page+"&pageSize="+pageSize+"&petKind="+petKind+"&petBirth="+birth+"&petSick="+petSick,
						success : function(dt){
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
<!-- header 시작 -->
<%@include file="../common/header.jsp"%>
<!-- header 끝-->

	<div id="headerMain">
		<!-- main content -->
			<div id="header">
				<%--main --%>
				<div id="logo">
					<a href="/common/main.jsp"><img alt="이미지가 없습니다" src="/img/petInsuranceLogo2.jpg" width="200px;"></a>
				</div>
				<div id="petSearch">
					<div id="word">
						<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
					</div>
					<div id="searchButton">
						<a href="#" id="searchButton"></a>
					</div>
				</div>
				
				<!-- 우리 아이 등록하기 -->
				<div id="petInsert">
					<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg" width="240px;" height="100px;"></a>
				</div>
			</div>
	</div>
	
<div id="main">	
	<!-- 여기부터 나의 body -->

		<!-- petInsuranceHeaderMain -->
		<%@include file="./petInsuranceHeaderMain.jsp"%>
		<!-- petInsuranceHeaderMain 끝 -->

		<%--우리 아이 보험상품 추천 --%>
		<div id="introduction">
			<div id="productRecommendation">

				<div id="write">
						<div id="product">
							<h2>우리아이 보험상품 추천</h2>
						</div>
						<div id="inputBox">
							<div id="checkbox">
								<label class="container">강아지
								  <input type="radio" class="kind" checked="checked" name="kind" value="강아지">
								  <span class="checkmark"></span>
								</label>
								
								<label class="container">고양이
								  <input type="radio" class="kind" name="kind" value="고양이" >
								  <span class="checkmark"></span>
								</label>
							</div>
							<div id="birth">
								생년월일 : &nbsp;<input type="text" name ="petBirth" id="date1" readonly="readonly"><br/>
							</div>
							
							<div id="disease">
								<label id="disease1">질병여부 :</label>
								<label class="container">예
								  <input type="radio" class="petSick" checked="checked" name="disease" value='Y' >
								  <span class="checkmark"></span>
								</label>
								
								<label class="container">아니요
								  <input type="radio" class="petSick" name="disease" value='N'>
								  <span class="checkmark"></span>
								</label>
							</div>
							<div>
								<input type="submit" id="productBtn" value="보험상품 추천" />
							</div>

						</div>
				</div>
			</div>
			
			<div id="lookup">
						<div id="condition">
							<div id="condition1">
								<label id="label1">조회조건</label>
							
								<div class="condition2">
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
				<table cellspacing='0'>
					<tr>
						<th class="tabel1">가입대상</th>
						<th class="tabel1">보험상품</th>
						<th class="tabel1">월 보험료 가격</th>
						<th class="tabel1">가입연령</th>
						<th class="tabel1">보장기간</th>
						<th class="tabel1">질병여부(Y/N)</th>
					</tr>

				<tbody id="prodList">
					<!-- 보험상품 리스트 아작스 처리한곳 -->
				</tbody>

						
				</table>
			</div>
			
			<div id="pagenation">
					<div id="pagenation1" >
						<ul class="pagination" id="paginationHtml">  
							<!-- 페이징 아작스 처리한곳 -->
						</ul>
					</div>
			</div>
			
		
	</div>
	
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>