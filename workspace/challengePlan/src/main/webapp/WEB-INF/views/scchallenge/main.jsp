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
        <div class="page-header section-dark" style="background-image: url('/resources/img/antoine-barres.jpg')">
            <div class="filter"></div>
    		<div class="content-center">
    			<div class="container">
    				<div class="title-brand">
    					<h1 class="presentation-title">CHALLENGE</h1>
    					<div class="fog-low">
    						<img src="/resources/img/fog-low.png" alt="">
    					</div>
    					<div class="fog-low right">
    						<img src="/resources/img/fog-low.png" alt="">
    					</div>
    				</div>

    				<h1 class="presentation-subtitle text-center"> </h1>
    			</div>
    		</div>
            <div class="moving-clouds" style="background-image: url('/resources/img/clouds.png'); ">

            </div>
    	</div>
    	<div class="main">
    		<div class="section section-bottoms">
    			<div class="container">
    				<div class="tim-title">
    					<h2>일정</h2>
    				</div>
    				<div class="row">
    					<div class="calendar-section">
    						<jsp:include page="/resources/calendar/selectable.jsp" />
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
<jsp:include page="/WEB-INF/views/included/footer.jsp" flush="true" /><!-- footer and tags -->