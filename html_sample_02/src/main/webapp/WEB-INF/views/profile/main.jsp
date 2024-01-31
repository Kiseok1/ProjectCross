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

    
    <script>
    	$(function(){
    		$(".heading_media").click(function(){
    			location.href = "/profile/media";
    		})
    		$(".heading_content").click(function(){
    			location.href = "/profile/content";
    		})
    		$(".heading_reply").click(function(){
    			location.href = "/profile/reply";
    		})
    		$(".heading_like").click(function(){
    			location.href = "/profile/like";
    		})
    		$(".editprofile").click(function(){
    			location.href = "/profile/mypage";
    		})

    	});//jquery
    </script>
    
</head>

<body>

            <section class="headsec">
                <a href="javascript:history.back()"><i class="fa fa-arrow-left" id="fa-arrow-left"></i></a>
                <div>
                    <h3>홍길동</h3>
                    <span>38.7k 게시물</span>
                </div>
            </section>
            <section class="twitterprofile">
                <div class="headerprofileimage">
                    <img src="/images/img2.jpg" alt="header" id="headerimage">
                    <img src="/images/k2.jpg" alt="profile pic" id="profilepic">
                    <div class="editprofile">MY PAGE</div>
                </div>
                <div class="bio">
                    <div class="handle">
                        <h3>홍길동</h3>
                        <span>@gildong</span>
                    </div>
                    <div>안녕하세요 홍길동입니다.</div>
                    <span> 
                    	   <i class="fa fa-location-arrow "></i> 대한민국 &nbsp
                    	   <i class="fa-solid fa-arrow-up-right-from-square"></i> <a href="#">www.naver.com</a> &nbsp 
                           <i class="fa fa-calendar"></i> 2024.01.25
                    </span>
                    <div class="nawa">
                        <div class="followers"> 100 <span>Following</span></div>
                        <div>100<span> Followers</span></div>
                    </div>
                </div>
            </section>

</body>

</html>