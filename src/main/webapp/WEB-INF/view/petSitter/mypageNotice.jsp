<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<div style="background-color: #6eb9b5; color : #fff; border-color:#6eb9b5; height : 50px; text-align: center; line-height: 50px;">
		<span style="font-size : 16px;">내가 쓴 후기글 내역</span>
	</div>
	
	<div style="margin-top:30px; width:100%;">
		<table id="reservationTable">
			<tr>
				<th class="th">번호</th>
				<th class="th">내용</th>
				<th class="th">작성일자</th>
			</tr>
			<c:choose>
				<c:when test="${myReviewList.size() == 0 }">
					<tr>
						<td colspan="3" class="td">등록한 후기글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${myReviewList }" var="list">
						<tr>
							<td class="td">${list.rnum }</td>
							<td class="td"><a href="/sit/sitDetail?pst_id=${list.pst_id }">${list.stv_text }</a></td>
							<td class="td"><fmt:formatDate value="${list.stv_date }" pattern="yyyy-MM-dd" /></td>
						</tr>			
					</c:forEach>	
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>