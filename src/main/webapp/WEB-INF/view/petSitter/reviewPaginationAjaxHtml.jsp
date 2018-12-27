<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${page == 1 }">
		<li><a id="disabled"
			href="javascript:getReviewListHtml(1, '${stv_pst}');"> <span>&laquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:getReviewListHtml(1, '${stv_pst}');"
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${page > 1 }">
		<li><a
			href="javascript:getReviewListHtml(${page-1 }, '${stv_pst}');">
				<span aria-hidden="true">&lt;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a id="disabled"
			href="javascript:getReviewListHtml(1, '${stv_pst}');">
				<span aria-hidden="true">&lt;</span>
		</a></li>
	</c:otherwise>

</c:choose>
<c:forEach begin="1" end="${pageCnt }" var="i">

	<li><a href="javascript:getReviewListHtml(${i }, '${stv_pst}');">${i }</a></li>
</c:forEach>
<c:choose>
	<c:when test="${page eq pageCnt}">
		<li><a id="disabled"
			href="javascript:getReviewListHtml(${pageCnt }, '${stv_pst}');">
				<span aria-hidden="true">&gt;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a
			href="javascript:getReviewListHtml(${page+1 }, '${stv_pst}');">
				<span aria-hidden="true">&gt;</span>
		</a></li>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${page eq pageCnt }">
		<li><a id="disabled"
			href="javascript:getReviewListHtml(${pageCnt }, '${stv_pst}');"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a
			href="javascript:getReviewListHtml(${pageCnt }, '${stv_pst}');"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>