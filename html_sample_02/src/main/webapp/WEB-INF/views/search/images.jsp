<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home / Twitter</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui_hw.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">

</head>
<body>

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
			<a href="user" ><div class="user_mini" >사용자</div></a>
			<a href="images" ><div class="media_mini" >미디어<div class="underscore"></div></div></a>				
		</div>
		<!--카테고리 -->
		<div class="images">
			<section class="media_main">
               <div class="media_sub">
				<div class="media_box_1"><img src="/images/cross.jpg"></div>		              
				<div class="media_box_2"><img src="/images/img11.jpg"></div>		              
				<div class="media_box_3"><img src="/images/img2.jpg"></div>		              
               </div>
            </section>
		</div>
		
	</main>
	<!-- main section end -->

	


</body>
</html>