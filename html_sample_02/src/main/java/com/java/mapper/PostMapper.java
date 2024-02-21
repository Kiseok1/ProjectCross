package com.java.mapper;


import java.util.List;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;
import com.java.dto.PostMediaUserDto;
import com.java.dto.RenoteDto;

@Mapper
public interface PostMapper {

	//정환(기석)작업
	//작성글 가져오기
	ArrayList<PostMediaUserDto> selectDefault(String id); //구작업
	ArrayList<PostDto> getMypost(String id); //신작업
	
	//답글 가져오기
	ArrayList<PostDto> getMyreply(String id);
	
	//post 좋아요 카운트Up
	void likeUp(String post_id);
	//post 좋아요 카운트Down
	void likeDown(String post_id);
	
	//미디어 불러오기
	ArrayList<PostMediaUserDto> selectMedia(String id);
		
	//좋아요한 글 불러오기
	ArrayList<PostMediaUserDto> selectLikePost(String id);
	ArrayList<PostDto> getMylike(String id);
	
	//아이디 변경
	void accountUpdate1(String user_id, String org_id);
	
	//게시글 검색(미디어)
	List<PostDto> selectkeyword_media(String keyword);
	
	//북마크된 게시글 가져오기
	ArrayList<PostDto> getMyBookmark(String id);
	//북마크된 게시글인지 체크
	Integer myBookmarkCheck(String user_id, int post_id);
	
	//알람 대상 아이디 검색
	PostDto getTargetId(PostDto postDto); //답글
	String getLikeTargetId(String post_id); //좋아요
	//-----------------------------------------------------
	
	//향연 작업
	//포스트 등록
	int sendPost(PostDto postDto);

	//사용자 포스트 타임라인 불러오기

	ArrayList<PostDto> getMyTimeline(String id, int pageCounter);


	//특정포스트(post_id) 타임라인 불러오기
	ArrayList<PostDto> getSelected(int post_id);

	//답글 포스트 등록
	int sendModalPost(PostDto postDto);

	//특정포스트 최대step 불러오기
	PostDto getMaxStep(int post_id);
	
	//포스트 답글 등록시 기존포스트 step1 증가
	int upStep(PostDto postDto);
	
	//특정 포스트 삭제
	int deleteOne(int post_id);
	
	//리트윗 수 가져오기
	int getRenoteCounter(int post_id);

	//특정포스트 리트윗 정보 불러오기
	RenoteDto getRenote(int post_id);

	//사용자가 특정포스트(post_id)에 리트윗 했는지 여부
	int myRenoteCounter(String user_id, int post_id);

	//좋아요 수 가져오기
	int getFavorCounter(int post_id);

	//사용자가 특정포스트(post_id)에 좋아요 했는지 여부
	int myFavorCounter(String user_id, int post_id);

	//특정포스트 정보 불러오기(view0,view6,...)
	PostDto getSeletedHit(int post_id);

	//답글 수 가져오기
	int getReplyCounter(int post_id);

	//노출수 1 증가
	void updateHit(int post_id);

	void repeatOn(int post_id);

	void repeatOff(int post_id);

	void favoriteOn(int post_id);

	void favoriteOff(int post_id);
	

	int getPostRenote(int post_id);

	int getPostFavor(int post_id);

	int addRenote(int post_id, String user_id);
	int delRenote(int post_id, String user_id);
	int addLike(int post_id, String user_id);
	int delLike(int post_id, String user_id);
	
	int hitViewhit0(int post_id);
	int hitViewhit6(int post_id);
	int hitViewhit12(int post_id);
	int hitViewhit18(int post_id);
	
	//-----------------------------------------------------------------------

	//현우,진민 작업
	//인기순 게시글 정렬
	List<PostDto> selectLike();
	//최신순으로 게시글 정렬
	List<PostDto> selectnewest();
	//유저전부 가져오기
	List<Cross_userDto> selectAlluser();
	//게시글 검색(최신)
	List<PostDto> selectKeyWord(String keyword);
	//게시글 검색(인기)
	List<PostDto> selectKeyWord_Like(String keyword);
	//유저 검색
	List<Cross_userDto> selectKeyWord_user(String keyword);
	//좋아요 증가
	void likeUp(int post_id);
	PostDto getSelectedOne(int post_id);

}


