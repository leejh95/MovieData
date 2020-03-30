package mybatis.vo;

import java.util.List;

public class MovieMemberVO {

	private String m_idx, id, pw, name, email, phone, reg_date, status, sns_id, sns_type;
	
	private List<MovieCommentVO> c_list;
	
	public String getSns_type() {
		return sns_type;
	}
	
	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}

	public String getSns_id() {
		return sns_id;
	}
	
	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}
	
	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<MovieCommentVO> getC_list() {
		return c_list;
	}

	public void setC_list(List<MovieCommentVO> c_list) {
		this.c_list = c_list;
	}
	
	
}
