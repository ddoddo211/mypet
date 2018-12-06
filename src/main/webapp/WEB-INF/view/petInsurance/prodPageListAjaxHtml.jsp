<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${pageList}" var="prod">
	<tr class="tr1">
		<c:choose>
			<c:when test = "${prod.insp_join == '강아지'}">
				<td><img alt="이미지가 없습니다" src="/img/petInsurance/petKind.jpg" width="40px" height="40px">${prod.insp_join}</td>
			</c:when>
			<c:otherwise>
				<td><img alt="이미지가 없습니다" src="/img/petInsurance/petKind2.jpg" width="40px" height="40px">${prod.insp_join}</td>
			</c:otherwise>
		</c:choose>
		<td>${prod.insp_kind}</td>
		<td><%="월 "%>${prod.insp_fees}<%="원"%></td>
		<td>${prod.insp_minage}<%="~"%>${prod.insp_maxage}<%="세"%></td>
		<td><%="가입 기간 부터 ~"%>${prod.insp_period}<%="세 까지"%></td>
		<td>${prod.insp_sick}</td>
	</tr>
</c:forEach>