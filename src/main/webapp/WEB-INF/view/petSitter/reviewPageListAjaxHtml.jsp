<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function(){
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  
		  return false;
	});
	
	$(".reviewUpdate").click(function(){
		var revtext = $(this).parent().parent().parent().children().children().children(".revtext").val();
		$(this).parent().parent().parent().children().children().children(".review_text").val(revtext);
		
		$(this).parent().parent().parent().children().children().children(".revText").hide();
		$(this).parent().parent().parent().children().children().children(".review_text").show();
		
		var score = $(this).parent().parent().parent().children().children().children(".rev_score").children(".rScore").val();
		
		$("select option").each(function(){
			if ($(this).val() == score)
			$(this).attr("selected","selected");
		});
		
		$(this).parent().parent().parent().children().children().children(".rev_score").hide();
		$(this).parent().parent().parent().children().children().children(".starRev").show();
		
		$(this).parent(".reviewMDBtn").hide();
		$(this).parent().parent().children(".reviewMDBtn2").show();
		
	});
	
	$(".reviewUpdate2").click(function(){
		var staId = $(this).parent().parent().parent().children().children().children(".stvId").val();
		var staPst = $(this).parent().parent().parent().children().children().children(".stvPst").val();
		var review_text = $(this).parent().parent().parent().children().children().children(".review_text").val();
		var score = $(this).parent().parent().parent().children().children().children(".starRev").children(".review_score").val();
		
		$("#pst_id").val(staPst);
		$("#stv_id").val(staId);
		$("#upReview").val(review_text);
		$("#stvScore").val(score);
		
		$("#updateFrm").submit();
	});
	
	$(".reviewCancle").click(function(){
		$(this).parent().parent().parent().children().children().children(".review_text").hide();
		$(this).parent().parent().parent().children().children().children(".revText").show();
		
		$(this).parent().parent().parent().children().children().children(".rev_score").show();
		$(this).parent().parent().parent().children().children().children(".starRev").hide();
		
		$(this).parent(".reviewMDBtn2").hide();
		$(this).parent().parent().children(".reviewMDBtn").show();
	});
	
	$(".reviewDelete").click(function(){
		var stvId = $(this).parent().parent().parent().children().children().children(".stvId").val();
		var stvPst = $(this).parent().parent().parent().children().children().children(".stvPst").val();
		
		$("#pstId").val(stvPst);
		$("#stvID").val(stvId);
		
		$("#deleteFrm").submit();
	});
	
});
</script>
<form action="/sit/updateReview" method="POST" id="updateFrm">
	<input type="hidden" id="pst_id" name="pst_id"  />
	<input type="hidden" id="stv_id" name="stv_id"  />
	<input type="hidden" id="upReview" name="revText" />
	<input type="hidden" id="stvScore" name="stv_score"  />
</form>

<form action="/sit/deleteReview" method="post" id="deleteFrm">
	<input type="hidden" name="pstId" id="pstId" />
	<input type="hidden" id="stvID" name="stvID" />
</form>
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
				<span style="display:block; float:left;">${list.mem_name } /&nbsp;</span>
				<div class="rev_score">
					<c:forEach begin="1" end="${list.stv_score }">
						<span>★</span>
					</c:forEach>
					<input type="hidden" class="rScore" value="${list.stv_score }" />
				</div>
				<div class="starRev" style="display:none;">
					<select class="review_score">
						<option value="1">★</option>
						<option value="2">★★</option>
						<option value="3">★★★</option>
						<option value="4">★★★★</option>
						<option value="5">★★★★★</option>
					</select>
				</div>
			</div>
			<div id="reviewText">
				<input type="hidden" class="stvId" value="${list.stv_id }" />
				<input type="hidden" class="stvPst" value="${list.stv_pst }" />
				<span style="display:block; width:530px;" class="revText" >${list.stv_text }</span>
				<input type="hidden" class="revtext" value="${list.stv_text }" />
				<input type="text" class="review_text" name="review_text" style="display: none;"/>
			</div>
			<div id="reviewDate">
				<span style="display:block;"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.stv_date }" /></span>
			</div>
		</div>
		<div id="reviewMD">
			<c:choose>
				<c:when test="${list.stv_mem == memVo.mem_id }">
					<div class="reviewMDBtn" >
						<input type="button" id="reviewUpdate" class="reviewUpdate" value="수정"/>&nbsp;<input type="button" id="reviewDelete" class="reviewDelete" value="삭제"/>
					</div>
					<div class="reviewMDBtn2" >
						<input type="button" id="reviewUpdate2" class="reviewUpdate2" value="수정"/>&nbsp;<input type="button" id="reviewCancle" class="reviewCancle" value="취소"/>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
		
</c:forEach>