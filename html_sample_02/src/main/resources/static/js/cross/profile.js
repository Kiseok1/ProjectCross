/**
 * 
 */
$(function(){
	/*$(".favorite").click(function(){
		let post_id=$(this).attr("data-post_id");
		let loc = $(this).next();
		let stat = "";
		if($(this).hasClass("toggle")){
			stat = "likeDown"
			
		} else {
			stat = "likeUp"
			
		}
		
		console.log(stat);
		
		$.ajax({
			url:"/profile/likeUpdate",
			type:"post",
			data:{"post_id":post_id,"stat":stat},
			datatype:"text",
			success:function(data){
				
				$(loc).text(data);
			},
			error:function(){
				alert("실패");
			}
		});//ajax
	})*/
	
	
	$(document).on("click",".favorite", function(e) {

		let postId = $(e.target).attr("data-post_id");
		let loc = $(e.target).next();
		let stat = "";
		if ($(e.target).hasClass("toggle") == false) {
			
			stat = "likeUp"
			$(e.target).addClass("toggle");
			$(e.target).text("favorite");

		} else {
			
			stat = "likeDown"
			$(e.target).removeClass("toggle");
			$(e.target).text("favorite_border");

		}
		
		console.log(stat);
		
		$.ajax({
			url:"/profile/likeUpdate",
			type:"post",
			data:{"post_id":postId,"stat":stat},
			datatype:"text",
			success:function(data){
				
				$(loc).text(data);
			},
			error:function(){
				alert("실패");
			}
		});//ajax

	})
	
	
	

})