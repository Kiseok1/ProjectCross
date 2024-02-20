<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home / Twitter</title>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui_hw.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui.css">



</head>
	<script>
	
     $(function(){
	
		$(".like").click(function(){
			onofftext = $(this).text();
			
			if( onofftext ==="favorite"){
				$(this).text("favorite_border");
			}else {
				$(this).text("favorite");
			}
			
			
		});
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
<body>
	
	<div id="view-box">
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	<main>
	<!--검색창 -->
		<div class="aside_input">
			<span class="material-icons aside_search-icon">search</span>
			<form action="search" id="search_frm" method="post">
			<input type="text" id="keyword" name="keyword" placeholder="검색">
			</form>
			<script>
			   $(function() {
			       $(".aside_input input").keyup(function(e) {
			           if (e.keyCode == 13) {
			               alert($("#keyword").val());
			               search_frm.submit();
			           }
			       });
			   });
		</script>
		</div>
	<!--검색창 -->
		<!--인기글 명단-->
	<!--카테고리-->
		<div class="category_menu" >
			<a href="search_in?keyword=${map.keyword}"><div class="search_in" >인기</div></a>
			<a href="search" ><div class="Latest_mini">최신<div class="underscore"></div></div></a>
			<a href="user?keyword=${map.keyword}"><div class="user_mini" >사용자</div></a>
			<a href="images" ><div class="media_mini" >미디어</div></a>				
		</div>
	<!--카테고리 -->
	<!-- <div class="post">
			<div class="search_post_profile-image">
				<div class="user_profile"><img src="/upload/2.jpg"></div>
			</div>
			<div class="post_body">
				<div class="post_header">
				 <div class="post_header">
				이름들어가는 자리
					<div class="post_header-text">
						<h3>이름 <span class="header-icon-section"> <span class="material-icons post_badge">verified</span>@아이디</span>
						<span class="header-icon-section">2024.01.29 09:40</span>
						</h3>
					</div>
			    이름들어가는 자리
					
				드롭다운
					<div class="post_header-discription">
					
					<div class="dropdown_bar">
					  <span class="material-icons more_horiz">more_horiz</span>
					  <div class="dropdown_content">
					 		<a href="">팔로워</a>
					 		<a href="">차단하기</a>
					 		<a href="">쪽지하기</a>
					 		<a href="">신고하기</a>
					  </div>
					</div>
					</div>
				드롭다운
				</div>
				
					</div>
				content 내용
					<div class="post_header-discription">
						<p>Java 18 is now available! #Java18 #JDK18 #openjdk</p>
						<br>
						<p>
							Download now: https://social.ora.cl/6012KoqQ0 <br> Release
							notes: https://social.ora.cl/6013KoqQF <br> API Javadoc:
							https://social.ora.cl/6015KoqQN <br> Features:
							https://social.ora.cl/6016KoqQ4 <br>
						</p>
					</div>
				content 내용
				<div class="search_img">
				<img src="images/cacao.jpg" alt="java18" style="width:100%; height:100%; border-radius: 20px;">
				</div>
				<div class="post_footer">
					<span class="material-icons">chat</span> 
					<span class="material-icons">repeat</span> 
					<span class="material-icons like">favorite_border</span>
					<span class="material-icons">file_upload</span>
 					<span class="material-icons"><img src="images/icons7.png"></span>


				</div>

			</div>


		</div> -->

		
		
		

		<c:forEach var="Pdto" items="${map.list}">
	  <div class="post" style="position:relative;">

       	
            <div class="post_profile-image rounded-5">
                <img class="" src="/images/profile01.jpg" alt="profile">
	            <div style="position: absolute; height: 100%;     width: 80px;">
		         
				</div>
            </div>

            <div class="post_body">
                <div class="post_header">
                	<!-- 드롭다운 -->
					<div class="dropdown_bar" style="float: right; margin-right: 20px;">
					  <span class="material-icons more_horiz">more_horiz</span>
					  <div class="dropdown_content">
					 		<a href="">팔로워</a>
					 		<a href="">차단하기</a>
					 		<a href="">쪽지하기</a>
					 		<a href="">신고하기</a>
					  </div>
					</div>
					<!-- 드롭다운 -->
                    <div class="post_header-text">
                        <h3>${Pdto.user_id}
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>@java
                            </span>
                        </h3>
                        <div style="margin-left: 1rem; text-align: center;"><h3>24.01.01</h3></div>
                    </div>

                    <div class="post_header-discription" onclick="location.href='viewContent'">
                    	${Pdto.pcontent}
                    </div>
                    
                </div>
                
                <div class="container">
			      <div class="row row-cols-auto ">
			        <div class="col-md-auto img-xl rounded-4"><img src="/images/post-image.jpeg"  class="rounded " alt="java18" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="/images/post-image.jpeg" ></div>
			
			      </div>
			    </div>
			    

                <div class="post_footer">

                    <span class="material-icons ms_icons">chat</span><h3>${Pdto.pstep}</h3>
                    <span class="material-icons ms_icons repeat">repeat</span><h3>${Pdto.renote}</h3>
                    <span class="material-icons ms_icons favorite">favorite_border</span><h3>${Pdto.plike}</h3>
                    <span class="material-icons ms_icons">bar_chart</span><h3>100</h3>
                    

                </div>

            </div>

        </div>
	</c:forEach>
        
      
		
		
		<!--카테고리 -->
	


		
	</main>
	<!-- main section end -->

	</div>


</body>
</html>