<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/css/findId.css">
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
				
				
	</head>
	

	
		<body>
		<div class="logo">
		
		<a href="login" style="cursor: pointer; color: #50b7f5; text-decoration: none;"><img src="/images/cross.jpg" style="padding-top: 50px;"></a>
		
			<div class="mypage_main" >
		               <div class="find">
		               <ul class="mypage_password"><strong>비밀번호 찾기</strong>
		               	<!-- <div> -->
					<div>
					<input type="email" id="email1" name="email1" class="inp2" placeholder="이메일을 입력하세요">
					<span>@</span> 
					<select type="text" id="email2" name="email2" class="inp_2_1" list="emailList" placeholder="도메인 선택" style="font-size: 0.6em;color: gray;">
                    	<option selected >메일선택</option>
                    	<option>naver.com</option>
                    	<option>google.co.kr</option>
                    	<option>nate.com</option>
                    	<option>daum.com</option>
                    </select>
                    <br><br>
					<button id="emailCheck" class="emailCheck">코드발송</button>
					</div>
					
					<br>
					
					<div class="code" style="visibility: hidden; display: inline-block;">
					<input type="text" id="emailpwcode" name="emailpwcode" class="inp2" placeholder="인증번호를 입력하세요">
					<button id="emailChk2" class="emailChk2">확인</button>
					<br>
					
					</div>
					
					<br>
					
					<div class="code1" style="visibility: hidden; display: inline-block;">
		               	<li>새 비밀번호</li>
		               	<input type="password" id="Pw1" class="new_pw">
		               	<li>비밀번호 확인</li>
		               	<input type="password" id="Pw2" class="chk_pw">
		               	<div class="pwChkTxt"></div>
                      
		               <!-- </ul> -->
		               
		               <br><br>
		               <div class="savebtn">저장</div>
		               </div>
		               </div>
		               </div>
		               
		               </div>
		              
		               
		     </div>
		     	
		     	<!-- <div class="foot" style="margin-top: 100px;">
						<h3>●새로운 소통의 시작</h3>
						<b>조원정보: 박기석팀장,배향연부팀장,소현우,홍여경,김지원,류진민</b>
				</div> -->
				
				<script>
				 $(function(){
					 let check = 0; 
					
					$(".emailCheck").click(function(){
						if($("#email1").val().length<1){
							alert("이메일을 입력하세요.");
							$(".inp2").focus();
							return false;
						}
						$(".code").css("visibility","visible");
						alert("인증번호를 발송합니다.");
						
						let email1 = $("#email1").val();
						let email2 = $("#email2").val();
						let email = email1+"@"+email2;
						
						
						$.ajax({
							url:"/login/EmailPw",
							type:"post",
							data:{"email":email},
							dataType:"text",
							success:function(data){
								alert("인증번호가 발송되었습니다.");
								console.log(data);
							},
							error:function(){
								alert("실패");
							}
						});//ajax
						
					});
					
					$(".emailChk2").click(function(){
						alert("인증번호를 확인합니다.");
						let emailpwcode = $("#emailpwcode").val();
						alert(emailpwcode);
						
						$.ajax({
							url:"/login/emailPwfind",
							type:"post",
							data:{"emailpwcode":emailpwcode},
							dataType:"text",
							success:function(data){
								if(data=='success'){
									alert("인증번호가 확인되었습니다.");
									$(".code1").css("visibility","visible");
									check=1;
								}else{
									alert("인증번호가 일치하지 않습니다. 다시 입력해주세요.")
									$("#emailpwcode").focus();
								}
								console.log(data);
							},
							error:function(){
								alert("실패");
							}
							
						});//ajax
						
						
					});
					
					$(".savebtn").click(function(){
						let Spw = $("#Pw1").val();
						let email1 = $("#email1").val();
						let email2 = $("#email2").val();
						let email = email1+"@"+email2;
						if(check==1){
							$.ajax({
								url:"/login/savePW",
								data:{"pw":Spw,"email":email},
								type:"post",
								dataType:"text",
								success:function(data){
									alert("저장되었습니다.");
									location.href="login";
								},
								error:function(){
									alert("실패");
								}
								
							}); //ajax
						}
						
						
					}); 
					
					/* 새비밀번호 일치 확인용 변수 */
		    		let chk = false;
		    		
		    		/* 새비밀번호 일치 확인 */
		    		$(".new_pw").keyup(function(){
		    			let new_pw = $(".new_pw").val();
		    			let chk_pw = $(".chk_pw").val();
		    			
		    			if(new_pw==chk_pw){
		    				$(".pwChkTxt").text("비밀번호가 일치합니다.");
		    				$(".pwChkTxt").css("color","blue");
		    				/* $(".pwChkTxt").css("margin-left","340px"); */
		    				chk = true;
		    			} else{
		    				$(".pwChkTxt").text("비밀번호가 일치하지 않습니다.");
		    				$(".pwChkTxt").css("color","red");
		    				/* $(".pwChkTxt").css("margin-left","290px"); */
		    				chk = false;
		    			}
		    			
		    		})
		    		
		    		$(".chk_pw").keyup(function(){
		    			let new_pw = $(".new_pw").val();
		    			let chk_pw = $(".chk_pw").val();
		    			
		    			if(new_pw==chk_pw){
		    				$(".pwChkTxt").text("비밀번호가 일치합니다.");
		    				$(".pwChkTxt").css("color","blue");
		    				/* $(".pwChkTxt").css("margin-left","340px"); */
		    				chk = true;
		    			} else{
		    				$(".pwChkTxt").text("비밀번호가 일치하지 않습니다.");
		    				$(".pwChkTxt").css("color","red");
		    				/* $(".pwChkTxt").css("margin-left","290px"); */
		    				chk = false;
		    			}
		    			
		    		})
					
				 });
				 
				 
				</script>
		</div>
	
		</body>
</html>