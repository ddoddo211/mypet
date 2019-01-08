<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sitterDetail.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href='/css/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='/css/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/js/moment.min.js'></script>
<script src='/js/fullcalendar.min.js'></script>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  <style type="text/css">
  	#calendar {
  	height : 390px;
    max-width: 900px;
    margin: 0 auto;
  }
  
  .fc-row {
  	border-right-width : 0px !important;
  	margin-right : 0px !important;
  }
  
  .fc-scroller{
  	overflow: hidden !important;
  	height : 288px !important;
  }
  
  #dateStart, #dateEnd{
  	text-align: center;
  }
  
  .hidden{
  	display : none;
  }
  
  .show{
  	display : initial;
  }
  
  #reViewList{
  	font-size : 20px;
  	font-family: 'Work Sans', sans-serif;
  }
  
  #reviewAddMain{
  	width : 100%;
  	overflow : hidden;
  	margin-top : 10px;
  }
  
  #reviewWord{
  	float : left;
  } 
  
  #reviewBtn{
  	float : left;
  }
  
  #reviewAdd{
  	height : 51px;
  }
  
  #reviewDiv{
  	margin-top : 10px;
  	border-bottom : 1px solid #b2b2b2;
  	width : 100%;
  	overflow: hidden;
  }
  
  #userImg{
  	float : left;
  	width : 12%;
  	height : 100%;
  	margin : 0 auto;
  }
    
  #reviewContent{
  	width : 70%;
  	float : left;
  	margin-left : 20px;
  	min-height : 90px;
  }
  
  #reviewMD{
  	float:left;
  	width : 13%;
  	min-height: 90px;
  	margin-left : 5px;
  	display: table;
  }
  
  #reviewMDBtn{
  	display: table-cell;
  	vertical-align: middle;
  }
  
  .pagination{
  	padding : 0;
  	font-family: 'Work Sans', sans-serif;
  	font-size : 20px;
  	text-align: center;
  }
  
  .pagination > li {
  	display: inline-block;
  }
  
  .pagination > li > a {
  	float : left;
  	margin : 0 auto;
  }
  
  #review_text{
  	width : 530px;
  	height : 40px;
  }
  
  #reviewMDBtn2{
  	display: none;
  	vertical-align: middle;
  }
  
  .priceDt{
  	font-size : 20px;
  }
  
  .priceDd{
  	font-size : 20px;
  }
  
  .input_hidden{
  	outline: none;
    border: none;
    width: 63px;
    font-size: 19px;
  	text-align: right;
  	font-family: 'Nanum Brush Script', sans-serif; 
  }
  
  .input_hidden_1{
  	outline: none;
    border: none;
    color:#ffb813; 
    font-size: 48px; 
    font-family: 'Nanum Brush Script', sans-serif; 
    text-align: right;
    width : 105px;
  }
  
  .dayLength{
  	outline: none;
    border: none;
    font-size: 23px;
    width: 13px;
    font-family: 'Nanum Brush Script', sans-serif;
    text-align: right;
  }
  
  </style>

