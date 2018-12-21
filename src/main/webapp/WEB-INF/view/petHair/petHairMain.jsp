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
			        marker.setTitle('러비펫살롱');
			        infowindow.setPosition(new daum.maps.LatLng(y, x));
			    }
			};

			
			var test = "엄사 중앙로 66";
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
			    content: ' 러비펫살롱'
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
				
				$("#lowfrm").submit();
			
		});
		
		//탑버튼 클릭이동
		$(".moveTop").click(function(){
			$("#shopDetail").scrollTop(0);
			
		});
		
	});

</script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->
	
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
		<input type="hidden" name="zip_low" id="hiddenLowInput"/>
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
						<option value="${zll.zip_low }">${zll.zip_low }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<%-- 왼쪽에 쭉 내려줄 미용실 list div --%>
		<div id="shopList">
			
			<%-- profile list block 한세트 시작--%>
			<%-- list 로 뿌려진 미용실의 요약정보 --%>
			<div class="shopProfile">
				<%--블록의 왼쪽  프로필사진 / 평점--%>
				<div class="profileLeft">
					
					<div class="profileImgBlock">
						<img src="/hairimg/testimgShop.jpg"/>
					</div>
					
					<div class="profileScore">
						☆☆☆☆☆
					</div>
					
				</div>
				
				<%-- 블록의 오른쪽  간략한 소개--%>
				<div class="profileRight">
					<div class="profileShopNm">
						러비펫살롱
					</div>
					<div class="profileText">
						안녕하세요 러비펫 살롱 입니다  할로할로 방가방가 빨리와서 머리해라 여기 개좋음 리얼임 가성비 성능 지존임 ㄱㄱㄱㄱㄱㄱㄱ
					</div>
				</div>
				
			</div>
			<%-- profile list block 한세트 끝 --%>
		
		</div>
		
		<%-- 오른쪽에 클릭한 미용실의 요약정보를 보여주는 div --%>
		<div id="shopDetail">
			<%-- 디테일 최고 윗줄 --%>
			<div id="sdHead">
				<div class="shopName sdHeadCom">
					미용실이름
				</div>
				<div class="shopScore sdHeadCom">
					☆☆☆☆☆
				</div>
				<div class="bookMark sdHeadCom">
					즐겨찾기등록
				</div>	
			
			</div>
			
			<%-- 이미지, 후기, 문의, 예약 버튼 블록  / 상세정보 / 후기조회 / --%>
			<div class="imgBlock">
				<%-- img block --%>
				<div class="shopImg">
					<img src="/hairimg/testimgShop.jpg"/>
				</div>
				
				<%-- 버튼 block --%>
				<div class="shopBtnBlock">
					<div onclick="move('.shopLoc')" class="shopBtn detailShop">
						상세정보
					</div>
					<div onclick="move('.shopRv')" class="shopBtn reviewShop">
						후기확인
					</div>
					<div class="shopBtn askShop">
						문의하기
					</div>
					<div class="shopBtn revShop">
						예약하기
					</div>
				</div>
				
				<%-- 가게 상세정보 부분 --%>
				<div class="shopDetail">
					<div class="shopLoc">
						<p>샵의 위치</p>
						<div id="map" style="width:500px;height:300px;"></div>
					</div>
					
					<div class="shopEx">
						<p>샵 특이사항, 영업시간 등등 소개글</p>
					</div>
					<div class="shopStyle">
						<p>샵에서 할수있는 스타일 목록</p>
						<br>
						<div class="styleList">
							<img src="https://via.placeholder.com/350x250"/>
						</div>
					</div>
					
					<div class="shopRv">
							<p> 리뷰 </p>
							<div class="shopRvHd">
							<span>작성자 : OOO </span> <span class="scorespan">☆☆☆☆☆</span> <br>
							<span>리뷰 내용</span>
							
							</div>
							<div class="shopRvHd">
							<span>작성자 : OOO </span> <span class="scorespan">☆☆☆☆☆</span> <br>
							<span>리뷰 내용</span>
							
							</div>
							<div class="shopRvHd">
							<span>작성자 : OOO </span> <span class="scorespan">☆☆☆☆☆</span> <br>
							<span>리뷰 내용</span>
							
							</div>
					</div>
				</div>
			</div>
			<%-- 종료종료 이미지, 후기, 문의, 예약 버튼 블록  / 상세정보 / 후기조회 / 종료종료 --%>
			
			
		</div>
		
	</div>
	<a class="moveTop"><img src="/hairimg/upArrow.png"/></a>
		
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>
</html>

























