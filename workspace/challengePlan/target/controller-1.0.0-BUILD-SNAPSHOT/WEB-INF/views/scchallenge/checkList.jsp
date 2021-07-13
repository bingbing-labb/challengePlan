<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/views/included/header.jsp" flush="true" /><!-- header and tags -->
<div class="wrapper" id='checkList'>
	<div class="section">
	<div class="container">
		<div class='row'>
			<div style="margin-left:2%;width:82vh">
				<div class='title' id='checkListTitle' >
					<h2 style="color:rgb(255,204,000);"><b>CHECKLIST</b></h2>
					<div class='hiddenList'>
						<h4><a class='btn btn-link btn-warning' href="#DailyPlan">오늘의 할일</a></h4>
						<h4><a class='btn btn-link btn-warning' href="#defaultPlan">매일매일</a></h4>
						<h4><a class='btn btn-link btn-warning' href="#weeklyProgress">이번 주 달성</a></h4>
					</div>
				</div>
			</div>
			<div class='planContainer'>
				<div class='title'>
				<h4 id='nowDate' style="color:rgb(123,123,123);"><b>2021/05/05</b></h4>
				</div>
				<div id="DailyPlan">
					<div class='tm-title planHeadar'>
						<h4><b>오늘의 할일</b></h4>
					</div>
					<div class='planBody today'>
						<div id='todayItems'>
							<input type='hidden' id ='todayNum' value='0'>
							<input class="form-check-input" type="checkbox" id="todayListCheck0">
							<input class='form-control' type='text' name='todayItem0' id='todayItem0'> 
						</div>
					</div>
					<div class='planBottom'>
						<button class='btn btn-outline-info btn-round checkListAddBtn' type='button'><img alt="+" src="/resources/img/plus.png" onclick='addList("today")'></button>
					</div>
				</div>
				<div id="defaultPlan">
					<div class='tm-title'><h4><b>매일 매일</b></h4></div>
					<div class='planBody daily'>
						<div id='dailyItems'>
							<input type='hidden' id ='dailyNum' value='0'>
							<input class="form-check-input" type="checkbox" id="dailyListCheck0">
							<input class='form-control' type='text' name='dailyItem0' id='dailyItem0'> 
						</div>
					</div>
					<div class='planBottom'>
						<button class='btn btn-outline-danger btn-round checkListAddBtn' type='button'><img alt="+" src="/resources/img/plus.png" onclick='addList("daily")'></button>
					</div>
				</div>
				<div id="weeklyProgress">
					<div class='tm-title'><h4><b>이번주 달성</b></h4></div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
<script type="text/javascript">
$('#nowDate b').text(getToday());


function getToday(){
	var date = new Date();
	var today = date.getFullYear()+"/"
	if(date.getMonth() < 10)
		today+= '0'
	today+= date.getMonth()+1+"/"
	if(date.getDate() <10)
		today+='0'
	today += date.getDate();
	console.log(today);
	return today;
	
}

function addList(key){
	var html = '';
	var i= parseInt($('#'+key+'Num').val())+1 ;
	var maxNum= key=='today' ? 14 : 6; 
	if (i < maxNum){
		html+= '<div id="'+key+'Items">';
		html+='<input class="form-check-input" type="checkbox" id="'+key+'ListCheck'+i+'">';
		html+="<input class='form-control' type='text' name='"+key+"Item"+i+"' id='"+key+"Item"+i+"'> ";
		html+='</div>'
	} else{
		alert('최대 '+parseInt(maxNum)+'개 까지 가능합니다.')
	}
	
	$("."+key).append(html);
	$('#'+key+'Num').val(i);
}
</script>