<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
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
</head>

<body>
	<div id="view-box"
		style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-line-color);">
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	 <div class="middlecontainer" >
   	<%@ include file="/WEB-INF/views/profile/your_main.jsp" %>
   			<section class="tweets">
               <div class="heading">
                   <div class="heading_content">게시물</div>
                   <div class="heading_reply">답글</div>
                   <div class="heading_media">미디어<div class="content_underbar"></div></div>
                   <div class="heading_like">마음에 들어요</div>
               </div>
           	</section>
           	<div class="media_sub">
            <c:forEach var="pmuDto" items="${list}" varStatus="stat">
           		<c:set var="index" value="${stat.count}" />
           		<c:if test="${index%3!=0}">
           			<c:if test="${pmuDto.mediaDto.file_type!='mp4'}">
           				<div class="media_box_${index%3}"><img src="/upload/${pmuDto.mediaDto.file_name}"></div>		
           			</c:if>
           			<c:if test="${pmuDto.mediaDto.file_type=='mp4'}">
           				<div class="media_box_${index%3}"><video controls loop muted preload="auto" src="/video/video01.mp4"></div>		
           			</c:if>
           		</c:if>
           		<c:if test="${index%3==0}">
           			<c:if test="${pmuDto.mediaDto.file_type!='mp4'}">
           				<div class="media_box_3"><img src="/upload/${pmuDto.mediaDto.file_name}"></div>
           			</c:if>
           			<c:if test="${pmuDto.mediaDto.file_type=='mp4'}">
           				<div class="media_box_3"><video controls loop muted preload="auto" src="/video/video01.mp4"></div>		
           			</c:if>
           			</div>
           			<div class="media_sub">
           		</c:if>
           </c:forEach>
           </div>
       </div>
      </div>
</body>

</html>