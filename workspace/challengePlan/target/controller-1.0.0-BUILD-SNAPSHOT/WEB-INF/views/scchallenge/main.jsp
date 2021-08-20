<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/views/included/header.jsp" flush="true" /><!-- header and tags -->
<style>
  #calendar {
    max-width: 1080px;
    margin: 0 auto;
  }
 .calendar-section {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
</style>
   <div class="wrapper">
        <div class="page-header section-dark" style="background-image: url('/resources/img/antoine-barres.jpg')">
            <div class="filter"></div>
    		<div class="content-center">
    			<div class="container">
    				<div class="title-brand">
    					<h1 class="presentation-title">CHALLENGE</h1>
    					<div class="fog-low">
    						<img src="/resources/img/fog-low.png" alt="">
    					</div>
    					<div class="fog-low right">
    						<img src="/resources/img/fog-low.png" alt="">
    					</div>
    				</div>

    				<h1 class="presentation-subtitle text-center"> </h1>
    			</div>
    		</div>
            <div class="moving-clouds" style="background-image: url('/resources/img/clouds.png'); ">

            </div>
    	</div>
    	<div class="main">
    		<div class="section section-bottoms">
    			<div class="container">
    				<div class="tim-title" id="schedule">
    					<h2><B>SCHEDULE</B></h2>
    				</div>
    				<div class="row">
    					<div class="calendar-section">
    						<jsp:include page="/resources/calendar/selectable.jsp" />
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    <div id='planModal' class="modal fade" role='dialog' aria-labelledby='popupModalLabel' aria-hidden='true'>
	<div class='modal-dialog' role='document'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h5 class='modal-title' id='popupModalLable'>
					<b>플랜 등록</b>
				</h5>
				<button type='button' class='close' data-dismiss='modal' aria-label='Close'></button>
			</div>
			<div class='modal-body'>
				<div style='max-height:600px; overflow:auto'>
					<form name='calPlanRegForm' id='calPlanRegForm' method='post'>
						<input type='hidden' name='startDate' id='startDate'>
						<input type='hidden' name='endDate' id='endDate'>
						<div class="form-group">
							<label>기간</label>
							<input type="text" id="duration" name="duration" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>제목</label>
							<input id="planTitle" name='planTitle' type="text" class="form-control" placeholder="제목">
						</div>
						<div style="float:right">
							<input class="form-check-input" type="checkbox" id="allDate">
							<p style='margin-left:1em'>하루 종일</p>
						</div>
						<div class="form-group">
							<label>시작 시간</label>
							<input id="fromTime" name='fromTime' type="time" class="form-control">
						</div>
						<div class="form-group">
							<label>종료시간</label>
							<input id="toTime" name='toTime' type="time" class="form-control">
						</div>
						<div class="form-group">
							<label>설명</label>
							<textarea id='description' name='description' class='form-control' placeholder="description"></textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer" style="padding: 10px">
				<button type="submit" class="btn btn-outline-primary" data-dismiss="modal">등록</button>
				<button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<div class='breaker'></div>
<script type="text/javascript">

function setSelectedDate(start, end){
	$("#startDate").val(start);
	$("#endDate").val(end);
	
	$("#duration").val(start+"~"+end);
} 	
function getAllPlan(arg){

	var allPlan = new Array();
	
	var param ={
		start:dateFormat(arg.start,"-"),
		end:dateFormat(arg.end,"-")
	}
	
	var url="/scchallenge/main/getUserPlan";	
	$.ajax({
		type:'POST',
		url:url,
		data:param,
		beforeSend:function(){
			console.log(param);
		},
		success:function(result){
			console.log(result);
		},
		error:function(err){
			console.log(err);
		}
		
	});
	 console.log(allPlan);
	return allPlan;
}
</script>
	<jsp:include page="/WEB-INF/views/included/footer.jsp" flush="true" /><!-- footer and tags -->