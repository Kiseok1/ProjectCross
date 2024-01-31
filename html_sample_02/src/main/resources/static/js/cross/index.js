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
					var img = document.createElement("source");
					//	console.log("isImageFile",e.target);
					img.setAttribute("src", e.target.result);
					img.setAttribute("class", "modal_userfile");
					img.setAttribute("onmouseover", "this.src='images/cancel.png'");
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
				url: "location",
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
		location.href='analystic';
	});	
	

	$(".repeat").on("click", function(e) {
		if ($(e.target).hasClass("toggle") == false) {
			$(e.target).addClass("toggle");

		} else {
			$(e.target).removeClass("toggle");

		}

	});

	$(".favorite").on("click", function(e) {

		if ($(e.target).hasClass("toggle") == false) {
			$(e.target).addClass("toggle");
			$(e.target).text("favorite");

		} else {
			$(e.target).removeClass("toggle");
			$(e.target).text("favorite_border");

		}

	})

	$(".bookmark").on("click", function(e) {

		if ($(e.target).hasClass("toggle") == false) {
			$(e.target).addClass("toggle");
			$(e.target).text("bookmark");

		} else {
			$(e.target).removeClass("toggle");
			$(e.target).text("bookmark_border");

		}

	})
	


})