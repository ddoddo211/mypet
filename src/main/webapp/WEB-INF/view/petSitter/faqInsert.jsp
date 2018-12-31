<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqUpdate.jsp</title>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
	$(document).ready(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors, // 전역변수 명과 동일해야 함.
			elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
			sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
			fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, 
			}
		});
		
		// 전송버튼 클릭이벤트
		$("#faq_insert").click(function(){
			if(confirm("저장하시겠습니까?")) {
				// id가 smarteditor인 textarea에 에디터에서 대입
				oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
				// 이부분에 에디터 validation 검증
				if(validation()) {
					$("#frm").submit();
				}
			}
		})
		
		$("#faq_cancle").click(function(){
			history.back();
		});
		
	});
	
	function validation(){
		var contents = $.trim(oEditors[0].getContents());
		if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false;
		}
		return true;
	}
</script>

<style type="text/css">
	#faqUpdate{
		width : 90%;
		margin : 0 auto;
	}
	
	#faqMain{
		border-radius : 10px;
		width : 100%;
		min-height : 650px;
		margin : 0 auto;
		overflow: hidden;
		padding-left: 45px;
	}
	
	#faq_Title{
		margin-top : 20px;
		overflow : hidden;
	}
	
	.f_menu{
		border : 2px dashed #91aaff;
		width : 100px;
		height : 50px;
		text-align: center;
		background-color: #91aaff80;
		color : #fff;
		font-size : 20px;
		border-radius: 10px;
		line-height: 50px;
		float : left;
	}
	
	#f_title_input{
		float:left;
		margin-left : 20px;
		height : 50px;
		line-height: 50px;
		width : 900px;
	}
	
	#f_title_input > input {
		width : 300px;
		height : 30px;
		border-radius: 10px;
		box-shadow: 1px 1px #c1c1c1;
		padding-left : 10px;
	}
	
	#faq_text{
		margin-top : 20px;
		width : 100%;
		overflow: hidden;
	}
	
	#f_text_smartEditer{
		width : 890px;
		margin-left : 20px;
		float:left;
	}
	
	#faq_btn{
		width : 100%;
		overflow: hidden;
		margin-top : 20px;
	}
	
	#faq_btn_main{
		width : 260px;
		overflow: hidden;
		text-align : center;
		margin:0 auto;
	}
	
	#faq_btn_left{
		margin : 0 auto;
		float:left;
		height : 50px;
	}
	
	#faq_btn_right {
		float: left;
		height : 50px;
		margin-left : 30px;
	}
	
	.faq_btn_style{
		padding : 10px 40px 10px 40px;
		border : 1px solid #f1f1f1;
		border-radius: 10px;
		box-shadow: 1px 1px #000;
		background-color: #c1c1c1;
		font-size : 16px;
		outline: none;
		color : #fff;
	}
	.faq_btn_style:active{
		padding : 10px 40px 10px 40px;
		border : 1px solid #a1a1a1;
		border-radius: 10px;
		box-shadow: 1px 1px #000;
		background-color: #a1a1a1;
		font-size : 16px;
		outline : none;
		color : #fff;
	}
</style>
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
		<form action="/sit/faqInsert" method="post" id="frm">
			<div id="faqUpdate">
				<div id="faqMain">
					<div id="faq_Title">
						<div class="f_menu">
							<span>제목</span>
						</div>
						<div id="f_title_input">
							<input type="text" id="f_title_text" name="faq_name" />
						</div>
					</div>
					<div id="faq_text">
						<div class="f_menu">
							<span>내용</span>
						</div>
						<div id="f_text_smartEditer">
							<textarea name="smarteditor" id="smarteditor" rows="10"
								cols="100" style="width: 766px; height: 412px;"></textarea>
						</div>
					</div>
					<div id="faq_btn">
						<div id="faq_btn_main">
							<div id="faq_btn_left">
								<input type="button" class="faq_btn_style" id="faq_insert"
									value="등록" />
							</div>
							<div id="faq_btn_right">
								<input type="button" class="faq_btn_style" id="faq_cancle"
									value="취소" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>