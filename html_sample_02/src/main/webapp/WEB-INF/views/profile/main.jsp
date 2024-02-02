<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Twitter Profile</title>
    <script src="/js/cross/profile.js"></script>

    
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
                    <h3>${udto.name}</h3>
                    <span>38.7k 게시물</span>
                </div>
            </section>
            <section class="twitterprofile">
                <div class="headerprofileimage">
                	<c:if test="${udto.header_img!=null}">
	                    <img src="/upload/${udto.header_img}" alt="header" id="headerimage">
                	</c:if>
                	<c:if test="${udto.header_img==null}">
	                    <img src="/images/header_default.jpg" alt="header" id="headerimage">
                	</c:if>
                	<c:if test="${udto.profile_img!=null}">
	                    <img src="/upload/${udto.profile_img}" alt="profile pic" id="profilepic">
                	</c:if>
                	<c:if test="${udto.profile_img==null}">
	                    <img src="/images/header_default.jpg" alt="profile pic" id="profilepic">
                	</c:if>
                    <div class="editprofile">MY PAGE</div>
                </div>
                <div class="bio">
                    <div class="handle">
                        <h3>${udto.name}</h3>
                        <span>@${udto.user_id}</span>
                    </div>
                    <div>${udto.profile_txt}</div>
                    <span> 
                    	   <i class="fa fa-location-arrow "></i> ${udto.user_loc} &nbsp
                    	   <c:if test="${not fn:contains(udto.user_url, 'http')}">
                    	   		<i class="fa-solid fa-arrow-up-right-from-square"></i> <a href="http://${udto.user_url}">${udto.user_url}</a> &nbsp 
                    	   </c:if>
                    	   <c:if test="${fn:contains(udto.user_url, 'http')}">
                    	   		<i class="fa-solid fa-arrow-up-right-from-square"></i> <a href="${udto.user_url}">${udto.user_url}</a> &nbsp 
                    	   </c:if>
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