<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>CROSS</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui_jw.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script src="/js/cross/index_jw.js"></script>
    
<style>

input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.userfile{

width:80px;
height:80px;
}

pre{    white-space: pre-wrap;    background: #EEE;}

</style>
    
</head>
 <body>
 
 <div id="view-box">
 	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
 <main>
        <div class="header">
            <span class="material-icons" style="font-size: 35px; color:#BA68C8">
				email
			</span>
        </div>
        <script>
       	$(function(){
       		
       		$("#home-tab").click(function(){
       			location.href = "/message/index";
       		});//click
       		
       		$("#profile-tab").click(function(){
       			location.href = "/message/head";
       		});//click
       		
       		$("#contact-tab").click(function(){
       			location.href = "/message/head2";
       		});//click
       		
       		//.post 숨기기
	       	$('.message_post').hide();
       		//click시 .welcom숨기기
	        $('input[type="search"]').click(function(){
	             $('.welcom').hide();
	             $('.post').show();
	         }); 

       		 //click하지 않았을때는 post를 숨기고 .welcom 보이기
	        $(document).click(function(e) {
	             if (!$(e.target).is('input[type="search"]')) {
	                 $('.welcom').show();
	                 $('.group').hide();
	                 $('.post').hide(); 
	             }
	         }); 
            
       		
            // .post 클래스를 가진 요소를 클릭했을 때의 이벤트 리스너
    		$(".message_post").click(function(){
                // Show the modal
                $('#exampleModal').modal('show');
    			
    		});//post click
    		
       	});//jquery
        </script>
        <!-- nav -->
        <div class="d-flex align-items-center" style="position:relative;">
        	 <div class="breadcrmb_div">
			  <ul class="nav nav-tabs" id="myTab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <button class="nav-link active" id="home-tab"  data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">쪽지쓰기</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false" >받은쪽지함</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">보낸쪽지함</button>
				  </li>
			  </ul> 
		   </div>
        </div>
        <!-- 검색 ajax -->
        <script>
        /*index 모달에 데이터 넣기*/		
        $(document).on('click', '.post', function() {
            // 클릭된 요소에서 필요한 데이터 추출
            var user_id = $(this).closest(".post").attr('id');
            
            // 모달에 데이터 채우기
            
            // 모달 보이기
            /* 유저 정보 모달창 ajax  */
            $.ajax({
                url: "/message/UserData",
                type: "post",
                data: { "user_id": user_id },
                dataType: "json",
                success: function(data) {
                    console.log(data);
                    $(".sender").children().attr("src","/upload/"+data.profile_img);
                    $("#name").text("@"+data.user_id);
                    $("#name1").val(data.user_id);
                    
                    $('#messageModal').modal('show');
                },
                error: function() {
                    alert("실패");
                }
            });
        });
		
        $(function(){
        	 var prev_data = "";
        	 var initialDataLoaded = false; // 처음 데이터를 받았는지 여부를 나타내는 변수
            $("#searchResults").on("click", ".check", function(event) {
                var user_id = $(this).closest(".post").attr('id');
                alert(user_id);
               
                // 데이터가 로드되지 않은 경우, AJAX 요청을 보냄
                $.ajax({
                    url: "/message/UserData",
                    type: "post",
                    data: { "user_id": user_id },
                    dataType: "json",
                    success: function(data) {
                        console.log(data);
                        if (data) { // 단일 객체로 데이터를 받음
                            var item = data; // 단일 객체이므로 item에 할당
							
                            var userDataHtml = '<div id="' + item.user_id + '_data">';
                            userDataHtml += '<div class="profile-image" style="overflow: hidden; height: 40px; width: 40px; border-radius: 50%; position: relative; left: 5px; top: 3px;">';
                            userDataHtml += '<img src="/upload/' + item.profile_img + '" style="width: 40px; height: 40px; position: relative; right: 1px; border-radius: 50%;"></div>';
                            userDataHtml += '<div class="body" style="position: relative; bottom: 36px; left: 50px;">';
                            userDataHtml += '<span class="header-icon-section" style="position: relative; right: 3px font-size: 10px;">@' + item.name + '';
                            userDataHtml += '</span>';
                            userDataHtml += '<h3 style="font-size: 12px;">' + item.user_id + '';
                            userDataHtml += '<span class="material-icons badge" style="font-size: 12px; color: #BA68C8; position: relative; right: 5px; top: 3px;">verified</span>';
                            userDataHtml += '</h3>';
                            userDataHtml += '</div>';
                            userDataHtml += '</div>';
                            userDataHtml += '</div>';

                            // 새로운 데이터를 옆으로 추가
                            if (!initialDataLoaded) {
                                $(".group").append(userDataHtml); // 처음 데이터를 추가
                                $(".group").css("display","flex");
                            } else {
                                $(".group").append(userDataHtml);
                                console.log(userDataHtml);
                            }

                            $(".group").show();
                            initialDataLoaded = true;
                        } else {
                            $(".group").hide();
                        }
                    },
                    error: function() {
                        alert("실패");
                    }
                });

                // .check 클릭 이벤트가 .post 클릭 이벤트를 중지시킴
                event.stopPropagation();
            });
        });


        </script>
        
        <!-- 검색 -->
        <div class="d-flex align-items-center">
         <form class="w-100 me-3" role="search" name="search">
           <input style="width: 70%; margin-left: 10px; height: 30px; margin-bottom: 10px; margin-top: 10px;" type="search" class="form-control" placeholder="검색" aria-label="Search" name="searchInput" id="searchInput">
         </form>
         <span class="material-symbols-outlined add">person_add</span>
        </div>
        <!-- 쪽지 쓰기 버튼 구성 -->
		<div class="group" style="display:none; width: 97%; margin-left: 10px; height: 48px; margin-bottom: 5px; color: #212529; background-color: #fff; border: 1px solid #ced4da; border-radius: 0.25rem;">
		</div>
		<div class="welcom">
			<span class="material-icons" style="font-size: 50px; padding: 20px; color:#BA68C8">
				sentiment_satisfied_alt
			</span>
			<div>
			    <span class="message">쪽지쓰기에 오신 것을 환영합니다</span>
			</div>
			<br>
		</div>
		<div id="searchResults">
		</div>

		
	<!-- 모달 창 -->
		<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content" style="border: 2px solid #b19cd9; border-radius: 1rem;">
		      <div class="modal-header">
		        <span class="material-icons" style="font-size: 35px; color:#BA68C8; position: relative; top: 5px;">email</span>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   <div class="message_tweet_box">
            <form action="doMInsert" name="insertFrm" method="post" enctype="multipart/form-data">
               	<div class="profile-img" style="top: 10px; position: relative;">
		 			<div class="sender">
		          		<img src="/upload/" style="width: 70px; height: 70px; position: relative; right: 1px;  border-radius: 40px; bottom: 10px;">
		          	</div>
		          </div>
		          <div class="mb-3" style="position: relative; left: 80px; bottom: 15px;">
	                       <h3 id="target_id">
	                           <span class="header-icon-section">
	                               <span class="material-icons post_badge">verified</span><span id="name" name="target_id" style="right: 4px; position: relative;">@</span>
	                               <input type="hidden" name="target_id" id="name1">
	                           </span>
	                       </h3>
	                </div>
				<div class="tweet_box-input" style="position: relative; bottom: 30px;">
					<div id="modal_text-area" class="rounded" style="position: relative; height: 250px;">

						<textarea rows="" cols="" class="content" name="mcontent" id="modal_write-box"
							style="outline: none; width: 380px; border: none; resize: none; overflow: hidden"></textarea>
						<div id="modal_position_wrap" class="invis">
							<div id="position-area" style="display: flex;">
								<span class="material-icons">location_on</span>
								<div id="modal_currLocation"></div>
							</div>
						</div>
						<div class="userfile" id="modal_image-area" name="files" style=""></div>
								</div>
							</div>
						</div>
			
				</div>

                <div class="message_box-footer modal-footer" style="position: relative; bottom: 30px; height: 30px;">
                    <label for="file" id="message_imgBtn" style="position: relative; right: 340px; bottom: 10px; cursor: pointer;">
                    	<span class="material-symbols-outlined" style="font-size: 40px; color: var(--twitter-theme-color); ">image</span>
						<input type="file" id="file" name="files" multiple="multiple">
                    </label>
			        <button type="submit" id="send_btn" class="btn btn-primary" style="background-color: #BA68C8; border: 1px solid var(--twitter-background-color); position: relative; bottom: 10px; left: 5px;">보내기</button>
					<!--모달 끝 -->
                </div>
            </form>
        </div>
        </div>
        </div>
   	<script>
   	</script>
 </main>
 
    <!-- main section end -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 </body>
  
</html>