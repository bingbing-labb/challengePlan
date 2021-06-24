<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/views/included/header.jsp" flush="true" /><!-- header and tags -->
<div class="wrapper">
<div class ="section section-dark">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
			<h3 class="title" style="margin-top:50px; float:left">NEW PLAN</h3>
			<form class="planRegisterform">
					<input type='hidden' id="fromDate" name='fromDate'/>
					<input type='hidden' id="toDate" name='toDate'/>
					<div class="form-group">
						<input id="planTitle" type="text" class="form-control" placeholder="제목">
					</div>
					 <div class="form-group">
						<div class='input-group date'>
						 	<input type='text' id="duration" class="form-control datetimepicker" autocomplete='off' placeholder='일정 기간'/>
						 	<span class="input-group-addon">
						 		<span class="glyphicon glyphicon-calendar"><i class="fa fa-calendar" aria-hidden="true"></i></span>
						 	</span>
						</div> 
					</div>
					<div class='form-group'>
						<textarea id='description' name='description' rows='6' class='form-control' placeholder='description'></textarea> 
					</div>	
			</form>
			
			<div class="formButton">
				<button type="submit" class="btn btn-primary btn-round">등록</button>
				<button type="button" class="btn btn-danger btn-round">취소</button>
			</div>
				
			</div>
			<div class="col-md-6" style="display:none">
				<jsp:include  page="/resources/calendar/selectable.jsp" />
			</div>
		</div>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
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


function challenger(){
	
	
}

</script>

</html>