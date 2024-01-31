/**
 * 
 */

 $(function(){
	 
	 $(".side_home").on("click",function(){
		 location.href="/";
	 })
	 
	 $(".side_profile").on("click",function(){
		 location.href="/profile/content";
	 })
	 
	 $(".side_bookmark").on("click",function(){
		 location.href="/bookmark/bookmark";
	 })
	 
	 $(".side_message").on("click",function(){
		 location.href="/message/index";
	 })
	 
	 $(".side_notice").on("click",function(){
		 location.href="/alram/alram";
	 })
	 
	 $(".side_search").on("click",function(){
		 location.href="/search/search_in";
	 })
	 
	 $(".side_logout").on("click",function(){
		 location.href="/login/login";
	 })
	 

	 
 })