
package com.java.service;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.MediaDto;
import com.java.dto.PostDto;
import com.java.dto.User_followDto;
import com.java.mapper.Cross_userMapper;
import com.java.mapper.MediaMapper;
import com.java.mapper.PostMapper;
import com.java.mapper.User_followMapper;

import jakarta.servlet.http.HttpSession;

@Service
public  class PostServiceImpl implements PostService {

	@Autowired
	PostMapper postMapper;
	@Autowired
	Cross_userMapper cUserMapper;
	@Autowired
	MediaMapper mediaMapper;
	@Autowired
	User_followMapper user_followMapper;
	
	@Autowired HttpSession session;
	
	//포스트 등록
	@Override
	public int sendPost(PostDto postDto) {
		
		int result = postMapper.sendPost(postDto);
		
		return result;
	}

	//홈화면
	@Override
	public Map<String, Object> getMyTimeline(String id) {
		
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
				
		//사용자 타임라인 불러오기
		ArrayList<PostDto> plist = postMapper.getMyTimeline(id);

		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			//plist 활용 
			ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id())); //포스트에 표시할 유저정보
			mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id())); //포스트에 표시할 미디어 
			recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id())); //리트윗 수 가져오기
			renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id())); //사용자가 특정포스트(post_id)에 리트윗 했는지 여부
			facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id())); //좋아요 수 가져오기
			favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id())); //사용자가 특정포스트(post_id)에 좋아요 했는지 여부
			replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id())); //답글 수 가져오기
			postMapper.updateHit(plist.get(i).getPost_id()); //노출수 1증가
		}
		
		map.put("plist", plist);
		map.put("ulist", ulist);
		map.put("mlist", mlist);
		map.put("recount", recount);
		map.put("renoted", renoted);
		map.put("facount", facount);
		map.put("favorited", favorited);
		map.put("replycount", replycount);
		
		return map;
	}

	//포스트 클릭 view이동
	@Override
	public Map<String, Object> getSelected(int post_id) {
		
		Map<String, Object> map = new HashMap<>();
		
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
		
		ArrayList<Integer> bookmarked = new ArrayList<>();
				
		//특정포스트 타임라인 불러오기
		ArrayList<PostDto> plist = postMapper.getSelected(post_id);
		

		if(plist.size() >0)
		{
			
			for(int i = 0 ; i < plist.size() ; i++)
			{
				ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id()));
				mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id()));
				recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id()));
				renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id()));
				favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id()));
				bookmarked.add(postMapper.myBookmarkCheck(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				
			}
			
			map.put("plist", plist);
			map.put("ulist", ulist);
			map.put("mlist", mlist);
			map.put("recount", recount);
			map.put("renoted", renoted);
			map.put("facount", facount);
			map.put("favorited", favorited);
			map.put("replycount", replycount);
			map.put("bookmarked", bookmarked);
		}

		return map;
	}

	//포스트 답글 등록
	@Override
	public int sendModalPost(PostDto postDto) {
		
		//포스트 답글 등록시 기존포스트 step1 증가
		postMapper.upStep(postDto);
		//포스트 답글 등록
		int result = postMapper.sendModalPost(postDto);
		return result;
	}

	//특정 포스트 삭제
	@Override
	public void deleteOne(int post_id) {

		int result = postMapper.deleteOne(post_id);
	}

	//특정포스트 정보 불러오기(view0,view6,...)
	@Override
	public PostDto getSeletedHit(int post_id) {
		
		PostDto pdto = postMapper.getSeletedHit(post_id);
		
		return  pdto;
	}

	@Override
	public void repeatOn(int post_id) {
		postMapper.repeatOn(post_id);
		
	}

	@Override
	public void repeatOff(int post_id) {
		// TODO Auto-generated method stub
		postMapper.repeatOff(post_id);
		
	}

	@Override
	public void favoriteOn(int post_id) {
		// TODO Auto-generated method stub
		postMapper.favoriteOn(post_id);
		
	}

	@Override
	public void favoriteOff(int post_id) {
		// TODO Auto-generated method stub
		postMapper.favoriteOff(post_id);
		
	}

	//인기순으로 게시글 정렬
	@Override
	public List<PostDto> selectLike() {
		List<PostDto> list = postMapper.selectLike();
		return list;
	}
	
	@Override
	public Map<String, Object> selectLike2() {
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
		
		List<PostDto> plist = postMapper.selectLike();
		
		if(plist.size() >0)
		{
			
			for(int i = 0 ; i < plist.size() ; i++)
			{
				ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id()));
				mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id()));
				recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id()));
				renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id()));
				favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id()));
			}
			
			map.put("plist", plist);
			map.put("ulist", ulist);
			map.put("mlist", mlist);
			map.put("recount", recount);
			map.put("renoted", renoted);
			map.put("facount", facount);
			map.put("favorited", favorited);
			map.put("replycount", replycount);
		}
		
		
		return map;
	}
	
	//최신순으로 게시글 정렬
	@Override
	public List<PostDto> selectnewest() {
		List<PostDto> list = postMapper.selectnewest();
		return list;
	}
	
	@Override
	public Map<String, Object> selectnewest2() {
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
		
		List<PostDto> plist = postMapper.selectnewest();
		if(plist.size() >0)
		{
			
			for(int i = 0 ; i < plist.size() ; i++)
			{
				ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id()));
				mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id()));
				recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id()));
				renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id()));
				favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id()));
			}
			
			map.put("plist", plist);
			map.put("ulist", ulist);
			map.put("mlist", mlist);
			map.put("recount", recount);
			map.put("renoted", renoted);
			map.put("facount", facount);
			map.put("favorited", favorited);
			map.put("replycount", replycount);
		}
		
		return map;
	}
	
	
	//유저 전부 가져오기
	@Override
	public Map<String, Object> selectAlluser() {
		List<Cross_userDto> list = postMapper.selectAlluser();
		ArrayList<User_followDto> myfollowList = user_followMapper.selectFollow(session.getAttribute("session_id").toString()); //내 팔로우정보 비교용
		ArrayList<Cross_userDto> following = new ArrayList<>();
		ArrayList<Cross_userDto> follower = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		for(int i=0;i<list.size();i++) {
			int chk1 = 0;
			int chk2 = 0;
			for(int j=0;j<myfollowList.size();j++) {
				if(list.get(i).getUser_id().equals(myfollowList.get(j).getTarget_id()) && chk1==0) {
					following.add(cUserMapper.selectOne( myfollowList.get(j).getTarget_id() ));
					chk1=1;
				} else if(chk2==0 && chk1==0) {
					follower.add(cUserMapper.selectOne( list.get(i).getUser_id() ));
					chk2=1;
				}
			}
		}
		
		for(int i=0;i<following.size();i++) {
			int delNo = -1;
			for(int j=0;j<follower.size();j++) {
				if(follower.get(j).getUser_id().equals(following.get(i).getUser_id())) {
					delNo=j;
				}
			} 
			if(delNo != -1) {
				follower.remove(delNo);
			}
		}
		
		map.put("follower", follower);
		map.put("following", following);
		
		return map;
	}
	//게시글 검색(최신)
	@Override
	public List<PostDto> selectKeyWord(String keyword) {
		List<PostDto> list = postMapper.selectKeyWord(keyword);
		return list;
	}
	
	@Override
	public Map<String, Object> selectKeyWord2(String keyword) {
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
		
		List<PostDto> plist = postMapper.selectKeyWord(keyword);
		if(plist.size() >0)
		{
			
			for(int i = 0 ; i < plist.size() ; i++)
			{
				ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id()));
				mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id()));
				recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id()));
				renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id()));
				favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id()));
			}
			
			map.put("plist", plist);
			map.put("ulist", ulist);
			map.put("mlist", mlist);
			map.put("recount", recount);
			map.put("renoted", renoted);
			map.put("facount", facount);
			map.put("favorited", favorited);
			map.put("replycount", replycount);
		}
		
		return map;
	}
	
	
	//게시글 검색(인기)
	@Override
	public List<PostDto> selectKeyWord_Like(String keyword) {
		List<PostDto> list = postMapper.selectKeyWord_Like(keyword);
		return list;
	}		
	
	@Override
	public Map<String, Object> selectKeyWord_Like2(String keyword) {
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
		
		List<PostDto> plist = postMapper.selectKeyWord_Like(keyword);
		
		if(plist.size() >0)
		{
			
			for(int i = 0 ; i < plist.size() ; i++)
			{
				ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id()));
				mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id()));
				recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id()));
				renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id()));
				favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id()));
			}
			
			map.put("plist", plist);
			map.put("ulist", ulist);
			map.put("mlist", mlist);
			map.put("recount", recount);
			map.put("renoted", renoted);
			map.put("facount", facount);
			map.put("favorited", favorited);
			map.put("replycount", replycount);
		}
		
		return map;
	}
	
	
	//유저 검색
	@Override
	public Map<String, Object> selectKeyWord_user(String keyword) {
		List<Cross_userDto> list = postMapper.selectKeyWord_user(keyword);
		
		ArrayList<User_followDto> myfollowList = user_followMapper.selectFollow(session.getAttribute("session_id").toString()); //내 팔로우정보 비교용
		ArrayList<Cross_userDto> following = new ArrayList<>();
		ArrayList<Cross_userDto> follower = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		for(int i=0;i<list.size();i++) {
			int chk1 = 0;
			int chk2 = 0;
			for(int j=0;j<myfollowList.size();j++) {
				if(list.get(i).getUser_id().equals(myfollowList.get(j).getTarget_id()) && chk1==0) {
					following.add(cUserMapper.selectOne( myfollowList.get(j).getTarget_id() ));
					chk1=1;
				} else if(chk2==0 && chk1==0) {
					follower.add(cUserMapper.selectOne( list.get(i).getUser_id() ));
					chk2=1;
				}
			}
		}
		
		for(int i=0;i<following.size();i++) {
			int delNo = -1;
			for(int j=0;j<follower.size();j++) {
				if(follower.get(j).getUser_id().equals(following.get(i).getUser_id())) {
					delNo=j;
				}
			} 
			if(delNo != -1) {
				follower.remove(delNo);
			}
		}
		map.put("follower", follower);
		map.put("following", following);
		
		return map;
	}
	//좋아요 증가
	@Override
	public void likeUp(int post_id) {
		postMapper.likeUp(post_id);
		
	}

	//미디어 검색(기본)
	@Override
	public Map<String, Object> selectMedia() {
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<String> flist = new ArrayList<>();
		ArrayList ilist = new ArrayList<>();
		
		
		//내가 작성한 포스트 가져오기
		
		List<PostDto> plist = postMapper.selectnewest();
		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			//plist 활용 
			ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id())); //포스트에 표시할 유저정보
			mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id())); //포스트에 표시할 미디어 
			
		}
		
		for(int i=0;i<mlist.size();i++) {
			if(mlist.get(i)!=null) {
				System.out.println("fff : "+mlist.get(i).getFile_name());
				String[] file = mlist.get(i).getFile_name().split(",");
				//System.out.println(file[0]);
				for(int j=0;j<file.length;j++) {
					flist.add(file[j]);
					ilist.add(mlist.get(i).getPost_id());
					System.out.println("file["+j+"] : "+file[j]);
					System.out.println("post_id["+j+"] : "+ilist.get(j).toString());
				}
			}
		}
		
		for(int i=0;i<flist.size();i++) {
			System.out.println(i+" : "+flist.get(i));
			System.out.println(i+" : "+ilist.get(i));
		}
		
		map.put("plist", plist);
		map.put("ulist", ulist);
		map.put("mlist", mlist);
		map.put("flist", flist);
		map.put("ilist", ilist);
		
		return map;
	}
	//미디어 검색(키워드)
	@Override
	public Map<String, Object> selectKeyWordMedia(String keyword) {
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<String> flist = new ArrayList<>();
		ArrayList ilist = new ArrayList<>();
		
		
		//내가 작성한 포스트 가져오기
		
		List<PostDto> plist = postMapper.selectkeyword_media(keyword);
		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			//plist 활용 
			ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id())); //포스트에 표시할 유저정보
			mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id())); //포스트에 표시할 미디어 
			
		}
		
		for(int i=0;i<mlist.size();i++) {
			if(mlist.get(i)!=null) {
				System.out.println("fff : "+mlist.get(i).getFile_name());
				String[] file = mlist.get(i).getFile_name().split(",");
				//System.out.println(file[0]);
				for(int j=0;j<file.length;j++) {
					flist.add(file[j]);
					ilist.add(mlist.get(i).getPost_id());
					System.out.println("file["+j+"] : "+file[j]);
					System.out.println("post_id["+j+"] : "+ilist.get(j).toString());
				}
			}
		}
		
		for(int i=0;i<flist.size();i++) {
			System.out.println(i+" : "+flist.get(i));
			System.out.println(i+" : "+ilist.get(i));
		}
		
		map.put("plist", plist);
		map.put("ulist", ulist);
		map.put("mlist", mlist);
		map.put("flist", flist);
		map.put("ilist", ilist);
		
		return map;
	}

	//북마크된 포스트 가져오기
	@Override
	public Map<String, Object> getMyBookmark(String id) {
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
				
		//사용자 타임라인 불러오기
		ArrayList<PostDto> plist = postMapper.getMyBookmark(id);

		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			//plist 활용 
			ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id())); //포스트에 표시할 유저정보
			mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id())); //포스트에 표시할 미디어 
			recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id())); //리트윗 수 가져오기
			renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id())); //사용자가 특정포스트(post_id)에 리트윗 했는지 여부
			facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id())); //좋아요 수 가져오기
			favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id())); //사용자가 특정포스트(post_id)에 좋아요 했는지 여부
			replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id())); //답글 수 가져오기
			postMapper.updateHit(plist.get(i).getPost_id()); //노출수 1증가
		}
		
		map.put("plist", plist);
		map.put("ulist", ulist);
		map.put("mlist", mlist);
		map.put("recount", recount);
		map.put("renoted", renoted);
		map.put("facount", facount);
		map.put("favorited", favorited);
		map.put("replycount", replycount);
		
		return map;
	}

}

