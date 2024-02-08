<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<title>CROSS</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui.css">
<link rel="stylesheet" href="/css/style_x_ui_yk.css">
<link rel="stylesheet" href="/css/style_yk.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

   
    
<script>
    $(function() {
        $(".bookmark").click(function() {
            var currentText = $(this).text();

            if (currentText === "turned_in_not") {
                $(this).text("bookmark");
            } else {
                $(this).text("turned_in_not");
            }
        });

        $(".like").click(function() {
            var currentText = $(this).text();

            if (currentText === "favorite_border") {
                $(this).text("favorite");
            } else {
                $(this).text("favorite_border");
            }
        });

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

        // 문서의 다른 부분을 클릭했을 때 드롭다운 메뉴를 닫음
        $(document).click(function() {
            dropdownContent.css("display", "none");
           
        });
        
        $("#logout").click(function(){
        	alert("로그아웃 됩니다.");
        	location.href="login";
        });
    });
</script>
</head>
<body>

	<!-- main section start -->
	<div id="view-box"
		style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-line-color);">


	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	<main>
		<div class="header">
			<div style="width:100%; height:100%; position:relative;">
				<h2>북마크</h2>
				<div class="post_header-text">
					<h3>
						@qwerasd134<span class="header-icon-section">
					</h3>
				</div>
		
			</div>
			<div class="dropdown">
			  <div class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			  	<span class="material-icons mateBtn" >more_horiz</span>
		        <span class="visually-hidden">Toggle Dropdown</span>
			  </div>
			  <ul class="dropdown-menu dropdown-link-active-bg">
			    <li><a class="dropdown-item" href="#">모든 북마크 지우기</a></li>
			  </ul>
			</div>
	
		<!--
			<div style="width:100%; height:100%; position:relative;">
				<h2>북마크</h2>
				<div class="post_header-text">
					<h3>
						@qwerasd134<span class="header-icon-section">
					</h3>
				</div>
				<div class="menuBtn">
					<div class="dropdown_main">
			
						<div class="dropdown_bar">
							<span class="material-icons more_horiz">more_horiz</span>
						</div>
							<div class="dropdown_content" style="display:none;">
								<a href="#" style="color:#BA68C8;">·모든 북마크 지우기</a> 
							</div>
					</div>
	
				</div>
			</div>
		  -->
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
							onclick="location.href='viewContent'">
							<p>동영상</p>

						</div>

					</div>
					<div class="container video_contaner">
						<video controls loop muted preload="auto" src="video/video01.mp4">
							
							
						</video>
					</div>
					

					<div class="post_footer">

						<span class="material-icons ms_icons chat" data-bs-toggle="modal" data-bs-target="#writeModal">chat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons repeat">repeat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons favorite">favorite_border</span>
						<h3>100</h3>
						
						<div id="bookChk">
						<span class="material-icons bookmark" style="cursor: pointer; color: #BA68C8;">bookmark</span>
						</div>
						


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
							onclick="location.href='viewContent'">

							<p>흠터레스팅</p>

						</div>

					</div>
					<div class="container">
						<div class="">
							<div class="">

								<!--Renote Content -->

								<div class="rounded-4"
									style="width: 450px; border: 1px solid var(--twitter-line-color); padding: 1rem;"
									onclick="location.href='viewContent'">
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
											<img src="images/post-image.jpeg">
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

						<span class="material-icons ms_icons" data-bs-toggle="modal" data-bs-target="#writeModal">chat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons repeat">repeat</span>
						<h3>100</h3>
						<span class="material-icons ms_icons favorite">favorite_border</span>
						<h3>100</h3>
						
						<div id="bookChk">
						<span class="material-icons bookmark" style="cursor: pointer; color: #BA68C8;">bookmark</span>
						</div>


					</div>

				</div>

			</div>


		


	</main>

</div>
</body>
</html>