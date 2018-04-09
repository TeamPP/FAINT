package com.faint.service;

import java.util.List;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;
import com.faint.domain.UserVO;
import com.faint.dto.FollowinPostDTO;
import com.faint.dto.RelationDTO;
import com.faint.dto.TopPostDTO;

public interface PostService {
	// ====================post둥록 ===================
	// POST등록(사진/태그 Transaction)
	public void regist(PostVO post) throws Exception;

	// regist에서 사용
	public void registPostAndTag(Integer postid, String tagname) throws Exception;

	// registPostAndTag에서 사용
	public void insertPostedTag(int postid, int tagid) throws Exception;

	// registPostAndTag에서 사용
	public void insertTag(TagVO vo) throws Exception;

	// ====================post 수정 ==================
	// 게시글 수정
	public void modify(PostVO post) throws Exception;
	
	// 게시글 삭제
	public String deleteOne(int postid, int loginid) throws Exception;
	
	// ====================post읽기 ===================
	// post 전체목록
	public List<PostVO> listAllPost() throws Exception;

	// post tag로 찾기(keyword)
	public List<PostVO> listPostKeyword(SearchCriteria cri) throws Exception;

	// 특정 유저 게시물목록
	public List<PostVO> read(Integer userid) throws Exception;

	// 특정 유저 저장게시물목록
	public List<PostVO> storeRead(Integer userid) throws Exception;

	// 특정게시물 세부내용(매개변수:postid, loginid)
	public FollowinPostDTO detailRead(RelationDTO dto) throws Exception;

	// 메인피드 게시물 리스트(매개변수:postid, loginid)
	public List<FollowinPostDTO> mainRead(Integer id) throws Exception;

	// 인기 게시글
	public List<PostVO> topPost() throws Exception;

	// ====================post와 tag 관계 ===================

	// tag name검색
	public TagVO selectTagByName(String name) throws Exception;

	// ====================post와 like ====================
	public void postLike(RelationDTO dto) throws Exception;

	public void postUnlike(RelationDTO dto) throws Exception;

	public List<UserVO> postLiker(RelationDTO dto) throws Exception;

	// ==============store==============

	public void postStore(RelationDTO dto) throws Exception;

	public void postTakeaway(RelationDTO dto) throws Exception;

	// ====================무한스크롤 ====================

	// 무한스크롤 태그검색
	public List<PostVO> tagsAjax(SearchCriteria cri) throws Exception;

	public List<PostVO> infiniteScrollTags(SearchCriteria cri, Integer row) throws Exception;

	// 무한스크롤 위치검색
	public List<PostVO> locationsAjax(SearchCriteria cri) throws Exception;

	public List<PostVO> infiniteScrollLocations(SearchCriteria cri, Integer row) throws Exception;
}
