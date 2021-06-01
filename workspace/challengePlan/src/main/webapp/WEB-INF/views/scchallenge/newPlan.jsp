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
			<h3 class="title">NEW PLAN</h3>
				<form class="register_form">
					<div class="form-group">
						<input id="planTitle" type="text" class="form-control" placeholder="title">
					</div>
					 <div class="form-group">
					 	<div class="tim-title">
							<h3>StartDate</h3>
						</div>
						<div class='input-group date'>
						 	<input type='text' id="startDate"class="form-control datetimepicker"/>
						 	<span class="input-group-addon">
						 		<span class="glyphicon glyphicon-calendar"><i class="fa fa-calendar" aria-hidden="true"></i></span>
						 	</span>
						</div> 
					</div>
					 <div class="form-group">
					 	<div class="tim-title">
							<h3>EndDate</h3>
						</div>
						<div class='input-group date'>
						 	<input type='text' id="endDate" class="form-control datetimepicker" />
						 	<span class="input-group-addon">
						 		<span class="glyphicon glyphicon-calendar"><i class="fa fa-calendar" aria-hidden="true"></i></span>
						 	</span>
						</div> 
					</div>
				</form>
			</div>
			<div class="regCalendar col-md-6">
				<jsp:include  page="/resources/calendar/selectable.jsp" />
			</div>
		</div>
	</div>
</div>
</div>
</body>
<style>

  .dayPicker {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</html>