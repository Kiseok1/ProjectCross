/**
 * 
 */
$(function() {
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

	// 확인 버튼 클릭 시 모든 쪽지 삭제
	$('#Allsend_btn').click(function() {
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
	    $('#exampleModal3').modal('hide');
	});

	
	//exampleModal3이 사라지면
	$('#exampleModal3').on('hidden.bs.modal', function (e) {
    $('.check').css('color', ''); // 색상 스타일 초기화
    $('.check').css('display', ''); // display 속성 초기화
	});
	
	
	//모두삭제 모달창
	$("#deleteBtn2").click(function(){
		 // .check 요소의 CSS를 red로 변경
        $('.check').css('color', 'red');
        $('.check').css('display', 'block');
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
	
	/* 이동경로 */
	$("#home-tab").click(function(){
		location.href = "/message/index";
	});//nav home-tab clik
	
	$("#profile-tab").click(function(){
		location.href = "/message/head";
	});//nav profile-tab clik
	
	$("#contact-tab").click(function(){
		location.href = "/message/head2";
	});//nav contact-tab clik
	/* 이동경로 */
	
	 //search에 값없을때 .main 보이기
    $(document).click(function(e) {
         if (!$(e.target).is('input[type="search"]')) {
             $('.main').show();
         }
     }); 
      
});//jquery