<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$(function(){
		$("#revInsert").click(function(){
			location.href = "/sit/faqInsertView";
		});
		
		$("#revDelete").click(function(){
			var val = [];
			var k = "";
			$(':checkbox:checked').each(function(i) {
				val[i] = $(this).val();
				k += val[i] + " ";
			});
			
			getFaqDelete(k);
		});
	});
</script>
<!-- <form action="/sit/mypageFaqDelete" method="post" id="revDeleteFrm"> -->
<!-- 	<input type="hidden" id="faq_id" name="faq_id" /> -->
<!-- </form> -->
<div>
	<div style="background-color: #6eb9b5; color : #fff; border-color:#6eb9b5; height : 50px; text-align: center; line-height: 50px;">
		<span style="font-size : 16px;">FAQ 관리</span>
	</div>
	
	<div style="margin-top:30px; width:100%;">
		<table id="reservationTable">
			<tr>
				<th class="th">구분</th>
				<th class="th">번호</th>
				<th class="th">제목</th>
				<th class="th">작성일자</th>
			</tr>
			<c:forEach items="${faqList }" var="list">
				<tr>
					<td class="td"><input type="checkbox" class="revChk" value="${list.psf_id }"/></td>
					<td class="td">${list.rnum }</td>
					<td class="td">${list.psf_name }</td>
					<td class="td"><fmt:formatDate value="${list.psf_date }" pattern="yyyy-MM-dd" /></td>
				</tr>			
			</c:forEach>	
		</table>
	</div>

	<div style="width: 100%; height: 70px; overflow: hidden;">
		<div style="margin-top: 20px; margin-left:30px; float: right;">
			<input type="button" id="revDelete" class="mypageBtn" value="삭제" />
		</div>
		<div style="margin-top: 20px; float: right;">
			<input type="button" id="revInsert" class="mypageBtn" value="등록" />
		</div>
	</div>
</div>