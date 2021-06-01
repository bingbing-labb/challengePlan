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
<nav class="navbar navbar-expand-md fixed-top navbar-transparent" color-on-scroll="500">
	<div class="container">
		<div class="navbar-translate">
			<button class="navbar-toggler navbar-toggler-right navbar-burger" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar"></span>
                    <span class="navbar-toggler-bar"></span>
                    <span class="navbar-toggler-bar"></span>
        	</button>
			<a class="navbar-brand" href="main">challenge!</a>
		</div>
		<div class="collapse navbar-collapse" id="navbarToggler">
                <ul class="navbar-nav ml-auto">
                	<li class="nav-item">
                        <a href="#" target="_blank" class="nav-link" style="text-align:1.6;">SCHEDULE<i class="nc-icon nc-book-bookmark" style="margin-left:5px;"></i></a>
                    </li>
                	<li class="nav-item">
                        <a href="#" target="_blank" class="nav-link">CHECK LIST<i class="nc-icon nc-layout-11" style="margin-left:5px"></i></a>
                    </li>
                    <li class="nav-item">
                        <a href="newPlan" target="_blank" class="nav-link">NEW PLAN <i class="nc-icon nc-user-run" style="margin-left:5px"></i></a>
                    </li>
                    <li class="nav-item">
						<a href="#" target="_blank" class="btn btn-danger btn-round">MYPAGE</a>
					</li>
                </ul>
            </div>
	</div>
</nav>