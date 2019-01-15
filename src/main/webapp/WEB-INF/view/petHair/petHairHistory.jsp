<%@page import="kr.co.mypet.hair.model.HairPageVo"%>
<%@page import="kr.co.mypet.common.model.MemberVo"%>
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
		if('${memVo}'==''){
			alert("로그인이 필요합니다");
			history.back();
		}
	$(document).ready(function(){
		
		$(".resContent").click(function(){
			
			var index = $(".resContent").index(this);
			
			$(".reviewHide").eq(index).slideToggle("fast");
			
		});
		
		$(".historyBtn").click(function(){
			
			var btnIndex = $(".historyBtn").index(this);
			
			$("#hdtitle").val(
				$(".historyte").eq(btnIndex).val()	
			);
			$("#hdtext").val(
				$(".historyta").eq(btnIndex).val()	
			);
			$("#hdhas").val(
				$(".hbrd_has").eq(btnIndex).val()		
			);
			$("#hdmem").val(
				$(".hbrd_mem").eq(btnIndex).val()		
					
			);
			  var cnt = $(".on").length;
			$("#hdscore").val(
				cnt		
			);
			
			//alert($(".historyte").eq(btnIndex).val() + " : "+$(".historyta").eq(btnIndex).val() + " : " + $(".hbrd_has").eq(btnIndex).val());
			alert("후기작성이 완료되었습니다 (해당 미용실 소개화면에서 후기를 확인할 수 있습니다)");
			$("#rvfrm").submit();
		});
		
		
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  return false;
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
		<%@include file="petMypageLeft.jsp"%>
		
	<%--후기작성용 전달 parameter form --%>
	<form action="/hairMem/insertReview" method="post" id="rvfrm">
		<input type="hidden" name="hbrd_title" id="hdtitle" />
		<input type="hidden" name="hbrd_text" id="hdtext" />
		<input type="hidden" name="hbrd_has" id="hdhas" />
		<input type="hidden" name="hbrd_mem" id="hdmem" />
		<input type="hidden" name="hbrd_score" id="hdscore" />
	</form>
		
		<div class="mpMain">
			<p>이용 내역</p>  
				<table class="statTable">
					<tr>
						<th>미용실 명</th>
						<th>스타일 명</th>
						<th>이용시간</th>
						<th>가격</th>
						<th>특이사항</th>
						<th>진행상태</th>
					</tr>
					
					<c:choose>
						<c:when test="${hairResList!=null }">
							<c:forEach items="${hairResList }" var="hr">
								<tr class="resContent click">
									<td>${hr.has_name }	</td>
									<td>${hr.pts_name }</td>
									<td>${hr.hres_date }<br>${hr.hres_time }</td>
									<td>${hr.pts_price }원	</td>
									<td>${hr.hres_spec }	</td>
									<td>${hr.hres_stat }</td>
								</tr>
								<tr class="reviewHide click">
									<td> <img class="arr" src="/hairimg/RightArrow.png"/></td>
									<td colspan="5">
										<div class="starRev">
											별점주기 / 
										  <span class="starR on">별1</span>
										  <span class="starR">별2</span>
										  <span class="starR">별3</span>
										  <span class="starR">별4</span>
										  <span class="starR">별5</span>
										</div>
										제목 : <input type="text" class="historyte" />
											<input type="button" class="historyBtn" value="후기작성" />
										<textarea class="historyta" name=""></textarea>
										
										
										<input type="hidden"  class = "hbrd_has" value="${hr.hres_has }"/>
										<input type="hidden"  class = "hbrd_mem" value="${memVo.mem_id }"/>
									</td>
								</tr>
							
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">펫미용 이용내역이 없습니다	</td>
							</tr>
						
						</c:otherwise>
					</c:choose>
					
				</table>
				<br>
				 <span>- 클릭하여 후기를 작성할 수 있습니다 -</span>
			
			<br><br>
			
			<%-- page 처리 --%>
			<%
			HairPageVo hairPageVo = (HairPageVo)request.getAttribute("hairPageVo");
			int selPage = hairPageVo.getPage();
			String temp = request.getParameter("totalCnt");
			int totalCnt = 0;
			totalCnt = hairPageVo.getTotalCnt();
			
			// 불러온 페이지 번호가 1보다 작거나, 최대치보다 클때 = 1보다작으면 1로설정, 최대보다 크면 최대로 설정
			if(selPage<1){
				selPage = 1;
			} else if (selPage>totalCnt/5) {
				selPage = (totalCnt/5)+1;
			}
			
			int startIndex = selPage;
			if(startIndex<6){
				startIndex = 1;
			} else if(startIndex%5==0) { //여기서부터하기
				startIndex -= 4;
			} else {
				startIndex = startIndex-(startIndex%5)+1;
			}
			int endIndex = startIndex +5;
			int moveFoward = startIndex-5;
			if(moveFoward<1){
				moveFoward = 1;
			}
			if(endIndex > totalCnt/5){
				endIndex = totalCnt/5+2;
			}
			
			%>
			
			<ul class="pagination">
				<li><a href="/hairMem/history?mem_id=${memVo.mem_id }&page=1">start</a></li>
				<li><a href="/hairMem/history?mem_id=${memVo.mem_id }&page=<%=moveFoward%>"><<</a></li>
				<%
				for(int pg = startIndex;pg < endIndex;pg++){
					if(pg==selPage){
						%><li><a href="/hairMem/history?mem_id=${memVo.mem_id }&page=<%=pg%>" style="background:#428bca; color:white;"><%=pg%></a></li><%
					} else{
					%>
					<li><a href="/hairMem/history?mem_id=${memVo.mem_id }&page=<%=pg%>"><%=pg%></a></li>
					<%
					}
				}
				%>
				
				
				<li><a href="/hairMem/history?mem_id=${memVo.mem_id }&page=<%=endIndex-1%>">>></a></li>
				<li><a href="/hairMem/history?mem_id=${memVo.mem_id }&page=<%=totalCnt/5+1%>">end</a></li>
			<%-- 
			--%>
			</ul>
			
			
			<br><br>
			
			
		</div>
	</div>
			
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>


</html>
























