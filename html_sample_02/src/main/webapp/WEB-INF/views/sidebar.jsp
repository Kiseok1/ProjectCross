<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0242a4a15da7682f7e63d97312b81c85&libraries=services"></script>
    <script src="/js/cross/sidebar.js"></script>   
	<link rel="stylesheet" href="/css/style_x_ui.css">
	
	
	 <nav style="margin-top: 20px;" >
	    <div class="nav_logo-wrapper" >
       		<img class="nav_logo" src="/images/cross.jpg">
        </div>
        
	 	<div class="profile-wrapper " style="">
	 		<div class="profile-img">
	 			<div style="background-image: url(/upload/${session_image})" class="img-wrapper rounded-5" >
	 				
	 			</div>
	 		</div>
	 		<div class="profile-name">

	 			<div style="margin: 4px;"><h2>${session_name}</h2></div>

	 		</div>
	 		<div class="profile-follow" style="display: flex; margin-top:20px;">
	 			<div style="margin:0 4px;" onclick="location.href='/profile/following?user_id=${user_id}'"><h4>팔로우</h4></div> 
	 			<div style="margin:0;">${session_followingCount}</div>

	 			<div style="margin:0 4px 0 10px;" onclick="location.href='/profile/follower?user_id=${user_id}'"><h4>팔로워</h4></div> 
	 			<div style="margin:0;">${session_followerCount}</div>
	 		</div>
	 	
	 	</div>
	 
	 


        <div class="Menu_options side_home active">
            <span class="material-icons">home</span>
            <h2>홈</h2>
        </div>



        <div class="Menu_options side_profile">
            <span class="material-icons">person</span>
            <h2>프로필</h2>
        </div> 

        

        <div class="Menu_options side_bookmark">
            <span class="material-icons">bookmark</span>
            <h2>북마크</h2>
        </div> 

        

        <div class="Menu_options side_message">
            <span class="material-icons">email</span>
            <h2>메시지</h2>
        </div>

       

        <div class="Menu_options side_notice">
            <span class="material-icons">notifications</span>
            <h2>알림</h2><!-- <span class="badge text-bg-light rounded-pill align-text-bottom">new</span> -->
        </div>



		 <div class="Menu_options side_search">
            <span class="material-icons">tag</span>
            <h2>검색</h2>
        </div>

		
		<div><br></div>
	 

	 	<div class="Menu_options side_logout">
	 		<span class="material-icons">logout</span>
	 		<h2>로그아웃</h2>
	 	</div>

	 </nav>
 