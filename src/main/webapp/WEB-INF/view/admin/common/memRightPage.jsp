<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${page == 1 }">
		<li><a id="disabled" href="javascript:memRight(1)"> <span>&laquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:memRight(1)" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${page > 1 }">
		<li><a href="javascript:memRight(1)"> <span aria-hidden="true">&lt;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a id="disabled" href="javascript:memRight(1)"> <span
				aria-hidden="true">&lt;</span>
		</a></li>
	</c:otherwise>

</c:choose>
<c:forEach begin="1" end="${pageCnt }" var="i">

	<li><a href="javascript:memRight(${i})">${i }</a></li>
</c:forEach>
<c:choose>
	<c:when test="${page eq pageCnt}">
		<li><a id="disabled" href="javascript:memRight(${pageCnt })">
				<span aria-hidden="true">&gt;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:memRight(${page+1 })"> <span
				aria-hidden="true">&gt;</span>
		</a></li>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${page eq pageCnt }">
		<li><a id="disabled" href="javascript:memRight(${pageCnt })"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:memRight(${pageCnt })" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>
