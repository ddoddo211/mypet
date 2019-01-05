<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
   <script>
   		
   if('${memVo}'==''){
		alert("로그인이 필요합니다");
		location.href="/hair/hairMain";
	}
   
   </script>
   
<div class="mpLeft">
			<div class="mpleftBlock"><a href="/hairMem/myPage?mem_id=${memVo.mem_id }" class="ina">마이페이지</a></div> 
			<div class="mpleftBlock"><a href="/hairMem/bookMark?mem_id=${memVo.mem_id }" class="ina">즐겨찾기 (미용실)		 </a></div> 
			<div class="mpleftBlock" id="history">
<%-- 				<a href="/hairMem/history?mem_id=${memVo.mem_id }&page=1" class="ina">이용내역	 </a> --%>
				<a href="#" class="ina">이용내역	 </a>
			</div> 
			<br>
			
			<br>
			
		<c:choose>
			<c:when test="${memVo.mem_hair==2 }">
				<div class="mpleftBlock"><a class="ina">접수된 의뢰		</a>			</div> 
				<div class="mpleftBlock"><a class="ina">진행중인 의뢰		</a>			</div> 
				<div class="mpleftBlock"><a href="/hairAdmin/askList?mem_id=${memVo.mem_id }" class="ina">문의내역			</a>			</div> 
				<div class="mpleftBlock"><a class="ina">나의 미용실 정보	</a>				</div> 
				<div class="mpleftBlock"><a class="ina">미용실 매출		</a>			</div>
				<br>
			
			</c:when>
		</c:choose>	
			
			<br>
			<div class="mpleftBlock"><a class="ina">미용사 등록하기		</a>			</div>
		</div>
		
		<form action="/hairMem/history" method="get" id="hisfrm">
			<input type="hidden" name="mem_id" id="hdId" value="${memVo.mem_id }"/>
			<input type="hidden" name="page" id="hdPg" value="1"/>
		</form>
		
		<script>
			$(document).ready(function(){
				
				$("#history").click(function(){
					
					$("#hisfrm").submit();
					
				});
				
			});
		</script>