/**
 * 
 */
$(function () {
					let emailChk = 0;
					let checkid = "";
					$("#idCheck").click(function () {
						var user_id=$('#userid').val();
						
						
			//id check 확인 코드
						$.ajax({
							url:'/login/idCheck',
							type:'post',
							data:{"user_id":user_id},
							datatype:'json',
							success:function(data){
								console.log(data);
								if(data=='사용가능'){
								$(".idCheck1").css('color','blue');
								$(".idCheck1").html("사용할 수 있는 아이디입니다.");
								checkid = user_id ;
								
								}else{
								$(".idCheck1").css('color','red');
								$(".idCheck1").html("사용할 수 없는 아이디입니다.");
								}
								 chkKeyUp=1;
							},
							error:function(){
							}
						
						});//ajax
						 
						 });//click
						
			//비밀번호 일치 확인코드
					 $("#password2").keyup(function(){
						 var password1 = $("#password1").val();
						 var password2 = $("#password2").val();
						 if(password1 == password2){
							 $(".password3").css("color","blue");
							 $(".password3").text("비밀번호가 일치합니다.");
						 }else{
							 $(".password3").css("color","red");
							 $(".password3").text("비밀번호가 불일치 합니다 확인해주세요.");
							 
						 };
					 });
				
					 $("#password1").keyup(function(){
						 var password1 = $("#password1").val();
						 var password2 = $("#password2").val();
						 if(password1 == password2){
							 $(".password3").css("color","blue");
							 $(".password3").text("비밀번호가 일치합니다.");
						 }else{
							 $(".password3").css("color","red");
							 $(".password3").text("비밀번호가 불일치 합니다 확인해주세요.");
							 
						 };
					 });
					
				//이메일 코드 발송 
					 $(".emailCheck").click(function(){
						 var email = $("#email").val(); 
						 var email1= $("#email1").val();
						 $.ajax({
							 url:"email",
							 type:"post",
							 data:{"email":email,"email1":email1},
							 dataType:"text",
							 success: function(data){
							 alert("이메일로 코드발송 되었습니다.");
						     $(".code3").css("visibility","visible");
							 console.log(data); 
							 },
							 error:function(){
								 alert("실패");
							 }
						 })
						 
					 })//emailCheck
					 
					 $("#emailCheck1").click(function(){
						 alert("인증번호를 확인합니다.")
						 let check = $("#email3").val();
						 
						 $.ajax({
							 url:"emailCheck",
							type:"post",
							data:{"check":check},
							dataType:"text",
							success:function(data){
								console.log(data);
							if(data=='success'){
								alert("인증이 완료되었습니다.");
								emailChk = 1;
							}else{
								alert("일증번호가 일치하지 않습니다. 다시 인증을 받으세요.");
							}
							console.log(data);
							},
							error:function(){
								alert("실패");
							}
						 })
					 })
					
				

						  
				 		 
				 		 let chkKeyUp=0;
				 		 //가입하기 버튼 클릭
				 		 $("#join").click(function(){
				 			 
				 			 //정규식표현
				 			 let idpattern = /^[a-zA-Z]{1}[a-zA-Z0-9]{3,15}$/;
				 			 let pwpattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@$%^&().,]).{5,11}$/;
				 			 let namepattern = /^[ㄱ-ㅎ가-힣]{1,}$/;
				 			 let nicknamepattern = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{0,4}$/;
				 			 
				 			 let userid = $("#userid").val();
				 			 let username = $("#username").val();
				 			 let password1 = $("#password1").val();
				 			 let email = $("#email").val();
				 			 let email1 = $("#email1").val();
				 			 let emailAll = email+"@"+email1 ;
				 			 
				 			 if(!namepattern.test(username)){
				 				 alert("이름을 입력해주세요. 이름은 한글만 가능합니다.");
				 				 return false;
				 			 }
				 			 if(!idpattern.test(userid)){
				 				 alert("아이디는 4~15자리 영문, 숫자만 사용이 가능합니다.");
				 				 return false;
				 			 }
				 			if(chkKeyUp!=1){
								 alert("아이디 중복체크를 하셔야 다음으로 진행이 가능합니다.");
								 return false;
				 			}
				 			 
				 			 if(!pwpattern.test(password1)){
				 				 alert("비밀번호는 영문,숫자,특수문자 1개 이상 입력하셔야 합니다.(5자리 이상 ~ 11자리 이하)");
				 				 return false;
				 			 }
				 			 
				 			 if($("#password2").val().length<1){
				 					 alert("비밀번호 일치 확인하셔야 합니다.");
				 					 $("#password2").focus();
				 					 return false;
				 			}
				 			
				 			
				 			 if($("#email").val().length<1){
				 					 alert("이메일을 입력하셔야 합니다.");
				 					 $("#email").focus();
				 					 return false;
				 			}
				 			
				 			 if(emailChk==0){
				 				 alert("이메일 인증을 해주세요")
				 				 return false;
				 			 }
				 			 
				 			 if(checkid!=userid){
				 				 alert("아이디를 다시 확인해 주세요.");
				 				 return false;
				 			 }
				 			 $.ajax({
				 				url:"joinCheck",
				 				type:"post",
				 				data:{"userid":userid,"username":username,"password1":password1,"emailAll":emailAll},
				 				dataType:"text",
				 				success:function(data){
				 					alert("회원가입이 완료되었습니다.")
				 					console.log(data);
				 					location.href="/login/login";
				 				},
				 				error:function(){
				 					alert("실패");
				 				}
				 			 
				 			 
				 			 
				 			 })
				 		 });//join
						 		 
					
				});//쿼리