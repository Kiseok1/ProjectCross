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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='twitterprofile.css'>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <!--  <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet"> -->
       <link rel="stylesheet" href="/css/style_x_ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
    
    <script>
    	$(function(){
    		/* 새비밀번호 일치 확인용 변수 */
    		let chk = false;
    		
    		/* 새비밀번호 일치 확인 */
    		$(".new_pw").keyup(function(){
    			let new_pw = $(".new_pw").val();
    			let chk_pw = $(".chk_pw").val();
    			
    			if(new_pw==chk_pw){
    				$(".pwChkTxt").text("비밀번호가 일치합니다.");
    				$(".pwChkTxt").css("color","blue");
    				$(".pwChkTxt").css("margin-left","340px");
    				chk = true;
    			} else{
    				$(".pwChkTxt").text("비밀번호가 일치하지 않습니다.");
    				$(".pwChkTxt").css("color","red");
    				$(".pwChkTxt").css("margin-left","290px");
    				chk = false;
    			}
    			
    		})
    		
    		$(".chk_pw").keyup(function(){
    			let new_pw = $(".new_pw").val();
    			let chk_pw = $(".chk_pw").val();
    			
    			if(new_pw==chk_pw){
    				$(".pwChkTxt").text("비밀번호가 일치합니다.");
    				$(".pwChkTxt").css("color","blue");
    				$(".pwChkTxt").css("margin-left","340px");
    				chk = true;
    			} else{
    				$(".pwChkTxt").text("비밀번호가 일치하지 않습니다.");
    				$(".pwChkTxt").css("color","red");
    				$(".pwChkTxt").css("margin-left","290px");
    				chk = false;
    			}
    			
    		})
    		
    		
    		
    		/* 비번 변경 */
    		$(".savebtn").click(function(){
	    		let cur_pw = $(".cur_pw").val();
	    		let new_pw = $(".new_pw").val();
	    		
	    		if(chk==true){
		    		$.ajax({
		    			url:"/profile/pwUpdate",
		    			type:"post",
		    			data:{"cur_pw":cur_pw,"new_pw":new_pw},
		    			datatype:"text",
		    			success:function(data){
		    				//alert(data);
		    				$("#writeModal").modal("show");
		    				$("#modal_write-box").text(data);
		    				$(".cur_pw").val("");
		    				$(".new_pw").val("");
		    				$(".chk_pw").val("");
		    				$(".cur_pw").focus();
		    				$(".pwChkTxt").text("");
		    			},
		    			error:function(){
		    				alert("실패")
		    			}
		    		});//ajax    			
	    		} else {
	    			$("#writeModal").modal("show");
	    			$("#modal_write-box").css("font-size","15px");
    				$("#modal_write-box").text("'새 비밀번호' 와 '비밀번호 확인'이 일치하지 않습니다");
    				$(".cur_pw").val("");
    				$(".new_pw").val("");
    				$(".chk_pw").val("");
    				$(".cur_pw").focus();
    				$(".pwChkTxt").text("");
	    		}
	    		
    			
    		});//savebtn
    	})    
    </script>
    
</head>

<body>
<div id="view-box">
   	 <%@ include file="/WEB-INF/views/sidebar.jsp" %>
   	 <div class="middlecontainer" >
  	 <%@ include file="/WEB-INF/views/profile/main.jsp" %>
            <section class="mypage_main">
               <ul class="mypage_password"> 계정 > <strong>비밀번호 변경</strong><br>
               	<label>현재 비밀번호</label><br>
               	<input type="password" class="cur_pw"><br>
               	<label>새 비밀번호</label><br>
               	<input type="password" class="new_pw"><br>
               	<label>비밀번호 확인</label><br>
               	<input type="password" class="chk_pw" style="margin-bottom: 10px;"><br>
               	<div class="pwChkTxt" style="display:inline;"></div>
               </ul>
               <div class="savebtn">저장</div>
            </section>
        </div>
    </div>
    
    <!-- modal -->
    <div class="modal" id="writeModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="height: 2rem;">
					<h5 class="modal-title"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="tweet_box">
						<form>
							<div class="tweet_box-input">
								<div id="" class="rounded" style="position: relative; margin:auto;">

									<textarea rows="" cols="" class="content" id="modal_write-box"
										style="outline: none; width: 380px; border: none; resize: none; overflow: hidden; text-align: center; "></textarea>
									<div id="modal_position_wrap" class="invis">
										<div id="position-area" style="display: flex;">
											<span class="material-icons">location_on</span>
											<div id="modal_currLocation"></div>
										</div>
									</div>
									<div id="modal_image-area" style=""></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script async
	src="https://cdn.jsdelivr.net/npm/es-module-shims@1/dist/es-module-shims.min.js"
	crossorigin="anonymous"></script>
<script type="importmap">
    {
      "imports": {
        "@popperjs/core": "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/esm/popper.min.js",
        "bootstrap": "https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.esm.min.js"
      }
    }
    </script>
<script type="module">
      import * as bootstrap from 'bootstrap'

      new bootstrap.Popover(document.getElementById('popoverButton'))
    </script>

</html>