<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/included/header.jsp" flush="true" /><!-- header and tags -->
<style>
  table {
        width: 100%;
      }
  th {
    background-color:#6bd098;
    padding: 5px 10px;
   	text-align:center;
  }
  td{
  	padding: 8px 0 ; 
  	border-bottom : 0.5px dashed gray;
  	text-align:center;
  }
  ul li{
  	list-style-type:none;
  }
</style>
<div class="wrapper" >
	<div class ="section section-dark">
	<div class="container">
		<div class="row">
			<form id="planRegisterform" name="planRegisterform">
			<div class="formHeader" style="display:inline-block;">
				<div style="width:30vh"><h3 class="title" style="float:left">NEW PLAN</h3></div>
				<button type="button" class="btn btn-primary" onclick='showModal()'>목록 보기</button>
			</div>
					<input type='hidden' id='subPlanCnt' name='subPlanCnt'/>
					<input type='hidden' class='fromDate' id="fromDate" name='fromDate' value='' />
					<input type='hidden' class='toDate' id="toDate" name='toDate'  value='' />
					<div class="form-group">
						<input id="planTitle" type="text" name='planTitle' class="form-control" placeholder="제목">
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
							<input class="form-check-input" type="checkbox" id="subPlan" name='subPlan'>
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
				<button type="button" class="btn btn-danger btn-round" onclick='main()'>취소</button>
				<button type="submit" class="btn btn-primary btn-round" onclick='savePlan("planRegisterform")'>등록</button>
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
						<table id="planTbl"
							data-sortable="true"
							data-resizable="true"
							data-resizable-columns-id="newPlan_planTbl"
							data-cookies="true"
							data-cookies-storage="LocalStorage"
							data-cookies-id-table="newPlan_planTbl">
							<thead>
								<tr>
									<th data-field="pid">NO.</th>
									<th data-field="title">Plan Title</th>
									<th data-field="endDate">Due Date</th>
									<th data-field="isSub">Steps</th>
									<th data-field="complete">Complete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${paramMap.planlist }">
									<c:if test="${item != null  }">
										<tr>
											<td width='10%'><span><c:out value="${item.Pid }"/></span></td>
											<td width='40%'><span><c:out value="${item.PlanTitle  }"/></span></td>
											<td width='20%'><span><c:out value="${item.EndDate  }"/></span></td>
											<td width='25%'> 
												<c:if test ="${item.SubPlan ne '' }">
													<c:set var="sub" value="${fn:split(item.SubPlan,',') }" />
													<c:forEach var='subItem' items="${sub }">
														<ul class="subList">
															<li><c:out value="${subItem }"/></li>
														</ul>
													</c:forEach>
												</c:if>
												<c:if test="${item.SubPlan eq '' }">
													<span> N </span>
												</c:if>
											</td>
											<td width='15%'>
												<span>-</span>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						
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

console.log("${paramMap}");

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
	        '3개월': [ moment().startOf('day'), moment().subtract(-3, 'month').endOf('day')],
	        //'지난6개월': [moment().subtract(6, 'month'), moment()],
	        '1년': [ moment().startOf('day'),moment().subtract(-1, 'year').endOf('day')]
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

		document.planRegisterform.fromDate.value = picker.startDate.format('YYYY-MM-DD');
		document.planRegisterform.toDate.value = picker.endDate.format('YYYY-MM-DD');
		
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
		// 이후 코드 정리
		addSubPlan();
		$('#subPlanCnt').val(subPlanNum);
		
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
	$('#subPlanCnt').val(subPlanNum);
});


function savePlan(){
	var fromDate;
	var toDate;
	var subPlan;
	var subPlanList="";
	
	if($('#duration').val() != null && $('#duration').val()!=''){
		fromDate= $('#fromDate').val()
		toDate=$('#toDate').val();
		}
	
	var param = {
			PlanTitle:$('#planTitle').val(),
			StartDate:fromDate,
			EndDate:toDate,
			Description:$('#description').val()
		}
	
	if($('#subPlan').prop("checked")){
		for(var idx=1;idx<subPlanNum+1;idx++){
			subPlanList+=$('#subPlan'+idx).val()+"|"+$('#subDuration'+idx).val();
			if(idx != subPlanNum)
				subPlanList+=",";
		}
		console.log("subPlanCheck : " + subPlanList);
		param.SubPlan=subPlanList;
	}
	
	
	if(!validation(param))
		return;
	
	var url = "/scchallenge/newPlan";
	
	$.ajax({
		type:'POST',
		url:url,
		data : param,
		beforeSend:function(){
			console.log(param);
		},
		success:function(result){
			
			new SnackBar({
				message:"새로운 플랜이 등록되었습니다.",
				dismissible:true,
				timeout:5000,
				status:"success",
				position:"tc"
			});

			location.reload();
		},
		error:function(){
			
		}
	});
}
	
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
	html+='<input type="date" id="subDuration'+i+'" class="form-control datetimepicker" autocomplete="off" placeholder="일정 기간"	onchange="checkDate(event)"/>';
	html+='</div></div></div>';
	
	$('#subPlanContainer .row').append(html);
}
function showModal(id){
	$('#planListPop').modal('show');
}

function checkDate(e){
	var date = e.target.value;
	var fromDate= $('#fromDate').val()
	var toDate=$('#toDate').val();
	
	if(date > toDate || date < fromDate){
		alert("지정한 일정 날짜에 맞지 않습니다.\n날짜를 확인해 주세요 : " + date);
		e.target.value='';
	}
}
</script>

<jsp:include page="/WEB-INF/views/included/footer.jsp" flush="true" /><!-- footer and tags -->