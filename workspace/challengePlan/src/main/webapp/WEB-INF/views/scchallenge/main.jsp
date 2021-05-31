<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/views/included/header.jsp" flush="true" /><!-- header and tags -->
<style>
  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
 .calendar-section {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

</style>
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
                        <a href="#" target="_blank" class="nav-link">NEW PLAN <i class="nc-icon nc-user-run" style="margin-left:5px"></i></a>
                    </li>
                    <li class="nav-item">
						<a href="#" target="_blank" class="btn btn-danger btn-round">MYPAGE</a>
					</li>
                </ul>
            </div>
	</div>
</nav>
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

    				<h1 class="presentation-subtitle text-center">다 뿌수고 승리합시다! </h1>
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
    						<jsp:include page="/resources/calendar/daygrid-views.jsp" />
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</body>
</html>