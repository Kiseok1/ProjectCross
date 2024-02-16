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


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui_hw.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui.css">
<script src="/js/cross/profile.js"></script>


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
			               //alert($("#keyword").val());
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
			<a href="images?keyword=${map.keyword}" ><div class="media_mini" >미디어</div></a>				
		</div>
	<!--카테고리 -->
	<div id="post_wrap">


				<c:forEach var="pdto" items="${plist}" varStatus="status">
					<div class="post" style="position: relative;">
						
						<c:if test="${ulist[status.index].user_id!=session_id}">
							<div class="post_profile-image rounded-5" onclick="location.href='your_content?user_id=${ulist[status.index].user_id}'">
						</c:if>
						<c:if test="${ulist[status.index].user_id==session_id}">
							<div class="post_profile-image rounded-5" onclick="location.href='content?user_id=${ulist[status.index].user_id}'">
						</c:if>
							
							<c:if test="${ulist[status.index].profile_img!=null}">
								<img class="" src="/upload/${ulist[status.index].profile_img}"
									alt="profile">
							</c:if>
							<c:if test="${ulist[status.index].profile_img==null}">
								<img class="" src="/upload/proflie_default.png"
									alt="profile">
							</c:if>
							<div style="position: absolute; height: 100%; width: 80px;">

								<c:if
									test="${plist[status.index].post_id == plist[status.index+1].pindent}">
									<div
										style="width: 3px; height: 98%; top: -3px; background-color: var(--twitter-line-color); position: absolute; left: 25%;">
									</div>
								</c:if>

							</div>
						</div>

						<div class="post_body">
							<div class="post_header">
								<div class="post_header-text">
									<h3>
										${ulist[status.index].name}<span class="header-icon-section">@${ulist[status.index].user_id}
										</span>
									</h3>
									<div style="margin-left: 1rem; text-align: center;">
										<h3>${plist[status.index].created}</h3>
									</div>
								</div>

								<div class="post_header-discription"
									onclick="location.href='/viewContent?post_id=${plist[status.index].post_id}'">
									<p>${plist[status.index].pcontent}</p>
									<c:if test="${plist[status.index].plocation!=null}">
										<div class="" style="color:gray">
											<div style="display: flex;">
												<span class="material-icons">location_on</span>
												<div>${plist[status.index].plocation}</div>
											</div>
										</div>
									</c:if>
									
									
								</div>
							</div>

							<c:if
								test="${fn:contains(mlist[status.index].file_type,'video')}">
								<div class="container video_contaner">
									<video controls loop muted preload="auto"
										src="/upload/${mlist[status.index].file_name}">
									</video>
								</div>
							</c:if>

							<c:if
								test="${fn:contains(mlist[status.index].file_type,'image')}">
								<c:set var="img"
									value="${fn:split(mlist[status.index].file_name,',')}" />
								<c:if test="${fn:length(img)==1}">
									<div class="container">
										<div class="row row-cols-auto ">
											<div class="col-md-auto img-xl rounded-4">
												<img src="/upload/${mlist[status.index].file_name}"
													class="rounded " alt="java18" data-bs-toggle="modal"
													data-bs-target="#exampleModal"
													data-bs-whatever="/upload/${mlist[status.index].file_name}">
											</div>

										</div>
									</div>
								</c:if>

								<c:if test="${fn:length(img)==2}">
									<div class="container">
										<div class="row row-cols-auto ">
											<div class="col-md-auto img-lg rounded-4">
												<img src="/upload/${img[0]}" class="rounded " alt="java18"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													data-bs-whatever="/upload/${img[0]}">
											</div>
											<div class="col-md-auto img-lg rounded-4">
												<img src="/upload/${img[1]}" class="rounded " alt="java18"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													data-bs-whatever="/upload/${img[1]}">
											</div>
										</div>
									</div>
								</c:if>

								<c:if test="${fn:length(img)==3}">
									<div class="container">
										<div class="row row-cols-auto">
											<div class="col-md-auto img-md rounded-4">
												<img src="/upload/${img[0]}" class="rounded " alt="java18"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													data-bs-whatever="/upload/${img[0]}">
											</div>
											<div class="col-md-auto">
												<div class="row row-cols-auto">
													<div class="col-md-auto img-sm">
														<img src="/upload/${img[1]}" class="rounded " alt="java18"
															data-bs-toggle="modal" data-bs-target="#exampleModal"
															data-bs-whatever="/upload/${img[1]}">
													</div>
												</div>
												<div class="row row-cols-auto">
													<div class="col-md-auto img-sm">
														<img src="/upload/${img[2]}" class="rounded " alt="java18"
															data-bs-toggle="modal" data-bs-target="#exampleModal"
															data-bs-whatever="/upload/${img[2]}">
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>

								<c:if test="${fn:length(img)==4}">
									<div class="container img-sm">
										<div class="row">
											<div class="col-md-auto">
												<img src="/upload/${img[0]}" class="rounded " alt="java18"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													data-bs-whatever="/upload/${img[0]}">
											</div>
											<div class="col-md-auto">
												<img src="/upload/${img[1]}" class="rounded " alt="java18"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													data-bs-whatever="/upload/${img[1]}">
											</div>
										</div>

										<div class="row">
											<div class="col-md-auto">
												<img src="/upload/${img[2]}" class="rounded " alt="java18"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													data-bs-whatever="/upload/${img[2]}">
											</div>
											<div class="col-md-auto">
												<img src="/upload/${img[3]}" class="rounded " alt="java18"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													data-bs-whatever="/upload/${img[3]}">
											</div>
										</div>
									</div>
								</c:if>

							</c:if>

							<div class="post_footer">

								<span class="material-icons ms_icons chat"
									data-bs-toggle="modal" data-bs-target="#writeModal" 
									data-post_id="${plist[status.index].post_id}" 
									data-group="${plist[status.index].pgroup}" 
									data-step="${plist[status.index].pstep}" 
									data-indent="${plist[status.index].pindent}">chat</span>
								<h3>${replycount[status.index]}</h3>
									
								<c:if test="${renoted[status.index]<1}">
									<span class="material-icons ms_icons repeat"
									data-post_id="${plist[status.index].post_id}">repeat</span>
							
								</c:if>
								<c:if test="${renoted[status.index]>=1}">
									<span class="material-icons ms_icons repeat toggle"
									data-post_id="${plist[status.index].post_id}">repeat</span>
							
								</c:if>
							
								<h3>${recount[status.index]}</h3>
								
								<c:if test="${favorited[status.index]<1}">
									<span class="material-icons ms_icons favorite"
									data-post_id="${plist[status.index].post_id}">favorite_border</span>
							
								</c:if>
								<c:if test="${favorited[status.index]>=1}">
									<span class="material-icons ms_icons favorite toggle"
									data-post_id="${plist[status.index].post_id}">favorite</span>
							
								</c:if>
									
								<h3>${facount[status.index]}</h3>
								
								<span class="material-icons ms_icons chart"
								data-post_id="${plist[status.index].post_id}">bar_chart</span>
								<h3>${plist[status.index].hit+1}</h3>

							</div>

						</div>

					</div>

				</c:forEach>

	


		
	</main>
	<!-- main section end -->

	</div>


</body>
</html>