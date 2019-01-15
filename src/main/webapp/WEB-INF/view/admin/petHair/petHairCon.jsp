<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain.jsp(관리자용 메인화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
	td img {
		width: 50px;
		max-height: 50px;
	}

	#hiddenimg{
		position: absolute;
		width: 500px;
		height: 500px;
		display: none;
		z-index: 10;
	}
	#hiddenimg img{
		width: 100%;
		max-height: 500px;
		border: 4px dashed grey;
		border-radius: 20px;		
	}
	
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".inimg").click(function(){
		$(this).attr('src');
		$("#hiddenimg").empty();
		$("#hiddenimg").append("<img class='hide' src='"+$(this).attr('src')+"'/>");
		$("#hiddenimg").show();
		
	});
	
	$("#hiddenimg").click(function(){
		$("#hiddenimg").hide();
		
	});

});
	
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">
<link href="/css/admin.css" rel="stylesheet">

</head>
<body>

<!-- header 시작 -->
<%@include file="../../common/header.jsp"%>
<!-- header 끝-->

	<div id="main">
		<div id="adminMain">
			<div id="adminMain2_1">
				<!-- 관리자 메뉴 화면 -->
				<%@include file="../adminHeader.jsp"%>
				<div class="menuCtn">
					<p>미용실 전체 list</p>
					<div id="hiddenimg">
					
					</div>
					<table>
						<thead>
							<tr>
								<th>	이미지	</th>
								<th>	미용실ID	</th>
								<th>	미용사(회원ID)	</th>
								<th>	미용실이름	</th>
								<th>	미용실주소	</th>
								<th>	상세주소	</th>
								<th>	소개글	</th>
								<th>	상세소개글	</th>
								<th>	상태변경	</th>
							</tr>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${hsList.size()!=0 }">
									<c:forEach items="${hsList }" var="hl">
										<tr>
											<td>	<img class="inimg" src="/hairimg/${hl.has_img }"/>		</td>
											<td>	${hl.has_id }		</td>
											<td>	${hl.has_mem }		</td>
											<td>	${hl.has_name }		</td>
											<td>	${hl.has_addr }		</td>
											<td>	${hl.has_addr2 }		</td>
											<td>	${hl.has_ptext }		</td>
											<td>	${hl.has_text}		</td>
											<td class="hiddeninputtd">	
											<form action="/mem/updateHairShop" method="post">
												<c:choose>
													<c:when test="${hl.has_score==0 }">
														<input type="submit" class="acceptBtn" value="복귀"/>	
													
													</c:when>
													<c:otherwise>
														<input type="submit" class="acceptBtn" value="삭제"/>	
													
													</c:otherwise>
												</c:choose>
												<input type="hidden" class="has_id" name="has_id" value="${hl.has_id }"/>
												<input type="hidden" class="has_mem" name="has_mem" value="${hl.has_mem }"/>
												<input type="hidden" class="has_name" name="has_name" value="-관리자삭제-"/>
												<input type="hidden" class="has_addr" name="has_addr" value="${hl.has_addr}"/>
												<input type="hidden" class="has_addr2" name="has_addr2" value="-관리자삭제-"/>
												<input type="hidden" class="has_ptext" name="has_ptext" value="-관리자삭제-"/>
												<input type="hidden" class="has_text" name="has_text" value="-관리자삭제-"/>
												<input type="hidden" class="has_img" name="has_img" value="x.png"/>
												<input type="hidden" class="has_score" name="has_score" value="${hl.has_score }"/>
											</form>	
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8">미용실 리스트가 없습니다</td>
									</tr>
								
								</c:otherwise>
							</c:choose>
								
						</tbody>
					
					
					</table>
				
				
				
				
				
				
				
				
				</div>

			</div>
		</div>

	</div>


	<!-- footer 시작 -->
<%-- 	<%@include file="../../common/footer.jsp"%> --%>
	<!-- footer 끝 -->

<script type="text/javascript">
	

</script>

</body>

</html>