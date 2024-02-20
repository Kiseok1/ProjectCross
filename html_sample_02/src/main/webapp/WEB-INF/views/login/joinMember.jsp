<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="/css/joinMember.css">
			<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="../js/cross/joinMember.js"></script>
		</head>

		<body>
		<div>
		
			<div class="logo">
				<div>
					<!-- <h1 id="Puzzle" class="logo1">Cross</h1>
					<h5 class="slogo">생각과 의견을 교차</h5> -->
					<a href="login" style="cursor: pointer; text-decoration: none;"><img src="/images/cross.jpg"></a>
				</div>
				<div class="inputB">
				<div class="input">
					<label for="username">이름:</label>
					<input type="text" id="username" name="username" class="inp" placeholder="이름을 입력하세요"
						style="text">

					<div class="divid">
						<label for="username">아이디:</label>
						<div class="divid2">
						<input type="text" id="userid" name="userid" class="inp1" placeholder="아이디를 입력하세요"style="text">
						<button id="idCheck" class="idCheck" style="cursor: pointer;">중복확인</button>
						</div>
						<div class="idCheck1"></div>
					</div>
					
					<div>
					<label for="password">비밀번호:</label>
					<input type="password" id="password1" name="password" class="inp" placeholder="비밀번호 입력하세요">
					</div>
					
					<div>
					<label for="confirmPassword">비밀번호 확인:</label>
					<input type="password" id="password2" name="confirmPassword" class="inp"placeholder="비밀번호를 다시 입력하세요">
					<div class="password3" ></div>
					</div>
					
					<div>
					<label for="email">이메일:</label>
					<div>
					<input type="email" id="email" name="email" class="inp2" placeholder="이메일을 입력하세요">
					<span>@</span> 
					<select type="text" id="email1" name="email1" class="inp_2_1" list="emailList" placeholder="도메인 선택" style="font-size: 0.6em;color: gray;">
                    	<option selected >메일선택</option>
                    	<option>naver.com</option>
                    	<option>gmail.com</option>
                    	<option>nate.com</option>
                    	<option>daum.com</option>
                    </select>
                    <br>
					<button id="emailCheck" class="emailCheck" style="cursor: pointer;">인증번호발송</button>
					</div>
				<div>
					<br>
					<div class="code3" style="visibility: hidden; display: inline-block;">
					<input type="email" id="email3" name="email3" class="emailinp2"placeholder="인증코드 입력해 주세요">
					<button id="emailCheck1" class="emailCheck1" style="cursor: pointer;">인증확인</button>
					</div>
					</div>
					
				
				</div>
					<div class="joinBtn">
						<button id="join" name="join"  class="join" style="cursor: pointer;">가입완료</button>
					</div>
					
				</div>
			</div>
			
			
					<!-- <div class="foot">
						<h3>Cross 새로운 소통의 시작</h3>
						<b>조원정보: 박기석팀장,배향연부팀장,소현우,홍여경,김지원,류진민</b>
						
					</div> -->
		</div>
			<script>
				

			</script>
		</body>

	</html>