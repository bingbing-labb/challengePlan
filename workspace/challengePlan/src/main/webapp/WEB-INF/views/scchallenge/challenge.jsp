<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/views/included/header.jsp" flush="true" /><!-- header and tags -->
<div class="wrapper">
	<div class="section section-image section-bottoms" style="background-image: url('/resources/img/login-image.jpg');">
		<div class="container">
				<div class="row">
					<div class="challList">
						<div>
						</div>
					</div>
					<div class="btnContainer">
						<button id="addChallBtn" type="submit" class="btn btn-default btn-round">챌린지 추가하기</button>
					</div>
				</div>
		</div>
	</div>
	<div class="challenger-form section section-dark">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<form name="challregform" id="challregform">	
						<div>
							<h4 class="tim-title" style="margin:20px 0; color:white">challenge 일정</h4>
							<label>챌린시 이름</label>
							<div class='form-group'>
								<input type='text' name="challTitle" id='challTitle' class="form-control" placeholder='challenge title'>
							</div>
							<label>PLAN 연동</label>
							<div class='form-group'>
								<select class="form-control form-dropdown" name="planAsync"  id="planAsync">
									<option style="margin-bottom:10px" id="op1" value="0">test1</option>
									<option id="op2" value="1">test2</option>
								</select>
							</div>
							<label>챌린시 날짜, 시간</label>
							<div class='form-group'>
								<div class='input-group date'style='width:49%; float:left; margin-right:10px'>
									<input name="challDate" type='date' class="form-control">
								</div>
								<div class='input-group time'style='width:49%; margin-left:10px'>
									<input  name="challTime" type='time' class="form-control">
								</div>
							</div>
							<div class='form-group'>
								<label>목표 시간</label>
								<input type='text'  name="challDur" id='challDur' class="form-control" value='2 시간'>
							</div>
							<div class='form-group'><!-- 누를 경우 modal 띄우고 친구목록에서 선택가능하도록 조정 -->
								<label>동행 요청</label>
								<input type='text'  name="challCompanyReq" id='challCompanyReq' class="form-control" placeholder='동행'>
							</div>
							<div class='challBtn'>
								<button id="challRegBtn" type="submit" class="btn btn-primary btn-round">등록</button>
								<button id="challDissBtn" type="button" class="btn btn-danger btn-round" onclick="clearForm(this.form)">취소</button>
							</div>
							
						</div>			
					</form>
				</div>
				<div class="col-md-6">
					<div>
						<h4 class="tm-title" style="color:white">챌린지 목록</h4>
						<ul id="myChallList">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
setChallList();

$('#addChallBtn').on("click",function(){
	if($(".challenger-form").css('display') =='none'){
		$('.challenger-form').show();
		console.log("form open");
	}else{
		$('.challenger-form').hide();
		console.log("form close");
		
	}
});

$("#challregform").on("submit",function(e){
	e.preventDefault();
	var content=$(this).serialize();
	if(confirm("등록하시겠습니까?"))
		regChallenge();
	
});

function clearForm(form){
	$('.challenger-form').hide();
    $('[type=text],[type=date],[type=time], select, textarea', form).val('');
    $('[type=checkbox]:checked, [type=radio]:checked', form).prop('checked', false);
    $('#challDur').val('2 시간');
    $('#planAsync option:eq(0)').prop("selected","selected");
}

function setChallList(){
	var html ="";
	for(var i = 0 ;i < 6; i++){
		html += "<li class='challItem'><b> challenge " + i + "</b></li>";
	}
	$("#myChallList").append(html);
}
function regChallenge(){
	var val=$("#challTitle").val();
	if(val != null && val !=''){
		console.log("value exist : " +  val );
		var html="<li class='challItem'><b>"+ val+"</b></li>"; 
		$("#myChallList").prepend(html);
	}else{
		console.log("value doesn't exist")
		alert("챌린지 정보를 입력하세요");
	}
}
</script>		
</body>
</html>