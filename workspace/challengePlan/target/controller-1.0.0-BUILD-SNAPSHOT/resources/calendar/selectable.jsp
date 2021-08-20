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
	        left: 'prev, next  today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      defaultDate: new Date(),
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      select: function(arg) {
	    	  console.log(dateFormat(new Date(),"-"))
	    	  if(arg.startStr < dateFormat(new Date(),"-") ){
	    		  var check=confirm("오늘 날짜보다 이전 날짜를 선택하셨습니다. 이대로 진행하시겠습니까?");
		    	  if(!check){
		    		  calendar.unselect();
		    		  return;
		    	  } 
	    	  }
	    		  
	    	$('#planModal').modal('show');
	    	console.log(arg);
	        
	    	setSelectedDate(arg.startStr, arg.endStr);
	    	
	        $('#planModal .modal-footer button[type="submit"]').on('click', function(){
	        	console.log(arg.startStr);
	        	var title = $('#planTitle').val();
		       	var start='';
		       	var end = '';
		       	var allDay;
		       	
		        if($("#fromTime").val() != null && $("#fromTime").val() !=''){
		        	 start=arg.startStr;
		        	 start+='T'+$("#fromTime").val()+':00';
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
	      events: function(arg){
	    	  getAllPlan(arg)
	      }
	    	  
	    });
	    
	    calendar.render();
	    
 }

</script>

<div id='calendar'>
</div>

<script type="text/javascript">


</script>
