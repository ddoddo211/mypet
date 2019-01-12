<%@page import="kr.co.mypet.common.model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<%-- daum 지도 관련 api --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12a015bea1b6b11bb0fd0d1e78cc44c&libraries=services,clusterer"></script>




<%-- 스크립트 위치 --%>
	<script type="text/javascript">
			function move(loc){
				var offset = $(loc).offset();
				$('#shopDetail').animate({scrollTop: (offset.top-280)},400);
				console.log(offset.top-250);
			}
			
			
	</script>

<script type="text/javascript">
	$(document).ready(function(){
			
		
			//원하는 좌표
			var x = 126.570667;
			var y = 33.450701;
		
			//지도 관련
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(y, x), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

			var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			//좌표 변환 service
			var geocoder = new daum.maps.services.Geocoder();
			
			
			var callback = function(result, status) {
			    if (status === daum.maps.services.Status.OK) {
			        console.log(result);
			        console.log(result[0]['y']);
			        console.log(result[0]['x']);
			        y = Number(result[0]['y']);
			        x = Number(result[0]['x']);
			        map.setCenter(new daum.maps.LatLng(y, x));
			        marker.setPosition(new daum.maps.LatLng(y, x));
			        marker.setTitle('${hairShopVo.has_name}');
			        infowindow.setPosition(new daum.maps.LatLng(y, x));
			    }
			};

			
			var test = "${hairShopVo.has_addr}";
			geocoder.addressSearch(test, callback);
			
			
		
			
			
			//마커 클러스터링 메서드
			var clusterer = new daum.maps.MarkerClusterer({
			    map: map,
			    //markers: markers,
			   // gridSize: 35,
			    averageCenter: true,
			    minLevel: 6
			    //,
// 			    disableClickZoom: true,
// 			    styles: [{
// 			        width : '53px', height : '52px',
// 			        background: 'url(cluster.png) no-repeat',
// 			        color: '#fff',
// 			        textAlign: 'center',
// 			        lineHeight: '54px'
// 			    }]
			});
			
			var marker = new daum.maps.Marker({
				position: new daum.maps.LatLng(y, x)
			});

			console.log("y : "+y + "  x : "+x);
			
			clusterer.addMarker(marker);
			
			//info window
			var infowindow = new daum.maps.InfoWindow({
			    position: new daum.maps.LatLng(y, x),
			    content: ' ${hairShopVo.has_name}'
			});

			infowindow.open(map, marker);
			
			
		//대분류 값변화시 소분류 목록을 불러오기위해 form 태그 발동
		$("#zipHigh").change(function(){
			$("#hiddenZipInput").val(
				$("#zipHigh").val()		
			);
			
			$("#zipfrm").submit();
			
		});
		
		
		//소분류를 선택하면 그 지역의 전체 목록이 출력된다
		$("#zipLow").change(function(){
			$("#hiddenLowInput").val(
					$("#zipLow").val()		
				);
			
			$("#hiddenZipInputL").val(
					$("#zipHigh").val()		
				);
				
				$("#lowfrm").submit();
			
		});
		
		//리스트 클릭시 가게의 detail 표시 function
		$(".shopProfile").click(function(){
			$("#hiddenLowInputD").val(
					$("#zipLow").val()		
				);
			
			$("#hiddenZipInputD").val(
					$("#zipHigh").val()		
				);
			
			$("#hiddenHasId").val(
				$(this).children(".sel_id").val()		
			);
			console.log("넘겨줄 has_id : "+$("hiddenHasId").val());
				
			
				$("#detailfrm").submit();
			
		});
		
		
		//탑버튼 클릭이동
		$(".moveTop").click(function(){
			$("#shopDetail").scrollTop(0);
			
		});
		
		//문의하기
		$(".askShop").click(function(){
			$(".askInput").toggle("fast");
		});
		
		$(".askBtn").click(function(){
			
			if(<%=session.getAttribute("memVo")==null%>){
				alert("로그인이 필요합니다 로그인해주세요");
				return;
			}
			
			if($(".askta").val()==""){
				alert("내용을 입력해 주세요");
				return;
				
			}
			
			$("#hiddenLowInputA").val(
					$("#zipLow").val()		
			);
			
			$("#hiddenZipInputA").val(
					$("#zipHigh").val()		
			);
			
			$("#hiddenAskText").val(
				$(".askta").val()		
			);
			
				
			alert("문의가 접수되었습니다 (답변은 mypage 에서 확인하실수 있습니다)");
			$("#askfrm").submit();
			
		});
		
		
		//즐겨찾기 등록 (detail 과 유사하며 bookmart insert실행)
		//리스트 클릭시 가게의 detail 표시 function
		$(".bookMark").click(function(){
			
			if(<%=session.getAttribute("memVo")==null%>){
				alert("로그인이 필요합니다 로그인해주세요");
				
				return;
			}
			
			var has_name = $(".shopName").text().trim();
			var result=confirm(has_name + " 을 즐겨찾기에 등록하시겠습니까?????");
			
			if(!result){
				return;
			}
			
			
			$("#hiddenLowInputD").val(
					$("#zipLow").val()		
				);
			
			$("#hiddenZipInputD").val(
					$("#zipHigh").val()		
				);
			
			$("#hiddenHasId").val(
				$(this).children(".bmHidden").val()		
			);
			console.log("넘겨줄 has_id : "+$("hiddenHasId").val());
			
			$("#bmChk").val("yes");
			
				$("#detailfrm").submit();
			
		});
		
		//예약하기 메뉴 진입클릭
		$(".revShop").click(function(){
			
			//로그인정보 없으면 예약하기 화면으로 갈 수 없다
			if(<%=session.getAttribute("memVo")==null%>){
				alert("로그인이 필요합니다 로그인해주세요");
				return;
			}
			
			
			
			
			
			$("#revfrm").submit();
		});
		
		
		
	});
	
	

