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
        <div class="page-header section-dark" style="background-image: url('/resources/img/beach_cave.jpg')">
            <div class="filter"></div>
            <input type='hidden' id="monthlyList">
    		<div class="content-center">
    			<div class="container">
    				<div class="title-brand">
    					<!-- <h1 class="presentation-title">hello dear</h1> -->
    				</div>
    				<!-- <h1 class="presentation-subtitle text-center">JUST BREAK IT</h1> -->
    			</div>
    		</div>
<!--             <div class="moving-clouds" style="background-image: url('/resources/img/clouds.png'); "> -->
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

    <div id='planModal' class="modal fade" role='dialog' aria-labelledby='popupModalLabel' aria-hidden='true' data-backdrop='static' data-keyboard='false'>
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
						<input type='hidden' name='pid' id='pid'>
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
						<div class="form-group">
							<label>설명</label>
							<textarea id='description' name='description' class='form-control' placeholder="description"></textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer" style="padding: 10px">
				<button id='submitBtn' type="submit" class="btn btn-outline-primary" data-dismiss="modal">등록</button>
				<button type="button" class="btn btn-outline-danger" data-dismiss="modal" onclick='closeModal()'>닫기</button>
			</div>
		</div>
	</div>
</div>
<div class='breaker'></div>
<script type="text/javascript">
$(document).ready(function(){
	$('#submitBtn').on('click',function(e){
		e.preventDefault();
		if($('#duration').attr('readonly')){
			addPlan(null, 'new');
		}else{
			addPlan(null, 'edit');
		}
	})
});
function setSelectedDate(start, end){
	$("#startDate").val(start);
	$("#endDate").val(end);
	$("#duration").val(start+"~"+end);
} 	
function getAllPlan(arg){
	var plan=[];
	var param ={
		start:dateFormat(arg.start,"-"),
		end:dateFormat(arg.end,"-")
	}
	
	var url="/main/getUserPlan";	
	// bakim - only main title remain, no parent title.
	$.ajax({
		type:'POST',
		url:url,
		data:param,
		dataType:'json',
		async:false,
		beforeSend:function(){
			if(plan != null){
				return;
			}
			console.log(param);
		},
		success:function(result){
			console.log(result);
			if(!!result){
				$.map(result,function(r){
					plan.push({
						title:r.title,
						start:r.start,
						end:r.end,
						id:r.pid
							
					});
					
					if(r.subPlan != null){
						var subPlans = r.subPlan.split(",");
						
						for(var idx in subPlans){
							var subPlan = subPlans[idx].split("|");
							var date = getSubDate(r.start,subPlan[1]);
							plan.push({
								groupId:r.pid,
								id:r.pid,
								title:r.title.concat(" - ").concat(subPlan[0]),
								start:date,
								end:date
							});
						}
						
					}
				})
			}
			console.log(plan);
		},
		complete:function(result){
			
		},
		error:function(err){
			console.log(err);
		}
		
	});
	return plan;
}

