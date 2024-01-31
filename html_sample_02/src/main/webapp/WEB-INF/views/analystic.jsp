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
 
 <div id="view-box" style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-background-color)" >
 

	 <nav style="margin-top: 20px;" >
	 	
	 	<div class="nav_logo-wrapper" >
       		<img class="nav_logo" src="images/cross.jpg">
        </div>
        
	 	<div class="profile-wrapper " style="">
	 		<div class="profile-img">
	 			<div style="" class="img-wrapper rounded-5">
	 				
	 			</div>
	 		</div>
	 		<div class="profile-name">
	 			<div style="margin: 4px;"><h2>Name</h2></div>
	 		</div>
	 		<div class="profile-follow" style="display: flex; margin-top:20px;">
	 			<div style="margin:0 4px;"><h4>팔로우</h4></div> 
	 			<div style="margin:0;">100</div>

	 			<div style="margin:0 4px 0 10px;"><h4>팔로워</h4></div> 
	 			<div style="margin:0;">100</div>
	 		</div>
	 	
	 	</div>
	 	
	 	

        <div class="Menu_options active">
            <span class="material-icons">home</span>
            <h2>홈</h2>
        </div>

        <div class="Menu_options">
            <span class="material-icons">person</span>
            <h2>프로필</h2>
        </div> 
        
        <div class="Menu_options">
            <span class="material-icons">bookmark</span>
            <h2>북마크</h2>
        </div> 
        
        <div class="Menu_options">
            <span class="material-icons">email</span>
            <h2>메시지</h2>
        </div>
       
        <div class="Menu_options">
            <span class="material-icons">notifications</span>
            <h2>알림</h2><span class="badge text-bg-light rounded-pill align-text-bottom">27</span>
        </div>

		 <div class="Menu_options">
            <span class="material-icons">tag</span>
            <h2>검색</h2>
        </div>
		
		<div><br></div>
	 
	 	<div class="Menu_options">
	 		<span class="material-icons">logout</span>
	 		<h2>로그아웃</h2>
	 	</div>
	 </nav>


 <main>
 
	<div class="header">
		<span class="material-icons arrow_back">arrow_back</span>
		<h2>게시활동</h2>
	</div>
	
	<div class="analystic_wrab" style="padding:2rem;">
		<div class="hitCounters" style="margin-bottom:2rem; padding-bottom :2rem;">
			<span>노출수 : 100 </span><br><br>
			<span>조회수 : 100 </span>
		</div>
	
		<div class="hitChart">
			<canvas id="analysisChart"></canvas>
		</div>
	</div>
	<script type="text/javascript">
			$(document).ready(function() {


				const ctx = $('#analysisChart');

				let chartStatus = Chart.getChart("analysisChart");
				
/* 				if(chartStatus != undefined)
				{
					chartStatus.destroy();
					console.log("차트리셋");
				}
				 */
				let postid = 0;
				$.ajax({
					
					url:"selectedAnalysis",
					data:{"post_id":postid},
					dataType:"json",
					type:"post",
					success:function(data)
					{
			
						//console.log(data);
						
											
						
					 	let chartLabels=['0시', '6시', '12시', '18시'];
						let chartData2 = data;
						console.log(data)
						console.log(chartData2);
						  new Chart(ctx, {
						    type: 'bar',
						    data: {
						      labels: chartLabels,
						      datasets: [{
						        label: '시간대 조회수',
						        data: Object.values(chartData2) ,
						        parsing: {
						        	xAxisKey: 'viewhit',
						            yAxisKey: 'time'
						         },
						         backgroundColor: [
						             'rgb(255, 99, 132)',
						             'rgb(54, 162, 235)',
						             'rgb(255, 205, 86)',
						             'rgb(255, 99, 132)'
						           ],
						        borderWidth: 1
						      },
						      
							  ]
						    },
						    options: {
						      scales: {
						        y: {
						          beginAtZero: true
						        }
						      }
						    }
						  });
						  
						   
						
					},
					error:function()
					{
						alert("실패");
					}
					
				});
			
		})
		

	</script>
 
       
 </main>
    <!-- main section end -->
    
 </div>


<!-- Modal -->


<!-- Modal End -->


  </body>

  
  
</html>