</script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->
	

<c:if test="${bmDup!=null }">
	<script>
		alert("이미 즐겨찾기에 등록되어있습니다");
	</script>

</c:if>
	<!-- header 시작 -->
	<%@include file="petHairHeader.jsp"%>
	<!-- header 끝-->
	
	<%-- 전체 틀 div --%>
	<div id="mainmid">
	
	<%-- 주소 데이터 전송  hidden form--%>
	<form id="zipfrm" action="/hair/selectLow" method="post">
		<input type="hidden" name="zip_high" id="hiddenZipInput"/>
	</form>
	
	<%--소분류 선택 후 미용실 리스트 출력 form --%>
	<form id="lowfrm" action="/hair/selectShop" method="post">
		<input type="hidden" name="zip_high" id="hiddenZipInputL"/>
		<input type="hidden" name="zip_low" id="hiddenLowInput"/>
	</form>
	
	<%-- 미용실 목록 클릭시 상세정보 표시 form --%>
	<form id="detailfrm" action="/hair/shopDetail" method="post">
		<input type="hidden" name="zip_high" id="hiddenZipInputD"/>
		<input type="hidden" name="zip_low" id="hiddenLowInputD"/>
		<input type="hidden" name="has_id" id="hiddenHasId"/>
		<input type="hidden" name="bmChk" id="bmChk" value="no"/>
		<c:choose>
			<c:when test="${memVo!=null }">
				<input type="hidden" name="bmid" id="bmId" value="${memVo.mem_id }"/>
			</c:when>
			<c:otherwise>
			
				<input type="hidden" name="bmid" id="bmId" value="no"/>
			</c:otherwise>
		</c:choose>
	</form>
	
	<%-- 문의하기 클릭시 넘어가는 form --%>
	<form id="askfrm" action="/hair/askShop" method="post">
		<input type="hidden" name="zip_high" id="hiddenZipInputA"/>
		<input type="hidden" name="zip_low" id="hiddenLowInputA"/>
		<input type="hidden" name="has_id" id="hiddenHasIdA" value="${hairShopVo.has_id }"/>
	
		<input type="hidden" name="hbrd_text" id="hiddenAskText"/>
		<input type="hidden" name="hbrd_has" id="hiddenAskShop" value="${hairShopVo.has_id }"/>

	<c:choose>
		<c:when test="${memVo!=null }">
			<input type="hidden" name="hbrd_mem" id="hiddenAskShopID" value="${memVo.mem_id }"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="hbrd_mem" id="hiddenAskShopID" value="nologin"/>
		
		</c:otherwise>
	</c:choose>
		
		
	</form>
	
	<%-- 예약하기 눌렀을때 전송 form --%>
	<form id="revfrm" action="/hair/revShop" method="get">
		<c:choose>
		<c:when test="${memVo!=null }">
			<input type="hidden" name="mem_id" id="revShopMem" value="${memVo.mem_id }"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="mem_id" id="revShopMem" value="nologin"/>
		
		</c:otherwise>
	</c:choose>
		<input type="hidden" name="has_id" id="revShopHas" value="${hairShopVo.has_id }" />
	</form>
	
		
		<%-- 상단 주소 선택 div --%>
		<div id="shopAddr">
			<div id="zipMent"><div class="innerMent">지역을 선택해 주세요</div> <div class="innerMent"><img src="/img/petHair/arrowO.jpg"/></div> </div>
			
			<div id="zipCon">
				<select id="zipHigh"  class="zipSelect" name="zip_high">
					<option value="">:: 광역(특별)시 / 도 :: </option>
					<c:forEach items="${zipHighList }" var="zl">
						<c:choose>
							<c:when test="${zip_high==zl.zip_high }">
								<option value="${zl.zip_high }" selected="selected">${zl.zip_high }</option>
							
							</c:when>
							
							<c:otherwise>
								<option value="${zl.zip_high }">${zl.zip_high }</option>
							
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				
				<select id="zipLow" class="zipSelect" name="zip_low"> 
					<option value=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :: 구  / 시 :: </option>
					<c:forEach items="${zipLowList }" var="zll">
						<c:choose>
							<c:when test="${zip_low==zll.zip_low }">
								<option value="${zll.zip_low }" selected="selected">${zll.zip_low }</option>
							</c:when>
							<c:otherwise>
								<option value="${zll.zip_low }">${zll.zip_low }</option>
							
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<%-- 왼쪽에 쭉 내려줄 미용실 list div --%>
		<div id="shopList">
			
			<%-- profile list block 한세트 시작--%>
			<%-- list 로 뿌려진 미용실의 요약정보 --%>
			<c:forEach items="${hairShopList }" var="hs">
			<div class="shopProfile">
				<%-- detail 확인용 숨겨진 input id --%>
				<input type="hidden" class="sel_id" value="${hs.has_id }"/>
				<%--블록의 왼쪽  프로필사진 / 평점--%>
				<div class="profileLeft">
					
					<div class="profileImgBlock">
						<img src="/hairimg/${hs.has_img }"/>
					</div>
					
					<div class="profileScore">
						<c:forEach begin="1" end="${hs.has_score }">
						☆
						</c:forEach>
					</div>
					
				</div>
				
				<%-- 블록의 오른쪽  간략한 소개--%>
				<div class="profileRight">
					<div class="profileShopNm">
						${hs.has_name }
					</div>
					<div class="profileText">
						${hs.has_ptext }
					</div>
				</div>
				
			</div>
			</c:forEach>
			<%-- profile list block 한세트 끝 --%>
		
		</div>
		
		<%-- 오른쪽에 클릭한 미용실의 요약정보를 보여주는 div --%>
		<c:choose>
			<c:when test="${hairShopVo!=null }">
				<div id="shopDetail">
					<%-- 디테일 최고 윗줄 --%>
					<div id="sdHead">
						<div class="shopName sdHeadCom">
							${hairShopVo.has_name }
						</div>
						<div class="shopScore sdHeadCom">
							<c:forEach begin="1" end="${hairShopVo.has_score }">
							☆
							</c:forEach>
						</div>
						<div class="bookMark sdHeadCom">
							즐겨찾기등록
							<input class="bmHidden" type="hidden" value="${hairShopVo.has_id }"/>
						</div>	
					
					</div>
					
					<%-- 이미지, 후기, 문의, 예약 버튼 블록  / 상세정보 / 후기조회 / --%>
					<div class="imgBlock">
						<%-- img block --%>
						<div class="shopImg">
							
							<img src="/hairimg/${hairShopVo.has_img }"/>
						</div>
						
						<%-- 버튼 block --%>
						<div class="shopBtnBlock">
							<div onclick="move('.shopLoc')" class="shopBtn detailShop">
								상세정보
							</div>
							<div onclick="move('.shopRv')" class="shopBtn reviewShop">
								후기확인
							</div>
							<div  class="shopBtn askShop">
								문의하기
							</div>
							<div class="shopBtn revShop">
								예약하기
							</div>
						</div>
						
						<%-- 숨겨져있는 문의하기 input 창 --%>
						<div class="askInput">
							<div class="asktt">
								<p>문의하기</p>
							</div>
							<div class="askInputBox">
								<textarea class="askta" name="hbrd_text" ></textarea>
							</div>
							
							<input class="askBtn" type="submit" value="문의하기" />
						</div>
						
						<%-- 가게 상세정보 부분 --%>
						<div class="shopDetail">
							<div class="shopLoc">
								<p>샵의 위치</p>
								<div id="map" style="width:500px;height:300px;"></div>
							</div>
							
							<div class="shopEx">
								<p>샵 특이사항, 영업시간 등등 소개글</p>
								${hairShopVo.has_text }
							</div>
							<div class="shopStyle">
								<p>샵에서 할수있는 스타일 목록</p>
								<br>
								<div class="styleList">
									<c:forEach items="${styleList }" var="sl">
										<div class="styleBlock">
										<img src="/hairimg/${sl.pts_img }"/>
										<br>
										<span>${sl.pts_name }</span> <span>${sl.pts_price }원</span>
										</div>
										<br>
									</c:forEach>
								</div>
							</div>
							<br>
							<div class="shopRv">
									<p> 리뷰 </p>
										<c:choose>
											<c:when test="${reviewList!=null }">
												<c:forEach items="${reviewList }" var="rl">
													<div class="shopRvHd">
													<span>작성자 : ${rl.hbrd_mem } </span> <span class="scorespan">제목 : ${rl.hbrd_title }</span> 
													
													<span>
														 / 
														<c:forEach begin="1" end="${rl.hbrd_score }">
															★
														</c:forEach>
													</span>
													
													 <br>
													<span>${rl.hbrd_text }</span>
													
													</div>
												
												</c:forEach>
											
											</c:when>
											<c:otherwise>
												<div class="shopRvHd">
												<span> - 등록된 리뷰가 없습니다  -</span> 
												
												</div>
											</c:otherwise>
										</c:choose>
									
							</div>
						</div>
					</div>
					<%-- 종료종료 이미지, 후기, 문의, 예약 버튼 블록  / 상세정보 / 후기조회 / 종료종료 --%>
					
					
				</div>
			
			</c:when>
			<c:otherwise>
				<div><h2>클릭안했을때의 화면</h2></div>
				<div id="map" style="width:500px;height:300px; display:none;"></div>
			</c:otherwise>
		</c:choose>
		
	</div>
	<a class="moveTop"><img src="/hairimg/upArrow.png"/></a>
		
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>
</html>

























