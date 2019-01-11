<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(document).ready(function(){
	$(".mypageBtn2").click(function(){
		var mem_id = $(this).parent().parent().children().children("#mem_id").val();
		var mem_sit = $(this).parent().parent().children().children("#mem_sit").val();
		var mem_shop = $(this).parent().parent().children().children("#mem_shop").val();
		var mem_hair = $(this).parent().parent().children().children("#mem_hair").val();
		
		memberUpdate(1, mem_id, mem_sit, mem_shop, mem_hair);
	});
});
</script>

<div style="margin-top: 30px;">
	<div style="font-size: 22px; font-weight: bold;">
		<span>MYPET 회원리스트</span>
	</div>

	<div style="width: 100%;">
		<table id="reservationTable" border="1">
			<thead>
				<tr>
					<th class="th">프로필 사진</th>
					<th class="th hidden">아이디</th>
					<th class="th" width="100">이름</th>
					<th class="th" width="140">연락처</th>
					<th class="th">펫시터 권한</th>
					<th class="th">펫쇼핑몰 권한</th>
					<th class="th">펫미용실 권한</th>
					<th class="th">수정</th>
			</thead>

			<tbody id="memList">
				<c:choose>
					<c:when test="${memList.size() == 0 }">
						<tr>
							<td class="td" colspan="7">회원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${memList }" var="list">
							<tr>
								<td class="td"><img src="${list.mem_img }" width="50px" height="50px;" /></td>
								<td class="td hidden"><input type="hidden" id="mem_id" value="${list.mem_id }"/></td>
								<td class="td">${list.mem_name }</td>
								<td class="td">${list.mem_hp }</td>
								<td class="td">
									<select id="mem_sit">
										<c:choose>
											<c:when test="${list.mem_sit == 1 }">
												<option value="2">Y</option>
												<option value="1" selected>N</option>	
											</c:when>
											<c:otherwise>
												<option value="2" selected>Y</option>
												<option value="1">N</option>
											</c:otherwise>
										</c:choose>
									</select>
								</td>
								<td class="td">
									<select id="mem_shop">
										<c:choose>
											<c:when test="${list.mem_shop == 1 }">
												<option value="2">Y</option>
												<option value="1" selected>N</option>	
											</c:when>
											<c:otherwise>
												<option value="2" selected>Y</option>
												<option value="1">N</option>
											</c:otherwise>
										</c:choose>
									</select>
								</td>
								<td class="td">
									<select id="mem_hair">
										<c:choose>
											<c:when test="${list.mem_hair == 1 }">
												<option value="2">Y</option>
												<option value="1" selected>N</option>	
											</c:when>
											<c:otherwise>
												<option value="2" selected>Y</option>
												<option value="1">N</option>
											</c:otherwise>
										</c:choose>
									</select>
								</td>
								<td class="td"><input type="button" onclick="memUpdate()" class="mypageBtn2" value="권한 수정" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<ul class="pagination">

	</ul>

</div>





