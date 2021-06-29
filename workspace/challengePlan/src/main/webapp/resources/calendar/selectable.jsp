<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
var isSubmit = false;
	$(document).ready(function(){
		dayPick();
	});
	
 function dayPick(){
	   var calendarEl = document.getElementById('calendar');
	  
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      defaultDate: new Date(),
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      select: function(arg) {
	    	$('#planModal').modal('show');
	    	console.log(arg);
	        
	        $('#planModal .modal-footer button[type="submit"]').on('click', function(){
	        	console.log(arg.startStr);
	        	var title = $('#planTitle').val();
		       	var start='';
		       	var end = '';
		       	var allDay;
		       	
		        if($("#planSTime").val() != null && $("#planSTime").val() !=''){
		        	 start=arg.startStr;
		        	 start+='T'+$("#planSTime").val()+':00';
		        	 allDay = '';
		        	 
		          }else{
		        	  	allDay=arg.allDay
		        		start= arg.start
		          }
		        
	         	if (title.length > 0) {
	 	       	   console.log(start);
	 	    	   calendar.addEvent({
	 		            title: title,
	 		            start:start,
	 		            end: arg.end,
	 		            allDay:allDay
	 		          });
	 	        }
	         	$('#calPlanRegForm')[0].reset();
	         	$('#planModal').modal('hide');
	         	location.reload();
	         	
	        });
	        
	        calendar.unselect();
	      	
	      },
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: [
	        {
	          title: 'All Day Event',
	          start: '2020-02-01'
	        },
	        {
	          title: 'Long Event',
	          start: '2020-02-07',
	          end: '2020-02-10'
	        },
	        {
	          groupId: 999,
	          title: 'Repeating Event',
	          start: '2020-02-09T16:00:00'
	        },
	        {
	          groupId: 999,
	          title: 'Repeating Event',
	          start: '2020-02-16T16:00:00'
	        },
	        {
	          title: 'Conference',
	          start: '2020-02-11',
	          end: '2020-02-13'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-02-12T10:30:00',
	          end: '2020-02-12T12:30:00'
	        },
	        {
	          title: 'Lunch',
	          start: '2020-02-12T12:00:00'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-02-12T14:30:00'
	        },
	        {
	          title: 'Happy Hour',
	          start: '2020-02-12T17:30:00'
	        },
	        {
	          title: 'Dinner',
	          start: '2020-02-12T20:00:00'
	        },
	        {
	          title: 'Birthday Party',
	          start: '2020-02-13T07:00:00'
	        },
	        {
	          title: 'Click for Google',
	          url: 'http://google.com/',
	          start: '2020-02-28'
	        }
	      ]
	    });

	    calendar.render();

 }
</script>

<div id='calendar'>
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
							<input id="planTitle" name='planTitle' type="text" class="form-control" placeholder="제목">
						</div>
						<div style="float:right">
							<input class="form-check-input" type="checkbox" id="allDate">
							<p style='margin-left:1em'>하루 종일</p>
						</div>
						<div class="form-group">
							<label>시작 시간</label>
							<input id="planSTime" name='planSTime' type="time" class="form-control">
						</div>
						<div class="form-group">
							<label>종료시간</label>
							<input id="planETime" name='planETime' type="time" class="form-control">
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
<script type="text/javascript">


</script>
