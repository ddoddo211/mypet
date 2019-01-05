<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function mypetInsert(){
		location.href ="/sit/mypetInsertView?cnt=1";
	}
	
	$(function() {
		$("#mypetDelete").click(function() {
			var val = [];
			var k = "";
			$(':checkbox:checked').each(function(i) {
				val[i] = $(this).val();
				k += val[i] + " ";
			});
			if(k == ''){
				alert("삭제할 반려동물의 정보를 선택해주세요.");
				return;
			}
			mypetDelete(k);
		});
	});
	
	function mypetUpdate(){
		var k = "";
		$(':checkbox:checked').each(function(i) {
			if(i > 0){
				alert("하나만 선택가능합니다.");
				return;
			} else{
				k = $(this).val();
			}
			
		});
		if(k == ''){
			alert("수정하고싶은 반려동물 정보를 선택해주세요.");
			return;
		}
		$("#mypetId").val(k);
		$("#mypetUpdateFrm").submit();
	}
</script>
<form action="/sit/mypetUpdateView" method="post" id="mypetUpdateFrm">
	<input type="hidden" id="mypetId" name="mypet_id" />
</form>
<div id="mypageRightMain">
	<div style="background-color: #6eb9b5; color: #fff; border-color: #6eb9b5; height: 50px; text-align: center; line-height: 50px;">
		<span style="font-size: 16px;">반려동물 정보</span>
	</div>
	
	<div style="margin-top : 30px;">
		<table id="reservationTable">
			<tr>
				<th class="th">구분</th>
				<th class="th">이미지</th>
				<th class="th">이름</th>
				<th class="th">종류</th>
				<th class="th">생일</th>
				<th class="th">성별</th>
			</tr>
			
			<c:choose>
				<c:when test="${mypetList.size() == 0}">
					<tr>
						<td colspan="6" class="td">반려동물의 정보가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${mypetList }" var="list">
						<c:if test="${list.myp_del eq 'N' }">
							<tr>
								<td class="td"><input type="checkbox" class="" name="chk_mypet" value="${list.myp_id }"/></td>
								<c:choose>
									<c:when test="${list.myp_img != null }">
										<td class="td"><img src="${list.myp_img }" style="width:50px; height:50px; border-radius: 10px; border:2px dashed #c1c1c1;" /></td>	
									</c:when>
									<c:otherwise>
										<td class="td"><img src="/img/petimg/noimg.jpg" style="width:50px; height:50px; border-radius: 10px;" /></td>						
									</c:otherwise>
								</c:choose>
								<td class="td">${list.myp_name }</td>
								<td class="td">${list.petk_name }</td>
								<td class="td"><fmt:formatDate value="${list.myp_birth }" pattern="yyyy-MM-dd" /></td>
								<td class="td">${list.myp_gender }</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div style="width:100%; height:70px; overflow: hidden;">
		<div style="margin-top:20px;float:right; margin-left:10px;">
			<input type="button" id="mypetDelete" class="mypageBtn" value="삭제"/> 
		</div>
		<div style="margin-top:20px;float:right;margin-left:10px;">
			<input type="button" onclick="mypetUpdate()" class="mypageBtn" value="수정"/> 
		</div>
		<div style="margin-top:20px;float:right;">
			<input type="button" onclick="mypetInsert()" class="mypageBtn" value="추가"/> 
		</div>
	</div>
</div>