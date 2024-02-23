<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Twitter Profile</title>
    
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/js/cross/index.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
 

    <link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
		crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/node_modules/reset.css/reset.css">    
    <link rel='stylesheet' type='text/css' href='/css/profile.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="/css/style_x_ui.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
    
    <script>
    	$(function(){
    		$(".heading_media").click(function(){
    			location.href = "media2";
    		})
    		$(".heading_content").click(function(){
    			location.href = "content2";
    		})
    		$(".heading_reply").click(function(){
    			location.href = "reply2";
    		})
    		$(".heading_like").click(function(){
    			location.href = "like2";
    		})
    		$(".editprofile").click(function(){
    			location.href = "mypage";
    		})
    		
    		<!-- 프로필 수정_이미지파일 -->
    		
    		let img_location = "";
    		let header_img="${udto.header_img}";
    		let profile_img="${udto.profile_img}";

    		$(".header_camera").click(function(){
    			img_location = "header_camera";
    			console.log(img_location);
    			$('#file').click();
    		})
    		
    		$(".profile_camera").click(function(){
    			img_location = "profile_camera";
    			console.log(img_location);
    			$('#file').click();
    		})
    		
    		$("#file").on("change",function(e){	    		
	    		  
    			  		var file = e.target.files[0];
    			  		let name=file.name;
    			  		
    			  	    if(isImageFile(file)) { 
    			  	      var reader = new FileReader(); 
    			  	      reader.onload = function(e) {	
    			  	    	 var img = document.createElement("img");
    			  	         img.setAttribute("src", e.target.result);
    						 
    						 if(img_location=="header_camera"){
	    			  	       	 $("#headerimage").attr("src",img.src);
	    			  	         var form_data = new FormData(); //form객체선언
	    			  	  		 form_data.append("file",file);
	    			  	       	 
	    			  	       	 /* 이미지 저장 */
	    			  	       	 $.ajax({
	    			  	       		 url:"/profile/imgUpload",
		    			  	       	 type:"post",
		    			  			 data:form_data,
		    			  			 cashe:false,
		    			  			 contentType:false,
		    			  			 enctype:"multipart/form-data",
		    			  			 processData:false,
		    			  			 success:function(data){ //업로드 된 url링크 주소를 data에 전송
		    			  			 	header_img=data;
		    			  		   	 },
		    			  			 error:function(){
		    			  				alert("실패");
		    			  			 }
		    			  		 });//ajax
    						 
    						 } else {
    							 $("#profilepic").attr("src",img.src);
    							 var form_data = new FormData(); //form객체선언
	    			  	  		 form_data.append("file",file);
	    			  	       	 
	    			  	       	 /* 이미지 저장 */
	    			  	       	 $.ajax({
	    			  	       		 url:"/profile/imgUpload",
		    			  	       	 type:"post",
		    			  			 data:form_data,
		    			  			 cashe:false,
		    			  			 contentType:false,
		    			  			 enctype:"multipart/form-data",
		    			  			 processData:false,
		    			  			 success:function(data){ //업로드 된 url링크 주소를 data에 전송
		    			  			 	profile_img=data;
		    			  		   	 },
		    			  			 error:function(){
		    			  				alert("실패");
		    			  			 }
		    			  		 });//ajax
    						 }
    			  	      }
	    			  	reader.readAsDataURL(file);
    			  	    } 
    			  	  
	    	  })

	    	  function isImageFile(file) {
				  // 파일명에서 확장자를 가져옴
				  var ext = file.name.split(".").pop().toLowerCase(); 
				  return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
				}
	    	  
	    	  $(document).on("click",".userfile",function(e){
	    			  
	    		  	const files = $("#file")[0].files;
	    		  	const dataTranster = new DataTransfer();
	    		  	const removeTargetId = $(e.target).attr("data-set");
	    		  	
	    		  	console.log("target : " , e);
	    	  		
	    	  		
	    	  		 Array.from(files).forEach(file => {
	    	  			console.log(removeTargetId+" "+file.name);
	    	  			 if(removeTargetId!=file.name)
    	  				 {
	    	  				dataTranster.items.add(file);
    	  				 }
	                 });
	    	  		$("#file")[0].files = dataTranster.files;
	    	  		$(e.target).remove();
	    	  		console.log($("#file")[0].files);
	    	  });
	    	  <!-- 프로필 수정_이미지파일 끝 -->	
	    	  
	    	  var name_length = $(".name_input").val().length;
	    	  var introduce_length = $(".introduce_textarea").val().length;
	    	  var location_length = $(".location_input").val().length;
	    	  var website_length = $(".website_input").val().length;
	    	  
	    	  $(".name_input").keyup(function(){
	    		  name_length = $(".name_input").val().length;
	    		  console.log(name_length);
	    		  $(".name_length").text(name_length);
	    	  })
	    	  
	    	  $(".introduce_textarea").keyup(function(){
	    		  introduce_length = $(".introduce_textarea").val().length;
	    		  console.log(introduce_length);
	    		  $(".introduce_length").text(introduce_length);
	    	  })
	    	  
	    	  $(".location_input").keyup(function(){
	    		  location_length = $(".location_input").val().length;
	    		  console.log(location_length);
	    		  $(".location_length").text(location_length);
	    	  })
	    	  
	    	  $(".website_input").keyup(function(){
	    		  website_length = $(".website_input").val().length;
	    		  console.log(website_length);
	    		  $(".website_length").text(website_length);
	    	  })
	    	  
	    	  $(".name_input").focus(function(){
	    		  $(this).parent().css("border","3px solid var(--twitter-theme-color)");
	    		  $(this).prevAll().css("color","var(--twitter-theme-color)")
	    	  })
	    	  $(".name_input").blur(function(){
	    		  $(this).parent().css("border","1px solid black")
	    		  $(this).prevAll().css("color","black")
	    	  })
	    	  $(".introduce_textarea").focus(function(){
	    		  $(this).parent().css("border","3px solid var(--twitter-theme-color)");
	    		  $(this).prevAll().css("color","var(--twitter-theme-color)")
	    	  })
	    	  $(".introduce_textarea").blur(function(){
	    		  $(this).parent().css("border","1px solid black")
	    		  $(this).prevAll().css("color","black")
	    	  })
	    	  $(".location_input").focus(function(){
	    		  $(this).parent().css("border","3px solid var(--twitter-theme-color)");
	    		  $(this).prevAll().css("color","var(--twitter-theme-color)")
	    	  })
	    	  $(".location_input").blur(function(){
	    		  $(this).parent().css("border","1px solid black")
	    		  $(this).prevAll().css("color","black")
	    	  })
	    	  $(".website_input").focus(function(){
	    		  $(this).parent().css("border","3px solid var(--twitter-theme-color)");
	    		  $(this).prevAll().css("color","var(--twitter-theme-color)")
	    	  })
	    	  $(".website_input").blur(function(){
	    		  $(this).parent().css("border","1px solid black")
	    		  $(this).prevAll().css("color","black")
	    	  })
	    	  
	    	  
	    	  $(document).ready(function(){
	    		  $(".name_length").text(name_length);
	    		  $(".introduce_length").text(introduce_length);
	    		  $(".location_length").text(location_length);
	    		  $(".website_length").text(website_length);
	    	  });
	    	  
	    	  /* 프로필 수정 */
	    	  $(".savebtn").click(function(){
	    		  let name = $(".name_input").val();
	    		  let profile_txt = $(".introduce_textarea").val();
	    		  let user_loc = $(".location_input").val();
	    		  let user_url = $(".website_input").val();
	    		  
	    		  $.ajax({
	    			  url:"/profile/profileUpdate",
	    			  type:"post",
	    			  data:{"name":name,"profile_txt":profile_txt,"user_loc":user_loc,"user_url":user_url, "header_img":header_img, "profile_img":profile_img},
	    			  datatype:"text",
	    			  success:function(data){
	    				  $(".name_input").val(name);
	    				  $(".profile-img").children().css("background-image","url(/upload/"+profile_img+")");
	    				  $(".introduce_textarea").val(profile_txt);
	    	    		  $(".location_input").val(user_loc);
	    	    		  $(".website_input").val(user_url);
	    	    		  $(".profile-name").children().children().text(name);
	    				 
	    				  $("#writeModal").modal("show");
		    			  $("#modal_write-box").text(data);
	    			  },
	    			  error:function(data){
	    				  alert("실패");
	    			  }
	    		  })
	    		  
	    		  
	    	  });
	    	  
	    	  
    		
    	});//jquery
    	
    	
    	
    </script>
    
