<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<title>Home / Twitter</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link rel="stylesheet" href="/css/style_x_ui_yk.css">
<link rel="stylesheet" href="/css/style_yk.css">
<link rel="stylesheet" href="node_modules/reset.css/reset.css">
<link rel="icon" href="favicon.png">
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

 <!-- include summernote css/js-->
    <link href="css/summernote-lite.css" rel="stylesheet">
    <script src="js/summernote-lite.js"></script>
    
   
    
<script>
    $(function() {
        $(".bookmark").click(function() {
            var currentText = $(this).text();

            if (currentText === "turned_in_not") {
                $(this).text("bookmark");
            } else {
                $(this).text("turned_in_not");
            }
        });

        $(".like").click(function() {
            var currentText = $(this).text();

            if (currentText === "favorite_border") {
                $(this).text("favorite");
            } else {
                $(this).text("favorite_border");
            }
        });

        var dropdown = $(".dropdown_bar");
        var dropdownContent = $(".dropdown_content");

        dropdown.click(function(event) {
            event.stopPropagation(); // 클릭 이벤트 전파 방지
            if (dropdownContent.css("display") === "block") {
                dropdownContent.css("display", "none");
            } else {
                dropdownContent.css("display", "block");
            }
        });

        // 문서의 다른 부분을 클릭했을 때 드롭다운 메뉴를 닫음
        $(document).click(function() {
            dropdownContent.css("display", "none");
           
        });
        
        $("#logout").click(function(){
        	alert("로그아웃 됩니다.");
        	location.href="login";
        });
    });
</script>
</head>
<body>

	<!-- main section start -->
	<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	<main>
		<div class="header">
			<h2>북마크</h2>
			<div class="post_header-text">
				<h3>
					@qwerasd134<span class="header-icon-section">
				</h3>
			</div>
			<div class="menuBtn">
				<div class="dropdown_main">
					<!-- 드롭다운 메뉴바 -->
					<div class="dropdown_bar">
						<span class="material-icons more_horiz">more_horiz</span>
					</div>
						<div class="dropdown_content" style="display:none;">
							<a href="#" style="color:#BA68C8;">·모든 북마크 지우기</a> 
						</div>
				</div>

			</div>
		</div>


		<div class="post">
			<div class="bookmark_post_profile-image">
				<img src="/upload/k2.jpg" alt="java-logo">

			</div>

			<div class="post_body">
                <div class="post_header">
                    <div class="post_header-text">
                        <h3>Java
                            <span class="header-icon-section">
                                <span class="material-icons post_badge">verified</span>@java
                            </span>
                        </h3>
                        <div style="margin-left: 1rem; text-align: center;"><h3>24.01.01</h3></div>
                    </div>

                    <div class="post_header-discription" onclick="location.href='viewContent'">
                        <p>Java 18 is now available! #Java18 #JDK18 #openjdk </p>
                        <br>
                        <p>Download now: https://social.ora.cl/6012KoqQ0 <br>
                            Release notes: https://social.ora.cl/6013KoqQF <br>
                            API Javadoc: https://social.ora.cl/6015KoqQN <br>
                            Features: https://social.ora.cl/6016KoqQ4 <br>
                            </p>
                    </div>
                    
                </div>
                
                <div class="container">
			      <div class="row row-cols-auto ">
			        <div class="col-md-auto img-xl rounded-4"><img src="/images/post-image.jpeg"  class="rounded " alt="java18" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="/images/post-image.jpeg" ></div>
			
			      </div>
			    </div>
			    

                <div class="post_footer">

                    <span class="material-icons ms_icons">chat</span><h3>100</h3>
                    <span class="material-icons ms_icons repeat">repeat</span><h3>100</h3>
                    <span class="material-icons ms_icons favorite">favorite_border</span><h3>100</h3>
                    <span class="material-icons ms_icons">bar_chart</span><h3>100</h3>
                    

                </div>

            </div>

		</div>
		


	</main>


</body>
</html>