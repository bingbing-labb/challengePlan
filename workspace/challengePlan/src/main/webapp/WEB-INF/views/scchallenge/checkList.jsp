<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/views/included/header.jsp" flush="true" /><!-- header and tags -->
<div class="section section-dark" style="height:200px"></div>
<div class="wrapper">
	<div class="section">
		<div class='row'>
			<div style="margin-left:8%;width:82vh">
				<div class='title'>
					<h2 style="color:rgb(255,204,000)"><b>CHECKLIST</b></h2>
					<div class='hiddenList'>
						<h4><a class='btn btn-link btn-warning' href="#DailyPlan">오늘의 할일</a></h4>
						<h4><a class='btn btn-link btn-warning' href="#defaultPlan">매일매일</a></h4>
						<h4><a class='btn btn-link btn-warning' href="#weeklyProgress">이번 주 달성</a></h4>
					</div>
				</div>
			</div>
			<div class='planContainer'>
				<div class='title'>
				<h4><b>2021/05/05</b></h4>
				</div>
				<div id="DailyPlan"></div>
				<div id="defaultPlan"></div>
				<div id="weeklyProgress"></div>
			</div>

		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/included/footer.jsp" flush="true" /><!-- footer and tags -->