function addPlan(param, mode){
	var title = $('#planTitle').val();
	var serialize = $("#calPlanRegForm").serialize();
	var url='';
	var pid;
	
	//param set
	if($('#pid').val() != null) {
		pid = $('#pid').val();
	}
	if(param == null){
		param = {
				Pid:pid,
				PlanTitle:title,
				StartDate:$("#startDate").val(),
				EndDate:$("#endDate").val(),
		}
	}else{
		url = '/plan/updatePlan';
	}
	
	//param : subtitle set
	if($("#subTitle").val() != null){
		console.log($("#subTitle").val());
		param.SubPlan =$("#subTitle").val().concat('|0');
	}
		
	//url set
	if(mode == 'new'){
		url='/scchallenge/newPlan'
	}else{
		url = '/plan/updatePlan';
	}
	
	//null data check
	if(mode != 'drag'){
		var check=validation(param);
		if(!check){
			console.log(check);
			return;
		}
	}

	//nullable param set
	param.Description=$("#description").val();
	
	$.ajax({
		type:'POST',
		url:url,
		dataType:'json',
		data:param,
		async:false,
		beforeSend:function(){
		
		},
		success:function(result){
			location.reload();
			closeModal();
		},
		complete:function(result){
			
		},
		error:function(err){
			console.log(err);
		}
	});

}
function getEachPlan(event){
	 console.log(event);
	 var pid = event.id;
	
	 param={
			 Pid:pid
	 }
	 
	 $.ajax({
		 type:"POST",
		 url:"/plan/getPlan",
		 dataType:'json',
		 data:param,
		 async:false,
		 beforeSend:function(){
			 $('#duration').attr('readonly',false);
			 $('#submitBtn').text('확인');
			 
			 if(event.groupId != ''){
				 var html = '<div class="form-group">'
				 html+= '<label>상위 플랜 기간</label>';
				 html+= '<input type="text" id="parentDuration" class="form-control" readonly="true"/></div>';
				 html+= '<div class="form-group">';
				 html+= '<label>상위 플랜 제목</label>';
				 html+= '<input type="text" id="parentTitle" class="form-control" readonly="true"></div>';
				 
				 $('#duration').parent().before(html);
			 }
			 
		 },
		 success:function(result){

			 $('#pid').val(pid);
			 
			 var startDate= result.StartDate;
			 var endDate = result.EndDate;
			 var duration = startDate.concat("~").concat(endDate);
			 var planTitle = event.title;
			 var description = result.Description;
			 
			 $('#parentTitle').val(result.PlanTitle);
			 
			 // subPlan 선택시
			 if(event.groupId != ""){
				 $('#parentDuration').val(duration);
				 var subTitle=planTitle.substring(planTitle.indexOf('-')+1);
				 var subPlan = result.SubPlan.split(',');
				 var moreDay = "";
				 
				 for(var idx in subPlan){
					 if(subPlan[idx].includes(subTitle.replace(' ',''))){
						 moreDay=subPlan[idx].substring(subTitle.length)
					 }
				 }
				 
				 startDate=endDate=getSubDate(result.StartDate, moreDay);
				 duration=startDate.concat('~').concat(endDate);
				 planTitle=subTitle;
			 }
			 var item = {
						startDate:startDate,
				 		endDate:endDate,
				 		duration:duration,
				 		planTitle:planTitle,
				 		description:description
				 }
			 
			 for(var key in item){
				 $('#'+key).val(item[key]);
			 }
			 setDateRange('#duration');
		 },
		 complete:function(){
			 console.log( $('#parentDuration').val())
			 $("#planModal").modal('show');
		 },
		 error:function(err){
			 console.log(err);
		 }
	 });
}

function closeModal(){
	$('#planModal').modal('hide');
	$('#submitBtn').text('등록');
	$('#duration').attr('readonly',true);
	 $('#planTitle').attr('readonly',false);
	
	//모달 내용 전부 제거
	$('#calPlanRegForm')[0].reset();
	
	//서브 플랜 모달 끌때
	$('#parentTitle').siblings().remove();
	$('#parentTitle').remove();
	$('#parentDuration').siblings().remove();
	$('#parentDuration').remove();

	
	if($('#duration').data('daterangepicker') != null){
		$('#duration').data('daterangepicker').remove();
	}
	
}


function getSubDate(startDate, diff){
	var start= new Date(startDate);
	start.setDate(start.getDate()+parseInt(diff));

	start=dateFormat(start,'-');
	return start;
}

function checkDuration(){
	var duration = $('#duration').val();
	var parentDuration = $('#parentDuration').val();
	console.log('check Duration!!');
	console.log(duration); console.log(parentDuration);
	/* if($('#parentDuration').val() == null){
		
	}else{
		duration = duration.split('~');
		console.log('check Duration!!');
		console.log(duration); console.log(parentDuration);
		var parentDuration = $('#parentDuration').val().split('~');
		if(duration[0] < parentDuration[0] || duration[1] > parentDuration[1]){
			return false;
		}
	}
	return true; */
}
</script>
	<jsp:include page="/WEB-INF/views/included/footer.jsp" flush="true" /><!-- footer and tags -->