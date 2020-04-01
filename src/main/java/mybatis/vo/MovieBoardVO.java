package mybatis.vo;

import java.util.List;

public class MovieBoardVO {
	private String b_idx,
				subject,
				content,
				file_name,
				ori_name,
				write_date,
				ip,
				hit,
				ref,
				step,
				sunbun,
				status,
				category,
				m_idx;
	
	private List<MovieCommentVO> c_list;
	private MovieMemberVO mvo;
	
	public MovieMemberVO getMvo() {
		return mvo;
	}
	
	public void setMvo(MovieMemberVO mvo) {
		this.mvo = mvo;
	}

	public String getB_idx() {
		return b_idx;
	}

	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getSunbun() {
		return sunbun;
	}

	public void setSunbun(String sunbun) {
		this.sunbun = sunbun;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public List<MovieCommentVO> getC_list() {
		return c_list;
	}

	public void setC_list(List<MovieCommentVO> c_list) {
		this.c_list = c_list;
	}
	
	
}
