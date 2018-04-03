package com.faint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;
import com.faint.domain.UserVO;
import com.faint.dto.FollowinPostDTO;
import com.faint.dto.RelationDTO;
import com.faint.dto.TopPostDTO;
import com.faint.persistence.PostDAO;
import com.faint.util.HashTagHelper;

@Service
public class PostServiceImpl implements PostService {

	@Inject
	private PostDAO dao;

	//==============post 등록(사진등록+태그등록)==============
	// post등록 (registPostAndTag method 사용)
	@Transactional
	@Override
	public void regist(PostVO post) throws Exception {
		dao.create(post);
		// 첨부파일 목록 불러들임
		String[] files = post.getFiles();

		// 파일 목록 없으면 아무것도 안함
		if (files != null) {
			for (String url : files) {
				dao.addAttach(url);
			}
		}
		List<String> hashTags = HashTagHelper.getAllHashTags(post.getCaption());
		if (!hashTags.isEmpty()) { // exist hash tag
			for (String tagname : hashTags) {
				registPostAndTag(post.getId(), tagname);
			}
		}
	}
	
	//post등록 util 메서드 = insertPostedTag/insertTag메서드 사용
	public void registPostAndTag(Integer postid, String tagname) throws Exception {
		TagVO vo = selectTagByName(tagname);

		if (vo == null) {
			// tbl_tag에 존재하지 않는 tag
			// tbl_tag에 일단 tag를 넣는다
			TagVO vo2 = new TagVO();
			vo2.setName(tagname);
			vo2.setTagcount(0);
			insertTag(vo2);
			insertPostedTag(postid, vo2.getId());
		} else {

			insertPostedTag(postid, vo.getId());
		}
	}
	
	//post 등록 메서드 사용시 자동 사용
	@Override
	public void insertPostedTag(int postid, int tagid) throws Exception {
		dao.insertPostedTag(postid, tagid);
	}
	
	//post 등록 메서드 사용시 자동 사용 (tag등록)
	@Override
	public void insertTag(TagVO vo) throws Exception {
		dao.insertTag(vo);
	}
	
	//==============post 읽기==============
	
	// 특정 유저 게시물목록
	@Override
	public List<PostVO> read(Integer userid) throws Exception{
		return dao.read(userid);
	}
	
	// 특정 유저 저장 게시물목록
	@Override
	public List<PostVO> storeRead(Integer userid) throws Exception{
		return dao.storeRead(userid);
	}
	
	// 특정게시물 세부내용(매개변수:postid, loginid)
	@Override
	public FollowinPostDTO detailRead(RelationDTO dto) throws Exception{
		return dao.detailRead(dto);
	}
	
	// 메인피드 게시물 리스트(매개변수:postid, loginid)
	@Override
	public List<FollowinPostDTO> mainRead(Integer id) throws Exception{
		return dao.mainRead(id);
	}

	// post전체목록
	@Override
	public List<PostVO> listAllPost() throws Exception {
		return dao.listAllPost();
	}

	// post tag로 찾기( tag로 찾고나면 count +1 증가)
	@Override
	public List<PostVO> listPostKeyword(SearchCriteria cri) throws Exception {
		return dao.listPostKeyword(cri);
	}
	
	// 인기 게시글
	@Override
	public List<PostVO> topPost(TopPostDTO dto) throws Exception {
		return dao.topPost(dto);
	}

	//==============tag==============
	
	// tag name검색
	@Override
	public TagVO selectTagByName(String name) throws Exception {
		return dao.selectTagByName(name);
	}
	
	//==============tag검색 무한스크롤==============
	@Override
	public List<PostVO> tagsAjax(SearchCriteria cri) throws Exception {
		return dao.tagsAjax(cri);
	}

	@Override
	public List<PostVO> infiniteScrollTags(SearchCriteria cri, Integer row) throws Exception {
		return dao.infiniteScrollTags(cri, row);
	}

	// 무한스크롤 위치검색
	@Override
	public List<PostVO> locationsAjax(SearchCriteria cri) throws Exception {
		return dao.locationsAjax(cri);
	}

	@Override
	public List<PostVO> infiniteScrollLocations(SearchCriteria cri, Integer row) throws Exception {
		return dao.infiniteScrollLocations(cri, row);
	}
	
	//==============like==============
	
	@Override
	public void postLike(RelationDTO dto) throws Exception{
		dao.postLike(dto);
	}
	
	@Override
	public void postUnlike(RelationDTO dto) throws Exception{
		dao.postUnlike(dto);
	}
	
	@Override
	public List<UserVO> postLiker(RelationDTO dto) throws Exception{
		return dao.postLiker(dto);
	}
	
	//==============store==============
	
	@Override
	public void postStore(RelationDTO dto) throws Exception{
		dao.postStore(dto);
	}
	
	@Override
	public void postTakeaway(RelationDTO dto) throws Exception{
		dao.postTakeaway(dto);
	}
	
}
