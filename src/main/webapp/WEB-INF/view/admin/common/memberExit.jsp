<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div style="margin-top: 30px;">
	<div style="font-size: 22px; font-weight: bold;">
		<span>MYPET 회원리스트</span>
	</div>

	<div style="width: 100%;">
		<table id="reservationTable" border="1">
			<thead>
				<tr>
					<th class="th" width="100">구분</th>
					<th class="th">프로필 사진</th>
					<th class="th" width="100">이름</th>
					<th class="th" width="140">연락처</th>
					<th class="th">블랙리스트 여부</th>
					<th class="th">회원탈퇴 여부</th>
			</thead>

			<tbody id="memList">
				<c:choose>
					<c:when test="${memList.size() == 0 }">
						<tr>
							<td class="td" colspan="4">회원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${memList }" var="list">
							<tr>
								<td class="td"><input type="checkbox" name="mem_chk"
									value="${list.mem_id }" /></td>
								<td class="td"><img src="${list.mem_img }" width="50px"
									height="50px;" /></td>
								<td class="td">${list.mem_name }</td>
								<td class="td">${list.mem_hp }</td>
								<c:choose>
									<c:when test="${list.mem_black == 1 }">
										<td class="td">N</td>
									</c:when>
									<c:otherwise>
										<td class="td">Y</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.mem_exit == 1 }">
										<td class="td">N</td>
									</c:when>
									<c:otherwise>
										<td class="td">Y</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

	<ul class="pagination">

	</ul>

	<div style="width: 100%; height: 70px; overflow: hidden;">
		<div style="margin-top: 20px; float: right; margin-left: 20px;">
			<input type="button" onclick="memDelete()" class="mypageBtn"
				value="회원탈퇴" />
		</div>
		<div style="margin-top: 20px; float: right; margin-left: 20px;">
			<input type="button" onclick="memWhite()" class="mypageBtn"
				value="블랙리스트 해제" />
		</div>
		<div style="margin-top: 20px; float: right; margin-left: 20px;">
			<input type="button" onclick="memBlack()" class="mypageBtn"
				value="블랙리스트 설정" />
		</div>
	</div>
</div>





