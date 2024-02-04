<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home / Twitter</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui_hw.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
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
	});
    
	</script>

		<%@ include file="/WEB-INF/views/sidebar.jsp" %>


	<main>
		<!--검색창 -->
		<div class="aside_input">
			<span class="material-icons aside_search-icon">search</span> <input
				type="text" placeholder="검색">
		</div>
		<!--검색창 -->
		<!--카테고리-->
		<div class="category_menu" >
			<a href="search_in"><div class="search_in" >인기</div></a>
			<a href="search" ><div class="Latest_mini">최신</div></a>
			<a href="user" ><div class="user_mini" >사용자<div class="underscore"></div></div></a>
			<a href="images" ><div class="media_mini" >미디어</div></a>			
		</div>
		<!--카테고리 -->
		<div class="post">
			<div class="search_post_profile-image">
			<div class="user_profile"><img src="/images/2.jpg"></div>	
			</div>
			<div class="post_body">
				<div class="post_header">
					 <div class="post_header">
				<!-- 이름들어가는 자리 -->
					<div class="search_user_head" >
						<h3>이름 <span class="header-icon-section"> <span class="material-icons post_badge">verified</span>@아이디</span>
						</h3>
					</div>
			    <!-- 이름들어가는 자리 -->
					
				<!-- 드롭다운 -->
					<div class="post_header-discription">
						<div class="dropdown_bar" >
						  <!-- <p class="dropdown_bardropdown_bar">팔로우</p> -->
						  <button class="followBtn">팔로우</button>
						  <div class="dropdown_content" >
						 		<a href="">팔로워</a>
						 		<a href="">차단하기</a>
						  </div>
						</div>
					</div>
				<!-- 드롭다운 -->
				</div>
			
				</div>
				<div class="user_Introduction">
				 asdasdasdasd
				</div>
			</div>
		</div>
		<!--추천 유저 카테고리 -->
		<!--카테고리 -->
		<div class="post">
			<div class="search_post_profile-image">
			<div class="user_profile"><img src="/images/apple.jpg"></div>	
			</div>
			<div class="post_body">
				<div class="post_header">
					 <div class="post_header">
				<!-- 이름들어가는 자리 -->
					<div class="search_user_head" >
						<h3>이름 <span class="header-icon-section"> <span class="material-icons post_badge">verified</span>@아이디</span>
						</h3>
					</div>
			    <!-- 이름들어가는 자리 -->
					
				<!-- 드롭다운 -->
					<div class="post_header-discription">
						<div class="dropdown_bar" >
						  <!-- <p class="dropdown_bardropdown_bar">팔로우</p> -->
						  <button class="followBtn">팔로우</button>
						  <div class="dropdown_content" >
						 		<a href="">팔로워</a>
						 		<a href="">차단하기</a>
						  </div>
						</div>
					</div>
				<!-- 드롭다운 -->
				</div>
			
				</div>
				<div class="user_Introduction">
				 asdasdasdasd
				</div>
			</div>
		</div>
		<!--추천 유저 카테고리 -->
		<!--카테고리 -->
		<div class="post">
			<div class="search_post_profile-image">
			<div class="user_profile"><img src="/images/lang1.jpg"></div>	
			</div>
			<div class="post_body">
				<div class="post_header">
					 <div class="post_header">
				<!-- 이름들어가는 자리 -->
					<div class="search_user_head" >
						<h3>이름 <span class="header-icon-section"> <span class="material-icons post_badge">verified</span>@아이디</span>
						</h3>
					</div>
			    <!-- 이름들어가는 자리 -->
					
				<!-- 드롭다운 -->
					<div class="post_header-discription">
						<div class="dropdown_bar" >
						  <!-- <p class="dropdown_bardropdown_bar">팔로우</p> -->
						  <button class="followBtn">팔로우</button>
						  <div class="dropdown_content" >
						 		<a href="">팔로워</a>
						 		<a href="">차단하기</a>
						  </div>
						</div>
					</div>
				<!-- 드롭다운 -->
				</div>
			
				</div>
				<div class="user_Introduction">
				 asdasdasdasd
				</div>
			</div>
		</div>
		<!--추천 유저 카테고리 -->
		
		<div id="myModal" class="modal">
			  <!-- 모달 내용 -->
			  <div class="modal-content">
			    <span class="close">&times;</span>
			    <!-- 내용이 들어갑니다 -->
			    <div>
			    <img src="/images/post-image.jpeg" alt="java18" style="width:100%; height:100%; border-radius: 20px;"></p>
			    </div>
			    <!-- 내용이 들어갑니다 -->
			  </div>
			</div>
			
			<script>
			// 모달 열기 버튼 요소 가져오기
			var modalBtn = document.getElementById("myBtn");
			
			// 모달 요소 가져오기
			var modal = document.getElementById("myModal");
			
			// 모달 닫기 버튼 가져오기
			var closeBtn = document.getElementsByClassName("close")[0];
			
			// 모달 열기 버튼을 클릭했을 때 이벤트 설정
			modalBtn.onclick = function() {
			  modal.style.display = "block";
			}
			
			// 모달 닫기 버튼을 클릭했을 때 이벤트 설정
			closeBtn.onclick = function() {
			  modal.style.display = "none";
			}
			
			// 모달 외부 영역(모달 바깥 부분)을 클릭했을 때 모달 닫기
			window.onclick = function(event) {
			  if (event.target == modal) {
			    modal.style.display = "none";
			  }
			}
			
			$(function(){
				$("myBtn").click(function(){
					modal = this.src;
					 })
			})
			</script>
	

	</main>
	<!-- main section end -->

	


</body>
</html>