<script type="text/javascript">
	$(document).ready(function() {
		var price = ${pstVo.pst_price2};
		var today = new Date();
		$('#calendar').fullCalendar({
			header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay,listWeek'
		},
			defaultDate : today,
			locale : 'ko',
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : []

		});
		
		getReviewListHtml(1, "${pstVo.pst_id}");
		
		$("#reviewAdd").click(function(){
			var review_text = $("#review").val();
			$("#stv_text").val(review_text);
			
			$("#insertFrm").submit();
		});
		
		$("#resultBtn").click(function(){
			if($("#dateStart").val() > $("#dateEnd").val()){
				alert("날짜를 정확하게 입력해주세요.");
				return;
			}
		});
		

	});
	
	function AddComma(data_value) {
		return Number(data_value).toLocaleString('en').split(".")[0];
	}

	
	$(function(){
		// 달력 옵션 설정
		$("#dateStart").datepicker({ 
			// 달력에 옵션 설정하기
			dayNamesMin : [ "일", "월", "화", "수", "목",	"금", "토" ], // 요일에 표시되는 형식 설정
			dateFormat : "yy-mm-dd", //날짜 형식 설정
			monthNames : [ "1월", "2월", "3월", "4월","5월", "6월", "7월", "8월", "9월","10월", "11월", "12월" ], //월표시 형식 설정
			showAnim : "fold", //애니메이션효과
			minDate : "+1D",
			maxDate : "+3M",
			onClose : function(){
				$("#timeStart").timepicker({
					timeFormat : 'HH:mm',
					minTime: '09:00am',
				    maxTime: '21:00pm',
				    dynamic : false,
				    dropdown : true
				});	
			}
		});
		
		
		// 달력 옵션 설정
		$("#dateEnd").datepicker({ 
			// 달력에 옵션 설정하기
			dayNamesMin : [ "일", "월", "화", "수", "목",	"금", "토" ], // 요일에 표시되는 형식 설정
			dateFormat : "yy-mm-dd", //날짜 형식 설정
			monthNames : [ "1월", "2월", "3월", "4월","5월", "6월", "7월", "8월", "9월","10월", "11월", "12월" ], //월표시 형식 설정
			showAnim : "fold", //애니메이션효과
			minDate : "+1D",
			maxDate : "+3M",
			onClose : function(){
				var dateStart = $("#dateStart").val();
				var dateEnd = $("#dateEnd").val();
				if(dateStart > dateEnd){
					alert("시간을 잘못 설정 하셨습니다.");
					$("#dateStart").val("");
					$("#dateEnd").val("");
					$("#timeStart").val("");
					$("#timeEnd").val("");
					return;
				} else{
					var dateEndArr = dateEnd.split("-");
					var dateStartArr = dateStart.split("-");
					
					var dayLength = (dateEndArr[2] - dateStartArr[2]);
					var monthLength = (dateEndArr[1] - dateStartArr[1]);
					
					if((dayLength > 5) || (monthLength > 0)){
						alert("5일 이상 예약하실 수 없습니다.");
						$("#dateStart").val("");
						$("#dateEnd").val("");
						$("#timeStart").val("");
						$("#timeEnd").val("");
						return;
					}
					$("#timeEnd").timepicker({
						timeFormat : 'HH:mm',
						minTime: '09:00am',
					    maxTime: '21:00pm',
					    dynamic : false,
					    dropdown : true,
					    change : function(){
							var timeStart = $("#timeStart").val();
							var timeEnd = $("#timeEnd").val();
							var dayPrice = ${pstVo.pst_price2};
							var daycarePrice = ${pstVo.pst_price1};
							
							if(dayLength == 0){
								surtaxPrice = daycarePrice/10;
								totalPrice = daycarePrice + surtaxPrice;
								
								alert(dayLength);
								
								daycarePrice = AddComma(daycarePrice);
								surtaxPrice = AddComma(surtaxPrice);
								totalPrice = AddComma(totalPrice);
								
								$("#daycare").removeClass("hidden");
								$("#daycare").addClass("show");
								$("#daycarePrice").removeClass("hidden");
								$("#daycarePrice").addClass("show");
								
								$("#day").removeClass("show");
								$("#day").addClass("hidden");
								$("#dayPrice").removeClass("show");
								$("#dayPrice").addClass("hidden");
								
								$("#carePrice").val(daycarePrice);
								$("#surtaxPrice").val(surtaxPrice);
								$("#totalPrice").val(totalPrice);
								$("#totalPrice2").val(totalPrice);
								
							} else if((dayLength >= 1) && (dayLength < 5)){
								alert("저기");
								$("#daycare").addClass("hidden");
								$("#daycare").removeClass("show");
								$("#daycarePrice").addClass("hidden");
								$("#daycarePrice").removeClass("show");
								
								$("#day").addClass("show");
								$("#day").removeClass("hidden");
								$("#dayPrice").addClass("show");
								$("#dayPrice").removeClass("hidden");
								
								dayPrice = dayPrice * dayLength;
								surtaxPrice = dayPrice / 10;
								totalPrice = dayPrice + surtaxPrice;
								
								dayPrice = AddComma(dayPrice);
								surtaxPrice = AddComma(surtaxPrice);
								totalPrice = AddComma(totalPrice);
								totalPrice2 = totalPrice;
								
								$("#day_Price").val(dayPrice);
								$("#dayLength").val(dayLength);
								$("#surtaxPrice").val(surtaxPrice);
								$("#totalPrice").val(totalPrice);
								$("#totalPrice2").val(totalPrice2);
							}
					}
					});	
				}
			}
		});
		
		
	});
	
	function getReviewListHtml(page, stv_pst){
		var pageSize = 3;
		$.ajax({
			type : "POST",
			url  : "/sit/reviewPageListAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize+"&pst_id="+stv_pst,
			success : function(dt){
				$("#reViewList").html(dt);
				getReviewPagination(page, stv_pst);
			}
		});
	}
	
	function getReviewPagination(page, stv_pst){
		var pageSize = 3;
		$.ajax({
			type : "POST",
			url  : "/sit/reviewPaginationAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize+"&pst_id="+stv_pst,
			success : function(dt){
				$(".pagination").html(dt);
			}
		});
		
	}
	
	function reviewUpdate(){
		var revtext = document.getElementById("revtext");
		var review_text = document.getElementById("review_text");
		var review_btn = document.getElementById("reviewMDBtn");
		var review_btn2 = document.getElementById("reviewMDBtn2");
		
		$("#review_text").val(revtext.innerHTML);
		
		if(review_text.style.display == "none"){
			review_text.style.display = "block";
			revtext.style.display = "none";
		} else {
			review_text.style.display = "none";
			revtext.style.display = "block";
		}
		
		if(review_btn.style.display == "none"){
			review_btn.style.display = "table-cell";
			review_btn2.style.display = "none";
		} else{
			review_btn.style.display = "none";
			review_btn2.style.display = "table-cell";
		}
	}
	
	function reviewUpdate2(){
		var stvId = $("#stvId").val()
		$("#stv_id").val(stvId);
		var revtext = $("#review_text").val();
		$("#upReview").val(revtext);
		$("#updateFrm").submit();
	}
	
	function reviewCancle(){
		var revtext = document.getElementById("revtext");
		var review_text = document.getElementById("review_text");
		var review_btn = document.getElementById("reviewMDBtn");
		var review_btn2 = document.getElementById("reviewMDBtn2");
		
		revtext.style.display = "block";
		review_text.style.display = "none";
		review_btn.style.display = "table-cell";
		review_btn2.style.display = "none";
	}
	
	function reviewDelete(){
		var stvId = $("#stvId").val()
		$("#stvID").val(stvId);
		$("#deleteFrm").submit();
	}
	
	function str(k){
		alert(k);
	}
	
	
