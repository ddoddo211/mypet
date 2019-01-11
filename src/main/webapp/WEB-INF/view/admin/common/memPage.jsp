<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${page == 1 }">
		<li><a id="disabled" href="javascript:memExit(1)"> <span>&laquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:memExit(1)" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${page > 1 }">
		<li><a href="javascript:memExit(1)"> <span aria-hidden="true">&lt;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a id="disabled" href="javascript:memExit(1)"> <span
				aria-hidden="true">&lt;</span>
		</a></li>
	</c:otherwise>

</c:choose>
<c:forEach begin="1" end="${pageCnt }" var="i">

	<li><a href="javascript:memExit(${i})">${i }</a></li>
</c:forEach>
<c:choose>
	<c:when test="${page eq pageCnt}">
		<li><a id="disabled" href="javascript:memExit(${pageCnt })">
				<span aria-hidden="true">&gt;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:memExit(${page+1 })"> <span
				aria-hidden="true">&gt;</span>
		</a></li>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${page eq pageCnt }">
		<li><a id="disabled" href="javascript:memExit(${pageCnt })"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:memExit(${pageCnt })" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>
