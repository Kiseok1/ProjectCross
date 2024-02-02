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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' href='/css/profile.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet"> -->
        <link rel="stylesheet" href="/css/style_x_ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script>
    	$(function(){
    		$(".heading_media").click(function(){
    			location.href = "your_media";
    		})
    		$(".heading_content").click(function(){
    			location.href = "your_content";
    		})
    		$(".heading_reply").click(function(){
    			location.href = "your_reply";
    		})
    		$(".heading_like").click(function(){
    			location.href = "your_like";
    		})
    		$(".editprofile").click(function(){
    			location.href = "your_mypage";
    		})
    		
    		$(".followbtn").click(function(){
    			if($(".followbtn").text()=="언팔로우"){
    				$(".followbtn").text("팔로우")
    			} else if($(".followbtn").text()=="팔로우"){
    				$(".followbtn").text("팔로잉")
    			} 
    		})
    		
    		$(".followbtn").mouseover(function(){
    			if($(".followbtn").text()=="팔로잉"){
    				$(".followbtn").text("언팔로우")
    			} 
    		});
    		
    		$(".followbtn").mouseout(function(){
    			if($(".followbtn").text()=="언팔로우"){
    				$(".followbtn").text("팔로잉")
    			} 
    		});
    		
    		$(".alram").click(function(){
    			var attr_class = $(this).attr("class");
    			if(attr_class=="fa-regular fa-bell alram"){
    				$(this).attr("class","fa-solid fa-bell alram");
    			} else {
    				$(this).attr("class","fa-regular fa-bell alram");
    			}
    		})
    		
    		
    		

    	});//jquery
    </script>
    
</head>

<body>
        <div class="middlecontainer" >
            <section class="headsec">
                <a href="javascript:history.back()"><i class="fa fa-arrow-left" id="fa-arrow-left"></i></a>
                <div>
                    <h3>${udto2.name}</h3>
                    <span>38.7k 게시물</span>
                </div>
            </section>
            <section class="twitterprofile">
                <div class="headerprofileimage">
                	<c:if test="${udto2.header_img!=null}">
                    	<img src="/upload/${udto2.header_img}" alt="header" id="headerimage">
                	</c:if>
                	<c:if test="${udto2.header_img==null}">
                    	<img src="/images/header_default.jpg" alt="header" id="headerimage">
                	</c:if>
                	<c:if test="${udto2.profile_img!=null}">
                    	<img src="/upload/${udto2.profile_img}" alt="profile pic" id="profilepic">
                    </c:if>
                	<c:if test="${udto2.profile_img==null}">
                    	<img src="/images/header_default.jpg" alt="profile pic" id="profilepic">
                    </c:if>
                    <div class="yourpage">
                    	<div class="div_circle"><i class="fa-regular fa-bell alram" style="font-size: 20px;"></i></i></div>
                    	<div class="div_circle"><i class="fa-regular fa-envelope" style="font-size: 20px;"></i></i></div>
                    	
                    	<div class="followbtn">팔로잉</div>
                    </div>
                </div>
                <div class="bio">
                    <div class="handle">
                        <h3>${udto2.name}</h3>
                        <span>@${udto2.user_id}</span>
                    </div>
                    <p>${udto2.profile_txt}</p>
                    <span> 
                    	   <i class="fa fa-location-arrow "></i> ${udto2.user_loc} &nbsp
                    	   <i class="fa-solid fa-arrow-up-right-from-square"></i> ${udto2.user_url} &nbsp 
                           <i class="fa fa-calendar"></i> 2024.01.25
                    </span>
                    <div class="nawa">
                        <div class="followers"> 100 <span>Following</span></div>
                        <div>100<span> Followers</span></div>
                    </div>
                </div>
            </section>
        <!-- </div> -->
    <!-- <script>
alert('MY TWITTER PROFILE CLONE');
</script> -->

 





</body>

</html>