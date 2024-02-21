
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>로그인</title>
				<link rel="stylesheet" href="/css/login.css">
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
				<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
			</head>

			<body>

				<!-- login -->
				<div class="main">
					<!-- side image복사 -->
					
					<div class="side">
						<!-- <h1 class="logo">CROSS</h1> -->
						<img src="/images/cross.jpg">
						<!-- <h5 class="slogo">생각과 의견을 교차</h5> -->
					</div>

					<div class="smain">
						<!-- <h1 class="logo">CROSS</h1> -->
						<img src="/images/cross.jpg">
						<!-- <h5 class="slogo">생각과 의견을 교차</h5> -->
					
					<form action="login" method="post" name="loginFrm" id="loginFrm">
						<div class="container" style="margin-bottom: 60px;">
							<input type="text" placeholder="ID" id="id" name="id" class="account">
							<input type="password" placeholder="Password" id="pw" name="pw" class="account">
							<div class="group">
								<input id="check" type="checkbox" class="check">
								<label for="check"><span class="icon"></span> 아이디 저장</label>
							</div>
							<button id="login" type="button" style="cursor: pointer" class="account">로그인</button>


							<div class="wrap2">
								<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=fe714f17477232187f3fb8741b56d8bd&redirect_uri=http://localhost:8000/kakao/oauth"
									src="/images/kakao.png"><button type="button" class="kakaobutton">
									</button></a>
								<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=7g_j2G60OUulN4ds5aL_&state=STATE_STRING&redirect_uri=http://localhost:8000/naver/oauth01" data-wpel-link="external" target="_blank"
									rel="nofollow external noopener noreferrer" src="/images/naver.jpg"><button type="button"
										class="naverbutton">
									</button></a>
							</div>
							


                           
							<div class="wrap1">
								<label for="check"><span class="icon"></span> <strong>아이디 또는 비밀번호 찾기</strong></label>
								<br>
								<div class="idpw">
									<button id="Fid" type="button" name="Fid" class="Fid" style="cursor: pointer;"><span>아이디</span></button>
									<button id="Fpw" type="button" name="Fpw" class="Fpw" style="cursor: pointer;"><span>비밀번호</span></button>
								</div>
								<br>
								<label for="check" class="joinicon"><span class="icon"></span><strong> 회원가입</strong></label>
								<br><br>
								<button id="join" type="button" name="join" class="join" style="cursor: pointer;">회원가입</button>
							</div>
						</form>
						
							<!-- <div class="divuse">
								<button id="use" name="use" class="use" style="cursor: pointer;">이용약관</button>
							</div> -->
						</div>
					</div>
				</div>
				
				<script>
				
				
					$(function(){
						
						$("#login").click(function(){
							
							if($("#id").val().length<1){
								alert("아이디를 입력하세요.");
								$(".account").focus();
								return false;
							}
							
							let user_id = $("#id").val();
							let password = $("#pw").val();
							
							$.ajax({
								url:"/login/ajaxLogin",
								type:"post",
								data:{"user_id":user_id,"password":password},
								dataType:"text",
								success:function(data){
									if(data == "1"){
										alert("로그인 되었습니다.");
										location.href="/";
									}else{
										alert("아이디 또는 패스워드가 일치하지 않습니다.");
										$("#id").val("");
										$("#id").focus();
										$("#pw").val("");
									}
								},
								error:function(){
									alert("실패");
								}
							});//ajax
							
								
							
						});
						
						 $("#Fid").click(function(){
								location.href="/login/findId";
							
						});
						
						$("#Fpw").click(function(){
								
								location.href="/login/findPw";
							
						});
						
						$("#join").click(function(){
								
								location.href="/login/useAgree";
							
						});  
						
					});
				</script>

				

				<!-- <div class="food">
					<h3>Cross 새로운 소통의 시작</h3>
					<b>조원정보: 박기석팀장,배향연부팀장,소현우,홍여경,김지원,류진민</b>
				</div> -->
			</body>
			<br>


			</html>