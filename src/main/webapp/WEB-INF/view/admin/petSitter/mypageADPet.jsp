<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function petDelete(){
		var val = [];
		var k = "";
		$(':checkbox:checked').each(function(i) {
			val[i] = $(this).val();
			k += val[i] + " ";
		});
		if(k==''){
			alert("선택해주세요.");
			return;
		}
		deletePet(1, k);
	}
</script>

<div id="mypageRightMain">
	<div style=" margin-top : 30px;">
		<div style="font-size:22px; font-weight: bold;">
			<span>반려동물 리스트</span>
		</div>
		<div style="width:100%;">
			<table id="reservationTable">
				<tr>
					<th class="th">구분</th>
					<th class="th">주인 이름</th>
					<th class="th">동물종류 </th>
					<th class="th">동물하위종류</th>
					<th class="th">이미지</th>
					<th class="th">반려동물 이름</th>
					<th class="th">반려동물 생일</th>
				</tr>
				<c:choose>
					<c:when test="${petListAll == null }">
						<tr>
							<td class="td" colspan="6">게시글이 없습니다.</td>
						</tr>				
					</c:when>
					<c:otherwise>
						<c:forEach items="${petListAll }" var="list">
							<c:if test="${list.myp_del == 'N' }">
								<tr>
									<td class="td"><input type="checkbox" name="" class="" value="${list.myp_id }" /></td>
									<td class="td">${list.mem_name }</td>
									<td class="td">${list.am_name }</td>
									<td class="td">${list.petk_name }</td>
									<td class="td">
										<c:choose>
											<c:when test="${list.myp_img == null }">
												<img src="/img/petimg/noimg.jpg" style="width:50px; height:50px; border-radius: 10px;" />
											</c:when>
											<c:otherwise>
												<img src="${list.myp_img }" style="width:50px; height:50px; border-radius: 10px;" />
											</c:otherwise>
										</c:choose>
									</td>
									<td class="td">${list.myp_name }</td>
									<td class="td"><fmt:formatDate value="${list.myp_birth }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<ul class="pagination">

		</ul>
	</div>
	
	<div style="width:100%; height:70px; overflow: hidden;">
		<div style="margin-top:20px;float:right;margin-left:20px;">
			<input type="button" onclick="petDelete()" class="mypageBtn" value="반려동물 삭제"/> 
		</div>
	</div>
</div>