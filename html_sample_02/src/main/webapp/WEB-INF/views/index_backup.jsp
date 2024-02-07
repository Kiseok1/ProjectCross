<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<title>CROSS</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">




<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script src="/js/cross/index.js"></script>


<style>
pre {
	white-space: pre-wrap;
	 
	background
	:
	#EEE;
}
</style>





</head>
<body>

	<div id="view-box">
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>


		<main>
			<div class="header">
				<h2>홈</h2>
			</div>

			<div class="tweet_box">
				<form id="writeForm" action="/sendPost" method="post" enctype="multipart/form-data">
					<div class="tweet_box-input">
						<div class="tweet_box-image rounded-5">
							<img src="/images/profile01.jpg" alt="profile imagw">

						</div>
						<div id="text-area" class="rounded" style="position: relative;">

							<textarea rows="" cols="" class="content" id="write-box" name="pcontent"
								style="outline: none; width: 480px; border: none; resize: none; overflow: hidden"></textarea>
							<div id="position_wrap" class="invis">
								<div id="position-area" style="display: flex;">
									<span class="material-icons">location_on</span>
									<div id="currLocation"></div>
								</div>
							</div>
							<div id="image-area" style=""></div>

						</div>


					</div>

					<div class="box-footer" style="">


						<label for="file"  id="imgBtn" class="btn btn-sm btn-dark">사진등록</label>
						<input type="file" id="file" name="files" multiple="multiple"> <label
							for="regPosition" id="regBtn" class="btn btn-sm btn-dark"
							data-bs-toggle="modal" data-bs-target="#locationModal"
							data-bs-whatever="Test">위치등록</label>
							 <input type="hidden"class="btn btn-sm btn-dark" id="regPosition" name="plocation">
						<button id="writeBtn" class="write-btn btn btn-sm btn-dark">게시하기</button>


					</div>
				</form>
			</div>




			<!-- Post -->

			<div class="post" style="position: relative;">

				<div class="post_profile-image rounded-5">
					<img class="" src="/images/profile01.jpg" alt="profile">
					<div style="position: absolute; height: 100%; width: 80px;">
						<div
							style="width: 3px; height: 98%; top: -3px; background-color: var(--twitter-line-color); position: absolute; left: 25%;">

						</div>
					</div>
				</div>

				<div class="post_body">
					<div class="post_header">
						<div class="post_header-text">
							<h3>
								Java <span class="header-icon-section"> <span
									class="material-icons post_badge">verified</span>@java
								</span>
							</h3>
							<div style="margin-left: 1rem; text-align: center;">
								<h3>24.01.01</h3>
							</div>
						</div>

						<div class="post_header-discription"
							onclick="location.href='/viewContent'">
							<p>동영상</p>

						</div>

					</div>
					<div class="container video_contaner">
						<video controls loop muted preload="auto" src="/video/video01.mp4">


						</video>
					</div>

					<div class="post_footer">

						<span class="material-icons ms_icons chat" data-bs-toggle="modal"
							data-bs-target="#writeModal">chat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons repeat">repeat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons favorite">favorite_border</span>
						<h3>100</h3>
						<span class="material-icons ms_icons chart">bar_chart</span>
						<h3>100</h3>


					</div>

				</div>

			</div>



			<div class="post" style="position: relative;">

				<div class="post_profile-image rounded-5">
					<img class="" src="/images/profile01.jpg" alt="profile">
				</div>

				<div class="post_body">
					<div class="post_header">
						<div class="post_header-text">
							<h3>
								만두 <span class="header-icon-section"> @Mandoo </span>
							</h3>
							<div style="margin-left: 1rem; text-align: center;">
								<h3>24.01.01</h3>
							</div>
						</div>

						<div class="post_header-discription"
							onclick="location.href='/viewContent'">

							<p>흠터레스팅</p>

						</div>

					</div>
					<div class="container">
						<div class="">
							<div class="">

								<!--Renote Content -->

								<div class="rounded-4"
									style="width: 450px; border: 1px solid var(--twitter-line-color); padding: 1rem;"
									onclick="location.href='/viewContent'">
									<div class="post_header">
										<div class="post_header-text">
											<h3>
												만두 <span class="header-icon-section">@Mandoo</span>
											</h3>
											<div style="margin-left: 1rem; text-align: center;">
												<h3>24.01.01</h3>
											</div>
										</div>
									</div>

									<div class="post_header-renote" style="display: flex;">
										<div class="container img-xs rounded" style="">
											<img src="/images/post-image.jpeg">
										</div>
										<div style="width: 200px; height: 50px;">
											<p>Text Only</p>
										</div>
									</div>


								</div>

							</div>

						</div>
					</div>

					<div class="post_footer">

						<span class="material-icons ms_icons" data-bs-toggle="modal"
							data-bs-target="#writeModal">chat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons repeat">repeat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons favorite">favorite_border</span>
						<h3>100</h3>
						<span class="material-icons ms_icons">bar_chart</span>
						<h3>100</h3>


					</div>

				</div>

			</div>





			<div class="post" style="position: relative;">

				<div class="post_profile-image rounded-5">
					<img class="" src="/images/profile01.jpg" alt="profile">
					<div style="position: absolute; height: 100%; width: 80px;">
						<div
							style="width: 3px; height: 98%; top: -3px; background-color: var(--twitter-line-color); position: absolute; left: 25%;">

						</div>
					</div>
				</div>

				<div class="post_body">
					<div class="post_header">
						<div class="post_header-text">
							<h3>
								Java <span class="header-icon-section"> <span
									class="material-icons post_badge">verified</span>@java
								</span>
							</h3>
							<div style="margin-left: 1rem; text-align: center;">
								<h3>24.01.01</h3>
							</div>
						</div>

						<div class="post_header-discription"
							onclick="location.href='/viewContent'">
							<p>Java 18 is now available! #Java18 #JDK18 #openjdk</p>
							<br>
							<p>
								Download now: https://social.ora.cl/6012KoqQ0 <br> Release
								notes: https://social.ora.cl/6013KoqQF <br> API Javadoc:
								https://social.ora.cl/6015KoqQN <br> Features:
								https://social.ora.cl/6016KoqQ4 <br> 이게&nbsp; 맞나 ?&nbsp;
								&nbsp; &nbsp;<br> 이게&nbsp; 맞나 ?&nbsp; &nbsp; &nbsp;<br>
							</p>
						</div>

					</div>
					<div class="container img-sm">
						<div class="row row-cols-auto">
							<div class="col-md-auto">
								<img src="/images/post-image.jpeg" class="rounded " alt="java18"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="images/post-image.jpeg">
							</div>
							<div class="col-md-auto">
								<img src="/images/post-image.jpeg" class="rounded " alt="java18"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="images/post-image.jpeg">
							</div>
						</div>

						<div class="row row-cols-auto">
							<div class="col-md-auto">
								<img src="/images/post-image.jpeg" class="rounded " alt="java18"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="images/post-image.jpeg">
							</div>
							<div class="col-md-auto">
								<img src="/images/post-image.jpeg" class="rounded " alt="java18"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="images/post-image.jpeg">
							</div>
						</div>
					</div>

					<div class="post_footer">

						<span class="material-icons ms_icons" data-bs-toggle="modal"
							data-bs-target="#writeModal">chat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons repeat">repeat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons favorite">favorite_border</span>
						<h3>100</h3>
						<span class="material-icons ms_icons">bar_chart</span>
						<h3>100</h3>


					</div>

				</div>

			</div>



			<div class="post" style="position: relative;">

				<div class="post_profile-image rounded-5">
					<img class="" src="/images/profile01.jpg" alt="profile">
					<div style="position: absolute; height: 100%; width: 80px;">
					</div>
				</div>

				<div class="post_body">
					<div class="post_header">
						<div class="post_header-text">
							<h3>
								Java <span class="header-icon-section"> <span
									class="material-icons post_badge">verified</span>@java
								</span>
							</h3>
							<div style="margin-left: 1rem; text-align: center;">
								<h3>24.01.01</h3>
							</div>
						</div>

						<div class="post_header-discription"
							onclick="location.href='/viewContent'">
							<p>Java 18 is now available! #Java18 #JDK18 #openjdk</p>
							<br>
							<p>
								Download now: https://social.ora.cl/6012KoqQ0 <br> Release
								notes: https://social.ora.cl/6013KoqQF <br> API Javadoc:
								https://social.ora.cl/6015KoqQN <br> Features:
								https://social.ora.cl/6016KoqQ4 <br>
							</p>
						</div>

					</div>

					<div class="container">
						<div class="row row-cols-auto">
							<div class="col-md-auto img-md rounded-4">
								<img src="/images/post-image.jpeg" class="rounded " alt="java18"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="images/post-image.jpeg">
							</div>
							<div class="col-md-auto">
								<div class="row row-cols-auto">
									<div class="col-md-auto img-sm">
										<img src="/images/post-image.jpeg" class="rounded "
											alt="java18" data-bs-toggle="modal"
											data-bs-target="#exampleModal"
											data-bs-whatever="images/post-image.jpeg">
									</div>
								</div>
								<div class="row row-cols-auto">
									<div class="col-md-auto img-sm">
										<img src="/images/post-image.jpeg" class="rounded "
											alt="java18" data-bs-toggle="modal"
											data-bs-target="#exampleModal"
											data-bs-whatever="images/post-image.jpeg">
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="post_footer">

						<span class="material-icons ms_icons" data-bs-toggle="modal"
							data-bs-target="#writeModal">chat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons repeat">repeat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons favorite">favorite_border</span>
						<h3>100</h3>
						<span class="material-icons ms_icons">bar_chart</span>
						<h3>100</h3>


					</div>

				</div>

			</div>

			<div class="post" style="position: relative;">

				<div class="post_profile-image rounded-5">
					<img class="" src="/images/profile01.jpg" alt="profile">
					<div style="position: absolute; height: 100%; width: 80px;">

					</div>
				</div>

				<div class="post_body">
					<div class="post_header">
						<div class="post_header-text">
							<h3>
								Java <span class="header-icon-section"> <span
									class="material-icons post_badge">verified</span>@java
								</span>
							</h3>
							<div style="margin-left: 1rem; text-align: center;">
								<h3>24.01.01</h3>
							</div>
						</div>

						<div class="post_header-discription"
							onclick="location.href='/viewContent'">
							<p>Java 18 is now available! #Java18 #JDK18 #openjdk</p>
							<br>
							<p>
								Download now: https://social.ora.cl/6012KoqQ0 <br> Release
								notes: https://social.ora.cl/6013KoqQF <br> API Javadoc:
								https://social.ora.cl/6015KoqQN <br> Features:
								https://social.ora.cl/6016KoqQ4 <br>
							</p>
						</div>

					</div>


					<div class="container">
						<div class="row row-cols-auto ">
							<div class="col-md-auto img-lg rounded-4">
								<img src="/images/post-image.jpeg" class="rounded " alt="java18"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="images/post-image.jpeg">
							</div>
							<div class="col-md-auto img-lg rounded-4">
								<img src="/images/post-image.jpeg" class="rounded " alt="java18"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="images/post-image.jpeg">
							</div>
						</div>
					</div>


					<div class="post_footer">

						<span class="material-icons ms_icons" data-bs-toggle="modal"
							data-bs-target="#writeModal">chat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons repeat">repeat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons favorite">favorite_border</span>
						<h3>100</h3>
						<span class="material-icons ms_icons">bar_chart</span>
						<h3>100</h3>


					</div>

				</div>

			</div>


			<div class="post" style="position: relative;">

				<div class="post_profile-image rounded-5">
					<img class="" src="/images/profile01.jpg" alt="profile">
					<div style="position: absolute; height: 100%; width: 80px;">

					</div>
				</div>

				<div class="post_body">
					<div class="post_header">
						<div class="post_header-text">
							<h3>
								Java <span class="header-icon-section"> <span
									class="material-icons post_badge">verified</span>@java
								</span>
							</h3>
							<div style="margin-left: 1rem; text-align: center;">
								<h3>24.01.01</h3>
							</div>
						</div>

						<div class="post_header-discription"
							onclick="location.href='/viewContent'">
							<p>Java 18 is now available! #Java18 #JDK18 #openjdk</p>
							<br>
							<p>
								Download now: https://social.ora.cl/6012KoqQ0 <br> Release
								notes: https://social.ora.cl/6013KoqQF <br> API Javadoc:
								https://social.ora.cl/6015KoqQN <br> Features:
								https://social.ora.cl/6016KoqQ4 <br>
							</p>
						</div>

					</div>

					<div class="container">
						<div class="row row-cols-auto ">
							<div class="col-md-auto img-xl rounded-4">
								<img src="/images/post-image.jpeg" class="rounded " alt="java18"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="/images/post-image.jpeg">
							</div>

						</div>
					</div>


					<div class="post_footer">

						<span class="material-icons ms_icons" data-bs-toggle="modal"
							data-bs-target="#writeModal">chat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons repeat">repeat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons favorite">favorite_border</span>
						<h3>100</h3>
						<span class="material-icons ms_icons">bar_chart</span>
						<h3>100</h3>


					</div>

				</div>

			</div>


		</main>
		<!-- main section end -->

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
				<form>
					<div class="modal-body">
						<div class="tweet_box">

							<div class="tweet_box-input">
								<div id="modal_text-area" class="rounded"
									style="position: relative;">

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



						</div>

					</div>
					<div class="modal-footer">
						<div class="modal_box-footer" style="">


							<label for="modalFile" id="modalImgBtn"
								class="btn btn-sm btn-dark">사진등록</label> <input type="file"
								id="modalFile" multiple="multiple"> <label
								for="modalRegPosition" id="modalregBtn"
								class="btn btn-sm btn-dark" data-bs-toggle="modal"
								data-bs-target="#locationModal2" data-bs-whatever="Test">위치등록</label>
							<input type="button" id="madalRegPosition">
							<button class="modal_write-btn btn btn-sm btn-dark">게시하기</button>


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
						<label for="recipient-name" class="col-form-label ">검색:</label> <input
							type="text" class="form-control" id="locSearch"
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