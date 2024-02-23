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
<script src="/js/cross/head_jw.js"></script>


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
   <div id="view-box" style="display: flex; justify-content: center; border-left: 1px solid var(--twitter-background-color);" >
 	<%@ include file="/WEB-INF/views/sidebar.jsp" %> 
 	

 <main>
         <div class="header">
            <span class="material-icons" style="font-size: 35px; color:#BA68C8">
				email
			</span>
        </div>
        <script>
        /* 클릭요소 및 ajax */
        	$(function(){
        		/* 검색하기 */
        		$("#searchInput2").on("keyup",function(){
        			var input = $(this).val().trim();
        	        if (input === "") {
        	            // 입력값이 없으면 검색 결과를 숨김
        	            $("#searchResults").empty().hide();
        	            $(".main").show();
        	            return;
        	        } else {
        	            $("#searchResults").show();
        	            $(".main").hide();
        	        }
        	        // 이전 검색 결과를 삭제
        	        $("#searchResults").empty();
        	        
        			$.ajax({
						url:"/message/search2",
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

			                	    // 태그 입력 시작
			                	    let hdata = '<div class="post" id="' + item.messageDto.msg_id + '">';
			                	    hdata += '<div class="post_profile-image" style="margin: 1rem; overflow: hidden; height: 60px; width: 70px; position: relative; left: 1px;">';
			                	    hdata += '<div class="user"><img src="/upload/' + item.cross_userDto.profile_img + '" style="width: 60px;  height: 60px; position: relative; border-radius: 30px; color: var(--twitter-theme-color); right: 20px; bottom: 20px;" ></div>';
			                	    hdata += '</div>';
			                	    hdata += '<div class="post_body" style="position: relative; bottom: 6px;">';
			                	    hdata += '<div class="post_header" style="position: relative; top: 15px; left: 10px;">';
			                	    hdata += '<div class="post_header-text">';
			                	    hdata += '<h3>' + item.cross_userDto.name + '';
			                	    hdata += '<span class="header-icon-section">';
			                	    hdata += '<span class="material-icons post_badge">verified</span>' + item.messageDto.source_id + '님께 받은 쪽지 ';
			                	    hdata += '<span id="date">' + formattedDate + '</span>';
			                	    hdata += '</span>';
			                	    hdata += '</h3>';
			                	    hdata += '</div>';
			                	    hdata += '<div class="post_header-discription">';
			                	    hdata += '<ul>';

			                	    if (item.messageDto.checked == 0) {
			                	        // checked 값이 0인 경우 스타일 적용
			                	        hdata += '<li style="font-weight:bold; color: grey;">' + item.messageDto.mcontent + '</li>';
			                	    } else {
			                	        // 그 외의 경우 일반적인 스타일 적용
			                	        hdata += '<li>' + item.messageDto.mcontent + '</li>';
			                	    }

			                	    hdata += '</ul>';
			                	    hdata += '</div>';
			                	    hdata += '<span class="material-symbols-outlined check">check_circle</span>';
			                	    hdata += '</div>';
			                	    hdata += '</div>';
			                	    hdata += '</div>';

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
        		
        		//input값이 있을 경우에는 다른 곳을 클릭해도 searchInput값만 나오게 하기
        	    $(document).on("click", function(event){
        	        // 클릭된 요소가 input 요소가 아니고, 검색 결과 영역이 아니라면
        	        if (!$(event.target).is("#searchInput2") && !$(event.target).closest("#searchResults").length) {
        	            // input 요소에 값이 있으면 검색 결과를 보여주고, 없으면 숨깁니다.
        	            var inputVal = $("#searchInput2").val().trim();
        	            if (inputVal !== "") {
        	            	$("#searchResults").show();
        		            $(".main").hide();
        	            } else {
        	            	$("#searchResults").empty().hide();
        		            $(".main").show();
        	            }
        	        }
        	    });        
        		
        		 // 데이터를 가져와서 모달 열기 함수
			    function openModalWithData(element) {
			        let msg_id = element.attr('id');
			        $.ajax({
			            url: '/message/receiveOne',
			            type: 'post',
			            data: { 'msg_id': msg_id },
			            dataType: 'json',
			            success: function(data) {
			                console.log(data);
			                // 날짜 데이터를 JavaScript Date 객체로 변환
			                var date = new Date(data.messageDto.created);
			                // 원하는 형식으로 날짜를 변환하여 출력 (예: yyyy년 MM월 dd일)
			                var formattedDate = (date.getMonth() + 1) + '월 ' + date.getDate() + '일';
			
			                // 변환된 날짜를 해당 요소에 적용
			                $('#date').text(formattedDate);
			                $('.sender').children().attr('src', '/upload/' + data.cross_userDto.profile_img);
			                $('#Mcontent').text(data.messageDto.mcontent);
			                $('#name').text('@' + data.messageDto.source_id);
			                if (data.mediaDto.file_name === null || !data.mediaDto.file_name.match(/\.(jpg|jpeg|gif|png)$/i)) {
			                    $('#File').hide();
			                } else {
			                    $('#File').show();
			                   // 파일 이름이 쉼표로 구분된 문자열을 포함하고 있다고 가정합니다.
			                    var fileNames = data.mediaDto.file_name.split(',');
								console.log(fileNames[0]);
								console.log(fileNames[1]);
			                    // 파일 이름 배열을 순회합니다.
			                    for (var i = 0; i < Math.min(4, fileNames.length); i++) {
			                        var fileName = fileNames[i].trim(); // 앞뒤의 공백을 제거합니다.
			                        // 해당 인덱스에 해당하는 자식 요소를 선택합니다. (예: #File > img:nth-child(1))
			                        var childElement = $('#File').children().eq(i);
			                        // 자식 요소의 src 속성을 설정합니다.
			                        childElement.attr('src', '/upload/' + fileName);
			                        // 자식 요소를 표시합니다.
			                        childElement.show();
			                    }

			                    // 제공된 파일 이름이 4개 미만인 경우 남은 자식 요소를 숨깁니다.
			                    $('#File').children().slice(Math.min(4, fileNames.length)).hide();

			                    
			                }
			            },
			            error: function() {
			                alert('실패');
			            }
			        });
			        // Show the modal
			        $('#exampleModal').modal('show');
			    }
			    // #searchResults의 .post를 클릭했을 때 모달 열기 및 데이터 표시
			    $('#searchResults').on('click', '.post', function() {
			        openModalWithData($(this));
			    });

			    // .post를 클릭했을 때 모달 열기 및 데이터 표시
			    $('.post').click(function() {
			        let $post = $(this); // 클릭된 .post 요소를 변수에 저장
			        let msg_id = $post.attr('id');
			        $.ajax({
			            url: '/message/checkUpdate',
			            type: 'post',
			            data: { 'msg_id': msg_id, "stat":"receive" },
			            dataType: 'json',
			            success: function(data) {
			                console.log(data.messageDto.checked);
			                if(data.messageDto.checked == 1){
			                    $post.find('.post_header-discription li').css('font-weight', '');
			                    $post.find('.post_header-discription li').css('color', 'black');
			                }
			            },
			            error:function(){
			                alert("실패");    
			            }
			        });
			        openModalWithData($post);
			    });//postclick
        	});//jquery
        	
        </script>
        <!-- 모달 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content" style="border: 2px solid #b19cd9; border-radius: 1rem; height: 400px;">
		      <div class="modal-header" style="width: 495px;">
		        <span class="material-icons" style="font-size: 35px; color:#BA68C8; position: relative; top: 5px;">email</span>
		        <h5 class="modal-title" id="exampleModalLabel"></h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="">
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
		            <div class="form-control" id="message-text" style="height: 200px;">
		            	<ul>
		            	  <li id="Mcontent">안녕하세요. 다름이 아니라 저번주에 정했던 미팅 약속을 부득이하게 취소하게 되어 연락드립니다.</li>
		            	  <li id="File">
		            	  	<img src="/upload/" style="width: 40%; height:220px; position: relative; top: 10px; object-fit:cover;" >
		            	  	<img src="/upload/" style="width: 40%; height:220px; position: relative;  top: 10px;  object-fit:cover;" >
		            	  	<img src="/upload/" style="width: 40%; height:220px; position: relative; top: 10px; object-fit:cover;" >
		            	  	<img src="/upload/" style="width: 40%; height:220px; position: relative; top: 10px; object-fit:cover;" >
		            	  </li>
		            	</ul>
		            </div>
		          </div>
		        </div>
		        </form>
		      </div>
		      <div class="modal-footer" style="position: relative; right: 495px; top: 175px; width: 490px; margin-top: 20px;">
		      </div>
		    </div>
		  </div>
        <!-- delete모달 창 -->
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
                        <h3 style="font-size: 19px; position: relative; top: 5px;">선택하신 알림을 삭제하시겠습니까?</h3>
	                </div>
		        </div>
		        <div  style="position: relative; bottom: 25px; left: 150px;">
		         <button type="button" id="send_btn" class="btn btn-primary" style="width: 100px; font-size: 18px; position: relative; top: 5px;  left: 0px; ">확인</button>
		      	</div>
		       </form>
		      </div>
		    </div>
		  </div>

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
                        <h3 style="font-size: 19px; position: relative; top: 5px;">모든 알림을 삭제하시겠습니까?</h3>
	                </div>
		        </div>
		        <div  style="position: relative; bottom: 25px; left: 150px;">
		         <button type="button" id="Allsend_btn" class="btn btn-primary">확인</button>
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
				    <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="true" >받은쪽지함</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">보낸쪽지함</button>
				  </li>
			  </ul> 
		   </div>
        </div>
        <!-- 검색 -->
      <div class="d-flex align-items-center">
	    <form class="w-100 me-3" role="search" name="search">
           <input type="hidden" style="width: 100%; margin-left: 10px; height: 30px; margin-bottom: 10px; margin-top: 10px;" type="search" class="form-control" placeholder="검색" aria-label="Search" name="searchInput2" id="searchInput2">
         </form>
	    <!-- 선택삭제,전체삭제 -->
	    <button class="delete-button" id="deleteBtn1" style="position: relative; left: 18px;">선택삭제</button>
	    <button class="delete-button" id="deleteBtn2" >전체삭제</button>
	 </div>
        <script>
        	$(function(){
        		$("#message_wrap").on("click",function(){
        			alert("test");
        		})
        		
        	})
        </script>
       <div id="searchResults">
	   </div> 
	   <!-- 쪽지 부분 -->
	   <c:if test="${empty list}">
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
	   </c:if>
	    <c:if test="${not empty list}">
	   <c:forEach var="messCrossMediaDto" items="${list}">
       <div class="post main" id="${messCrossMediaDto.messageDto.msg_id}">
            <div class="post_profile-image" style="margin: 1rem; overflow: hidden; height: 60px; width: 70px; position: relative; left: 1px;">
			<div class="user"><img src="/upload/${messCrossMediaDto.cross_userDto.profile_img}" style="width: 60px;  height: 60px; position: relative; border-radius: 30px; color: var(--twitter-theme-color); right: 20px; bottom: 20px;" ></div>
			</div>
            <div class="post_body" style="position: relative; bottom: 6px;">
                <div class="post_header" style="position: relative; top: 15px; left: 10px;">
                    <div class="post_header-text">
                        <h3>${messCrossMediaDto.cross_userDto.name}
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>${messCrossMediaDto.messageDto.source_id}님께 받은 쪽지
                                <span id="date"><fmt:formatDate value="${messCrossMediaDto.messageDto.created}" pattern="MM월dd일"/> </span>
                            </span>
                        </h3>
                    </div>
                    <div class="post_header-discription">
                       <ul>
					    <c:if test="${messCrossMediaDto.messageDto.checked eq 0}">
						    <li style="font-weight:bold; color:#BA68C8;">${messCrossMediaDto.messageDto.mcontent}</li>
						</c:if>
						<c:if test="${messCrossMediaDto.messageDto.checked ne 0}">
						    <li>${messCrossMediaDto.messageDto.mcontent}</li>
						</c:if>
                       </ul>
                    </div>
                    <span class="material-symbols-outlined check">check_circle</span>
                </div>
            </div>
        </div>
       </c:forEach>
      </c:if>  
</main>

</div>
</body>
  
</html>