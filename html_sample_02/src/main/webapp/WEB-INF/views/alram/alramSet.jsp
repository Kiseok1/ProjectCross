<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/JmModal.js"></script>

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
</head>
 <body>
 <div id="view-box" style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-background-color);" >
 	<%@ include file="/WEB-INF/views/sidebar.jsp" %> 

	 <!-- <nav style="margin-top: 20px;" >
	    <div class="nav_logo-wrapper" >
	    	<img class="nav_logo" src="/images/apple.jpg">
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
            <h2>알림</h2><span class="badge text-bg-light rounded-pill align-text-bottom">new</span>
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
        <div class="header_alram headeralram dropdown">
             <span class="material-symbols-outlined">settings</span> 
             <h2>해당 알람 뮤트설정</h2>
        </div>
        
        <div class="Alram_options">
	 		<h2>내가 팔로우하지 않는계정</h2>
	 		<div class="form-check form-switch">
  				<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
			</div>
	 	</div>
        <div class="Alram_options">
	 		<h2>나를 팔로우하지 않는계정</h2>
	 		<div class="form-check form-switch">
  				<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
			</div>
	 	</div>
        <div class="Alram_options">
	 		<h2>새계정</h2>
	 		<div class="form-check form-switch">
  				<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
			</div>
	 	</div>
        <div class="Alram_options">
	 		<h2>기본 프로필 이미지를 사용하는 계정</h2>
	 		<div class="form-check form-switch">
  				<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
			</div>
	 	</div>
        <div class="Alram_options">
	 		<h2>이메일을 인증하지 않은 계정</h2>
	 		<div class="form-check form-switch">
  				<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
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