<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/views/included/header.jsp" flush="true" /><!-- header and tags -->
<div class="wrapper" id='newPlan'>
	<div class ="section section-dark">
	<div class="container">
		<div class="row">
			<form id="planRegisterform">
			<div class="formHeader" style="display:inline-block;">
				<div style="width:30vh"><h3 class="title" style="float:left">NEW PLAN</h3></div>
				<button type="button" class="btn btn-primary" onclick='showModal()'>목록 보기</button>
			</div>
					<input type='hidden' id="fromDate" name='fromDate'/>
					<input type='hidden' id="toDate" name='toDate'/>
					<div class="form-group">
						<input id="planTitle" type="text" class="form-control" placeholder="제목">
					</div>
					 <div class="form-group">
						<div class='input-group date'>
						 	<input type='text' id="duration" class="form-control datetimepicker" autocomplete='off' placeholder='일정 기간' />
						 	<span class="input-group-addon">
						 		<span class="glyphicon glyphicon-calendar"><i class="fa fa-calendar" aria-hidden="true"></i></span>
						 	</span>
						</div> 
						<div class="checkBoxContainer">
							<button class="btn btn-danger btn-round" type="button" id="addSubPlan">추가</button>
							<input class="form-check-input" type="checkbox" id="subPlan">
							<p>세부 일정 추가</p>
						</div>
						<div class="subPlanContainer" id="subPlanContainer">
							<div class="row">
							</div>
						</div>
					</div>
					<div class='form-group'>
						<textarea id='description' name='description' rows='6' class='form-control' placeholder='description'></textarea> 
					</div>	
			</form>
			
			<div class="formButton">
				<button type="button" class="btn btn-danger btn-round">취소</button>
				<button type="submit" class="btn btn-primary btn-round">등록</button>
			</div>
		</div>
	</div>
	</div>
</div>
<div class="modal fade" id="planListPop" tabindex="-1" role="dialog" aria-labelledby="popupModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class='modal-title' id='popupModalLabel'>플랜 목록</h5>
			</div>
			<div class='modal-body'>
				<div style="max-height: 660px; overflow: auto;">
					<div id='planList'>
						<h2>content</h2>
					</div>
				</div>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-default'>닫기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var subPlanNum = 0;
console.log("${planList }");
$(document).ready(function(){
	$('#duration').daterangepicker({
		showDropdowns: true,
		timePicker: false,
	    timePicker24Hour: false,
	    autoUpdateInput: false,
	    ranges: {
	        '하루': [moment().startOf('day'), moment().endOf('day')],
	        '3일': [moment().subtract(1, 'days').startOf('day'),moment().subtract(-1, 'days').endOf('day')],
	        '일주일': [moment().subtract(1, 'days').startOf('day'),moment().subtract(-6, 'days').endOf('day')],
	        '한 달': [moment().subtract(1, 'days').startOf('day'), moment().subtract(-29, 'days').endOf('day')],
	        '3개월': [ moment().startOf('day'), moment().subtract(-1, 'month').endOf('day')],
	        //'지난6개월': [moment().subtract(6, 'month'), moment()],
	        '1년': [ moment().startOf('day'),moment().subtract(0, 'year').endOf('day')]
	    },
	    locale: {
	        format: "YYYY-MM-DD",
	        separator: " - ",
	        applyLabel: "적용",
	        cancelLabel: "취소",
	        fromLabel: "시작",
	        toLabel: "종료",
	        customRangeLabel: "지정",
	        cancelLabel: '삭제',
	        weekLabel: "주",
	        daysOfWeek: [ "일","월","화","수","목","금","토" ],
	        monthNames: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
	        firstDay: 1
	    },
	    alwaysShowCalendars: true,
	    startDate:moment().startOf('day'),
	    endDate:moment().endOf('day'),
	    drops: "dn"
	}, function(start, end, label) {
		//console.log('New date range selected: ' + start.format('YYYY-MM-DD HH:mm') + ' to ' + end.format('YYYY-MM-DD HH:mm') + ' (predefined range: ' + label + ')');
	});
	$('#duration').on('apply.daterangepicker', function(ev, picker){
		var str= picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD');
		$('#duration').val(str);
	});

	$('#duration').on('cancel.daterangepicker', function(ev, picker){
		$('#duration').val('');
		document.planRegisterform.fromDate.value='';
		document.planRegisterform.toDate.value='';
	});
	
});

$('input:checkbox').on('click',function(){
	var useSubPlan = $('#subPlan').prop("checked");
	
	console.log("subPaln clicked");
	
	if(useSubPlan){
		console.log("checked subPlan btn : " + useSubPlan);
		$("#addSubPlan").show();
		
	}else{
		console.log("checked subPlan btn : " + useSubPlan);
		$("#addSubPlan").hide();
		$("#subPlanContainer .row").html('');
		subPlanNum=0;
		
	}
});

$('.modal-footer button').on('click', function(){
	$('#planListPop').modal('hide');
	console.log('hello');
})

$('#addSubPlan').on('click',function(){
	addSubPlan();
});
	
function addSubPlan(){
	var html='';
	
	subPlanNum += 1; 
	i=subPlanNum;
	console.log(i);
	//일정 이름 추가
	html+='<div class="col-md-6">';
	html+='<div class="form-group subTitle">';
	html+='<input id="subPlan'+ i +'" type="text" class="form-control" placeholder="세부일정 이름">';
	html+='</div></div>';
	
	//일정 날짜 추가
	html+='<div class="col-md-6"><div class="form-group subDate"><div class="input-group date">';
	html+='<input type="date" id="subDuration'+i+'" class="form-control datetimepicker" autocomplete="off" placeholder="일정 기간"	/>';
	html+='</div></div></div>';
	
	$('#subPlanContainer .row').append(html);
}
function showModal(id){
	$('#planListPop').modal('show');
}
</script>

</html>