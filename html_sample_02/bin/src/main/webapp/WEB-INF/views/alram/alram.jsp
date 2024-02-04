<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>BootStrap 01</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="/css/style_x_ui_jm.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

 <!-- include summernote css/js-->

<script>
@import "../node_modules/bootstrap/scss/bootstrap";

$(function(){
	var exampleModal = document.getElementById('exampleModal')
	exampleModal.addEventListener('show.bs.modal', function (event) {
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
	
	
    $('#summernote').summernote({
        placeholder: 'Hello Bootstrap 5',
        tabsize: 2,
        height: 100
      });
	
})
</script>

<script>
	$(function(){
		var dropicon;
		var dropdown = $(".dropdown_bar");
        var dropdownContent = $(".dropdown_content");
        dropdown.click(function(event) {
            event.stopPropagation(); // 클릭 이벤트 전파 방지
            if (dropdownContent.css("display") === "block") {
                dropdownContent.css("display", "none");
            } else {
                dropdownContent.css("display", "block");
            }
        });
		console.log()        
       $(".Xicon").click(function(event) {
    	   dropicon = $(this).next();
    	   /* alert("클릭:"+$(this).prev().text()); 
    	   alert("속성 : "+$(this).next().attr("class"));
    	   alert("스타일 : "+$(this).next().css("display")); */
    	   event.stopPropagation(); // 클릭 이벤트 전파 방지
            if ($(this).next().css("display") === "block") {
            	$(this).next().css("display", "none");
            } else {
            	$(this).next().css("display", "block");
            }
        }); 

        // 문서의 다른 부분을 클릭했을 때 드롭다운 메뉴를 닫음
        $(document).click(function() {
            dropdownContent.css("display", "none");
           
        });
       $(document).click(function() {
           if(dropicon.css("display")==="block") {
        	   dropicon.css("display","none");
           }
           
        }); 
        
	});
</script>
                 
</head>
 <body>
 <div id="view-box">
 	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
 	<style>
 		.Xicon{
 		display: none;
 		}
 	</style>
 <!-- <div id="view-box" style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-background-color);" >
 

	 <nav style="margin-top: 20px;" >
	    <div class="nav_logo-wrapper" >
	    	<img class="nav_logo" src="images/apple.jpg">
        </div>
        
	 	<div class="profile-wrapper ">
	 		<div class="profile-img">
	 			<div  class="img-wrapper rounded-5">
	 				
	 			</div>
	 		</div>
	 		<div class="profile-name">
	 			<div ><h2>Name</h2></div>
	 		</div>
	 		<div class="profile-follow">
	 			<div class="minifollow"><h4>팔로우</h4></div> 
	 			<div class="minifollowCount">100</div>

	 			<div class="minifollwer"><h4>팔로워</h4></div> 
	 			<div class="minifollwerCount">100</div>
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
	 </nav> -->


 <main>
        <div class="header dropdown">
             <span class="material-icons">notifications</span>
             	<span class="material-symbols-outlined dropdown_bar" style="position:absolute; right:1rem;">pending</span>
    	    	 <div class="dropdown_content">
        		 	<a href="">모두 읽은상태 표시</a>
        		 	<a href="">알람 설정</a>
			     </div>	
        </div>

        <div class="breadcrmb_div">
		  <ul class="nav nav-tabs" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true"
			   >전체</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false"
			     onclick="location.href='alramCheck'">확인완료</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">언급</button>
			  </li>
		  </ul> 
		 </div>

        <div class="alram_post">
            <div class="alram_post_profile-image">
					<div class="user">
					</div>
				</div>

            <div class="post_body">
                <div class="post_header">
                    <div class="post_header-text">
                        <h3>Java
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>@java
                                <span id="date">1월 18일</span>
                            </span>
                        </h3>
                    </div>
                    <div class="noCheck">
                        <p>
                           <strong>lets_be_next</strong>님이 회원님을
						   <div class="name">
						   	팔로우하기 시작했습니다.
						   </div>
	                    </div>
                       </p>
						   <button class="followBtn">팔로우2</button>
						   <span class="material-icons Xicon" >highlight_off</span>
                     <div class="Xcontent">
					    <a href="#">알림삭제</a>
					    <a href="#">알림차단</a>
                     </div>
                  </div>	
               </div>
        </div>
        <div class="alram_post">
            <div class="alram_post_profile-image">
					<div class="user">
					</div>
				</div>

            <div class="post_body">
                <div class="post_header">
                    <div class="post_header-text">
                        <h3>Java
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>@java
                                <span id="date">1월 18일</span>
                            </span>
                        </h3>
                    </div>

                    <div class="noCheck">
                        <p>
                           <strong>lets_be_next</strong>님이 회원님을
						   <div class="name">
						   	팔로우하기 시작했습니다.
						   </div>
                    	 </div>
                       </p>
      
						   <button class="followBtn">팔로우3</button>
						   <span class="material-icons Xicon">highlight_off</span>
                       <div class="Xcontent">
						    <a href="#">알림삭제</a>
						    <a href="#">알림차단</a>
                    </div>
                </div>
            </div>
        </div>
       
        <div class="alram_post">
            <div class="alram_post_profile-image">
					<div class="user">
					</div>
				</div>
            <div class="post_body">
                <div class="post_header">
                    <div class="post_header-text">
                        <h3>Java
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>@java
                                <span id="date">1월 18일</span>
                            </span>
                        </h3>
                    </div>

                    <div class="">
                        <p>
                           <strong>lets_be_next</strong> 님이 회원님의 게시물을
						   	좋아합니다.
                       </p>
                      <div class="like">
					        <a href="">
					        </a>
					      </div>
                       <span class="material-icons Xicon" >highlight_off</span>
					<div class="Xcontent">
					    <a href="#">알림삭제</a>
					    <a href="#">알림차단</a>
                     </div>
                 </div>
                </div>
            </div>
        </div>
        <div class="alram_post">
            <div class="alram_post_profile-image">
					<div class="user">
					</div>
				</div>

            <div class="post_body">
                <div class="post_header">
                    <div class="post_header-text">
                        <h3>Java
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>@java
                                <span id="date">1월 18일</span>
                            </span>
                        </h3>
                    </div>

                    <div class="">
                        <p>
                          <strong>lets_be_next</strong> 님이 댓글을 남겼습니다.
						  <div class="photo-frame">
					        <a href="">
					        	<img src="images/page-profile-image.png">
					        </a>
					      </div>
                       </p>
					        <span class="material-icons Xicon" >highlight_off</span>
                      <div class="Xcontent">
					    <a href="#">알림삭제</a>
					    <a href="#">알림차단</a>
                      </div>
                </div>
            </div>
        </div>
        </div>
        <div class="alram_post">
            <div class="alram_post_profile-image">
					<div class="user">
					</div>
				</div>

            <div class="post_body">
                <div class="post_header">
                    <div class="post_header-text">
                        <h3>Java
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>@java
                                <span id="date">1월 18일</span>
                            </span>
                        </h3>
                    </div>

                    <div class="">
                        <p>
                          <strong>lets_be_next</strong> 님이 리트윗하셨습니다!
						  <div class="photo-frame">
						  <span class="large material-icons ms_icons1 repeat" style="font-size:50px">repeat</span>
					      </div>
                       </p>
					        <span class="material-icons Xicon" >highlight_off</span>
                      <div class="Xcontent">
					    <a href="#">알림삭제</a>
					    <a href="#">알림차단</a>
                      </div>
                </div>
            </div>
        </div>
        </div>
    </main>
    <!-- main section end -->
    
 </div>



<!-- Modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

          <div class="mb-3">
            <label for="recipient-name" class="col-form-label"><img></label>
          </div>


      </div>

    </div>
  </div>

<!-- Modal End -->
  </body>
  
 <script async src="https://cdn.jsdelivr.net/npm/es-module-shims@1/dist/es-module-shims.min.js" crossorigin="anonymous"></script>
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