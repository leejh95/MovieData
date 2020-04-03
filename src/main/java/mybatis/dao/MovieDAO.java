package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MovieBoardVO;
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
	
	// SNS 로그인
	public MovieMemberVO signInSns(String sns_id, String sns_type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sns_id", sns_id);
		map.put("sns_type", sns_type);
		
		MovieMemberVO vo = ss.selectOne("movie.sign_in_sns", map);
		
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
	
	//영화 별점 평균
	public String rateAvg(String movieCd) {
		String avg = null;
		
		avg = ss.selectOne("movie.rateAvg", movieCd);
		
		return avg;
	}
	
	//전체 게시물 수
	public int totalCount(String category) {
		int total = 0;
		
		total = ss.selectOne("movie.totalCount", category);
		
		return total;
	}
	
	//원글 쓰기
	public boolean writeBoard(MovieBoardVO vo) {
		boolean chk = false;
		
		int cnt = ss.insert("movie.writeBoard", vo);
		
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	//답변 쓰기 시 순번 증가
	public void updateSunbun(Map<String, String> map) {
		ss.update("movie.updateSunbun", map);
	}
	
	//답변 쓰기
	public boolean writeAnswer(MovieBoardVO vo) {
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("ref", vo.getRef());
		map.put("sunbun", vo.getSunbun());
		
		updateSunbun(map);
		
		int sunbun = Integer.parseInt(vo.getSunbun());
		int step = Integer.parseInt(vo.getStep());
		
		vo.setSunbun(String.valueOf(sunbun+1));
		vo.setStep(String.valueOf(step+1));
		
		int cnt = ss.insert("movie.writeAnswer", vo);
		
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	//게시물 리스트
	public MovieBoardVO[] getBoardList(String category, int begin, int end) {
		MovieBoardVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("category", category);
		
		List<MovieBoardVO> list = ss.selectList("movie.getBoardList", map);
		if(!list.isEmpty()) {
			ar = new MovieBoardVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//게시물 하나보기
	public MovieBoardVO getBoard(String b_idx) {
		MovieBoardVO vo = null;
		vo = ss.selectOne("movie.getBoard", b_idx);
		return vo;
	}
	
	//게시물 수정
	public boolean updateBoard(MovieBoardVO vo) {
		boolean chk = false;
		
		int cnt = ss.update("movie.editPost", vo);
		if(cnt > 0)
			chk = true;
		
		return chk;
	}
	
	//원글 삭제
	public boolean deleteBoard(String b_idx) {
		boolean chk = false;
		
		int cnt = ss.update("movie.delBoard", b_idx);
		
		if(cnt > 0) 
			chk = true;
		
		return chk;
	}
	
	//답글이 달렸는지 알 수 있는 개수 반환
	public int getRefCount(String ref) {
		int count = 0;
		
		count = ss.selectOne("movie.getRefCount", ref);
		
		return count;
	}
	
	//답글이거나 답글이 달린 경우 삭제
	public boolean deleteBoard2(String b_idx) {
		boolean chk = false;
		
		int cnt = ss.update("movie.delBoard2", b_idx);
		
		if(cnt > 0) 
			chk = true;
		
		return chk;
	}
	
	// 조회 수 올리는 기능 - 인자로 받은 b_idx의 게시물 hit를 증가하는 기능
	public boolean hit(String b_idx) {
		boolean chk = false;

		int cnt = ss.update("movie.hit", b_idx);
		
		if(cnt > 0) 
			chk = true;
			
		return chk;
	}
	
	public MovieCommentVO[] getBoardCommList(String b_idx) {
		List<MovieCommentVO> list = ss.selectList("movie.getBoard_commList", b_idx);
		MovieCommentVO[] ar = null;
		
		if(!list.isEmpty()) {
			ar = new MovieCommentVO[list.size()];
			list.toArray(ar);
		}
			
		return ar;
	}
}


