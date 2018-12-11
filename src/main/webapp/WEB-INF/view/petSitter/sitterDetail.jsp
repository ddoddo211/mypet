<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sitterDetail.jsp</title>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href='/css/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='/css/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/js/moment.min.js'></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src='/js/fullcalendar.min.js'></script>

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
  
  </style>
  <script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: '2018-03-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2018-03-01',
        },
        {
          title: 'Long Event',
          start: '2018-03-07',
          end: '2018-03-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-03-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2018-03-11',
          end: '2018-03-13'
        },
        {
          title: 'Meeting',
          start: '2018-03-12T10:30:00',
          end: '2018-03-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2018-03-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2018-03-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2018-03-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2018-03-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2018-03-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2018-03-28'
        }
      ]
    });

  });

</script>
</head>

<body>
<%@include file="/WEB-INF/view/common/header.jsp"%>

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
				<div id="contentleft2">
					<div id="contentset">
						
					</div>
				</div>
			</div>
			<div id="contentright">
				<div id="contentright1">
					<span>예약을 원하는 날짜와 시간을 선택해주세요.</span> <br>
					<div id="contentDate">
						<input type="text" name="dateStart" id="dateStart" readonly/> ~
						<input type="text" name="dateEnd" id="dateEnd" readonly/>
					</div>
					<div id="contentPrice">
						<span>원</span> 
						<select>
							<option selected>15kg 미만</option>
							<option>15kg 이상</option>
						</select>
						<select>
							<option selected>1박</option>
							<option>데이케어</option>
						</select>
						<br><br>
						<dl>
							<dt class="priceDt">초과금액</dt>
							<dd class="priceDd">원</dd>
							<dt class="priceDt">부가세</dt>
							<dd class="priceDd">원</dd>
							<dt class="priceDt dlLast">총 합계</dt>
							<dd class="priceDd dlLast">원</dd>
						</dl>
						<div id="res">
							<button id="resultBtn">예약요청하기</button>
						</div>
					</div>
				</div>
				<div id="contentright2">
					<span>캘린더 미리보기</span>
					<div id="calendar"></div>
					<div id="calendarChk">
						<label>예약가능</label><label>예약불가능</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>