/**
 * 
 */
var fileCount = 0;
$(function() {
/*index 모달 기능 */
	const DEFAULT_HEIGHT = 16; // textarea 기본 height

	$("#write-box").on("keydown", function(e) {
		console.log($(e.target).val());
		//	  console.log(e.target.style);
		let text = $(e.target).val();
		e.target.style.height = 0;
		e.target.style.height = DEFAULT_HEIGHT + e.target.scrollHeight + 'px';
		//					    		 
		if (text.length > 150) {
			console.log("글자수입력제한");
			$(e.target).val(($(e.target).val().substring(0, 150)));
			e.target.style.height = DEFAULT_HEIGHT + e.target.scrollHeight - 32 + 'px';
		}


	})
	
	$("#modal_write-box").on("keydown", function(e) {
		console.log($(e.target).val());
		//	  console.log(e.target.style);
		let text = $(e.target).val();
		e.target.style.height = 0;
		e.target.style.height = DEFAULT_HEIGHT + e.target.scrollHeight + 'px';
		//					    		 
		if (text.length > 150) {
			console.log("글자수입력제한");
			$(e.target).val(($(e.target).val().substring(0, 150)));
			e.target.style.height = DEFAULT_HEIGHT + e.target.scrollHeight - 32 + 'px';
		}


	})
	

	$("#text-area").click(function() {
		$("#write-box").focus();
	})
	
	$("#modal_text-area").click(function() {
		$("#modal_write-box").focus();
	})
	

	$("#file").on("change", function(e) {
	//  console.log(e);
		//  console.log(e.target.files.length);
		console.log($("#modal_image-area"));
		var felement = e.target.files;
		$("#modal_image-area").html("");
	
		fileCount = 0;
		for (var i = 0; i < e.target.files.length; i++) {

			var file = e.target.files[i];

			let name = file.name;

			console.log(name);

			if (isImageFile(file)) {
				if (fileCount > 3) {
					alert("이미지 파일은 최대 네개까지만 첨부가능합니다.");
					break;
				}


				var reader = new FileReader();
				reader.onload = function(e) {
					var img = document.createElement("img");
					//	console.log("isImageFile",e.target);
					img.setAttribute("src", e.target.result);
					img.setAttribute("class", "modal_userfile");
					img.setAttribute("onmouseover", "this.src='/images/cancel.png'");
					img.setAttribute("onmouseout", "this.src='" + e.target.result + "'");
					img.setAttribute("style", "width:80px; height:80px; object-fit:cover;");
					img.setAttribute("data-set", name);
					$("#modal_image-area").prepend(img);
					console.log("imageFileReader");


				}
				
				reader.readAsDataURL(file);
			}else if(isVideoFile(file)){
				if (fileCount > 0) {
					alert("영상 파일은 최대 하나까지만 첨부가능합니다.");
					break;
				}
				
				var reader = new FileReader();
				reader.onload = function(e) {
					var video = document.createElement("video");
					console.log("isVideoFile",e.target);
					video.setAttribute("src", e.target.result);
					video.setAttribute("controls", "controls");
					video.setAttribute("loop", "loop");
					video.setAttribute("muted", "muted");
					video.setAttribute("preload", "preload");
					$("#modal_image-area").prepend(video);
					console.log("FileReader");

				}
				
				reader.readAsDataURL(file);
			}
			fileCount++;

		}
	})

	function isImageFile(file) {
		// 파일명에서 확장자를 가져옴
		var ext = file.name.split(".").pop().toLowerCase();
		return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}
	/*이미지 삭제 클릭시*/
	$(document).on("click", ".modal_userfile", function(e) {

		const files = $("#file")[0].files;
		const dataTranster = new DataTransfer();
		const removeTargetId = $(e.target).attr("data-set");

		console.log("target : ", e);


		Array.from(files).forEach(file => {
			console.log(removeTargetId + " " + file.name);
			if (removeTargetId != file.name) {
				dataTranster.items.add(file);
			}
		});
		$("#file")[0].files = dataTranster.files;
		$(e.target).remove();
		console.log($("#file")[0].files);
	});
/* index 모달 끝*/



    /*search Input 검색 가져오기*/
	$("#searchInput").on("keyup",function(){
        			var input = $(this).val().trim();
        	        if (input === "") {
        	            // 입력값이 없으면 검색 결과를 숨김
        	            $("#searchResults").empty().hide();
        	            return;
        	        }
        			//ajax 검색 데이터 가져오기
        			$.ajax({
						url:"/message/search",
						type:"post",
						data:{"input":input},
						dataType:"json",
						success:function(data){
							console.log(data);
							 // 이전 검색 결과를 삭제
			                $("#searchResults").empty();
			                if (data.length > 0) {	 
							for (let i = 0; i < data.length; i++) {
							    let item = data[i];
							    //태그 입력 시작
							    let hdata = '<div class="post" id='+item.user_id+'>';
							    hdata +='<div class="post_profile-image" style="margin: 1rem; overflow: hidden; height: 60px; width: 90px;">';
							    hdata +='<img src="/upload/'+item.profile_img+'" style="width: 60px; height: 60px; position: relative; right: 1px; bottom: 20px;"></div>';
							    hdata +='<div class="post_body" style="position: relative; right: 20px">';
							    hdata +='<div class="post_header">';
							    hdata +='<div class="post_header-text">';
							    hdata +=' <h3>'+item.user_id+'';
							    hdata +='<span class="header-icon-section">';
							    hdata +='<span class="material-icons post_badge">verified</span>@'+item.name+'';
							    hdata +='</span>';
							    hdata +='</h3>';
							    hdata +='</div>';
							    hdata +='<div class="post_header-discription">';
							    hdata +='<ul>';
							    hdata +='<li>'+item.profile_txt+'입니다.</li>';
							    hdata +='<li class="name">@'+item.name+'</li>';
							    hdata +='</ul>';
							    hdata +='<button class="followBtn">팔로우</button>';
							    hdata +='</div>';
							    hdata += '<span class="material-symbols-outlined check" style="left: 450px; bottom: 78px;">check_circle</span>';
							    hdata +='</div>';
							    hdata +='</div>';
							    hdata +='</div>';
							    //생성된 HTML을 추가
							    $("#searchResults").append(hdata);
							}
					        $("#searchResults").show();
					    } else {
					        $("#searchResults").hide();
					    }
					},
						error:function(){
							alert("실패");
						}
        				
        				
        			});//ajax
        		});//searchInput
        		
        
       

});//jquery