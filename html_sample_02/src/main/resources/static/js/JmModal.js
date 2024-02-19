/*
*
*/
$(function(){
		/* 삭제 모달 */
		 $(document).on('click', '.alramDelect', function() {
	            var alram_id = $(this).closest(".alram_post").attr('id');
	            var alramPost = $(this).closest(".alram_post");
			        $("#yesDelete").off().click(function () { // 이 부분에서 off() 함수를 사용하여 중복 클릭 방지합니다.
			            $.ajax({
			                url: "alramDelect",
			                type: "post",
			                data: {"alram_id": alram_id},
			                dataType: "text",
			                success: function (data) {
			                    alramPost.remove();
					        	$("#DeleteModal").modal("hide");
			                	$("#DeleteCheckModal").modal("show"); // 알람 삭제 확인 모달 표시
			                },
			                error: function () {
			                    $(".modal-body").text("알람 삭제 중 오류가 발생했습니다.");
			                }
			            });
			        });
			});
			 /* 차단 모달 */
			 $(document).on('click', '.alramBan', function() {
			 	var source_id = $(this).closest(".alram_post").find(".post_body").attr('id');
			        $("#yesBan").off().click(function () { // 이 부분에서 off() 함수를 사용하여 중복 클릭 방지합니다.
			        	$.ajax({
			 				url:"alramBan",
			 				type:"post",
			 				data:{"source_id":source_id},
			 				dataType:"text",
			 				success:function(data){
			 					$("#BanModal").modal("hide");
			                	$("#BanCheckModal").modal("show");	
			                	},
			 				error:function(){
			 					$(".modal-body").text("차단 중 오류가 발생했습니다.");
			 				}
			 			});
			        });
			});
			 /* 차단 해제 모달 */
			 $(document).on('click', '.UnBanBtn', function() {
			 	var source_id = $(this).closest(".alram_post").find(".post_body").attr('id');
			        $("#yesUnBan").off().click(function () { // 이 부분에서 off() 함수를 사용하여 중복 클릭 방지합니다.
			        	$.ajax({
			 				url:"UserUnBan",
			 				type:"post",
			 				data:{"source_id":source_id},
			 				dataType:"text",
			 				success:function(data){
			 					$("#UnBanModal").modal("hide");
			                	$("#UnBanCheckModal").modal("show");	
			                	},
			 				error:function(){
			 					$(".modal-body").text("차단해제 중 오류가 발생했습니다.");
			 				}
			 			});
			        });
			});
		 });//jquery