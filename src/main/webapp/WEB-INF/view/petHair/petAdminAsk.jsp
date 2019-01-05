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
			
			if($(".historyta").eq(btnIndex).val()==''){
				alert("답변을 입력해주세요");
				return;
			}
			
			$("#hdtext").val(
				$(".historyta").eq(btnIndex).val()	
			);
			
			$("#hdhas").val(
				$(".hbrd_id").eq(btnIndex).val()	
			);
			
			$("#asrfrm").submit();
			
			
		});
		
		
		
		
	});

</script>

	<style>
		.arr {
			margin-left: 57px;
		}	
	</style>
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
		
		
	<%--답변작성용 전달 parameter form --%>
	<form action="/hairAdmin/insertAskR" method="post" id="asrfrm">
		<input type="hidden" name="hbrd_rep" id="hdtext" />
		<input type="hidden" name="hbrd_id" id="hdhas" />
		<input type="hidden" name="mem_id" id="hdmemId" value="${memVo.mem_id }" />
	</form>
		
		<div class="mpMain">
			<p>미답변 문의</p>  
				<table class="statTable">
					<tr>
						<th>문의 일자</th>
						<th>작성자(ID)</th>
						<th>문의내용</th>
					</tr>
					
					<c:choose>
						<c:when test="${askListNA.size()!=0 }">
							<c:forEach items="${askListNA }" var="an">
								<tr class="resContent click">
									
									<td><fmt:formatDate value="${an.hbrd_date }" pattern="yyyy-MM-dd"/>	</td>
									<td>${an.hbrd_mem }</td>
									<td>${an.hbrd_text}</td>
								</tr>
								<tr class="reviewHide click">
									<td> <img class="arr" src="/hairimg/RightArrow.png"/></td>
									<td colspan="2">
											<input type="button" class="historyBtn" value="답변작성" />
										<textarea class="historyta" name=""></textarea>
										
										
										<input type="hidden"  class ="hbrd_id" value="${an.hbrd_id}"/>
									</td>
								</tr>
							
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3">등록된 문의가 없습니다	</td>
							</tr>
						
						</c:otherwise>
					</c:choose>
					
				</table>
				<br>
				 <span>- 클릭하여 답변을 작성할 수 있습니다 -</span>
			
			<br><br>
			
			<%-- page 처리 --%>
			
			<%-- 
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
				<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=1">start</a></li>
				<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=moveFoward%>"><<</a></li>
				<%
				for(int pg = startIndex;pg < endIndex;pg++){
					if(pg==selPage){
						%><li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=pg%>" style="background:#428bca; color:white;"><%=pg%></a></li><%
					} else{
					%>
					<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=pg%>"><%=pg%></a></li>
					<%
					}
				}
				%>
				
				
				<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=endIndex-1%>">>></a></li>
				<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=totalCnt/5+1%>">end</a></li>
			</ul>
			--%>
			
			<br><br>
			<p>답변완료 문의</p>  
				<table class="statTable">
					<tr>
						<th>문의 일자</th>
						<th>작성자(ID)</th>
						<th>문의내용</th>
					</tr>
					
					<c:choose>
						<c:when test="${askListYA.size()!=0 }">
							<c:forEach items="${askListYA }" var="ay">
								<tr class="resContent click">
									<td><fmt:formatDate value="${ay.hbrd_date }" pattern="yyyy-MM-dd"/>	</td>
									<td>${ay.hbrd_mem }</td>
									<td>${ay.hbrd_text}</td>
								</tr>
								<tr class="reviewHide click">
									<td> <img class="arr" src="/hairimg/RightArrow.png"/></td>
									<td colspan="2">
											<input type="button" class="historyBtn" value="답변수정" />
										<textarea class="historyta" name="">${ay.hbrd_rep }</textarea>
										
										
										<input type="hidden"  class = "hbrd_id" value="${ay.hbrd_id}"/>
									</td>
								</tr>
							
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3">답변완료된 문의가 없습니다	</td>
							</tr>
						
						</c:otherwise>
					</c:choose>
					
				</table>
				<br>
				 <span>- 클릭하여 답변을 수정할 수 있습니다 -</span>
			
			<br><br>
			
			<%-- page 처리 --%>
			
			<%-- 
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
				<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=1">start</a></li>
				<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=moveFoward%>"><<</a></li>
				<%
				for(int pg = startIndex;pg < endIndex;pg++){
					if(pg==selPage){
						%><li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=pg%>" style="background:#428bca; color:white;"><%=pg%></a></li><%
					} else{
					%>
					<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=pg%>"><%=pg%></a></li>
					<%
					}
				}
				%>
				
				
				<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=endIndex-1%>">>></a></li>
				<li><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }&page=<%=totalCnt/5+1%>">end</a></li>
			</ul>
			--%>
			
			<br><br>
			
			
		</div>
	</div>
			
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>


</html>
