</head>

<body>
<div id="view-box">
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
        <div class="middlecontainer" >
            <section class="headsec">
                <a href="javascript:history.back()"><i class="fa fa-arrow-left" id="fa-arrow-left"></i></a>

            </section>
            <section class="twitterprofile">
                <div class="headerprofileimage">
           			<input type="file" id="file" name="file">
             		<div class="header_camera" >
                		<img src="/images/camera_add.png" >
               		</div>
               		<c:if test="${udto.header_img!=null}">
	                   	<img src="/upload/${udto.header_img}" alt="header" id="headerimage">
               		</c:if>
               		<c:if test="${udto.header_img==null}">
	                   	<img src="/images/header_default.jpg" alt="header" id="headerimage">
               		</c:if>
               	
               		<c:if test="${udto.profile_img!=null}">
	                    <img src="/upload/${udto.profile_img}" alt="profile pic" id="profilepic">
               		</c:if>
               		<c:if test="${udto.profile_img==null}">
	                    <img src="/images/header_default.jpg" alt="profile pic" id="profilepic">
               		</c:if>
               		<div class="profile_camera">
                		<img src="/images/camera_add.png" >
               		</div>
                	
                </div>
                <div class="profile_modify_outline" >
                	<div class="profile_modify_outline_name" >
                		이름
                		<div class="max_length length_fixed"> &nbsp/ 100</div><div class="max_length name_length"></div>
                		<br>
                		<input class="name_input" maxlength="100" value="${udto.name}">
                	</div>
                	
                	<div class="profile_modify_outline_introduce">
                		자기소개
                		<div class="max_length"> &nbsp/ 160</div><div class="max_length introduce_length"></div>
                		<br>
                		<textarea class="introduce_textarea" rows="3" maxlength="160">${udto.profile_txt}</textarea>
                	</div>
                	
                	<div class="profile_modify_outline_location">
                		위치
                		<div class="max_length"> &nbsp/ 30</div><div class="max_length location_length"></div>
                		<br>
                		<input class="location_input" maxlength="30" value="${udto.user_loc}">
                	</div>
                	
                	<div class="profile_modify_outline_website">
                		웹사이트
                		<div class="max_length"> &nbsp/ 100</div><div class="max_length website_length"></div>
                		<br>
                		<input class="website_input" maxlength="100" value="${udto.user_url}">
                	</div>
                	
                	<!-- <div class="profile_modify_outline_birthday">
                		생일
                		<br>
                		<div class="birthday_div">2024년 1월 25일</div>
                	</div> -->
   		            <div class="savebtn">저장</div>
                </div>
               
            </section>

		</div>
		</div>
		
		<!-- modal -->
	    <div class="modal" id="writeModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="height: 2rem;">
						<h5 class="modal-title"></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="tweet_box">
							<form>
								<div class="tweet_box-input">
									<div id="" class="rounded" style="position: relative; margin:auto;">
	
										<textarea rows="" cols="" class="content" id="modal_write-box"
											style="outline: none; width: 380px; border: none; resize: none; overflow: hidden; text-align: center; "></textarea>
										<div id="modal_position_wrap" class="invis">
											<div id="position-area" style="display: flex;">
												<span class="material-icons">location_on</span>
												<div id="modal_currLocation"></div>
											</div>
										</div>
										<div id="modal_image-area" style=""></div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script async
	src="https://cdn.jsdelivr.net/npm/es-module-shims@1/dist/es-module-shims.min.js"
	crossorigin="anonymous"></script>
<script type="importmap">
    {
      "imports": {
        "@popperjs/core": "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/esm/popper.min.js",
        "bootstrap": "https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.esm.min.js"
      }
    }
    </script>
<script type="module">
      import * as bootstrap from 'bootstrap'

      new bootstrap.Popover(document.getElementById('popoverButton'))
    </script>
</html>