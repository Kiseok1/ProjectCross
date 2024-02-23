<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <!-- <meta http-equiv='X-UA-Compatible' content='IE=edge'> -->
    <meta name='viewport' content='width=device-width, initial-scale=1'>   
    <meta name='viewport' content='width=device-width, initial-scale=1'>
   
		
    <title>CROSS</title>
    
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
    <link rel="stylesheet" href="/css/style_x_ui_ks.css">
    <link rel="stylesheet" href="/css/style_x_ui_hw.css">

    <script>
	 $(function(event){
	     var dropdown = $(".dropdown_bar");
	     var dropdownContent = $(".dropdown_content");
	     $(".dropdown_bar").click(function(event) {
	         event.stopPropagation(); // 클릭 이벤트 전파 방지
	         if ($(this).find(".dropdown_content").css("display") === "block") {
	        	 $(this).find(".dropdown_content").css("display", "none");
	            	
	         } else {
	        	 $(this).find(".dropdown_content").css("display", "block");
	         }
	     });
	     
	     // 문서의 다른 부분을 클릭했을 때 드롭다운 메뉴를 닫음
	     $(document).click(function() {
	         dropdownContent.css("display", "none");
	     });
	     
	     $(".folbtn").click(function(){
	    	 	
				if($(this).text()=="언팔로우"){
					$(this).parent().prev().text("팔로우")
					$(this).text("팔로워")
					console.log("팔로잉->팔로우(언팔)");
					let stat = "delete";
					let target_id=$(this).attr("id");
					
					console.log(target_id)
					$.ajax({
						url:"/profile/followBtn",
						type:"post",
						data:{"stat":stat,"target_id":target_id},
						datatype:"text",
						success:function(data){
							
						},
						error:function(){
							alert("실패");
						}
					})
					
					
				} else if($(this).text()=="팔로워"){
					$(this).parent().prev().text("팔로잉")
					$(this).text("언팔로우")
					console.log("팔로우->팔로잉");
					let stat = "insert";
					let target_id=$(this).attr("id");
					console.log(target_id)
					$.ajax({
						url:"/profile/followBtn",
						type:"post",
						data:{"stat":stat,"target_id":target_id},
						datatype:"text",
						success:function(data){
							
						},
						error:function(){
							alert("실패");
						}
					})
				} 
		 
			})
	     
		});
	 
	
	 
	</script>
    
    
    
    
</head>

<body>

	<div id="view-box"
		style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-line-color);">
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	 <div class="middlecontainer" >
		<section class="headsec">
            <a href="javascript:history.back()"><i class="fa fa-arrow-left" id="fa-arrow-left"></i></a>
            <div>
                <h3>${udto.name}</h3> 
                <span></span>
            </div>
        </section>
		<section class="tweets">
               <div class="heading">
                   <div class="heading_content" onclick="location.href='/profile/follower?id=${udto.user_id}'">팔로워<div class="content_underbar"></div></div>
                   <div class="heading_like" onclick="location.href='/profile/following?id=${udto.user_id}'">팔로잉</div>
               </div>
        </section>
           
           
           
		<section>
		   <c:forEach items="${follower}" var="Udto" varStatus="stat">
		   	<c:if test="${Udto.user_id!=session_id}">
		   	   <div class="post" onclick="location.href='your_content?user_id=${Udto.user_id}'">
		    </c:if>
		    <c:if test="${Udto.user_id==session_id}">
		       <div class="post" onclick="location.href='content?user_id=${Udto.user_id}'">
		    </c:if>
			<div class="search_post_profile-image">
			<c:if test="${Udto.profile_img!=null}">
				<div class="user_profile"><img src="/upload/${Udto.profile_img}"></div>
			</c:if>
			<c:if test="${Udto.profile_img==null}">
				<div class="user_profile"><img src="/upload/proflie_default.png"></div>
			</c:if>
			
			</div>
			<div class="post_body">
				<div class="post_header">
					 <div class="post_header">				
					 <div class="search_user_head" >
						<h3>${Udto.name} <span class="header-icon-section"> <span class="material-icons post_badge">verified</span>@${Udto.user_id}</span>
						</h3>
					 </div>
					
				<!-- 드롭다운 -->
					<div class="post_header-discription">
						<div class="dropdown_bar" >
						  <!-- <p class="dropdown_bardropdown_bar">팔로우</p> -->
						  <c:if test="${Udto.user_id!=session_id}">
						  	  <c:if test="${Udto.user_id==followerDto[stat.index].target_id}">
							  <button class="followBtn">팔로잉</button>
							  <div class="dropdown_content" >
							 		<div class="folbtn" id="${Udto.user_id}">언팔로우</div>
							  </div>
						  	  </c:if>
						  	  <c:if test="${Udto.user_id!=followerDto[stat.index].target_id}">
							  <button class="followBtn">팔로우</button>
							  <div class="dropdown_content" >
							 		<div class="folbtn" id="${Udto.user_id}">팔로워</div>
							  </div>
						  	  </c:if>
						  </c:if>
						</div>
					</div>
				<!-- 드롭다운 -->
				</div>
			
				</div>
				<div class="user_Introduction">
				<c:if test="${Udto.profile_txt !=null}">
				 ${Udto.profile_txt}
				</c:if>
				<c:if test="${Udto.profile_txt ==null}">
					유저 소개말이 없습니다.
				</c:if>
				</div>
			</div>
		
		
		</div>
		   </c:forEach>
		   	</div>
		   </section>

				
			
        </div>
        </div>
       

      <!-- Modal -->

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">FileName</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">

					<div class="mb-3">
						<label for="recipient-name" class="col-form-label"><img></label>
					</div>


				</div>

			</div>
		</div>
	</div>




	<div class="modal" id="locationModal" tabindex="-1"
		aria-labelledby="locationModalLabel" aria-hidden="true"
		data-bs-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fs-6 fw-bold font-family-sans-serif"
						id="locationModalLabel">지역 검색</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">

					<div class="mb-3">
						<label for="recipient-name" class="col-form-label ">검색:</label> <input
							type="text" class="form-control" id="locSearch"
							data-bs-keyboard="false">
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label  ">검색 결과:</label>
						<div style="">

							<div class="container text-center locArray"
								style="overflow-y: scroll; height: 100px;">

								<div class="row  align-items-start selAddr"
									data-location="Loacation1">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr"
									data-location="Loacation2">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr"
									data-location="Loacation3">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr"
									data-location="Loacation4">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr">
									<div class="col col-2 border-end border-secondary mt-1"
										data-location="Loacation5">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>


								<div class="w-100"></div>

								<div class="row  align-items-start selAddr">
									<div class="col col-2 border-end border-secondary mt-1"
										data-location="Loacation6">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr"
									data-location="Loacation7">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr"
									data-location="Loacation8">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr"
									data-location="Loacation9">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>
							</div>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>


