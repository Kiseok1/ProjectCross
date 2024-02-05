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
<title>CROSS</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="/css/style_x_ui_jw.css">
<link rel="stylesheet" href="/node_modules/reset.css/reset.css">
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


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

<script>



$(function(){

	
})


</script>

    
    
</head>
 <body>
 
 <div id="view-box">
 	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
 <!-- <div id="view-box" style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-background-color);" >
 

	 <nav style="margin-top: 20px;" >
	    <div class="nav_logo-wrapper" >
       		<img class="nav_logo" src="images/apple.jpg" >
        </div>
        
	 	<div class="profile-wrapper " style="">
	 		<div class="profile-img">
	 			<div style="" class="img-wrapper rounded-5">
	 				
	 			</div>
	 		</div>
	 		<div class="profile-name">
	 			<div style="margin: 4px;"><h2>Name</h2></div>
	 		</div>
	 		<div class="profile-follow" style="display: flex; margin-top:20px;">
	 			<div style="margin:0 4px;"><h4>팔로우</h4></div> 
	 			<div style="margin:0;">100</div>

	 			<div style="margin:0 4px 0 10px;"><h4>팔로워</h4></div> 
	 			<div style="margin:0;">100</div>
	 		</div>
	 	
	 	</div>
	 
	 


        <div class="Menu_options active">
            <span class="material-icons">home</span>
            <h2>홈</h2>
        </div>

        <div class="Menu_options">
            <span class="material-icons">person</span>
            <h2>프로필</h2>
        </div> 
        
        <div class="Menu_options">
            <span class="material-icons">bookmark</span>
            <h2>북마크</h2>
        </div> 
        
        <div class="Menu_options" style="background-color: var(--twitter-background-color); border-radius: 30px; color: #b19cd9;">
            <span class="material-icons">email</span>
            <h2>메시지</h2>
        </div>
       
        <div class="Menu_options">
            <span class="material-icons">notifications</span>
            <h2>알림</h2><span class="badge text-bg-light rounded-pill align-text-bottom">27</span>
        </div>

		 <div class="Menu_options">
            <span class="material-icons">tag</span>
            <h2>검색</h2>
        </div>
		
		<div><br></div>
	 
	 	<div class="Menu_options">
	 		<span class="material-icons">logout</span>
	 		<h2>로그아웃</h2>
	 	</div>
	 </nav> -->


 <main>
      <div class="header">
            <span class="material-icons" style="font-size: 35px; color:#BA68C8">
				email
			</span>
        </div>
        <script>
        	$(function(){
        		
        		/* 검색하기 */
        		$("#searchInput3").on("keyup",function(){
        			var input = $(this).val().trim();
        	        if (input === "") {
        	            // 입력값이 없으면 검색 결과를 숨김
        	            $("#searchResults").empty().hide();
        	            
        	        }else{
        	        	$(".post").remove();
        	        }
        			//ajax 검색 데이터 가져오기
        			$.ajax({
						url:"/message/search3",
						type:"post",
						data:{"input":input},
						dataType:"json",
						success:function(data){
							console.log(data);
							 // 이전 검색 결과를 삭제
			                $("#searchResults").empty();
			                if (data.length > 0) {	 
							for (let i = 0; i < data.length; i++) {
							    let item = data[i];
							    var formattedDate = moment(item.messageDto.created).format('MM월DD일');
							    //태그 입력 시작
							    let hdata = ' <div class="post" id="'+item.messageDto.msg_id+'">';
							    hdata +='<div class="post_profile-image" style="margin: 1rem; overflow: hidden; height: 60px; width: 70px; position: relative; left: 1px;">';
							    hdata +='<div class="user"><img src="/upload/'+item.cross_userDto.profile_img+'" style="width: 60px;  height: 60px; position: relative; border-radius: 30px; color: var(--twitter-theme-color); right: 20px; bottom: 20px;" ></div>';
							    hdata +='</div>';
							    hdata +='<div class="post_body" style="position: relative; bottom: 6px;">';
							    hdata +='<div class="post_header" style="position: relative; top: 15px; left: 10px;">';
							    hdata +='<div class="post_header-text">';
							    hdata +='<h3>'+item.cross_userDto.name+'';
							    hdata +='<span class="header-icon-section">';
							    hdata +='<span class="material-icons post_badge">verified</span>'+item.messageDto.target_id+'님께 받은 쪽지 ';
							    hdata += '<span id="date">' + formattedDate + '</span>';
							    hdata +='</span>';
							    hdata +='</h3>';
							    hdata +='</div>';
							    hdata +='<div class="post_header-discription">';
							    hdata +='<ul>';
							    hdata +='<li>'+item.messageDto.mcontent+'</li>';
							    hdata +='</ul>';
							    hdata +='</div>';
							    hdata +='<span class="material-symbols-outlined check">check_circle</span>';
							    hdata +='</div>';
							    hdata +='</div>';
							    hdata +='</div>';
							    //생성된 HTML을 추가
							    $("#searchResults").append(hdata);
							    
							}
					        $("#searchResults").show();
					       
					    } else {
					        $("#searchResults").hide();
					    }
					},
						error:function(){
							alert("실패");
						}
        				
        				
        			});//ajax
        			
        		});//searchInput
        		
        		//이동
        		$("#home-tab").click(function(){
	       			location.href = "/message/index";
        			
        		});//nav home-tab clik
        		
        		$("#profile-tab").click(function(){
        			location.href = "/message/head";
        		});//nav profile-tab clik
        		
        		$("#contact-tab").click(function(){
        			location.href = "/message/head2";
        		});//nav contact-tab clik
        		
        		
        		// 데이터를 가져와서 모달 열기 함수
        		function openModalWithData(element) {
        		    let msg_id = element.attr('id');
        		    $.ajax({
        				url:"/message/sendOne",
						type:"post",
						data:{"msg_id":msg_id},
						dataType:"json",
						success:function(data){
						  console.log(data);
						  // 날짜 데이터를 JavaScript Date 객체로 변환
						  var date = new Date(data.messageDto.created);
						    
					     // 원하는 형식으로 날짜를 변환하여 출력 (예: yyyy년 MM월 dd일)
					     var formattedDate = (date.getMonth() + 1) + "월 " + date.getDate() + "일";

						  // 변환된 날짜를 해당 요소에 적용
						  $("#date").text(formattedDate);
						  $(".sender").children().attr("src","/upload/"+data.cross_userDto.profile_img);
			              $("#Mcontent").text(data.messageDto.mcontent);
			              $("#name").text("@"+data.messageDto.target_id);
			              if (data.mediaDto.file_name === null) {
			            	    $("#File").hide();
			            	    
			            	} else {
			            		$("#File").show();
			            	    $("#File").children().attr("src", "/upload/" + data.mediaDto.file_name);
			            	}
						},
						error:function(){
							alert("실패");
						}
        			});//ajax
        		    // Show the modal
        		    $('#exampleModal').modal('show');
        		}

        		// #searchResults의 .post를 클릭했을 때 모달 열기 및 데이터 표시
        		$('#searchResults').on('click', '.post', function() {
        		    openModalWithData($(this));
        		});

        		// .post를 클릭했을 때 모달 열기 및 데이터 표시
        		$('.post').click(function() {
        		    openModalWithData($(this));
        		});

        		
        		//선택삭제 모달창
        		$("#deleteBtn1").click(function(){

                    // Show the modal
                    $('#exampleModal2').modal('show');
        			
        		});//deleteBtn1 click
        		
        		// 확인 버튼 클릭 시 선택된 쪽지 삭제
        		$('#send_btn').click(function() {
        		    // 빨간색으로 선택된 .check 요소를 찾아 그 부모인 .post 요소를 찾고, 각 .post 요소의 ID를 가져와 서버로 전송하여 삭제
        		    $('.check').filter(function() {
        		        return $(this).css('color') === 'rgb(255, 0, 0)';
        		    }).each(function() {
        		        var msg_id = $(this).closest('.post').attr('id');
        		        // 서버로 쪽지 삭제 요청을 전송하는 코드 작성
        		        $.ajax({
        		            url: '/message/deleteMSelect',
        		            type: 'post',
        		            data: { 'msg_id': msg_id },
        		            dataType: 'text',
        		            success: function(data) {
        		            		console.log(data);
        		                    // 삭제 성공 시 해당 쪽지를 화면에서 제거
        		                    $('#' + msg_id).remove();
        		            },
        		            error: function() {
        		                alert('삭제 요청을 처리하는 중 오류가 발생했습니다.');
        		            }
        		        });
        		    });
        		    // 모달 닫기
        		    $('#exampleModal2').modal('hide');
        		});

        		
        		
        		//선택삭제 모달창
        		$("#deleteBtn2").click(function(){

                    // Show the modal
                    $('#exampleModal3').modal('show');
        			
        		});//deleteBtn1 click
        		
        	    // .post 클래스를 가진 요소를 클릭했을 때의 이벤트 리스너
        		// Click event for #check
        	    $('.check').click(function(event){
        	        // 클릭 이벤트의 기본 동작 방지
        	        event.preventDefault();
        	        //상위 요소로 이벤트 전파 중지
        	        event.stopPropagation();
        	     	
        	        // Get the current color of #check
        	        var currentColor = $(this).css('color');
        	        // 빨간색과 원래 색상 간 전환
                    if (currentColor === 'rgb(255, 0, 0)') {
                        $(this).css('color', ''); // 기본 색상으로 재설정
                        $(this).css('display', ''); // 빨간색으로 설정
                        $(this).closest('.post').removeClass('hover');
                    } else {
                        $(this).css('color', 'red'); // 빨간색으로 설정
                        $(this).css('display', 'inline-block'); // 빨간색으로 설정
                        $(this).closest('.post').addClass('hover');
                    }
	                
        	    });//check
        	    
        	});//jquery
        	
        </script>
        <!-- 모달 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content" style="border: 2px solid #b19cd9; border-radius: 1rem;">
		      <div class="modal-header" style="width: 495px;">
		        <span class="material-icons" style="font-size: 35px; color:#BA68C8; position: relative; top: 5px;">email</span>
		        <h5 class="modal-title" id="exampleModalLabel"></h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="height: 290px;">
		        <form>
		          <div class="mb-3" style="position: relative; right: 10px;">
		          	<div class="sender">
		          		<img src="/upload/" style="width: 60px; height: 60px; position: relative; right: 1px;  border-radius: 30px;">
		          	</div>
		          </div>
		          <div class="mb-3" style="position: relative; left: 65px; bottom: 50px;">
                        <h3 id="target_id">
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span><span id="name" style="right: 4px; position: relative;">@</span>
                                <br>
                                <span id="date">1월 18일</span>
                            </span>
                        </h3>
	                </div>
		          <div class="mb-3">
		            <div class="form-control" id="message-text" style="">
		            	<ul>
		            	  <li id="Mcontent">안녕하세요. 다름이 아니라 저번주에 정했던 미팅 약속을 부득이하게 취소하게 되어 연락드립니다.</li>
		            	  <li id="File"><img src="/upload/" style="width: 120px; height: 125px; position: relative; top: 10px;" ></li>
		            	</ul>
		            </div>
		          </div>
		        </div>
		        </form>
		      </div>
		      <div class="modal-footer" style="position: relative; right: 495px; top: 170px; width: 490px; margin-top: 20px">
		      </div>
		    </div>
		  </div>
        
		  <!-- 선택삭제 모달 창 -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content" style="border: 2px solid #b19cd9; border-radius: 1rem; height: 250px; width: 400px;">
		      <div class="modal-header" style="width: 395px;">
		        <span class="material-icons" style="font-size: 35px; color:#BA68C8; position: relative; top: 5px;">email</span>
		        <h5 class="modal-title" id="exampleModalLabel"></h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="mb-3" style="position: relative; text-align: center;top: 30px;">
                        <h3>선택하신 쪽지를 삭제하시겠습니까?</h3>
	                </div>
		        </div>
		        <div  style="position: relative; bottom: 25px; left: 150px;">
		         <button type="button" id="send_btn" class="btn btn-primary">확인</button>
		      	</div>
		       </form>
		      </div>
		    </div>
		  </div>
		<!--전체 삭제버튼  -->
		<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content" style="border: 2px solid #b19cd9; border-radius: 1rem; height: 250px; width: 400px;">
		      <div class="modal-header" style="width: 395px;">
		        <span class="material-icons" style="font-size: 35px; color:#BA68C8; position: relative; top: 5px;">email</span>
		        <h5 class="modal-title" id="exampleModalLabel"></h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="mb-3" style="position: relative; text-align: center;top: 30px;">
                        <h3>모든 알림을 삭제하시겠습니까?</h3>
	                </div>
		        </div>
		        <div  style="position: relative; bottom: 25px; left: 150px;">
		         <button type="button" id="send_btn" class="btn btn-primary">확인</button>
		      	</div>
		       </form>
		      </div>
		    </div>
		  </div>
		  
		  
		  
		  
		  
        <!-- nav -->
        <div class="d-flex align-items-center" style="position:relative;">
        	 <div class="breadcrmb_div">
			  <ul class="nav nav-tabs" id="myTab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <div class="nav-link" id="home-tab"  data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="false">쪽지쓰기</div>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link " id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false" >받은쪽지함</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link active" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="true">보낸쪽지함</button>
				  </li>
			  </ul> 
		   </div>
        </div>
        <!-- 검색 -->
      <div class="d-flex align-items-center">
	    <form class="w-100 me-3" role="search" name="search">
           <input style="width: 100%; margin-left: 10px; height: 30px; margin-bottom: 10px; margin-top: 10px;" type="search" class="form-control" placeholder="검색" aria-label="Search" name="searchInput3" id="searchInput3">
         </form>
	    <!-- 선택삭제,전체삭제 -->
	    <button class="delete-button" id="deleteBtn1" style="position: relative; left: 18px;">선택삭제</button>
	    <button class="delete-button" id="deleteBtn2" >전체삭제</button>
	 </div>
	  <div id="searchResults">
	   </div> 
	   <!-- 쪽지 부분 -->
	   <c:forEach var="messCrossMediaDto" items="${list2}">
       <div class="post" id="${messCrossMediaDto.messageDto.msg_id}">
            <div class="post_profile-image" style="margin: 1rem; overflow: hidden; height: 60px; width: 70px; position: relative; left: 1px;">
			<div class="user"><img src="/upload/${messCrossMediaDto.cross_userDto.profile_img}" style="width: 60px;  height: 60px; position: relative; border-radius: 30px; color: var(--twitter-theme-color); right: 20px; bottom: 20px;" ></div>
			</div>
            <div class="post_body">
                <div class="post_header" style="position: relative; top: 15px; left: 10px;">
                    <div class="post_header-text">
                        <h3>${messCrossMediaDto.cross_userDto.name}
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>${messCrossMediaDto.messageDto.target_id}님께 보낸 쪽지
                                <span id="date"><fmt:formatDate value="${messCrossMediaDto.messageDto.created}" pattern="MM월dd일"/> </span>
                            </span>
                        </h3>
                    </div>
                    <div class="post_header-discription">
                        <ul>
                           <li>${messCrossMediaDto.messageDto.mcontent}</li>
                       </ul>
                    </div>
                    <span class="material-symbols-outlined check">check_circle</span>
                </div>
            </div>
        </div>
       </c:forEach>
</main>

</div>
</body>
  
</html>