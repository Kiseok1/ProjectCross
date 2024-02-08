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
		               <ul class="mypage_password"><strong>아이디 찾기</strong>
		               	<div class="findid_content">
					<div>
					<input type="email" id="email1" name="email1" class="inp2" placeholder="이메일을 입력하세요">
					<span>@</span> 
					<select type="text" id="email2" name="email2" class="inp_2_1" list="emailList" placeholder="도메인 선택" style="font-size: 0.6em;color: gray;">
                    	<option selected >메일선택</option>
                    	<option>naver.com</option>
                    	<option>gmail.com</option>
                    	<option>nate.com</option>
                    	<option>daum.com</option>
                    </select>
                    <br><br>
					<button id="emailCheck" type="button" class="emailCheck">코드발송</button>
					</div>
					<br><br>
					<div class="code" style="visibility: hidden; display: inline-block;">
					<input type="text" id="Idcodechk" name="Idcodechk" class="inp2" placeholder="인증번호를 입력하세요">
					<button id="emailChk2" type="button" class="emailChk2">확인</button>
					<br>
					<!-- 인증번호가 일치합니다. -->
					</div>
					<br><br>
					
					<div class="code2" style=" visibility: hidden; display: inline-block;">
					<input type="text" id="idFind" name="idFind" class="inp2" disabled>
					<button id="Remain" type="button" class="Remain">로그인화면으로이동</button>
					</div>
					</div>
					
		               </ul>
		               
		               <br>
		               
		               </div>
		     </div>
		     <br><br>
		     	
				
				<script>
				 $(function(){
					 let email = "";
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
							url:"/login/EmailId",
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
						let Idcodechk = $("#Idcodechk").val();
						alert(Idcodechk);
						
						let email1 = $("#email1").val();
						let email2 = $("#email2").val();
						let email = email1+"@"+email2;
						
						$.ajax({
							url:"/login/Emailidchk",
							type:"post",
							data:{"Idcodechk":Idcodechk,"email":email},
							dataType:"text",
							success:function(data){
								if(data=='fail'){
									alert("인증번호가 일치하지 않습니다. 다시 입력해주세요.")
									$("#Idcodechk").focus();
									
								}else{									
									alert("인증번호가 확인되었습니다.");
									$(".code2").css("visibility","visible");
									$("#idFind").val(data);
								}
								console.log(data);
							},
							error:function(){
								alert("실패");
							}
							
						});//ajax
						
						
						
						
						
					}); 
					
					
					
					$(".Remain").click(function(){
						location.href="/login/login";
					}); 
					
					
				 });
				</script>
		</div>
	
		</body>
</html>