<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain.jsp(관리자용 메인화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	

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
					<p>미용실 지원자 list</p>
					
					<table>
						<thead>
							<tr>
								<th>	지원자ID	</th>
								<th>	미용실이름	</th>
								<th>	미용실주소	</th>
								<th>	상세주소	</th>
								<th>	소개글	</th>
								<th>	상세소개글	</th>
								<th>	신청상태	</th>
								<th>	상태변경	</th>
							</tr>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${hsaList.size()!=0 }">
									<c:forEach items="${hsaList }" var="hl">
										<tr>
											<td>	${hl.hsa_mem }		</td>
											<td>	${hl.hsa_name }		</td>
											<td>	${hl.hsa_addr }		</td>
											<td>	${hl.hsa_addr2 }		</td>
											<td>	${hl.hsa_ptext }		</td>
											<td>	${hl.hsa_text}		</td>
											<td>			
												<select name="hsa_acp" class="hsa_acpS">
													<option value="대기">
														대기중
													</option>
													<option value="승인">
														승인
													</option>
													<option value="거절">
														거절
													</option>
												</select>
											</td>
											<td class="hiddeninputtd">	
											<form action="/mem/updateHsa" method="post">
												<input type="submit" class="acceptBtn" value="변경"/>	
												<input type="hidden" class="hsa_id" name="hsa_id" value="${hl.hsa_id }"/>
												<input type="hidden" class="hsa_mem" name="hsa_mem" value="${hl.hsa_mem }"/>
												<input type="hidden" class="hsa_name" name="hsa_name" value="${hl.hsa_name}"/>
												<input type="hidden" class="hsa_addr" name="hsa_addr" value="${hl.hsa_addr}"/>
												<input type="hidden" class="hsa_addr2" name="hsa_addr2" value="${hl.hsa_addr2}"/>
												<input type="hidden" class="hsa_ptext" name="hsa_ptext" value="${hl.hsa_ptext}"/>
												<input type="hidden" class="hsa_text" name="hsa_text" value="${hl.hsa_text}"/>
												<input type="hidden" class="hsa_img" name="hsa_img" value="${hl.hsa_img}"/>
												<input type="hidden" class="hsa_acp" name="hsa_acp" value="${hl.hsa_acp}"/>
											</form>	
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7">미용실 지원자가 없습니다</td>
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
	<%@include file="../../common/footer.jsp"%>
	<!-- footer 끝 -->

<script type="text/javascript">
	$(".hsa_acpS").change(function(){
		
		var hsa_acp = $(this).val();
		$(this).parent("td").parent("tr").children(".hiddeninputtd").children("form").children(".hsa_acp").val(hsa_acp);
	});
	

</script>

</body>

</html>