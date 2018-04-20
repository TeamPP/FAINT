package com.faint.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.AdminPostVO;
import com.faint.domain.AdminReplyVO;
import com.faint.domain.AdminReportVO;
import com.faint.domain.AdminUserVO;
import com.faint.domain.UserVO;

import util.AdminCriteria;
import util.SearchMemberCriteria;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.faint.mapper.AdminMapper";
	
	@Override
	public List<UserVO> getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map) {
		
	System.out.println(" 여기 서에러 날수도 있겠다 ");
		
		return sqlSession.selectList(namespace+".getSearchMemberList", scri);
	}
	
	@Override
	public int getTotalMemberCount(SearchMemberCriteria scri) {
		return sqlSession.selectOne(namespace+".getTotalMemberCount", scri);
	}
	@Override
	public List<UserVO> listAll()throws Exception{
		return sqlSession.selectList(namespace+".getSearchMemberList");
	}
	
	@Override
	
	public int deleteMember(String email) {
		
		return sqlSession.delete(namespace+".deleteMember", email);
	}
	
	// 유저 관리자
	
	// 유저 관리 리스트
	@Override
	public List<AdminUserVO> AUList(AdminCriteria ac) throws Exception{
		return sqlSession.selectList(namespace + ".AUList", ac);
	}
	@Override
	public int AULCount(AdminCriteria ac) throws Exception {
	  return sqlSession.selectOne(namespace + ".AULCount", ac);
	}
	
	// 유저 관리 리스트 삭제
	@Override
	public void AUDelete(String value) throws Exception {
		sqlSession.delete(namespace + ".AUDelete", value);
	};
	
	// 유저 영구 정지
	@Override
	public void AUPStop(String value) throws Exception {
		sqlSession.update(namespace + ".AUPStop", value);
	};
	
	// 유저 정지
	@Override
	public void AUStop(String value) throws Exception {
		sqlSession.update(namespace + ".AUStop", value);
	};
	
	
	// 게시물 관리자
	
	// 게시물 관리 리스트
	@Override
	public List<AdminPostVO> APList(AdminCriteria ac) throws Exception {
		return sqlSession.selectList(namespace + ".APList", ac);
	}
	@Override
	public int APLCount(AdminCriteria ac) throws Exception {
	  return sqlSession.selectOne(namespace + ".APLCount", ac);
	}
	
	// 게시물 관리 리스트 삭제
	@Override
	public void APDelete(String value) throws Exception {
		sqlSession.delete(namespace + ".APDelete", value);
	};
	
	// 게시물 관리자 외 비공개 처리
	@Override
	public void APBlock(String value) throws Exception {
		sqlSession.update(namespace + ".APBlock", value);
	};
	
	
	// 댓글 관리자
	
	// 댓글 관리 리스트
	@Override
	public List<AdminReplyVO> ARList(AdminCriteria ac) throws Exception {
		return sqlSession.selectList(namespace + ".ARList", ac);
	}
	@Override
	public int ARLCount(AdminCriteria ac) throws Exception {
	  return sqlSession.selectOne(namespace + ".ARLCount", ac);
	}
	
	// 댓글 관리 리스트 삭제
	@Override
	public void ARDelete(String value) throws Exception {
		sqlSession.selectList(namespace + ".ARDelete", value);
	};


	// 유저 신고 관리자
	
	// 유저 신고
	@Override
	public void ARUCreate(AdminReportVO vo) throws Exception {
		sqlSession.insert(namespace + ".ARUCreate", vo);
	}

	// 유저 신고 리스트
	@Override
	public List<AdminReportVO> ARUList(AdminCriteria ac) throws Exception {
		return sqlSession.selectList(namespace + ".ARUList", ac);
	}
	@Override
	public int ARULCount(AdminCriteria ac) throws Exception {
		return sqlSession.selectOne(namespace + ".ARULCount", ac);
	}

	// 유저 신고 리스트 삭제
	@Override
	public void ARUDelete(String value) throws Exception {
		sqlSession.selectList(namespace + ".ARUDelete", value);
	};

	// 유저 신고 리스트 상세페이지
	@Override
	public AdminReportVO ARURead(Integer id) throws Exception {
		return sqlSession.selectOne(namespace + ".ARURead", id);
	}

	// 유저 신고 리스트 상세페이지 읽은 관리자 체크
	@Override
	public void ARUCheck(AdminReportVO vo) throws Exception {
		sqlSession.insert(namespace + ".ARUCheck", vo);
	}
	
	
	// 게시물 신고 관리자		
	
	// 게시물 신고
	@Override
	public void ARPCreate(AdminReportVO vo) throws Exception {
		sqlSession.insert(namespace + ".ARPCreate", vo);
	}
	
	// 게시물 신고 리스트
	@Override
	public List<AdminReportVO> ARPList(AdminCriteria ac) throws Exception {
		return sqlSession.selectList(namespace + ".ARPList", ac);
	}
	@Override
	public int ARPLCount(AdminCriteria ac) throws Exception {
	  return sqlSession.selectOne(namespace + ".ARPLCount", ac);
	}
	
	// 게시물 신고 리스트 삭제
	@Override
	public List<String> ARPDelete(String value) throws Exception {
		return sqlSession.selectList(namespace + ".ARPDelete", value);
	}
	
	// 게시물 신고 리스트 상세페이지
	@Override
	public AdminReportVO ARPRead(Integer id) throws Exception {
		return sqlSession.selectOne(namespace + ".ARPRead", id);
	}

	// 게시물 신고 리스트 상세페이지 읽은 관리자 체크
	@Override
	public void ARPCheck(AdminReportVO vo) throws Exception {
		sqlSession.insert(namespace + ".ARPCheck", vo);
	}
	
}
