/**
 * 
 */
var fileCount = 0;
let pageCounter = 0 ;
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
		
		//alert("test2");
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
	//	alert("test");
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


	$(document).on("click", ".selAddr", function(e) {
		let element = $(e.currentTarget).attr("data-location");
		$(".locSelected").remove();
		$(e.currentTarget).append('<span class="material-icons locSelected" data-bs-dismiss="modal" aria-label="Close">close</span>');
		console.log(element);
		$("#position_wrap").removeClass("invis");
		$("#currLocation").html(element);
		$("#regPosition").val(element);
		$("#locationModal").modal("hide");
		$(".modal-backdrop").modal("hide");
		$(".modal-backdrop").modal("hide");
	});
	$(document).on("click", ".selAddr2", function(e) {
		let element = $(e.currentTarget).attr("data-location");
		$(".locSelectedM").remove();
		$(e.currentTarget).append('<span class="material-icons locSelectedM" data-bs-dismiss="modal" aria-label="Close">close</span>');
		console.log(element);
		$("#modal_position_wrap").removeClass("invis");
		$("#modal_currLocation").html(element);
		$("#modalRegPosition").val(element);
		$("#locationModal2").modal("hide");
		$("#writeModal").modal("show");
	});

	$(document).on("click", ".locSelected", function(e) {
		e.stopPropagation();
		$("#position_wrap").addClass("invis");
		$("#currLocation").html("");
		$("#currLocation").text("");
		e.currentTarget.remove();
		console.log("locSelected");
		$("#locationModal").modal("hide");
		$(".modal-backdrop").modal("hide");
	});
	$(document).on("click", ".locSelectedM", function(e) {
		e.stopPropagation();
		$("#modal_position_wrap").addClass("invis");
		$("#modal_currLocation").html("");
		e.currentTarget.remove();
		$("#locationModal2").modal("hide");
		$(".modal-backdrop").modal("hide");
		$("#writeModal").modal("show");
	});

	/*$(document).on("click",".selAddr",function(e) {

		let element = $(e.currentTarget).attr("data-location");
		$(".locSelected").remove();
		$(e.currentTarget).append('<span class="material-icons locSelected" data-bs-dismiss="modal" aria-label="Close">close</span>');
		console.log(element);
		$("#position_wrap").removeClass("invis");
		$("#currLocation").html(element);
		$("#regPosition").val(element);

		$("#locationModal").modal("hide");
		$(".modal-backdrop").modal("hide");


	});

	$(document).on("click",".selAddr2",function(e) {

		let element = $(e.currentTarget).attr("data-location");
		$(".locSelectedM").remove();
		$(e.currentTarget).append('<span class="material-icons locSelectedM" data-bs-dismiss="modal" aria-label="Close">close</span>');
		console.log(element);
		$("#modal_position_wrap").removeClass("invis");
		$("#modal_currLocation").html(element);
		$("#modalRegPosition").val(element);
	

		$("#locationModal2").modal("hide");
		$("#writeModal").modal("show");



	});*/
	
	

	/*$(document).on("click", ".locSelected", function(e) {
		e.stopPropagation();
		$("#position_wrap").addClass("invis");
		$("#currLocation").html("");
		$("#currLocation").text("");
		
		e.currentTarget.remove();
		console.log("locSelected");
		$("#locationModal").modal("hide");
		$(".modal-backdrop").modal("hide");
		$("#writeModal").modal("show");
		
	});*/

	/*$(document).on("click", ".locSelectedM", function(e) {
		e.stopPropagation();
		$("#modal_position_wrap").addClass("invis");
		$("#modal_currLocation").html("");
		
		e.currentTarget.remove();
		$("#locationModal2").modal("hide");
		$(".modal-backdrop").modal("hide");
		$("#writeModal").modal("show");
	});*/




	$(document).on("click", ".chat", function(e) {
	//	alert("chat");
	});
	
	$(document).on("click", ".chart", function(e) {

		let post_id = $(e.target).attr("data-post_id");
		console.log(post_id);
		
		location.href='/analystic?post_id='+post_id;

	});


	$(document).on("click", ".drpRepeat", function(e) {

		let postId = $(e.target).attr("data-post_id");
		
		console.log("repeat elements are ");
		console.log(e);
		console.log(e.target.parentNode.parentElement.previousElementSibling);
		console.log($(e.target.parentNode.parentElement.previousElementSibling));
		
		let element = $(e.target.parentNode.parentElement.previousElementSibling); 


		console.log("post ID : " + postId);
		if (element.hasClass("toggle") == false) {
			element.addClass("toggle");
			repeatOn(postId, e);

		} else {
			element.removeClass("toggle");
			repeatOff(postId, e);
		}

	});

	$(document).on("click",".favorite", function(e) {

		let postId = $(e.target).attr("data-post_id");
		let loc = $(e.target).next();
		let stat = "";
		if ($(e.target).hasClass("toggle") == false) {
			
			stat = "likeUp"
			$(e.target).addClass("toggle");
			$(e.target).text("favorite");
			/*favoriteOn(postId, e);*/
		} else {
			
			stat = "likeDown"
			$(e.target).removeClass("toggle");
			$(e.target).text("favorite_border");
			/*favoriteOff(postId, e);*/

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

	$(document).on("click",".bookmark", function(e) {

		let postId = $(e.target).attr("data-post_id");
		let stat = "";
		
		if ($(e.target).hasClass("toggle") == false) {
			$(e.target).addClass("toggle");
			$(e.target).text("bookmark");
			stat = "check";
		} else {
			$(e.target).removeClass("toggle");
			$(e.target).text("bookmark_border");
			stat = "cancel";
		}
		
		$.ajax({
			url:"/bookmark/bookmarkUpdate",
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

	//아래 4개 함수 추가
	function repeatOn(post_id, e) {
		$.ajax({
			url: "/repeatOn",
			type: 'POST',
			data: { "post_id": post_id },
			dataType: "text",
			success: function(data) {
				console.log("repeatOn : " + data);
				//e.next().text(data);
				$(e.target.parentNode.parentNode.parentNode.nextElementSibling).text(data);
				$(e.target).text("재게시 취소");
			},
			error: function(data) {
				alert(data);
			}

		});
	}

	function repeatOff(post_id, e) {
		$.ajax({
			url: "/repeatOff",
			type: 'POST',
			data: { "post_id": post_id },
			dataType: "text",
			success: function(data) {
				console.log("repeatOff : " + data);
				//e.next().text(data);
				$(e.target.parentNode.parentNode.parentNode.nextElementSibling).text(data);
				$(e.target).text("재게시");
			},
			error: function(data) {
				alert(data);
			}

		});
	}

	function favoriteOn(post_id, e) {
		$.ajax({
			url: "/favoriteOn",
			type: 'POST',
			data: { "post_id": post_id },
			dataType: "text",
			success: function(data) {
				console.log("favoriteOn : " + data);
				$(e.target).next().text(data);
			},
			error: function(data) {
				alert(data);
			}

		});
	}

	function favoriteOff(post_id, e) {
		$.ajax({
			url: "/favoriteOff",
			type: 'POST',
			data: { "post_id": post_id },
			dataType: "text",
			success: function(data) {
				console.log("favoriteOff : " + data);
				$(e.target).next().text(data);
			},
			error: function(data) {
				alert(data);
			}

		});
	}




/* ---------------------------------------------------------------------------------------------*/

	$("#writeBtn").on("click", function(e) {
		e.preventDefault();

		var url = $("#writeForm").attr("action");
		var form = $('#writeForm')[0];
		var formData = new FormData(form);

		$.ajax({
			url: url,
			type: 'POST',
			data: formData,
			dataType: "json",
			success: function(data) {
				console.log(data);
				console.log("number of files : " + data.nof);
				console.log("profile : " + data.profile);
				console.log("files : " + data.files);
				console.log("type : " + data.type);
				if (data.nof == 0) {
					console.log(makePostHtml0(data.name, data.profile, data.post));
					$("#post_wrap").prepend(makePostHtml0(data.name, data.profile, data.post) + makePostHtmlFooter(data.post));
				} else if (data.nof == 1) {
					console.log("왜 안 됨 ? ");
					if ((data.type).includes("image")) {
						$("#post_wrap").prepend(makePostHtml1(data.name, data.profile, data.post, data.files));
						console.log("이미지");
					} else if ((data.type).includes("video")) {
						$("#post_wrap").prepend(makePostHtmlv(data.name, data.profile, data.post, data.files));
						console.log("비디오");
					}
				} else if (data.nof == 2) {
					$("#post_wrap").prepend(makePostHtml2(data.name, data.profile, data.post, data.files));
				} else if (data.nof == 3) {
					$("#post_wrap").prepend(makePostHtml3(data.name, data.profile, data.post, data.files));
				} else if (data.nof == 4) {
					$("#post_wrap").prepend(makePostHtml4(data.name, data.profile, data.post, data.files));
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
			error: function(data) {
				alert(data);
			},
			cache: false,
			contentType: false,
			processData: false
		});


	})



	function makePostHtml0(name, image, post) {

		var phtml = '<div class="post" style="position: relative;">';
		phtml += '<div class="post_profile-image rounded-5">';
		phtml += '<img class="" src="/upload/' + image + '" alt="profile">';
		phtml += '<div style="position: absolute; height: 100%; width: 80px;"></div></div>';
		phtml += '<div class="post_body">';
		phtml += '<div class="post_header">'
		phtml += '<div class="post_header-text">';
		phtml += '<h3>';
		phtml += name + '<span class="header-icon-section">@' + post.user_id;
		phtml += '</span>';
		phtml += '</h3>';
		phtml += '<div style="margin-left: 1rem; text-align: center;">';
		phtml += '<h3>방금 전</h3>';
		phtml += '</div></div>';
		phtml += '<div class="post_header-discription"';
		phtml += 'onclick="location.href=' + "'/viewContent?post_id=" + post.post_id + "'" + '">';
		phtml += '<p>' + post.pcontent + '</p>';


		if (post.plocation != "") {
			phtml += '<div class="" style="color:gray">';
			phtml += '<div style="display: flex;">';
			phtml += '<span class="material-icons">location_on</span>';
			phtml += '<div>' + post.plocation + '</div>';
			phtml += '</div></div>';
		}


		phtml += '</div></div>';

		//phtml += makePostHtmlFooter();


		return phtml;
	}

	function makePostHtmlv(name, image, post, files) {

		var phtml = makePostHtml0(name, image, post);
		phtml += '<div class="container video_contaner">';
		phtml += '<video controls loop muted preload="auto" src="/upload/' + files + '">';
		phtml += '</video></div>';

		phtml += makePostHtmlFooter(post);

		return phtml;
	}

	function makePostHtml1(name, image, post, files) {
		//var file = files.split(",");
		var phtml = makePostHtml0(name, image, post);

		phtml += '<div class="container">';
		phtml += '<div class="row row-cols-auto ">';
		phtml += '<div class="col-md-auto img-xl rounded-4">';
		phtml += '<img src="/upload/' + files + '" class="rounded " alt="java18"';
		phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="/upload/' + files + '">';
		phtml += '</div></div></div>';

		phtml += makePostHtmlFooter(post);

		return phtml;
	}

	function makePostHtml2(name, image, post, files) {
		var file = files.split(",");
		var phtml = makePostHtml0(name, image, post);

		phtml += '<div class="container">';
		phtml += '<div class="row row-cols-auto ">';
		phtml += '<div class="col-md-auto img-lg rounded-4">';
		phtml += '<img src="/upload/' + file[0] + '" class="rounded " alt="java18"';
		phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="upload/' + file[0] + '">';
		phtml += '</div>';
		phtml += '<div class="col-md-auto img-lg rounded-4">';
		phtml += '<img src="/upload/' + file[1] + '" class="rounded " alt="java18"';
		phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="/upload/' + file[1] + '">';
		phtml += '</div></div></div>';

		phtml += makePostHtmlFooter(post);

		return phtml;
	}

	function makePostHtml3(name, image, post, files) {
		var file = files.split(",");
		var phtml = makePostHtml0(name, image, post);

		phtml += '<div class="container">';
		phtml += '<div class="row row-cols-auto">';
		phtml += '<div class="col-md-auto img-md rounded-4">';
		phtml += '<img src="upload/' + file[0] + '" class="rounded " alt="java18"';
		phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="upload/' + file[0] + '">';
		phtml += '</div>';
		phtml += '<div class="col-md-auto">';
		phtml += '<div class="row row-cols-auto">';
		phtml += '<div class="col-md-auto img-sm">';
		phtml += '<img src="upload/' + file[1] + '" class="rounded "';
		phtml += 'alt="java18" data-bs-toggle="modal"';
		phtml += 'data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="upload/' + file[1] + '">';
		phtml += '</div>';
		phtml += '</div>';
		phtml += '<div class="row row-cols-auto">';
		phtml += '<div class="col-md-auto img-sm">';
		phtml += '<img src="upload/' + file[2] + '" class="rounded "';
		phtml += 'alt="java18" data-bs-toggle="modal"';
		phtml += 'data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="upload/' + file[2] + '">';
		phtml += '</div></div></div></div></div>';

		phtml += makePostHtmlFooter(post);

		return phtml;
	}

	function makePostHtml4(name, image, post, files) {
		var file = files.split(",");
		var phtml = makePostHtml0(name, image, post);

		phtml += '<div class="container img-sm">';
		phtml += '<div class="row">';
		phtml += '<div class="col-md-auto">';
		phtml += '<img src="upload/' + file[0] + '" class="rounded " alt="java18"';
		phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="upload/' + file[0] + '">';
		phtml += '</div>';
		phtml += '<div class="col-md-auto">';
		phtml += '<img src="upload/' + file[1] + '" class="rounded " alt="java18"';
		phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="upload/' + file[1] + '">';
		phtml += '</div>';
		phtml += '</div>';
		phtml += '<div class="row">';
		phtml += '<div class="col-md-auto">';
		phtml += '<img src="upload/' + file[2] + '" class="rounded " alt="java18"';
		phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="upload/' + file[2] + '">';
		phtml += '</div>';
		phtml += '<div class="col-md-auto">';
		phtml += '<img src="upload/' + file[3] + '" class="rounded " alt="java18"';
		phtml += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
		phtml += 'data-bs-whatever="upload/' + file[3] + '">';
		phtml += '</div></div></div>';

		phtml += makePostHtmlFooter(post);

		return phtml;
	}

	function makePostHtmlFooter(post) {
		var phtml = '<div class="post_footer">';
		phtml += '<span class="material-icons ms_icons chat" data-bs-toggle="modal"';
		phtml += 'data-bs-target="#writeModal" data-post_id="' + post.post_id + '"';
	//	phtml += 'data-group="' + post.pgroup + '" ';
	//	phtml += 'data-step="' + post.pstep + '" ';
	//	phtml += 'data-indent="' + post.pindent + '"
		phtml += '>chat</span>';


		phtml += '<h3>0</h3>';
		phtml += '<span class="material-icons ms_icons repeat"';
		phtml += 'data-post_id="' + post.post_id + '"';
		phtml += '>repeat</span>';
		phtml += '<h3>0</h3>';
		phtml += '<span class="material-icons ms_icons favorite"';
		phtml += 'data-post_id="' + post.post_id + '"';
		phtml += '>favorite_border</span>';
		phtml += '<h3>0</h3>';
		phtml += '<span class="material-icons ms_icons chart"';
		phtml += 'data-post_id="' + post.post_id + '"';
		phtml += '>bar_chart</span>';
		phtml += '<h3>0</h3>';
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
		ip1.setAttribute("value", postId);
		ip1.setAttribute("name", "post_id");

/*		var ip2 = document.createElement("input");
		ip2.setAttribute("type", "hidden");
		ip2.setAttribute("value", group);
		ip2.setAttribute("name", "pgroup");

		var ip3 = document.createElement("input");
		ip3.setAttribute("type", "hidden");
		ip3.setAttribute("value", step);
		ip3.setAttribute("name", "pstep");

		var ip4 = document.createElement("input");
		ip4.setAttribute("type", "hidden");
		ip4.setAttribute("value", indent);
		ip4.setAttribute("name", "pindent");

		$("#modal_hidden").html("");*/

		$("#modal_hidden").append(ip1);
/*		$("#modal_hidden").append(ip2);
		$("#modal_hidden").append(ip3);
		$("#modal_hidden").append(ip4);*/


	})




	$("#modal_write-btn").on("click", function(e) {

		e.preventDefault();

		var url = $("#modalForm").attr("action");
		var form = $('#modalForm')[0];
		var formData = new FormData(form);

		$.ajax({
			url: url,
			type: 'POST',
			data: formData,
			dataType: "json",
			success: function(data) {
				console.log(data);
				console.log("number of files : " + data.nof);
				console.log("profile : " + data.profile);
				console.log("files : " + data.files);
				console.log("type : " + data.type);
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
			error: function(data) {
				alert(data);
			},
			cache: false,
			contentType: false,
			processData: false
		});



	})





	$(document).on("click", ".deleteOne", function(e) {

		var element = e.target;
		console.log(element);

		var postId = element.getAttribute('data-post_id');
		console.log(postId);
		$.ajax({
			url: "/deleteOne",
			type: 'POST',
			data: { "post_id": postId },
			dataType: "text",
			success: function(data) {

				alert("삭제되었습니다.");
				location.reload(true);
			},
			error: function(data) {
				alert(data);
			}
		});

	})

	//////////////위치 검색 함수/////////////////////////////

	$("#locSearch").on("keyup", function(e) {

		if (e.keyCode == 13) {

			searchPlaces();
			$("#locSearch").val("");

		}

	});
	
	$("#locSearch2").on("keyup", function(e) {

		if (e.keyCode == 13) {

			searchPlaces2();
			$("#locSearch2").val("");

		}

	});

	
	//장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();


	//키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = $("#locSearch").val();

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}


	//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
	//		displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	//검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList');
	//	var menuEl = document.getElementById('menu_wrap');
		var fragment = document.createDocumentFragment();
	//	var bounds = new kakao.maps.LatLngBounds();

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		for (var i = 0; i < places.length; i++) {
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);

			var itemEl = makeListItem(places[i]);
			

			fragment.append(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		listEl.appendChild(fragment);

	}



	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}


	function makeListItem(places) {

		var el = document.createElement('div');
		
		let addrHtml = '<div class="row  align-items-start selAddr" data-bs-dismiss="modal" aria-label="Close"';
		addrHtml += 'data-location="'+places.place_name	+'">';
		
		addrHtml += '<div class="col col-2 border-end border-secondary mt-1 addrHead">';
		addrHtml += places.place_name;
		addrHtml += '</div>';

		addrHtml += '<div class="col col-5 mt-1 addrbody">';
		addrHtml += places.road_address_name;
		addrHtml += '</div></div>';

		addrHtml += '<div class="w-100"></div>';

		el.innerHTML = addrHtml;
		el.className = 'item';

		console.log(el);

		return el;
	}


	//키워드 검색을 요청하는 함수입니다
	function searchPlaces2() {

		var keyword = $("#locSearch2").val();

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB2);
	}
	
	//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB2(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces2(data);

			// 페이지 번호를 표출합니다
	//		displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}
	//검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces2(places) {

		var listEl = document.getElementById('placesList2');
		var menuEl = document.getElementById('menu_wrap');
		var fragment = document.createDocumentFragment();
		var bounds = new kakao.maps.LatLngBounds();

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		for (var i = 0; i < places.length; i++) {
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);

			var itemEl = makeListItem2(places[i]);
			

			fragment.append(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		listEl.appendChild(fragment);

	}
	
	
	function makeListItem2(places) {

		var el = document.createElement('div');
		
		let addrHtml = '<div class="row  align-items-start selAddr2" data-bs-dismiss="modal" aria-label="Close"';
		addrHtml += 'data-location="'+places.place_name	+'"';
		addrHtml += 'data-bs-dismiss="modal" aria-label="Close"';
		addrHtml += '>';

		
		addrHtml += '<div class="col col-2 border-end border-secondary mt-1 addrHead">';
		addrHtml += places.place_name;
		addrHtml += '</div>';

		addrHtml += '<div class="col col-5 mt-1 addrbody">';
		addrHtml += places.road_address_name;
		addrHtml += '</div></div>';

		addrHtml += '<div class="w-100"></div>';

		el.innerHTML = addrHtml;
		el.className = 'item';

		console.log(el);

		return el;
	}
	
	
	/* ---------------------------스크롤 감지---------------------------- */

	$("main").scroll(function(){
	        var scrollTop = $(this).scrollTop();
	        var innerHeight = $(this).innerHeight();
	        var scrollHeight = $(this).prop('scrollHeight');
	
	        if (scrollTop + innerHeight >= scrollHeight) {
	       		
	       		pageCounter++;
	       		
	       		console.log(pageCounter);
	       		
	       		let postElement = $("#post_wrap");
	       		
	       		$.ajax({
				url: "/getPostAjax",
				type: 'POST',
				data: { "pageCounter": pageCounter },
				dataType: "json",
				success: function(data) {
	
					console.log("pageCounter : " + data.pageCounter);
					console.log(data.plist);
					console.log(data.ulist);
					console.log(data.mlist);
					console.log(data.recount);
					console.log(data.renoted);
					console.log(data.facount);
					console.log(data.favorited);
					console.log(data.replycount);
					console.log(data.user_id);
					console.log("Length : "+data.plist.length);
					
					for(let i = 0 ; i < data.plist.length ; i++){
					
						$("#post_wrap").append(makeHtml(data,i));
					
					}
					
				},
				error: function(data) {
					alert(data);
				}
			});
	
	       		
	        } else {
	       
	        }
	});


	function makeHtml(data,i){
		
		let postHtml="";
		
			
			postHtml += '<div class="post" style="position: relative;">';
			postHtml += '			<div class="post_profile-image rounded-5">';
			postHtml += '				<img class="" src="/upload/'+data.ulist[i].profile_img+'"';
			postHtml += '					alt="profile">';
			postHtml += '				<div style="position: absolute; height: 100%; width: 80px;">';
			
			if(data.plist[i].post_id == data.plist[i+1].pindent){
				postHtml += '					<div style="width: 3px; height: 98%; top: -3px; ';
				postHtml += '						background-color: var(--twitter-line-color); position: absolute; left: 25%;">';
				postHtml += '					</div>';
				
			}
			postHtml += '				</div>';
			postHtml += '			</div>';
			postHtml += '			<div class="post_body">';
			postHtml += '				<div class="post_header">';
			postHtml += '					<div class="post_header-text">';
			postHtml += '						<h3>';
			postHtml += '							'+data.ulist[i].name+'<span class="header-icon-section">@'+data.ulist[i].user_id;
			postHtml += '							</span>';
			postHtml += '						</h3>';
			postHtml += '						<div style="margin-left: 1rem; text-align: center;">';
			postHtml += '							<h3>'+data.plist[i].created+'</h3>';
			postHtml += '						</div>';
			postHtml += '					</div>';
			postHtml += '					<div class="post_header-discription"';
			postHtml += '						onclick="location.href='+"'"+'/viewContent?post_id='+data.plist[i].post_id+"'"+'">';
			postHtml += '						<p>'+data.plist[i].pcontent+'</p>';
			
			if(data.plist[i].plocation!=null){
				postHtml += '							<div class="" style="color:gray">';
				postHtml += '								<div style="display: flex;">';
				postHtml += '									<span class="material-icons">location_on</span>';
				postHtml += '									<div>'+data.plist[i].plocation+'</div>';
				postHtml += '								</div>';
				postHtml += '							</div>';
				
			}
			

			postHtml += '					</div>';
			postHtml += '				</div>';

			if(data.mlist[i]!=null){
				if(data.mlist[i].file_type.includes('video')){
					postHtml += '<div class="container video_contaner">';
					postHtml += '	<video controls loop muted preload="auto"';
					postHtml += '		src="/upload/'+data.mlist[i].file_name+'">';
					postHtml += '	</video>';
					postHtml += '</div>';
				}else if(data.mlist[i].file_type.includes('image')){
					let img = data.mlist[i].file_name.split(',');
					
					if(img.length==1){
						postHtml += '				<div class="container">';
						postHtml += '					<div class="row row-cols-auto ">';
						postHtml += '						<div class="col-md-auto img-xl rounded-4">';
						postHtml += '							<img src="/upload/'+data.mlist[i].file_name+'"';
						postHtml += '								class="rounded " alt="java18" data-bs-toggle="modal"';
						postHtml += '								data-bs-target="#exampleModal"';
						postHtml += '								data-bs-whatever="/upload/'+data.mlist[i].file_name+'">';
						postHtml += '						</div>';
						postHtml += '					</div>';
						postHtml += '				</div>';
					}else if(img.length==2){
						postHtml += '				<div class="container">';
						postHtml += '					<div class="row row-cols-auto ">';
						postHtml += '						<div class="col-md-auto img-lg rounded-4">';
						postHtml += '							<img src="/upload/'+img[0]+'" class="rounded " alt="java18"';
						postHtml += '								data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '								data-bs-whatever="/upload/'+img[0]+'">';
						postHtml += '						</div>';
						postHtml += '						<div class="col-md-auto img-lg rounded-4">';
						postHtml += '							<img src="/upload/'+img[1]+'" class="rounded " alt="java18"';
						postHtml += '								data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '								data-bs-whatever="/upload/'+img[1]+'">';
						postHtml += '						</div>';
						postHtml += '					</div>';
						postHtml += '				</div>';
						
					}else if(img.length==3){
						postHtml += '				<div class="container">';
						postHtml += '					<div class="row row-cols-auto">';
						postHtml += '						<div class="col-md-auto img-md rounded-4">';
						postHtml += '							<img src="/upload/'+img[0]+'" class="rounded " alt="java18"';
						postHtml += '								data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '								data-bs-whatever="/upload/'+img[0]+'">';
						postHtml += '						</div>';
						postHtml += '						<div class="col-md-auto">';
						postHtml += '							<div class="row row-cols-auto">';
						postHtml += '								<div class="col-md-auto img-sm">';
						postHtml += '									<img src="/upload/'+img[1]+'" class="rounded " alt="java18"';
						postHtml += '										data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '										data-bs-whatever="/upload/'+img[1]+'">';
						postHtml += '								</div>';
						postHtml += '							</div>';
						postHtml += '							<div class="row row-cols-auto">';
						postHtml += '								<div class="col-md-auto img-sm">';
						postHtml += '									<img src="/upload/'+img[2]+'" class="rounded " alt="java18"';
						postHtml += '										data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '										data-bs-whatever="/upload/'+img[2]+'">';
						postHtml += '								</div>';
						postHtml += '							</div>';
						postHtml += '						</div>';
						postHtml += '					</div>';
						postHtml += '				</div>';
						
					}else if(img.length==4){
						postHtml += '				<div class="container img-sm">';
						postHtml += '					<div class="row">';
						postHtml += '						<div class="col-md-auto">';
						postHtml += '							<img src="/upload/'+img[0]+'" class="rounded " alt="java18"';
						postHtml += '								data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '								data-bs-whatever="/upload/'+img[0]+'">';
						postHtml += '						</div>';
						postHtml += '						<div class="col-md-auto">';
						postHtml += '							<img src="/upload/'+img[1]+'" class="rounded " alt="java18"';
						postHtml += '								data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '								data-bs-whatever="/upload/'+img[1]+'">';
						postHtml += '						</div>';
						postHtml += '					</div>';
						postHtml += '					<div class="row">';
						postHtml += '						<div class="col-md-auto">';
						postHtml += '							<img src="/upload/'+img[2]+'" class="rounded " alt="java18"';
						postHtml += '								data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '								data-bs-whatever="/upload/'+img[2]+'">';
						postHtml += '						</div>';
						postHtml += '						<div class="col-md-auto">';
						postHtml += '							<img src="/upload/'+img[3]+'" class="rounded " alt="java18"';
						postHtml += '								data-bs-toggle="modal" data-bs-target="#exampleModal"';
						postHtml += '								data-bs-whatever="/upload/'+img[3]+'">';
						postHtml += '						</div>';
						postHtml += '					</div>';
						postHtml += '				</div>';
						
					}
				}
			}
			postHtml += '				<div class="post_footer">';
			postHtml += '					<span class="material-icons ms_icons chat"';
			postHtml += '						data-bs-toggle="modal" data-bs-target="#writeModal" ';
			postHtml += '						data-post_id="'+data.plist[i].post_id+'" ';
			postHtml += '						data-group="'+data.plist[i].pgroup+'" ';
			postHtml += '						data-step="'+data.plist[i].pstep+'" ';
			postHtml += '						data-indent="'+data.plist[i].pindent+'">chat</span>';
			postHtml += '					<h3>'+data.replycount[i]+'</h3>';
								
								if(data.renoted[i]<1){
									postHtml += '<span class="material-icons ms_icons repeat"';
									postHtml += 'data-post_id="'+data.plist[i].post_id+'">repeat</span>';
								}else{
									postHtml += '<span class="material-icons ms_icons repeat toggle"';
									postHtml += 'data-post_id="'+data.plist[i].post_id+'">repeat</span>';
								}
								
								postHtml += '<h3>'+data.recount[i]+'</h3>';
								
								if(data.favorited[i]<1){
									postHtml += '<span class="material-icons ms_icons favorite"';
									postHtml += 'data-post_id="'+data.plist[i].post_id+'">favorite_border</span>';
								}else{
									postHtml += '<span class="material-icons ms_icons favorite toggle"';
									postHtml += 'data-post_id="'+plist[i].post_id+'">favorite</span>';
								}
								
			postHtml += '					<h3>'+data.facount[i]+'</h3>';
			postHtml += '					<span class="material-icons ms_icons chart"';
			postHtml += '					data-post_id="'+data.plist[i].post_id+'">bar_chart</span>';
			postHtml += '					<h3>'+data.plist[i].hit+1+'</h3>';
			postHtml += '				</div>';
			postHtml += '			</div>';
			postHtml += '		</div>';
			
			
			


			
			return postHtml;
			
		
		
		
	}
	
	
	
	/* 인용알티 */
	
	
	let quotationModal = document.getElementById('quotationModal')
	quotationModal.addEventListener('show.bs.modal', function(e) {
		
		console.log("quotationModal is ...");
		console.log(e);
		console.log(e.relatedTarget.parentNode.parentNode.parentNode.parentNode.parentNode);
		console.log($(e.relatedTarget.parentNode.parentNode.parentNode.parentNode.parentNode));

		console.log(e.target.querySelector('.container'));
		console.log($(e.target.querySelector('.container')).children('img').attr("src"));
		console.log(e.target.querySelector('.post_header'));
		console.log(e.relatedTarget.querySelector('.post_header-discription'));
		console.log($(e.target.querySelector('.post_header')).children("p.thisContent"));
		
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

});












