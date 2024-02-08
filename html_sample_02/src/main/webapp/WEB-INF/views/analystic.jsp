<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<title>CROSS</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/style_x_ui.css">
<link rel="stylesheet" href="node_modules/reset.css/reset.css">




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.js" ></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script src="js/cross/analystic.js"></script>


    
    
</head>
 <body>
 
 <div id="view-box" >
 
		<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	

 <main>
 
	<div class="header">
		<span class="material-icons arrow_back">arrow_back</span>
		<h2>게시활동</h2>
	</div>
	<input id="hiddenPostId" type="hidden" value="${param.post_id}">
	<div class="analystic_wrab" style="padding:2rem;">
		<div class="hitCounters" style="margin-bottom:2rem; padding-bottom :2rem;">
			<span>노출수 : </span><br><br>
			<span>조회수 : </span>
		</div>
	
		<div class="hitChart">
			<canvas id="analysisChart"></canvas>
		</div>
	</div>
	<script type="text/javascript">
			$(document).ready(function() {


				
			
		})
		

	</script>
 
       
 </main>
    <!-- main section end -->
    
 </div>


<!-- Modal -->


<!-- Modal End -->


  </body>

  
  
</html>