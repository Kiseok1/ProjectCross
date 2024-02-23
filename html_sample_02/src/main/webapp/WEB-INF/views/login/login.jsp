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
				<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
				<script type="text/javascript" src="/_js/custom/cookies.js"></script>
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
							
								
							
						});// login
						
						 $("#Fid").click(function(){
								location.href="/login/findId";
							
						});
						
						$("#Fpw").click(function(){
								
								location.href="/login/findPw";
							
						});
						
						$("#join").click(function(){
								
								location.href="/login/useAgree";
							
						}); 
						
						
						// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
					    var key = getCookie("key");
					    $("#id").val(key); 
					     
					    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
					    if($("#id").val() != ""){ 
					        $("#check").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
					    }
					     
					    $("#check").change(function(){ // 체크박스에 변화가 있다면,
					        if($("#check").is(":checked")){ // ID 저장하기 체크했을 때,
					            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
					        }else{ // ID 저장하기 체크 해제 시,
					            deleteCookie("key");
					        }
					    });
					     
					    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
					    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
					        if($("#check").is(":checked")){ // ID 저장하기를 체크한 상태라면,
					            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
					        }
					    });

					// 쿠키 저장하기 
					// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
					function setCookie(cookieName, value, exdays) {
						var exdate = new Date();
						exdate.setDate(exdate.getDate() + exdays);
						var cookieValue = escape(value)
								+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
						document.cookie = cookieName + "=" + cookieValue;
					}

					// 쿠키 삭제
					function deleteCookie(cookieName) {
						var expireDate = new Date();
						expireDate.setDate(expireDate.getDate() - 1);
						document.cookie = cookieName + "= " + "; expires="
								+ expireDate.toGMTString();
					}
				     
					// 쿠키 가져오기
					function getCookie(cookieName) {
						cookieName = cookieName + '=';
						var cookieData = document.cookie;
						var start = cookieData.indexOf(cookieName);
						var cookieValue = '';
						if (start != -1) { // 쿠키가 존재하면
							start += cookieName.length;
							var end = cookieData.indexOf(';', start);
							if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
								end = cookieData.length;
				                console.log("end위치  : " + end);
							cookieValue = cookieData.substring(start, end);
						}
						return unescape(cookieValue);
					}
						
					});
					    
					    
				</script>
				
			</body>
			<br>

			</html>