</script>
</head>

<body>
<%@include file="/WEB-INF/view/common/header.jsp"%>
<form action="/sit/insertReview" method="post" id="insertFrm">
	<input type="hidden" name="pst_id" value="${pstVo.pst_id }" />
	<input type="hidden" id="stv_text" name="stv_text"  />
</form>

<form action="/sit/updateReview" method="POST" id="updateFrm">
	<input type="hidden" name="pst_id" value="${pstVo.pst_id }" />
	<input type="hidden" id="stv_id" name="stv_id"  />
	<input type="hidden" id="upReview" name="revText" />
</form>

<form action="/sit/deleteReview" method="post" id="deleteFrm">
	<input type="hidden" name="pst_id" value="${pstVo.pst_id }" />
	<input type="hidden" id="stvID" name="stvID" />
</form>
<!-- 각자 화면 -->
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/petSitter.jsp"><img alt="이미지가 없습니다"
					src="/img/petSitterLogo2.jpg" width="200px;" /></a>
			</div>
			<div id="petSearch">
				<div id="word">
					<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color: #c1c1c1" />
				</div>
				<div id="searchButton">
					<a href="#" id="searchButton"></a>
				</div>
			</div>

			<!-- 우리 아이 등록하기 -->
			<div id="petInsert">
				<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg"
					width="240px;" height="100px;"></a>
			</div>
		</div>
	</div>
	<div id="body">
		<div id="petSitterMenu">
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp" %>
		</div>
		
		<div id="contentMain">
			<div id="contentleft">
				<div id="contentleft1">
					<img alt="상세이미지" src="${pstVo.pst_img }" id="contentImg" />
				</div>
				<div id="contentleft3">
					<div id="left3_1">
						<div id="left3_1_img"></div>
						<div id="left3_1_text">
							<span>돌봄가능한 강아지 크기 & 나이</span><br>
							<input type="hidden" id="pst_text" value="${pstVo.pst_text }" />
							<pre id="left3_1_textPre">${pstVo.pst_text}</pre>
						</div>
					</div>
					<div id="left3_2">
						<div id="left3_2_img"></div>
						<div id="left3_2_text">
							<span>체크인, 체크아웃 시간</span><br>
							<span>체크인&nbsp;&nbsp;&nbsp;&nbsp;${pstVo.pst_cidate }</span><br>
							<span>체크아웃&nbsp;&nbsp;${pstVo.pst_codate }</span>
						</div>
					</div>
				</div>
				<div id="contentleft2">
					<div id="contentset">
						<div style="width:100%; font-size:24px; font-weight : bold; padding-left : 10px; margin-bottom:5px;">
							<span>후기글</span>
						</div>
						<div id="reviewAddMain">
							<div id="reviewWord">
								<textarea rows="3" cols="100" id="review" name="review"></textarea>
							</div>
							<div id="reviewBtn">
								<input type="button" id="reviewAdd" name="reviewAdd" value="등록"/>
							</div>
						</div>
						<div id="reViewList">
							
						</div>
					</div>
					<ul class="pagination">

					</ul>
				</div>
			</div>
			<div id="contentright">
				<div id="contentright1">
					<span style="font-size:24px;">예약을 원하는 날짜와 시간을 선택해주세요.</span> <br>
					<div id="contentDate">
						<input type="text" name="dateStart" id="dateStart" value="" readonly="readonly"/>
						<input type="text" name="timeStart" id="timeStart" value="" readonly="readonly"/> ~
						<input type="text" name="dateEnd" id="dateEnd" value="" readonly="readonly" />
						<input type="text" name="timeEnd" id="timeEnd" value="" readonly="readonly"/>
					</div>
					<div id="contentPrice">
						<dl style="margin-top:50px;height: 60px;">
							<dt class="priceDt hidden" id="daycare">DayCare</dt>
							<dd class="priceDd hidden" id="daycarePrice"><input type="text" id="carePrice" class="input_hidden" value=" "/>원</dd>
							<dt class="priceDt show" id="day"><input type="text" id="dayLength" class="dayLength">박</dt>
							<dd class="priceDd show" id="dayPrice"><input type="text" id="day_Price" class="input_hidden" value=" "/>원</dd>
							<dt class="priceDt">부가세</dt>
							<dd class="priceDd"><input type="text" id="surtaxPrice" class="input_hidden" value=" "/>원</dd>
							<dt class="priceDt dlLast">총 합계</dt>
							<dd class="priceDd dlLast"><input type="text" id="totalPrice" class="input_hidden" value=" "/>원</dd>
						</dl>
						<br><br>
						<div style="margin-bottom:30px;">
							<span style="color:#ffb813; font-size: 48px;"><input type="text" class="input_hidden_1" id="totalPrice2" value=" "/>원</span>
						</div>
						<div id="res">
							<button id="resultRSBtn" onclick="window.location.reload()">초기화</button>
							<button id="resultBtn">예약요청하기</button>
						</div>
					</div>
				</div>
<!-- 				<div id="contentright2"> -->
<!-- 					<span>캘린더 미리보기</span> -->
<!-- 					<div id="calendar"></div> -->
<!-- 					<div id="calendarChk"> -->
<!-- 						<label>예약가능</label><label>예약불가능</label> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>