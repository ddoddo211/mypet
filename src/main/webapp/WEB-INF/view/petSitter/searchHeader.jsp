<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function(){
		$(".closeBtn").click(function(){
			$("#tabs-2").hide();
			$("#tabs-3").hide();
			$("#tabs-4").hide();
			$("#tabs-5").hide();
			$("#tabs-6").hide();
			$("#tabs-7").hide();
			$("#tabs-8").hide();
		});
	});
</script>
<style>
	.zipKind {
		float : left;
		font-family: font-family: 'Nanum Brush Script', cursive;
		font-size : 20px;
		
	}
</style>
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">전체</a></li>
		<li><a href="#tabs-2">서울</a></li>
		<li><a href="#tabs-3">대전</a></li>
		<li><a href="#tabs-4">경기</a></li>
		<li><a href="#tabs-5">인천</a></li>
		<li><a href="#tabs-6">광주</a></li>
		<li><a href="#tabs-7">대구</a></li>
		<li><a href="#tabs-8">부산</a></li>
	</ul>
	<div id="tabs-2">
		<ul>
			<c:forEach items="${zipList }" var="zlist">
				<c:if test="${zlist.zip_high == '서울' }">
					
					<li class="zipKind"><input type = "radio" name="zip" />${zlist.zip_low }</li>
				</c:if>
			</c:forEach>
		</ul>
		<div id="close">
			<button type="button" class="closeBtn" value="2" >X</button>
		</div>
	</div>
	<div id="tabs-3">
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
			potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
			rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra,
			per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
			commodo pellentesque. Praesent eu risus hendrerit ligula tempus
			pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
			lacus.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
			semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
			justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
			potenti. Donec mattis, pede vel pharetra blandit, magna ligula
			faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
			Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
			lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
			vehicula velit eu tellus interdum rutrum. Maecenas commodo.
			Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
			hendrerit hendrerit.</p>
		<div id="close">
			<button type="button" class="closeBtn" value="3">X</button>
		</div>
	</div>
	<div id="tabs-4">
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
			potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
			rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra,
			per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
			commodo pellentesque. Praesent eu risus hendrerit ligula tempus
			pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
			lacus.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
			semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
			justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
			potenti. Donec mattis, pede vel pharetra blandit, magna ligula
			faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
			Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
			lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
			vehicula velit eu tellus interdum rutrum. Maecenas commodo.
			Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
			hendrerit hendrerit.</p>
		<div id="close">
			<button type="button" class="closeBtn" value="4">X</button>
		</div>
	</div>
	<div id="tabs-5">
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
			potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
			rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra,
			per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
			commodo pellentesque. Praesent eu risus hendrerit ligula tempus
			pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
			lacus.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
			semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
			justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
			potenti. Donec mattis, pede vel pharetra blandit, magna ligula
			faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
			Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
			lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
			vehicula velit eu tellus interdum rutrum. Maecenas commodo.
			Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
			hendrerit hendrerit.</p>
		<div id="close">
			<button type="button" class="closeBtn" value="5">X</button>
		</div>
	</div>
	<div id="tabs-6">
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
			potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
			rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra,
			per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
			commodo pellentesque. Praesent eu risus hendrerit ligula tempus
			pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
			lacus.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
			semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
			justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
			potenti. Donec mattis, pede vel pharetra blandit, magna ligula
			faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
			Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
			lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
			vehicula velit eu tellus interdum rutrum. Maecenas commodo.
			Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
			hendrerit hendrerit.</p>
		<div id="close">
			<button type="button" class="closeBtn" value="6">X</button>
		</div>
	</div>
	<div id="tabs-7">
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
			potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
			rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra,
			per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
			commodo pellentesque. Praesent eu risus hendrerit ligula tempus
			pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
			lacus.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
			semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
			justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
			potenti. Donec mattis, pede vel pharetra blandit, magna ligula
			faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
			Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
			lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
			vehicula velit eu tellus interdum rutrum. Maecenas commodo.
			Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
			hendrerit hendrerit.</p>
		<div id="close">
			<button type="button" class="closeBtn" value="7">X</button>
		</div>
	</div>
	<div id="tabs-8">
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
			potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
			rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra,
			per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
			commodo pellentesque. Praesent eu risus hendrerit ligula tempus
			pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
			lacus.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
			semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
			justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
			potenti. Donec mattis, pede vel pharetra blandit, magna ligula
			faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
			Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
			lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
			vehicula velit eu tellus interdum rutrum. Maecenas commodo.
			Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
			hendrerit hendrerit.</p>
		<div id="close">
			<button type="button" class="closeBtn" value="8">X</button>
		</div>
	</div>
</div>
