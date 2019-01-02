<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach items="${reviewList }" var="list">
	<div id="reviewDiv">
		<div id="userImg">
			<c:choose>
				<c:when test="${list.mem_profile == null }">
					<div style="border-radius:50%; height : 90px; background-image: url('/img/petimg/noimg.jpg'); background-repeat: no-repeat; background-size: cover;"></div>
				</c:when>
				<c:otherwise>
					<div style="border-radius:50%; height : 90px; background-image: url(''); background-repeat: no-repeat; background-size: cover;"></div>				
				</c:otherwise>
			</c:choose>
		</div>
		<div id="reviewContent">
			<div id="userName">
				<span style="display:block;">${list.mem_name }</span>
			</div>
			<div id="reviewText">
				<input type="hidden" id="stvId" value="${list.stv_id }" />
				<span style="display:block; width:530px;" id="revtext">${list.stv_text }</span>
				<input type="text" id="review_text" name="review_text" style="display: none;"/>
			</div>
			<div id="reviewDate">
				<span style="display:block;"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.stv_date }" /></span>
			</div>
		</div>
		<div id="reviewMD">
			<c:choose>
				<c:when test="${list.stv_mem == memVo.mem_id }">
					<div id="reviewMDBtn" >
						<input type="button" onclick="reviewUpdate()" id="reviewUpdate" value="수정"/>&nbsp;<input type="button" onclick="reviewDelete()" id="reviewDelete" value="삭제"/>
					</div>
					<div id="reviewMDBtn2" >
						<input type="button" onclick="reviewUpdate2()" id="reviewUpdate2" value="수정"/>&nbsp;<input type="button" onclick="reviewCancle()" id="reviewCancle" value="취소"/>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
		
</c:forEach>