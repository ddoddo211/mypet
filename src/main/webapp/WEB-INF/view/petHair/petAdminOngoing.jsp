<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<link  href="/css/petHairMyPage.css" rel="stylesheet"/>
<link  href="/css/petHairRev.css" rel="stylesheet"/>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
	.resPickBlock{
		width:200px;
	}
	
	.resPickBlockR{
		width: 200px;
	}
	
	#datepicker{
	margin-left: 0px;
	margin-top: 0px;
	
	}
	
	.selRes{
		display: none;
	}
	.resPick{
		width: 190px;
	}
	
	.chkB {
		margin-top: 5px;
		width: 80px;
	}
	
	.chkB img{
		
		width: 38px;
	}
</style>

<%-- 스크립트 위치 --%>

<script type="text/javascript">
		if('${memVo}'==''){
			alert("로그인이 필요합니다");
			location.href="/hair/hairMain";
		}
	$(document).ready(function(){
		
		
		
		
		$(".cgBtn").click(function(){
			
			$("#hres_id").val(
				$(this).parent("td").parent("tr").children(".sob").children("input").val()
			);
			$("#hres_stat").val(
				$(this).parent("td").parent("tr").children(".sob").children("select").val()	
			);
			$("#hres_spec").val(
				$(this).parent("td").parent("tr").children(".tab").children("textarea").val()	
			);
			
			$("#actfrm").submit();
			
			
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
		
		<%--미용실 id 참조용 input hidden --%>
	<input type="hidden" value="${has_id }" id="hiddenId"/>
	
	<%-- 접수의뢰 수락 or 취소 form --%>
	<form action="/hairAdmin/updateRev" method="post" id="actfrm">
		<input type="hidden" name="hres_stat" id="hres_stat" />
		<input type="hidden" name="hres_id" id="hres_id" />
		<input type="hidden" name="hres_spec" id="hres_spec" />
		<input type="hidden" name="mem_id" value="${memVo.mem_id }"/>
		<input type="hidden" name="ongoing" value="yes"/>
	</form>
		
		
		<div class="mpMain">
			<p>진행중인 의뢰</p>  
				<table class="statTable">
					<tr>
						<th>스타일 명</th>
						<th>이용시간</th>
						<th>가격</th>
						<th>특이사항</th>
						<th>진행상태</th>
						<th> </th>
					</tr>
					
					<c:choose>
						<c:when test="${hairResList.size()!=0 }">
							<c:forEach items="${hairResList }" var="hr">
								<tr>
									<td>${hr.pts_name }</td>
									<td>${hr.hres_date }<br>${hr.hres_time }</td>
									<td>${hr.pts_price }원	</td>
									<td class="tab"><textarea style="resize: none;">${hr.hres_spec }</textarea>	</td>
									
									<td class="sob">
										<select>
											<option value="진행중">진행중</option>
											<option value="완료">완료</option>
										</select>
										<input type="hidden" value="${hr.hres_id }"/>
									
									</td>
									
									
									<td><input class="cgBtn" type="button" value="상태변경"/></td>
								</tr>
							
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">진행중인 의뢰가 없습니다	</td>
							</tr>
						
						</c:otherwise>
					</c:choose>
					
				</table>
			
			
			<br><br>
			<br><br>
			
			
		</div>
	</div>
			
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>

<script type="text/javascript">
</script>

</html>
























