<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<link rel="stylesheet" href="/css/profile.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">

</head>
<body>
	<div id="view-box">
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>

	<main>
		<!--검색창 -->
		<div class="aside_input">
			<span class="material-icons aside_search-icon">search</span>
			<form action="images" id="search_frm" method="post">
			<input type="text" id="keyword" name="keyword" placeholder="검색">
			</form>
			<script>
			   $(function() {
			       $(".aside_input input").keyup(function(e) {
			           if (e.keyCode == 13) {
			               //alert($("#keyword").val());
			               search_frm.submit();
			           }
			       });
			   });
		</script>
		</div>
		<!--검색창 -->
	<!--카테고리-->
		<div class="category_menu" >
			<a href="search_in?keyword=${map.keyword}"><div class="search_in" >인기</div></a>
			<a href="search?keyword=${map.keyword}" ><div class="Latest_mini">최신</div></a>
			<a href="user?keyword=${map.keyword}" ><div class="user_mini" >사용자</div></a>
			<a href="images" ><div class="media_mini" >미디어<div class="underscore"></div></div></a>				
		</div>
		<!--카테고리 -->
		<div class="media_sub">
           <!-- media 테이블 하나에 이미지 파일 하나 -->
           <%-- <c:forEach var="pmuDto" items="${list}" varStatus="stat">
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
           </c:forEach> --%>
           
           <!-- media 테이블 하나에 이미지 파일 여러개 split으로 분류 -->
           <c:forEach var="flist" items="${flist}" varStatus="stat">
           		<c:if test="${stat.count%3!=0}">
	           		<c:if test="${fn:contains(flist,'mp4')}">
						<div class="media_box_${stat.count%3}" onclick="location.href='/viewContent?post_id=${ilist[stat.index]}'"><video controls loop muted preload="auto" src="/upload/${flist}"></div>		
					</c:if>
					<c:if test="${!fn:contains(flist,'mp4')}">
						<div class="media_box_${stat.count%3}" onclick="location.href='/viewContent?post_id=${ilist[stat.index]}'"><img src="/upload/${flist}"></div>	
					</c:if>
           		</c:if>
           		<c:if test="${stat.count%3==0}">
	           		<c:if test="${fn:contains(flist,'mp4')}">
						<div class="media_box_3" onclick="location.href='/viewContent?post_id=${ilist[stat.index]}'"><video controls loop muted preload="auto" src="/upload/${flist}"></div>		
					</c:if>
					<c:if test="${!fn:contains(flist,'mp4')}">
						<div class="media_box_3" onclick="location.href='/viewContent?post_id=${ilist[stat.index]}'"><img src="/upload/${flist}"></div>	
					</c:if>
					</div>
           			<div class="media_sub">
           		</c:if> 
           </c:forEach> 
          
           </div>
		
	</main>
	<!-- main section end -->

	


</body>
</html>