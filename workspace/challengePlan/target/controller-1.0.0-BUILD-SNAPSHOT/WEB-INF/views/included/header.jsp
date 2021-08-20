<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
 	<!-- full Calendar -->
	<link href='/resources/packages/core/main.css' rel='stylesheet' />
	<link href='/resources/packages/daygrid/main.css' rel='stylesheet' />
	<link href='/resources/packages/timegrid/main.css' rel='stylesheet' />
	
	<!-- css Downloaded -->
    <link rel="icon" type="image/png" href="/resources/img/favicon.ico">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources//img/apple-icon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>scChallenge</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/resources/css/paper-kit.css?v=2.1.0" rel="stylesheet"/>
    <!--     Fonts and icons     -->
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700' rel='stylesheet' type='text/css'>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/nucleo-icons.css" rel="stylesheet" />
    
    <link href="/resources/css/design.css" rel="stylesheet" />
    <link href="/resources/css/js-snackbar.css" rel="stylesheet"/>
</head>
<style>
 .calendar-section {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
</style>
<body>
<script src="/resources/js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="/resources/js/jquery-ui-1.12.1.custom.min.js" type="text/javascript"></script>
<script src="/resources/js/popper.js" type="text/javascript"></script>
<script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/js/js-snackbar.js" type="text/javascript"></script>

<!-- Switches -->
<script src="/resources/js/bootstrap-switch.min.js"></script>

<!--  Plugins for Slider -->
<script src="/resources/js/nouislider.js"></script>

<!--  Plugins for DateTimePicker -->
<script src="/resources/js/moment.min.js"></script>
<script src="/resources/js/bootstrap-datetimepicker.min.js"></script>

<!--  Paper Kit Initialization and functons -->
<script src="/resources/js/paper-kit.js?v=2.1.0"></script>
<!-- full Calendars -->
<script src='/resources/packages/core/main.js'></script>
<script src='/resources/packages/interaction/main.js'></script>
<script src='/resources/packages/daygrid/main.js'></script>
<script src='/resources/packages/timegrid/main.js'></script>
<!-- js  -->
<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


<!-- css -->
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<nav class="navbar navbar-expand-md fixed-top navbar-transparent" color-on-scroll="500">
	<div class="container">
		<div class="navbar-translate">
			<button class="navbar-toggler navbar-toggler-right navbar-burger" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar"></span>
                    <span class="navbar-toggler-bar"></span>
                    <span class="navbar-toggler-bar"></span>
                    <span class="navbar-toggler-bar"></span>
        	</button>
			<a class="navbar-brand" href="main" style="font-size:1.8em">challenge!</a>
		</div>
		<div class="collapse navbar-collapse main-nav" id="navbarToggler">
                <ul class="navbar-nav ml-auto">
                	<li class="nav-item">
                        <a href='schedule' class="nav-link" style="text-align:1.6;">SCHEDULE<i class="nc-icon nc-book-bookmark" style="margin-left:5px;"></i></a>
                    </li>
                	<li class="nav-item">
                        <a href='checkList' class="nav-link">CHECK LIST<i class="nc-icon nc-layout-11" style="margin-left:5px"></i></a>
                    </li>
                    <li class="nav-item">
                        <a href='newPlan' class="nav-link">NEW PLAN <i class="nc-icon nc-user-run" style="margin-left:5px"></i></a>
                    </li>
                    <li class="nav-item">
                        <a href='#' id="myPage" class="nav-link">MyPage <i class="nc-icon nc-user-run" style="margin-left:5px"></i></a>
                    </li>
                    <li class="nav-item">
						<a href='challenge' id="challenge" class="btn btn-danger btn-round">CHALLENGE</a>
					</li>
					
                </ul>
            </div>
	</div>
</nav>
<script type="text/javascript">
function clearForm(form, secId){
	$('.'+secId).hide();
    $('[type=text],[type=date],[type=time], select, textarea', form).val('');
    $('[type=checkbox]:checked, [type=radio]:checked', form).prop('checked', false);
    $('#challDur').val('2 시간');
    $('#planAsync option:eq(0)').prop("selected","selected");
}

function validation(param){
	for(var key in param){
		if(param[key]=='' || param[key] == null){
			alert('칸을 모두 채워주세요');
			//빈칸 번쩍이는 function 추가
			return false;
		}
	}
	return true;
}
function main(form){
	var check = confirm("작업을 종료하시고 메인화면으로 이동하시겠습니까?")
	if (check){
		location.href = "main"
		if(form != null){
			console.log(form+" cleared")
			$('[type=text],[type=date],[type=time], select, textarea', form).val('');
		    $('[type=checkbox]:checked, [type=radio]:checked', form).prop('checked', false);
		}
	}
}
function dateFormat(date, seperator){
	var yy=date.getFullYear();
	var mm=date.getMonth()+1;
	var dd=date.getDate();
	var result = yy+seperator;
	if(mm <10)
		result+='0';
	result+=mm+seperator;
	if(dd < 10)
		result +='0';
	result+=dd;
	return result;

}
</script>