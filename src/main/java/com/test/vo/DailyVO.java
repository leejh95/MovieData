package com.test.vo;

public class DailyVO {
/*
  	<rnum>1</rnum>
	<rank>1</rank>
	<rankInten>0</rankInten>
	<rankOldAndNew>OLD</rankOldAndNew>
	<movieCd>20199842</movieCd>
	<movieNm>인비저블맨</movieNm>
	<openDt>2020-02-26</openDt>
	<salesAmt>43585380</salesAmt>
	<salesShare>22.3</salesShare>
	<salesInten>-5891160</salesInten>
	<salesChange>-11.9</salesChange>
	<salesAcc>4409430520</salesAcc>
	<audiCnt>5210</audiCnt>
	<audiInten>-694</audiInten>
	<audiChange>-11.8</audiChange>
	<audiAcc>504363</audiAcc>
	<scrnCnt>483</scrnCnt>
	<showCnt>1130</showCnt>
 */
	 private String rank,
					movieCd,
					movieNm,
					openDt,
					image,
					rankInten,
					salesAcc,
					audiAcc;
	 
	 
	 

	 
	public String getRankInten() {
		return rankInten;
	}

	public void setRankInten(String rankInten) {
		this.rankInten = rankInten;
	}

	public String getSalesAcc() {
		return salesAcc;
	}

	public void setSalesAcc(String salesAcc) {
		this.salesAcc = salesAcc;
	}

	public String getAudiAcc() {
		return audiAcc;
	}

	public void setAudiAcc(String audiAcc) {
		this.audiAcc = audiAcc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
					
	
}
