<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<link  href="/css/petHairMyPage.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>




<%-- 스크립트 위치 --%>

<script type="text/javascript">
	$(document).ready(function(){
		//리스트 클릭시 가게의 detail 표시 function
		$(".bmName").click(function(){
			
			$("#hiddenHasId").val(
				$(this).children(".has_id").val()		
			);
			
			console.log("넘겨줄 has_id : "+$("#hiddenHasId").val());
				
			
			$("#detailfrm").submit();
			
		});
		
	});

</script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->
	
	<!-- header 시작 -->
	<%@include file="petHairHeader.jsp"%>
	<!-- header 끝-->
	
	<%-- 전체 틀 div --%>
	<div id="mainmid">
		
		<%-- mypage 전용 left 메뉴 --%>
		<%@include file="petMypageLeft.jsp"%>
		<%-- left menu 끝 --%>
		
		<%-- main content 부분 --%>
		<div class="mpMain">
			<p>즐겨찾기 카페 목록</p>
			<c:choose>
				<c:when test="${bmList.size()!=0 }">
					<c:forEach items="${bmList }" var="bl">
						<%-- bookmark 리스트 --%>
						<div class="bmList">
							<div class="bmImg">
								<img src="/hairimg/${bl.has_img }"/>
							</div>
							<div class="bmRight">
								<div class="bmName">
									<a href="#">${bl.has_name }</a>
									<input type="hidden" class="has_id" value="${bl.bmk_has }"/>
								</div>
								<div class="bmAddr">
									${bl.has_addr } / ${bl.has_addr2 }
								</div>
							</div>
							
						</div>
						
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div class="bmList">
					<br>
						즐겨찾기한 미용실이 없습니다
					</div>	
				</c:otherwise>
			</c:choose>
			
			  
		
		</div>
		
	</div>
			
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	
	<%-- 미용실 목록 클릭시 상세정보 표시 form --%>
	<form id="detailfrm" action="/hair/shopDetail" method="post">
		<input type="hidden" name="zip_high" id="hiddenZipInputD" value=""/>
		<input type="hidden" name="zip_low" id="hiddenLowInputD" value=""/>
		<input type="hidden" name="has_id" id="hiddenHasId" value=""/>
		<input type="hidden" name="bmChk" id="bmChk" value="no"/>
		<c:choose>
			<c:when test="${memVo!=null }">
				<input type="hidden" name="bmid" id="bmId" value="${memVo.mem_id }"/>
			</c:when>
			<c:otherwise>
			
				<input type="hidden" name="bmid" id="bmId" value="no"/>
			</c:otherwise>
		</c:choose>
	</form>
	


</body>


</html>
























