package com.faint.persistence;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.PostVO;
import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;
import com.faint.domain.UserVO;
import com.faint.dto.FollowinPostDTO;
import com.faint.dto.RelationDTO;

@Repository
public class PostDAOImpl implements PostDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.faint.mapper.postMapper";

	@Override
	public void create(PostVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}
	
	@Override
	public void modify(PostVO vo) throws Exception {
		session.update(namespace + ".modify", vo);
	}
	
	@Override
	public void deleteOne(int postid) throws Exception {
		session.delete(namespace + ".deleteOne", postid);
	}

	@Override
	public void addAttach(String url,String filter) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("url", url);
		paramMap.put("filter", filter);
		session.insert(namespace + ".addAttach", paramMap);
	}
	
	//==============================게시물 읽기==============================
	//특정 포스트
	public PostVO readOne(int postid) throws Exception{
		return session.selectOne(namespace+".readOne", postid);
	}
	
	// post전체목록  - 한 유저에 대해
	@Override
	public List<PostVO> read(Integer userid) throws Exception{
		return session.selectList(namespace+".read", userid);
	}
	
	// 저장post전체목록  - 로그인한 유저에 대해
	@Override
	public List<PostVO> storeRead(Integer userid) throws Exception{
		return session.selectList(namespace+".storeRead", userid);
	}
	
	@Override
	public FollowinPostDTO detailRead(RelationDTO dto) throws Exception{
		return session.selectOne(namespace+".detailRead", dto);
	}
	
	// post전체목록  - 모든 유저에 대해
	@Override
	public List<PostVO> listAllPost() throws Exception {
		return session.selectList(namespace + ".listAllPost");
	}
	
	// 메인피드용 post전체목록 - 팔로우한 유저에 대해
	@Override
	public List<FollowinPostDTO> mainRead(Integer id) throws Exception{
		return session.selectList(namespace+".mainRead", id);
	}
	
	// 인기 게시글
	@Override
	public List<PostVO> topPost() throws Exception {
		return session.selectList(namespace+".topPost");
	}

	//==============================tag관련==============================
	// post tag(keyword)로 찾기
	@Override
	public List<PostVO> listPostKeyword(SearchCriteria cri) throws Exception {
		// 검색한 tag의 count값 1 증가
		plusTagCount(cri);
		return session.selectList(namespace + ".listPostKeyword", cri);
	}
	
	// tag로 포스트 찾으면 tag count+1 증가
	@Override
	public void plusTagCount(SearchCriteria cri) throws Exception {
		session.update(namespace + ".plusTagCount", cri);
	}
	
	// 태그등록
	@Override
	public void insertTag(TagVO vo) throws Exception {
		session.insert(namespace + ".insertTag", vo);
	}

	// 태그 name으로 검색
	@Override
	public TagVO selectTagByName(String name) throws Exception {
		return session.selectOne(namespace + ".selectTagByName", name);
	}

	// postid와 tagid 넣기
	@Override
	public void insertPostedTag(int postid, int tagid) throws Exception {

		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("postid", postid);
		paramMap.put("tagid", tagid);

		session.insert(namespace + ".insertPostedTag", paramMap);
	}
	
	//==============================검색무한스크롤==============================
	
	// 태그 검색 무한 스크롤
	@Override
	public List<PostVO> tagsAjax(SearchCriteria cri) throws Exception {
		System.out.println("접근");
		System.out.println("toString: "+cri.toString());
		 plusTagCount(cri);
		return session.selectList(namespace+".tagsAjax", cri);
	}

	@Override
	public List<PostVO> infiniteScrollTags(SearchCriteria cri, Integer row) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("cri", cri);
		paramMap.put("row", row);
		
		return session.selectList(namespace + ".infiniteScrollTags", paramMap);
	}

	// 위치 검색 무한 스크롤
	@Override
	public List<PostVO> locationsAjax(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".locationsAjax", cri);
	}

	@Override
	public List<PostVO> infiniteScrollLocations(SearchCriteria cri, Integer row) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("cri", cri);
		paramMap.put("row", row);
		
		return session.selectList(namespace + ".infiniteScrollLocations", paramMap);
	}

	//==============================좋아요 관련==============================
	@Override
	public void postLike(RelationDTO dto) throws Exception{
		session.insert(namespace + ".postLike", dto);
	};
	@Override
	public void postUnlike(RelationDTO dto) throws Exception{
		session.delete(namespace + ".postUnlike", dto);
	};
	@Override
	public List<UserVO> postLiker(RelationDTO dto) throws Exception{
		return session.selectList(namespace + ".postLiker", dto);
	};
	
	//==============================store==============================
	@Override
	public void postStore(RelationDTO dto) throws Exception{
		session.insert(namespace + ".postStore", dto);
	};
	@Override
	public void postTakeaway(RelationDTO dto) throws Exception{
		session.delete(namespace + ".postTakeaway", dto);
	}

	
	
	//==============================category filtering==============================
		//카테고리로 필터링
	@Override
	public List<PostVO> cateAjax(int cateid) throws Exception {
		return session.selectList(namespace + ".cateFilter", cateid);
		
	};
}