<!-- Write Modal -->
	<div class="modal" id="writeModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="height: 2rem;">
					<h5 class="modal-title">답글쓰기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form id="modalForm" action="/modalSendPost" method="post" enctype="multipart/form-data">
				<div id="modal_hidden"></div>
					<div class="modal-body">
						<div class="tweet_box">

							<div class="tweet_box-input">
								<div id="modal_text-area" class="rounded"
									style="position: relative;">

									<textarea rows="" cols="" class="content" id="modal_write-box" name="pcontent"
										style="outline: none; width: 380px; border: none; resize: none; overflow: hidden"></textarea>
									<div id="modal_position_wrap" class="invis">
										<div id="position-area" style="display: flex;">
											<span class="material-icons">location_on</span>
											<div id="modal_currLocation"></div>
										</div>
									</div>
									<div id="modal_image-area" style=""></div>

								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<div class="modal_box-footer" style="">


							<label for="modalFile" id="modalImgBtn"
								class="btn btn-sm btn-dark">사진등록</label> 
								<input type="file" name="files"	id="modalFile" multiple="multiple"> 
								<label for="modalRegPosition" id="modalregBtn"
								class="btn btn-sm btn-dark" data-bs-toggle="modal"
								data-bs-target="#locationModal2" data-bs-whatever="Test">위치등록</label>
							<input type="hidden" class="btn btn-sm btn-dark" id="modalRegPosition" name="plocation">
							<button id="modal_write-btn" class="modal_write-btn btn btn-sm btn-dark">게시하기</button>


						</div>
					</div>
				</form>

			</div>
		</div>
	</div>	








	<div class="modal" id="locationModal2" tabindex="-1"
		aria-labelledby="locationModalLabel2" aria-hidden="true"
		data-bs-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fs-6 fw-bold font-family-sans-serif"
						id="locationModalLabel2">지역 검색</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">

					<div class="mb-3">
						<label for="recipient-name" class="col-form-label ">검색:</label> 
						<input	type="text" class="form-control" id="locSearch"
							data-bs-keyboard="false">
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label  ">검색 결과:</label>
						<div style="">

							<div class="container text-center locArray"
								style="overflow-y: scroll; height: 100px;">

								<div class="row  align-items-start selAddr2"
									data-location="Loacation1">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr2"
									data-location="Loacation2">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr2"
									data-location="Loacation3">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr2"
									data-location="Loacation4">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr2"
									data-location="Loacation5">
									<div class="col col-2 border-end border-secondary mt-1"
										data-location="Loacation5">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>


								<div class="w-100"></div>

								<div class="row  align-items-start selAddr2">
									<div class="col col-2 border-end border-secondary mt-1"
										data-location="Loacation6">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr2"
									data-location="Loacation7">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>

								<div class="w-100"></div>

								<div class="row  align-items-start selAddr2"
									data-location="Loacation8">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>


								<div class="w-100"></div>

								<div class="row  align-items-start selAddr2"
									data-location="Loacation9">
									<div class="col col-2 border-end border-secondary mt-1">우편번호</div>
									<div class="col col-5 mt-1">주소</div>
								</div>
							</div>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>




	<!-- Modal End -->  
        
        
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