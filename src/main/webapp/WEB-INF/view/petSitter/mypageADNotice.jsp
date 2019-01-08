<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function revDelete(){
		var val = [];
		var k = "";
		$(':checkbox:checked').each(function(i) {
			val[i] = $(this).val();
			k += val[i] + " ";
		});
		deleteReview(k,1);
	}
</script>

<div id="mypageRightMain">
	<div style="background-color: #6eb9b5; color : #fff; border-color:#6eb9b5; height : 50px; text-align: center; line-height: 50px;">
		<span style="font-size : 16px;">예약 내역</span>
	</div>
	<!-- 펫시터 집으로 부르기 -->
	<div style=" margin-top : 30px;">
		<div style="font-size:22px; font-weight: bold;">
			<span>후기글 리스트</span>
		</div>
		<div style="width:100%;">
			<table id="reservationTable">
				<tr>
					<th class="th">구분</th>
					<th class="th">번호</th>
					<th class="th">게시글 번호</th>
					<th class="th" width="476px;">글 내용</th>
					<th class="th">작성자</th>
					<th class="th">작성일자</th>
				</tr>
				<c:choose>
					<c:when test="${reviewListAll.size() == 0 }">
						<tr>
							<td class="td" colspan="6">후기글이 없습니다.</td>
						</tr>				
					</c:when>
					<c:otherwise>
						<c:forEach items="${reviewListAll }" var="list">
							<tr>
								<td class="td"><input type="checkbox" name="" class="" value="${list.stv_id }" /></td>
								<td class="td">${list.rnum }</td>
								<td class="td">${list.stv_pst }</td>
								<td class="td">${list.stv_text }</td>
								<td class="td">${list.mem_name }</td>
								<td class="td"><fmt:formatDate value="${list.stv_date }" pattern="yyyy-MM-dd"/></td>
							</tr>
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
			<input type="button" onclick="revDelete()" class="mypageBtn" value="후기글 삭제"/> 
		</div>
	</div>
</div>
<div id="mypageRightMain2">
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
					<th class="th" width="476px;">글 내용</th>
					<th class="th">작성자</th>
					<th class="th">작성일자</th>
				</tr>
				<c:choose>
					<c:when test="${reviewListAll.size() == 0 }">
						<tr>
							<td class="td" colspan="6">후기글이 없습니다.</td>
						</tr>				
					</c:when>
					<c:otherwise>
						<c:forEach items="${reviewListAll }" var="list">
							<tr>
								<td class="td"><input type="checkbox" name="" class="" value="${list.stv_id }" /></td>
								<td class="td">${list.rnum }</td>
								<td class="td">${list.stv_pst }</td>
								<td class="td">${list.stv_text }</td>
								<td class="td">${list.mem_name }</td>
								<td class="td"><fmt:formatDate value="${list.stv_date }" pattern="yyyy-MM-dd"/></td>
							</tr>
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
			<input type="button" onclick="revDelete()" class="mypageBtn" value="후기글 삭제"/> 
		</div>
	</div>
</div>