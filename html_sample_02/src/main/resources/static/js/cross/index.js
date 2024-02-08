/**
 * 
 */
var fileCount = 0;
$(function() {
	var exampleModal = document.getElementById('exampleModal')
	exampleModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget
		// Extract info from data-bs-* attributes
		var recipient = button.getAttribute('data-bs-whatever')
		// If necessary, you could initiate an AJAX request here
		// and then do the updating in a callback.
		//
		// Update the modal's content.
		var modalTitle = exampleModal.querySelector('.modal-title')
		var modalBodyInput = exampleModal.querySelector('.modal-body img')

		modalTitle.textContent = recipient
		modalBodyInput.src = recipient 
	})

	const DEFAULT_HEIGHT = 16; // textarea 기본 height

	$("#currLocation").on("click", function() {
		$("#locationModal").modal("show");
	})
	
	$("#modal_currLocation").on("click", function() {
		$("#locationModal2").modal("show");
	})

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
		
		alert("test2");
		var felement = e.target.files;
		$("#image-area").html("");
		fileCount = 0;
		for (var i = 0; i < e.target.files.length; i++) {
			if (fileCount > 3) {
				alert("파일은 최대 네개까지만 첨부가능합니다.");
				break;
			}

			var file = e.target.files[i];

			let name = file.name;

			//console.log(name);

			if (isImageFile(file)) {

				var reader = new FileReader();
				reader.onload = function(e) {
					var img = document.createElement("img");
					//	console.log("isImageFile",e.target);
					img.setAttribute("src", e.target.result);
					img.setAttribute("class", "userfile");
					img.setAttribute("onmouseover", "this.src='images/cancel.png'");
					img.setAttribute("onmouseout", "this.src='" + e.target.result + "'");
					img.setAttribute("style", "width:80px; height:80px; object-fit:cover;");
					img.setAttribute("data-set", name);
					$("#image-area").prepend(img);


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
					$("#image-area").prepend(video);


				}
				
				reader.readAsDataURL(file);
			}
			fileCount++;

		}
	})

	$("#modalFile").on("change", function(e) {
		//  console.log(e);
		//  console.log(e.target.files.length);
		alert("test");
		var felement = e.target.files;
		$("#modal_image-area").html("");
		fileCount = 0;
		for (var i = 0; i < e.target.files.length; i++) {

			var file = e.target.files[i];

			let name = file.name;

			//console.log(name);

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


				}
				
				reader.readAsDataURL(file);
			}
			fileCount++;

		}
	})
	
	function isVideoFile(file){
		var ext = file.name.split(".").pop().toLowerCase();
		return ($.inArray(ext, ["mpg", "mpeg", "mp4", "ogg", "webm","avi","wmv"]) === -1) ? false : true;
	}

	function isImageFile(file) {
		// 파일명에서 확장자를 가져옴
		var ext = file.name.split(".").pop().toLowerCase();
		return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}

	$(document).on("click", ".userfile", function(e) {

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
	
	$(document).on("click", ".modal_userfile", function(e) {

		const files = $("#modalFile")[0].files;
		const dataTranster = new DataTransfer();
		const removeTargetId = $(e.target).attr("data-set");

		console.log("target : ", e);


		Array.from(files).forEach(file => {
			console.log(removeTargetId + " " + file.name);
			if (removeTargetId != file.name) {
				dataTranster.items.add(file);
			}
		});
		$("#modalFile")[0].files = dataTranster.files;
		$(e.target).remove();
		console.log($("#modalFile")[0].files);
	});

	$("#locSearch").on("keyup", function(e) {

		if (e.keyCode == 13) {
			$.ajax({
				type: "GET",
				url: "/location",
				dataType: "text",
				error: function() {
					alert('통신실패!!');
				},
				success: function(data) {
					alert("Success");
					//	 $("#position_wrap").removeClass("invis");    
					//	 $("#currLocation").html(data);
				}

			});
		}

	});

	$(".selAddr").on("click", function(e) {

		let element = $(e.currentTarget).attr("data-location");
		$(".locSelected").remove();
		$(e.currentTarget).append('<span class="material-icons locSelected">close</span>');
		console.log(element);
		$("#position_wrap").removeClass("invis");
		$("#currLocation").html(element);
		$("#regPosition").val(element);

		$("#locationModal").modal("hide");
		$(".modal-backdrop").modal("hide");


	});
	
	$(".selAddr2").on("click", function(e) {

		let element = $(e.currentTarget).attr("data-location");
		$(".locSelectedM").remove();
		$(e.currentTarget).append('<span class="material-icons locSelectedM">close</span>');
		console.log(element);
		$("#modal_position_wrap").removeClass("invis");
		$("#modal_currLocation").html(element);
		$("#modalRegPosition").val(element);
	

		$("#locationModal2").modal("hide");
		$("#writeModal").modal("show");



	});
	
	

	$(document).on("click", ".locSelected", function(e) {
		$("#position_wrap").addClass("invis");
		$("#currLocation").html("");
	});

	$(document).on("click", ".locSelectedM", function(e) {
		$("#modal_position_wrap").addClass("invis");
		$("#modal_currLocation").html("");
	});




	$(document).on("click", ".chat", function(e) {
	//	alert("chat");
	});
	
	$(document).on("click", ".chart", function(e) {

		let post_id = $(e.target).attr("data-post_id");
		console.log(post_id);
		
		location.href='/analystic?post_id='+post_id;

	});	
	

	$(document).on("click",".repeat", function(e) {
				
		let postId = $(e.target).attr("data-post_id");
		
		if ($(e.target).hasClass("toggle") == false) {
			$(e.target).addClass("toggle");

		} else {
			$(e.target).removeClass("toggle");

		}

	});

	$(document).on("click",".favorite", function(e) {

		let postId = $(e.target).attr("data-post_id");
		
		if ($(e.target).hasClass("toggle") == false) {
			
			
			$(e.target).addClass("toggle");
			$(e.target).text("favorite");

		} else {
			
			
			$(e.target).removeClass("toggle");
			$(e.target).text("favorite_border");

		}

	})

	$(document).on("click",".bookmark", function(e) {

		if ($(e.target).hasClass("toggle") == false) {
			$(e.target).addClass("toggle");
			$(e.target).text("bookmark");

		} else {
			$(e.target).removeClass("toggle");
			$(e.target).text("bookmark_border");

		}

	})
	
	
	function repeatOn(post_id)
	{
		  $.ajax({
          url: url,
          type: 'POST',
          data: {"post_id":post_id},
          dataType:"text",
          success: function (data) {

          },
          error: function (data) {
            alert(data);
          }

        });
	}
	
	function repeatOff(post_id)
	{
		
	}
	
	function favoriteOn(post_id)
	{
		
	}

	function favoriteOff(post_id)
	{
		
	}




/* ---------------------------------------------------------------------------------------------*/

	$("#writeBtn").on("click",function(e){
		e.preventDefault();
		
        var url = $("#writeForm").attr("action");
        var form = $('#writeForm')[0];
        var formData = new FormData(form);
        
        $.ajax({
          url: url,
          type: 'POST',
          data: formData,
          dataType:"json",
          success: function (data) {
          	console.log(data);
          	console.log("number of files : " + data.nof);
          	console.log("profile : " + data.profile);
          	console.log("files : " + data.files);
          	console.log("type : " + data.type);
          	if(data.nof==0){
				  console.log(makePostHtml0(data.name,data.profile,data.post));
			    $("#post_wrap").prepend(makePostHtml0(data.name,data.profile,data.post)+ makePostHtmlFooter(data.post));
			}else if(data.nof==1){
				console.log("왜 안 됨 ? ");
				if((data.type).includes("image")){
					 $("#post_wrap").prepend(makePostHtml1(data.name,data.profile,data.post,data.files));	
					console.log("이미지")	;			
				}else if((data.type).includes("video")){
					 $("#post_wrap").prepend(makePostHtmlv(data.name,data.profile,data.post,data.files));
					console.log("비디오");	
				}
			}else if(data.nof==2){
				 $("#post_wrap").prepend(makePostHtml2(data.name,data.profile,data.post,data.files));
			}else if(data.nof==3){
				 $("#post_wrap").prepend(makePostHtml3(data.name,data.profile,data.post,data.files));
			}else if(data.nof==4){
				 $("#post_wrap").prepend(makePostHtml4(data.name,data.profile,data.post,data.files));
			}
          	
          	$("#write-box").val("");
          	$("#regPosition").val("");
          	$("#currLocation").html("");
          	$("#position_wrap").addClass("invis");
			$(".userfile").remove();
			$("#image-area").html("");
			const dataTranster = new DataTransfer();
		
			$("#file")[0].files = dataTranster.files;
          },
          error: function (data) {
            alert(data);
          },
          cache: false,
          contentType: false,
          processData: false
        });

		
	})

        
        
        function makePostHtml0(name,image,post){
			
			var phtml = '<div class="post" style="position: relative;">';
			phtml += '<div class="post_profile-image rounded-5">';
			phtml += '<img class="" src="/upload/'+image+'" alt="profile">';
			phtml += '<div style="position: absolute; height: 100%; width: 80px;"></div></div>';
			phtml += '<div class="post_body">';
			phtml +='<div class="post_header">'
			phtml +='<div class="post_header-text">';
			phtml +='<h3>';
			phtml += name+'<span class="header-icon-section">@'+post.user_id;
			phtml += '</span>';
			phtml += '</h3>';
			phtml += '<div style="margin-left: 1rem; text-align: center;">';
			phtml += '<h3>방금 전</h3>';
			phtml += '</div></div>';
			phtml += '<div class="post_header-discription"';
			phtml += 'onclick="location.href='+"'/viewContent?post_id="+post.post_id+"'"+'">';
			phtml += '<p>'+post.pcontent+'</p>';
			
			
			if(post.plocation!=null)
			{
				phtml += '<div class="" style="color:gray">';
				phtml += '<div style="display: flex;">';
				phtml += '<span class="material-icons">location_on</span>';
				phtml += '<div>'+post.plocation+'</div>';
				phtml += '</div></div>';
			}							
										
										
			phtml += '</div></div>';
			
			//phtml += makePostHtmlFooter();
			
			
			return phtml;
		}
		
		function makePostHtmlv(name,image,post,files){
			
			var phtml = makePostHtml0(name,image,post);
			phtml += '<div class="container video_contaner">';
			phtml += '<video controls loop muted preload="auto" src="/upload/'+files+'">';
			phtml += '</video></div>';
			
			phtml += makePostHtmlFooter(post);
			
			return phtml;
		}
		
		function makePostHtml1(name,image,post,files){
			//var file = files.split(",");
			var phtml = makePostHtml0(name,image,post);
			
			phtml += '<div class="container">';
			phtml += '<div class="row row-cols-auto ">';
			phtml += '<div class="col-md-auto img-xl rounded-4">';
			phtml += '<img src="/upload/'+files+'" class="rounded " alt="java18"';
			phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="/upload/'+files+'">';
			phtml += '</div></div></div>';
			
			phtml += makePostHtmlFooter(post);
			
			return phtml;
		}
		
		function makePostHtml2(name,image,post,files){
			var file = files.split(",");
			var phtml = makePostHtml0(name,image,post);
			
			phtml += '<div class="container">';
			phtml += '<div class="row row-cols-auto ">';
			phtml += '<div class="col-md-auto img-lg rounded-4">';
			phtml += '<img src="/upload/'+file[0]+'" class="rounded " alt="java18"';
			phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="upload/'+file[0]+'">';
			phtml += '</div>';
			phtml += '<div class="col-md-auto img-lg rounded-4">';
			phtml += '<img src="/upload/'+file[1]+'" class="rounded " alt="java18"';
			phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="/upload/'+file[1]+'">';
			phtml += '</div></div></div>';
			
			phtml += makePostHtmlFooter(post);
			
			return phtml;
		}
		
		function makePostHtml3(name,image,post,files){
			var file = files.split(",");
			var phtml = makePostHtml0(name,image,post);
			
			phtml += '<div class="container">';
			phtml += '<div class="row row-cols-auto">';
			phtml += '<div class="col-md-auto img-md rounded-4">';
			phtml += '<img src="upload/'+file[0]+'" class="rounded " alt="java18"';
			phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="upload/'+file[0]+'">';
			phtml += '</div>';
			phtml += '<div class="col-md-auto">';
			phtml += '<div class="row row-cols-auto">';
			phtml += '<div class="col-md-auto img-sm">';
			phtml += '<img src="upload/'+file[1]+'" class="rounded "';
			phtml += 'alt="java18" data-bs-toggle="modal"';
			phtml += 'data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="upload/'+file[1]+'">';
			phtml += '</div>';
			phtml += '</div>';
			phtml += '<div class="row row-cols-auto">';
			phtml += '<div class="col-md-auto img-sm">';
			phtml += '<img src="upload/'+file[2]+'" class="rounded "';
			phtml += 'alt="java18" data-bs-toggle="modal"';
			phtml += 'data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="upload/'+file[2]+'">';
			phtml += '</div></div></div></div></div>';
			
			phtml += makePostHtmlFooter(post);
			
			return phtml;
		}
		
		function makePostHtml4(name,image,post,files){
			var file = files.split(",");
			var phtml = makePostHtml0(name,image,post);
			
			phtml += '<div class="container img-sm">';
			phtml += '<div class="row">';
			phtml += '<div class="col-md-auto">';
			phtml += '<img src="upload/'+file[0]+'" class="rounded " alt="java18"';
			phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="upload/'+file[0]+'">';
			phtml += '</div>';
			phtml += '<div class="col-md-auto">';
			phtml += '<img src="upload/'+file[1]+'" class="rounded " alt="java18"';
			phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="upload/'+file[1]+'">';
			phtml += '</div>';
			phtml += '</div>';
			phtml += '<div class="row">';
			phtml += '<div class="col-md-auto">';
			phtml += '<img src="upload/'+file[2]+'" class="rounded " alt="java18"';
			phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="upload/'+file[2]+'">';
			phtml += '</div>';
			phtml += '<div class="col-md-auto">';
			phtml += '<img src="upload/'+file[3]+'" class="rounded " alt="java18"';
			phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
			phtml += 'data-bs-whatever="upload/'+file[3]+'">';
			phtml += '</div></div></div>';
			
			phtml += makePostHtmlFooter(post);
			
			return phtml;
		}
		
		function makePostHtmlFooter(post)
		{
			var phtml = '<div class="post_footer">';
		 	phtml += '<span class="material-icons ms_icons chat" data-bs-toggle="modal"';
			phtml += 'data-bs-target="#writeModal" data-post_id="'+post.post_id+'"';
			phtml += 'data-group="'+post.pgroup+'" ';
			phtml += 'data-step="'+post.pstep+'" ';
			phtml += 'data-indent="'+post.pindent+'">chat</span>';

			
			phtml += '<h3>100</h3>';
			phtml += '<span class="material-icons ms_icons repeat">repeat</span>';
			phtml += '<h3>100</h3>';
			phtml += '<span class="material-icons ms_icons favorite">favorite_border</span>';
			phtml += '<h3>100</h3>';
			phtml += '<span class="material-icons ms_icons chart">bar_chart</span>';
			phtml += '<h3>100</h3>';
			phtml += '</div></div></div>';
			
			return phtml;
			
		}


	var writeModal = document.getElementById('writeModal')
	writeModal.addEventListener('show.bs.modal', function(event) {
		//event.preventDefault();
		// Button that triggered the modal
		var button = event.relatedTarget;
		// Extract info from data-bs-* attributes
		var postId = button.getAttribute('data-post_id');
		var group = button.getAttribute('data-group');
		var step = button.getAttribute('data-step');
		var indent = button.getAttribute('data-indent');
		
		
		
		console.log("modal post id : " + postId);
		
		var ip1 = document.createElement("input");
		ip1.setAttribute("type", "hidden");
		ip1.setAttribute("value", postId );
		ip1.setAttribute("name", "post_id");

		var ip2 = document.createElement("input");
		ip2.setAttribute("type", "hidden");
		ip2.setAttribute("value", group );
		ip2.setAttribute("name", "pgroup");

		var ip3 = document.createElement("input");
		ip3.setAttribute("type", "hidden");
		ip3.setAttribute("value", step );
		ip3.setAttribute("name", "pstep");

		var ip4 = document.createElement("input");
		ip4.setAttribute("type", "hidden");
		ip4.setAttribute("value", indent );
		ip4.setAttribute("name", "pindent");		
		
		$("#modal_hidden").html("");
		
		$("#modal_hidden").append(ip1);
		$("#modal_hidden").append(ip2);
		$("#modal_hidden").append(ip3);
		$("#modal_hidden").append(ip4);

		
	})




	$("#modal_write-btn").on("click",function(e){

		e.preventDefault();
		
        var url = $("#modalForm").attr("action");
        var form = $('#modalForm')[0];
        var formData = new FormData(form);
        
        $.ajax({
          url: url,
          type: 'POST',
          data: formData,
          dataType:"json",
          success: function (data) {
          	console.log(data);
          	console.log("number of files : " + data.nof);
          	console.log("profile : " + data.profile);
          	console.log("files : " + data.files);
          	console.log("type : " + data.type);
          /*	if(data.nof==0){
				  console.log(makePostHtml0(data.name,data.profile,data.post));
			    $("#post_wrap").prepend(makePostHtml0(data.name,data.profile,data.post)+ makePostHtmlFooter(data.post));
			}else if(data.nof==1){
				console.log("왜 안 됨 ? ");
				if((data.type).includes("image")){
					 $("#post_wrap").prepend(makePostHtml1(data.name,data.profile,data.post,data.files));	
					console.log("이미지")	;			
				}else if((data.type).includes("video")){
					 $("#post_wrap").prepend(makePostHtmlv(data.name,data.profile,data.post,data.files));
					console.log("비디오");	
				}
			}else if(data.nof==2){
				 $("#post_wrap").prepend(makePostHtml2(data.name,data.profile,data.post,data.files));
			}else if(data.nof==3){
				 $("#post_wrap").prepend(makePostHtml3(data.name,data.profile,data.post,data.files));
			}else if(data.nof==4){
				 $("#post_wrap").prepend(makePostHtml4(data.name,data.profile,data.post,data.files));
			}*/
          		$("#modal_write-box").val("");
		      	$("#modalRegPosition").val("");
		      	$("#modal_currLocation").html("");
		      	$("#modal_position_wrap").addClass("invis");
				$(".modal_userfile").remove();
				$("#modal_image-area").html("");
				const dataTranster = new DataTransfer();
			
				$("#modalFile")[0].files = dataTranster.files;
				
				location.reload(true);
          },
          error: function (data) {
            alert(data);
          },
          cache: false,
          contentType: false,
          processData: false
        });





		


	})
	




	$(document).on("click",".deleteOne",function(e){
		
		var element = e.target;
		console.log(element);

		var postId = element.getAttribute('data-post_id');
		console.log(postId);
		 $.ajax({
          url: "/deleteOne",
          type: 'POST',
          data: {"post_id":postId},
          dataType:"text",
          success: function (data) {

				alert("삭제되었습니다.");
				location.reload(true);
          },
          error: function (data) {
            alert(data);
          }
        });
		
	})













})