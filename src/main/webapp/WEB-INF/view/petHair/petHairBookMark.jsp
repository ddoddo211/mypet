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
		$(".bma").click(function(){
			
			$("#hiddenHasId").val(
				$(this).parent(".bmName").children(".has_id").val()		
			);
			
				
			
			$("#detailfrm").submit();
			
		});
		
		$(".delbm").click(function(){
			var bmk_id = $(this).parent("span").parent(".bmName").children(".bmk_id").val();
			
			$("#delId").val(bmk_id);
			
			$("#dbmfrm").submit();
			
			
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
	
	<%-- 북마크 삭제 form --%>
	<form action="/hairMem/deleteBm" method="post" id="dbmfrm">
		<input type="hidden" id="delId" name="bmk_id" />
		<input type="hidden"  name="mem_id" value="${memVo.mem_id }" />
		
	</form>
	
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
									<a href="#" class="bma" data-tooltip-text="클릭시 미용실 정보 페이지로 이동합니다">${bl.has_name }</a> <span style="width: 200px;" data-tooltip-text="즐겨찾기에서 삭제합니다"><img class="delbm"  src="/hairimg/x.png"/></span>
									<input type="hidden" class="has_id" value="${bl.bmk_has }"/>
									<input type="hidden" class="bmk_id" value="${bl.bmk_id }"/>
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
























