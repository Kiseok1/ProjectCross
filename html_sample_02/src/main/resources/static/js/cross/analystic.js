/**
 * 
 */

$(function(){
	$(".arrow_back").on("click",function(){
		//alert("test");
		 history.back();
	});
	
	const ctx = $('#analysisChart');

				let chartStatus = Chart.getChart("analysisChart");
				
/* 				if(chartStatus != undefined)
				{
					chartStatus.destroy();
					console.log("차트리셋");
				}
				 */
				let postid = $("#hiddenPostId").val();
				$.ajax({
					
					url:"/selectedAnalysis",
					data:{"post_id":postid},
					dataType:"json",
					type:"post",
					success:function(data)
					{
						let v1 = Number(data.viewhit0);
						let v2 = Number(data.viewhit6);
						let v3 = Number(data.viewhit12);
						let v4 = Number(data.viewhit18);
						let total = v1 + v2 + v3 + v4 ;
						
						let hitHtml = "<span>노출수 : "+data.hit+"</span><br><br>";
						hitHtml += "<span>조회수 : "+total+"</span>";
						
					
						
						$(".hitCounters").html(hitHtml);
						
											
						
					 	let chartLabels=['0시', '6시', '12시', '18시'];
						let chartData2 = {"0":data.viewhit0,"1":data.viewhit6, "2":data.viewhit12, "3":data.viewhit18};
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
	
