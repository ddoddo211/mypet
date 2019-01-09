<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function pstDelete(){
		var val = [];
		var k = "";
		$(':checkbox:checked').each(function(i) {
			val[i] = $(this).val();
			k += val[i] + " ";
		});
		deleteSitterTo(k, 1);
	}
</script>

<div id="mypageRightMain">
	<div style=" margin-top : 30px;">
		<div style="font-size:22px; font-weight: bold;">
			<span>게시글 리스트(펫시터 집에 맡기기)</span>
		</div>
		<div style="width:100%;">
			<table id="reservationTable">
				<tr>
					<th class="th">구분</th>
					<th class="th">번호</th>
					<th class="th">이미지</th>
					<th class="th" width="476px;">글 제목</th>
					<th class="th">작성자</th>
					<th class="th">작성일자</th>
				</tr>
				<c:choose>
					<c:when test="${petSitterToListAll == null }">
						<tr>
							<td class="td" colspan="6">게시글이 없습니다.</td>
						</tr>				
					</c:when>
					<c:otherwise>
						<c:forEach items="${petSitterToListAll }" var="list">
							<c:if test="${list.pst_chk == 'N' }">
								<tr>
									<td class="td"><input type="checkbox" name="" class="" value="${list.pst_id }" /></td>
									<td class="td">${list.rnum }</td>
									<td class="td">
										<c:choose>
											<c:when test="${list.pst_img == null }">
												<img src="/img/petimg/noimg.jpg" style="width:50px; height:50px; border-radius: 10px;" />
											</c:when>
											<c:otherwise>
												<img src="${list.pst_img }" style="width:50px; height:50px; border-radius: 10px;" />
											</c:otherwise>
										</c:choose>
									</td>
									<td class="td">${list.pst_title }</td>
									<td class="td">${list.mem_name }</td>
									<td class="td"><fmt:formatDate value="${list.pst_date }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<ul class="pagination2">

		</ul>
	</div>
	
	<div style="width:100%; height:70px; overflow: hidden;">
		<div style="margin-top:20px;float:right;margin-left:20px;">
			<input type="button" onclick="pstDelete()" class="mypageBtn" value="게시글 삭제"/> 
		</div>
	</div>
</div>