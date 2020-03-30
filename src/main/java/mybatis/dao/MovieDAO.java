package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MovieCommentVO;
import mybatis.vo.MovieMemberVO;

public class MovieDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	// 회원 정보 보기
	public MovieMemberVO getMember(String m_idx) {
		MovieMemberVO vo = ss.selectOne("movie.getMember", m_idx);
		return vo;
	}
	
	// 회원 로그인
	public MovieMemberVO signIn(String id, String pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		MovieMemberVO vo = ss.selectOne("movie.sign_in", map);
		
		return vo;
	}
	
	// 네이버 로그인
		public MovieMemberVO signInNaver(String sns_id, String sns_type) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("sns_id", sns_id);
			map.put("sns_type", sns_type);
			
			MovieMemberVO vo = ss.selectOne("movie.sign_in_naver", map);
			
			return vo;
		}
	
	// 회원 가입
	public boolean signUp(MovieMemberVO vo) {
		boolean chk = false;
		
		int cnt = ss.insert("movie.sign_up", vo);
		
		if(cnt > 0) 
			chk = true;
		
		return chk;
	}
	
	// 댓글 리스트 보기
	public MovieCommentVO[] getCommList(String movieCd) {
		List<MovieCommentVO> list = ss.selectList("movie.commList", movieCd);
		MovieCommentVO[] ar = null;
		
		if(!list.isEmpty()) {
			ar = new MovieCommentVO[list.size()];
			list.toArray(ar);
		}
			
		return ar;
	}
	
	// 댓글 쓰기
	public boolean writeComment(MovieCommentVO vo) {
		boolean chk = false;
			
		int cnt = ss.insert("movie.writeComment", vo);
		
		if(cnt > 0) 
			chk = true;
			
		return chk;
	}
	
	// 회원가입시 이미 아이디가 존재하는지 검사
	public boolean isExistID(String id) {
		boolean chk = false;
		String vo_id = ss.selectOne("movie.searchID", id);
		if(vo_id != null)
			chk = true;
		return chk;
	}
	
	// 회원 정보 수정
	public boolean updateMember(MovieMemberVO vo) {
		boolean chk = false;
		int cnt = ss.update("movie.updateMember", vo);
		
		if(cnt > 0) 
			chk = true;
		
		return chk;
	}
	
	// 회원 탈퇴
	public boolean deleteMember(String m_idx, String pw) {
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_idx", m_idx);
		map.put("pw", pw);
		
		int cnt = ss.update("movie.delMember", map);
		
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	// 댓글 삭제
	public boolean deleteComment(String c_idx) {
		boolean chk = false;
		
		int cnt = ss.update("movie.delComment", c_idx);
		
		if(cnt > 0) 
			chk = true;
		
		return chk;
	}
	
	// 댓글 수정
	public boolean updateComment(MovieCommentVO vo) {
		boolean chk = false;
		
		int cnt = ss.update("movie.updateComment", vo);
		
		if(cnt > 0)
			chk = true;
		
		return chk;
	}

}


