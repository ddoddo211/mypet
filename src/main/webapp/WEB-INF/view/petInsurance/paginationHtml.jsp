<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 화면에서 페이지수 나오는 부분  -->
<c:forEach begin="1" end="${pageCnt }" var="page">
		<li><a href="javascript:getProdListHtml(${page});">${page}</a></li>
</c:forEach>



