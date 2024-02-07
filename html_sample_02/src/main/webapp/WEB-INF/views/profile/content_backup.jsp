<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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

    
</head>

<body>

	<div id="view-box"
		style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-line-color);">
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	 <div class="middlecontainer" >
	<%@ include file="/WEB-INF/views/profile/main.jsp" %>
		   <section class="tweets">
               <div class="heading">
                   <div class="heading_content">게시물<div class="content_underbar"></div></div>
                   <div class="heading_reply">답글</div>
                   <div class="heading_media">미디어</div>
                   <div class="heading_like">마음에 들어요</div>
               </div>
           </section>
           
			<script>
				let count = 0;
			</script>
			<c:forEach var="pmuDto" items="${list}" varStatus="i" >
				<div class="post ${i.index}" style="position: relative;">

					<script>
						
						let post_id${i.index}= ${pmuDto.postDto.post_id};
						let file_name${i.index}="${pmuDto.mediaDto.file_name}";
						let file_type${i.index}="${pmuDto.mediaDto.file_type}";
						let pcontent${i.index}="${pmuDto.postDto.pcontent}";
						let post_userId${i.index}="${pmuDto.postDto.user_id}";
						let post_name${i.index}="${pmuDto.cross_userDto.name}";
						let post_profileImg${i.index}="${pmuDto.cross_userDto.profile_img}";
						if("${pmuDto.cross_userDto.profile_img}"==""){
							post_profileImg${i.index}="proflie_default.png";
						}
						let post_created${i.index}="${pmuDto.postDto.created}";
						console.log(post_id${i.index})
						
						if(${i.index==0}){
							count ++;
							console.log(count);
						} else if(!${i.last} && post_id${i.index}==post_id${i.index-1}){
							count ++;
							console.log(count);
						} else {
							if(count ==4 ){
								let hdata = "";
								
								hdata += '<div class="post_profile-image rounded-5">';
								hdata += '<img class="" src="/upload/'+post_profileImg${i.index-1}+'" alt="profile">';
								hdata += '<div style="position: absolute; height: 100%; width: 80px;">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_body">';
								hdata += '<div class="post_header">';
								hdata += '<div class="post_header-text">';
								hdata += '<h3>';
								hdata += post_userId${i.index-1}+' <span class="header-icon-section"> <span';
								hdata += 'class="material-icons post_badge">verified</span>@'+post_name${i.index-1};
								hdata += '</span>';
								hdata += '</h3>';
								hdata += '<div style="margin-left: 1rem; text-align: center;">';
								hdata += '<h3>'+post_created${i.index-1}+'</h3>';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_header-discription"';
								hdata += 'onclick="location.href=\'/viewContent\'">';
								hdata += '<p>'+pcontent${i.index-1}+'</p>';
								hdata += '</div>';
								hdata += '</div>';
								
								hdata += '<div class="container img-sm_0">';
								hdata += '<div class="row row-cols-auto">';
								hdata += '<div class="col-md-auto">';
								hdata += '<img src="/upload/'+file_name${i.index-1}+'" class="rounded " alt="java18"';
								hdata += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-1}+'">';
								hdata += '</div>';
								hdata += '<div class="col-md-auto">';
								hdata += '<img src="/upload/'+file_name${i.index-2}+'" class="rounded " alt="java18"';
								hdata += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-2}+'">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="row row-cols-auto">';
								hdata += '<div class="col-md-auto">';
								hdata += '<img src="/upload/'+file_name${i.index-3}+'" class="rounded " alt="java18"';
								hdata += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-3}+'">';
								hdata += '</div>';
								hdata += '<div class="col-md-auto">';
								hdata += '<img src="/upload/'+file_name${i.index-4}+'" class="rounded " alt="java18"';
								hdata += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-4}+'">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '</div>';
								
								hdata += '<div class="post_footer">';
								hdata += '<span class="material-icons ms_icons" data-bs-toggle="modal" data-bs-target="#writeModal">chat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons repeat">repeat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons favorite">favorite_border</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons chart">bar_chart</span>';
								hdata += '<h3>100</h3>';
								hdata += '</div>';
								
								$(".${i.index-1}").html(hdata);
								$(".${i.index-2}").remove();
								$(".${i.index-3}").remove();
								$(".${i.index-4}").remove();
								count =1;
							} else if(count==3){
								let hdata = "";

								hdata += '<div class="post_profile-image rounded-5">';
								hdata += '<img class="" src="/upload/'+post_profileImg${i.index-1}+'" alt="profile">';
								hdata += '<div style="position: absolute; height: 100%; width: 80px;">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_body">';
								hdata += '<div class="post_header">';
								hdata += '<div class="post_header-text">';
								hdata += '<h3>';
								hdata += post_userId${i.index-1}+' <span class="header-icon-section"> <span';
								hdata += 'class="material-icons post_badge">verified</span>@'+post_name${i.index-1};
								hdata += '</span>';
								hdata += '</h3>';
								hdata += '<div style="margin-left: 1rem; text-align: center;">';
								hdata += '<h3>'+post_created${i.index-1}+'</h3>';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_header-discription"';
								hdata += 'onclick="location.href=\'/viewContent\'">';
								hdata += '<p>'+pcontent${i.index-1}+'</p>';
								hdata += '</div>';
								hdata += '</div>'; 
								
								hdata += '<div class="container">';
								hdata += '<div class="row row-cols-auto">';
								hdata += '<div class="col-md-auto img-md_0 rounded-4">';
								hdata += '<img src="/upload/'+file_name${i.index-1}+'" class="rounded " alt="java18"';
								hdata += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-1}+'">';
								hdata += '</div>';
								hdata += '<div class="col-md-auto">';
								hdata += '<div class="row row-cols-auto">';
								hdata += '<div class="col-md-auto img-sm_0">';
								hdata += '<img src="/upload/'+file_name${i.index-2}+'" class="rounded "';
								hdata += 'alt="java18" data-bs-toggle="modal"';
								hdata += 'data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-2}+'">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="row row-cols-auto">';
								hdata += '<div class="col-md-auto img-sm_0">';
								hdata += '<img src="/upload/'+file_name${i.index-3}+'" class="rounded "';
								hdata += 'alt="java18" data-bs-toggle="modal"';
								hdata += 'data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-3}+'">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '</div>';
								
								hdata += '<div class="post_footer">';
								hdata += '<span class="material-icons ms_icons" data-bs-toggle="modal" data-bs-target="#writeModal">chat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons repeat">repeat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons favorite">favorite_border</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons chart">bar_chart</span>';
								hdata += '<h3>100</h3>';
								hdata += '</div>';
								
								$(".${i.index-1}").html(hdata);
								$(".${i.index-2}").remove();
								$(".${i.index-3}").remove();
								count =1;
							} else if (count==2){
								let hdata = "";

								hdata += '<div class="post_profile-image rounded-5">';
								hdata += '<img class="" src="/upload/'+post_profileImg${i.index-1}+'" alt="profile">';
								hdata += '<div style="position: absolute; height: 100%; width: 80px;">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_body">';
								hdata += '<div class="post_header">';
								hdata += '<div class="post_header-text">';
								hdata += '<h3>';
								hdata += post_userId${i.index-1}+' <span class="header-icon-section"> <span';
								hdata += 'class="material-icons post_badge">verified</span>@'+post_name${i.index-1};
								hdata += '</span>';
								hdata += '</h3>';
								hdata += '<div style="margin-left: 1rem; text-align: center;">';
								hdata += '<h3>'+post_created${i.index-1}+'</h3>';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_header-discription"';
								hdata += 'onclick="location.href=\'/viewContent\'">';
								hdata += '<p>'+pcontent${i.index-1}+'</p>';
								hdata += '</div>';
								hdata += '</div>';
								
								hdata += '<div class="container">';
								hdata += '<div class="row row-cols-auto ">';
								hdata += '<div class="col-md-auto img-lg_0 rounded-4">';
								hdata += '<img src="/upload/'+file_name${i.index-1}+'" class="rounded " alt="java18"';
								hdata += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-1}+'">';
								hdata += '</div>';
								hdata += '<div class="col-md-auto img-lg_0 rounded-4">';
								hdata += '<img src="/upload/'+file_name${i.index-2}+'" class="rounded " alt="java18"';
								hdata += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
								hdata += 'data-bs-whatever="/upload/'+file_name${i.index-2}+'">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '</div>';
								
								hdata += '<div class="post_footer">';
								hdata += '<span class="material-icons ms_icons" data-bs-toggle="modal" data-bs-target="#writeModal">chat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons repeat">repeat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons favorite">favorite_border</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons chart">bar_chart</span>';
								hdata += '<h3>100</h3>';
								hdata += '</div>';
								
								$(".${i.index-1}").html(hdata);
								$(".${i.index-2}").remove();
								count =1;
							} else if(count==1 && file_name${i.index-1}!=""){ 
								console.log(file_name${i.index-1});
								let hdata = "";

								hdata += '<div class="post_profile-image rounded-5">';
								hdata += '<img class="" src="/upload/'+post_profileImg${i.index-1}+'" alt="profile">';
								hdata += '<div style="position: absolute; height: 100%; width: 80px;">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_body">';
								hdata += '<div class="post_header">';
								hdata += '<div class="post_header-text">';
								hdata += '<h3>';
								hdata += post_userId${i.index-1}+' <span class="header-icon-section"> <span';
								hdata += 'class="material-icons post_badge">verified</span>@'+post_name${i.index-1};
								hdata += '</span>';
								hdata += '</h3>';
								hdata += '<div style="margin-left: 1rem; text-align: center;">';
								hdata += '<h3>'+post_created${i.index-1}+'</h3>';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_header-discription"';
								hdata += 'onclick="location.href=\'/viewContent\'">'; 
								hdata += '<p>'+pcontent${i.index-1}+'</p>';
								hdata += '</div>';
								hdata += '</div>';
								
								if (file_type${i.index-1}=='mp4'){
									
									hdata += '<div class="container video_contaner">';
									hdata += '<video controls loop muted preload="auto" src="/video/video01.mp4">';
									hdata += '</video>';
									hdata += '</div>';
		
								} else{
									hdata += '<div class="container">';
									hdata += '<div class="row row-cols-auto ">';
									hdata += '<div class="col-md-auto img-xl rounded-4">';
									hdata += '<img src="/upload/'+file_name${i.index-1}+'" class="rounded " alt="java18"';
									hdata += 'data-bs-toggle="modal" data-bs-target="#exampleModal"';
									hdata += 'data-bs-whatever="/upload/'+file_name${i.index-1}+'">';
									hdata += '</div>';
									hdata += '</div>';
									hdata += '</div>';									
								}
								
								
								hdata += '<div class="post_footer">';
								hdata += '<span class="material-icons ms_icons" data-bs-toggle="modal" data-bs-target="#writeModal">chat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons repeat">repeat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons favorite">favorite_border</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons chart">bar_chart</span>';
								hdata += '<h3>100</h3>';
								hdata += '</div>';
								
								$(".${i.index-1}").html(hdata);
								count =1;
							} else {
								let hdata = "";

								hdata += '<div class="post_profile-image rounded-5">';
								hdata += '<img class="" src="/upload/'+post_profileImg${i.index-1}+'" alt="profile">';
								hdata += '<div style="position: absolute; height: 100%; width: 80px;">';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_body">';
								hdata += '<div class="post_header">';
								hdata += '<div class="post_header-text">';
								hdata += '<h3>';
								hdata += post_userId${i.index-1}+' <span class="header-icon-section"> <span';
								hdata += 'class="material-icons post_badge">verified</span>@'+post_name${i.index-1};
								hdata += '</span>';
								hdata += '</h3>';
								hdata += '<div style="margin-left: 1rem; text-align: center;">';
								hdata += '<h3>'+post_created${i.index-1}+'</h3>';
								hdata += '</div>';
								hdata += '</div>';
								hdata += '<div class="post_header-discription"';
								hdata += 'onclick="location.href=\'/viewContent\'">'; 
								hdata += '<p>'+pcontent${i.index-1}+'</p>';
								hdata += '</div>';
								hdata += '</div>';
								
								hdata += '<div class="post_footer">';
								hdata += '<span class="material-icons ms_icons" data-bs-toggle="modal" data-bs-target="#writeModal">chat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons repeat">repeat</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons favorite">favorite_border</span>';
								hdata += '<h3>100</h3>';
								hdata += '<span class="material-icons ms_icons chart">bar_chart</span>';
								hdata += '<h3>100</h3>';
								hdata += '</div>';
								
								$(".${i.index-1}").html(hdata);
								count=1;
							}
						}//if문 종료
						
						// list마지막 더미데이터 삭제
						if(${i.last}){
							$(".${i.index}").remove();
						}
						
					</script>

			</div>
			</c:forEach> 
			
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


	<div class="modal" id="writeModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="height: 2rem;">
					<h5 class="modal-title">답글쓰기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="tweet_box">
						<form>
							<div class="tweet_box-input">
								<div id="modal_text-area" class="rounded" style="position: relative;">

									<textarea rows="" cols="" class="content" id="modal_write-box"
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


						</form>
					</div>

				</div>
				<div class="modal-footer">
					<div class="modal_box-footer" style="">


						<label for="modalFile" id="modalImgBtn" class="btn btn-sm btn-dark">사진등록</label>
						<input type="file" id="modalFile" multiple="multiple"> 
						<label for="modalRegPosition" id="modalregBtn" class="btn btn-sm btn-dark"
							data-bs-toggle="modal" data-bs-target="#locationModal2"
							data-bs-whatever="Test">위치등록</label> 
						<input type="button" id="madalRegPosition">
						<button class="modal_write-btn btn btn-sm btn-dark">게시하기</button>


					</div>
				</div>
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