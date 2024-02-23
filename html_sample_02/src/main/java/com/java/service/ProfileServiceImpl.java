
package com.java.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.MediaDto;
import com.java.dto.PostDto;
import com.java.dto.PostLikeDto;
import com.java.dto.PostMediaUserDto;
import com.java.dto.User_followDto;
import com.java.mapper.AlramMapper;
import com.java.mapper.BookmarkMapper;
import com.java.mapper.Cross_userMapper;
import com.java.mapper.MediaMapper;
import com.java.mapper.MessageMapper;
import com.java.mapper.PostLikeMapper;
import com.java.mapper.PostMapper;
import com.java.mapper.ProfileMapper;
import com.java.mapper.User_followMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired HttpSession session;
	@Autowired ProfileMapper profileMapper;
	@Autowired Cross_userMapper cross_userMapper;
	@Autowired User_followMapper user_followMapper;
	@Autowired PostLikeMapper postLikeMapper;
	@Autowired PostMapper postMapper;
	@Autowired MediaMapper mediaMapper;
	@Autowired AlramMapper alramMapper;
	@Autowired MessageMapper messageMapper;
	@Autowired BookmarkMapper bookmarkMapper;
	
	
	//작성글 가져오기
	@Override
	public ArrayList<PostMediaUserDto> selectDefault(String id) {
		ArrayList<PostMediaUserDto> list = postMapper.selectDefault(id);
		PostMediaUserDto dummy = new PostMediaUserDto();
		dummy.setPostDto(new PostDto());
		list.add(dummy);
		return list;
	}

	//개인 정보 가져오기
	@Override
	public Cross_userDto selectOne(String id) {
		Cross_userDto udto = cross_userMapper.selectOne(id);
		return udto;
	}

	//아이디 이메일 변경
	@Override
	public void accountUpdate(Cross_userDto udto,String org_id) {
		String user_id= udto.getUser_id();
		String email = udto.getEmail();
		cross_userMapper.accountUpdate(user_id,email,org_id);
		user_followMapper.accountUpdate1(user_id,org_id);
		user_followMapper.accountUpdate2(user_id,org_id);
		user_followMapper.accountUpdate3(user_id,org_id);
		alramMapper.accountUpdate1(user_id,org_id);
		alramMapper.accountUpdate2(user_id,org_id);
		messageMapper.accountUpdate1(user_id,org_id);
		messageMapper.accountUpdate2(user_id,org_id);
		postMapper.accountUpdate1(user_id,org_id);
		postLikeMapper.accountUpdate1(user_id,org_id);
		bookmarkMapper.accountUpdate(user_id,org_id);
		bookmarkMapper.accountUpdate_renote(user_id,org_id);
		//리트윗,북마크 추가해야함
	}

	//비번 변경
	@Override
	public void pwUpdate(String cur_pw, String new_pw, String user_id) {
		cross_userMapper.pwUpadte(cur_pw,new_pw,user_id);
		
	}

	//프로필 변경
	@Override
	public void profileUpdate(String name, String profile_txt, String user_loc, 
			String user_url, String header_img, String profile_img, String user_id) {
		cross_userMapper.profileUpdate(name,profile_txt,user_loc,
				user_url,header_img,profile_img,user_id);
		
	}

	//팔로우->팔로잉
	@Override
	public void insertFollow(String source_id, String target_id) {
		user_followMapper.insertFollow1(source_id,target_id);
		user_followMapper.insertFollow2(source_id,target_id);
		alramMapper.insertFollowAlram(source_id,target_id);
		session.setAttribute("session_followerCount", user_followMapper.followerCount(source_id));
		session.setAttribute("session_followingCount", user_followMapper.followingCount(source_id));		
	}

	//팔로잉->팔로우(언팔)
	@Override
	public void deleteFollow(String source_id, String target_id) {
		user_followMapper.deleteFollow(source_id,target_id);
		session.setAttribute("session_followerCount", user_followMapper.followerCount(source_id));
		session.setAttribute("session_followingCount", user_followMapper.followingCount(source_id));		
	}

	//팔로우 정보 가져오기
	@Override
	public User_followDto selectFollowInfo(String id, String your_id) {
		User_followDto followDto = user_followMapper.selectFollowInfo(id,your_id);  
		return followDto;
	}
	
	@Override
	public Map<String, Object> selectFollow(String id) {
		ArrayList<User_followDto> followList = user_followMapper.selectFollow(id); //팔로우정보 
		ArrayList<User_followDto> myfollowList = user_followMapper.selectFollow(session.getAttribute("session_id").toString()); //내 팔로우정보 비교용
		ArrayList<Cross_userDto> following = new ArrayList<>();
		ArrayList<Cross_userDto> follower = new ArrayList<>();
		ArrayList<User_followDto> followerDto = new ArrayList<>();
		ArrayList<User_followDto> followingDto = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();		
				
		for(int i=0;i<followList.size();i++) {
			if(!id.equals(followList.get(i).getSource_id())) {
				follower.add(cross_userMapper.selectOne( followList.get(i).getSource_id() ));
				followerDto.add(user_followMapper.selectFollowInfo(session.getAttribute("session_id").toString(),followList.get(i).getSource_id()));				
			}
		}	
		
		for(int i=0;i<followList.size();i++) {
			if(!id.equals(followList.get(i).getTarget_id())) {
				following.add(cross_userMapper.selectOne( followList.get(i).getTarget_id() ));
				followingDto.add(user_followMapper.selectFollowInfo(session.getAttribute("session_id").toString(),followList.get(i).getTarget_id()));
			}
		}
		
		map.put("follower", follower);
		map.put("followerDto", followerDto);
		map.put("following", following);
		map.put("followingDto", followingDto);
		
		return map;
	}
	
	//팔로우 카운트 가져오기
	@Override
	public Map<String, Object> selectFollowCount(String id) {
		
		Map<String, Object> map = new HashMap<>();
		int followerCount = user_followMapper.followerCount(id);
		int followingCount = user_followMapper.followingCount(id);
		
		map.put("followerCount", followerCount);
		map.put("followingCount", followingCount);
		
		return map;
	}
	
	

	//좋아요 추가
	@Override
	public void likeUp(String user_id, String post_id) {
		postLikeMapper.likeUp(user_id,post_id);
		postMapper.likeUp(post_id);
		String target_id = postMapper.getLikeTargetId(post_id);
		alramMapper.insertLikeAlram(target_id,user_id,post_id);
	}

	//좋아요 삭제
	@Override
	public void likeDown(String user_id, String post_id) {
		postLikeMapper.likeDown(user_id,post_id);
		postMapper.likeDown(post_id);		
	}

	//좋아요 수
	@Override
	public int likeCount(String post_id) {
		int likeCount = postLikeMapper.likeCount(post_id);
		return likeCount;
	}

	//좋아요한 글
	@Override
	public ArrayList<PostLikeDto> selectLike(String id) {
		ArrayList<PostLikeDto> list = postLikeMapper.selectLike(id);
		
		return list;
	}

	//미디어 불러오기
	@Override
	public ArrayList<PostMediaUserDto> selectMedia(String id) {
		ArrayList<PostMediaUserDto> list = postMapper.selectMedia(id);
		
		
		return list;
	}

	//좋아요한 글 불러오기
	@Override
	public ArrayList<PostMediaUserDto> selectLikePost(String id) {
		ArrayList<PostMediaUserDto> list = postMapper.selectLikePost(id);
		PostMediaUserDto dummy = new PostMediaUserDto();
		dummy.setPostDto(new PostDto());
		list.add(dummy);
		return list;
	}

	//내가 작성한글 불러오기
	@Override
	public Map<String, Object> getMypost(String id) {
		
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
		int followerCount = user_followMapper.followerCount(id);
		int followingCount = user_followMapper.followingCount(id);
				
		//내가 작성한 포스트 가져오기
		ArrayList<PostDto> plist = postMapper.getMypost(id);
		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			//plist 활용 
			ulist.add(cross_userMapper.getUserProfile(plist.get(i).getUser_id())); //포스트에 표시할 유저정보
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
		map.put("followerCount", followerCount);
		map.put("followingCount", followingCount);
		
		return map;
	}
	
	//내가 작성한 답글 불러오기
	@Override
	public Map<String, Object> getMyreply(String id) {
		
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
		int followerCount = user_followMapper.followerCount(id);
		int followingCount = user_followMapper.followingCount(id);
		
		
		//내가 작성한 포스트 가져오기
		ArrayList<PostDto> plist = postMapper.getMyreply(id);
		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			//plist 활용 
			ulist.add(cross_userMapper.getUserProfile(plist.get(i).getUser_id())); //포스트에 표시할 유저정보
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
		map.put("followerCount", followerCount);
		map.put("followingCount", followingCount);
		
		return map;
	}

	//좋아요한 글 가져오기
	@Override
	public Map<String, Object> getMylike(String id) {
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
		int followerCount = user_followMapper.followerCount(id);
		int followingCount = user_followMapper.followingCount(id);
		
		//내가 좋아요한 포스트 가져오기
		ArrayList<PostDto> plist = postMapper.getMylike(id);
		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			//plist 활용 
			ulist.add(cross_userMapper.getUserProfile(plist.get(i).getUser_id())); //포스트에 표시할 유저정보
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
		map.put("followerCount", followerCount);
		map.put("followingCount", followingCount);
		
		return map;
	}
	
	//미디어 불러오기
	@Override
	public Map<String, Object> getMymedia(String id) {
		
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<String> flist = new ArrayList<>();
		ArrayList ilist = new ArrayList<>();
		int followerCount = user_followMapper.followerCount(id);
		int followingCount = user_followMapper.followingCount(id);
		
		
		//내가 작성한 포스트 가져오기
		
		ArrayList<PostDto> plist = postMapper.getMypost(id);
		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			//plist 활용 
			ulist.add(cross_userMapper.getUserProfile(plist.get(i).getUser_id())); //포스트에 표시할 유저정보
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
		map.put("followerCount", followerCount);
		map.put("followingCount", followingCount);
		
		
		return map;
	}

	

	
	
	
	
	
	
}

