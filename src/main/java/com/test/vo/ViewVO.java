package com.test.vo;

import java.util.List;

public class ViewVO {
/*
 	<movieCd>20124079</movieCd>
	<movieNm>광해, 왕이 된 남자</movieNm>
	<movieNmEn>Masquerade</movieNmEn>
	<showTm>131</showTm>
	<prdtYear>2012</prdtYear>
	<openDt>20120913</openDt>
	<prdtStatNm>개봉</prdtStatNm>
	<typeNm>장편</typeNm>
	<nationNm>한국</nationNm>
	<genreNm>사극</genreNm>
	<peopleNm>추창민</peopleNm>
	<peopleNm>이병헌</peopleNm>
	<cast>광해/하선</cast>
	<watchGradeNm>15세이상관람가</watchGradeNm>
 * 
 */
	
	private String movieCd, movieNm, movieNmEn, showTm, prdtYear, openDt, prdtStatNm, typeNm, nationNm, genreNm, directorNm,
					actorNm1, actorNm2, actorNm3, cast1, cast2, cast3, watchGradeNm,
					companyNm, image;
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	private ActorVO[] actors;
	

	public ActorVO[] getActors() {
		return actors;
	}

	public void setActors(ActorVO[] actors) {
		this.actors = actors;
	}

	public String getCompanyNm() {
		return companyNm;
	}

	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
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

	public String getMovieNmEn() {
		return movieNmEn;
	}

	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}

	public String getShowTm() {
		return showTm;
	}

	public void setShowTm(String showTm) {
		this.showTm = showTm;
	}

	public String getPrdtYear() {
		return prdtYear;
	}

	public void setPrdtYear(String prdtYear) {
		this.prdtYear = prdtYear;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}

	public String getPrdtStatNm() {
		return prdtStatNm;
	}

	public void setPrdtStatNm(String prdtStatNm) {
		this.prdtStatNm = prdtStatNm;
	}

	public String getTypeNm() {
		return typeNm;
	}

	public void setTypeNm(String typeNm) {
		this.typeNm = typeNm;
	}

	public String getNationNm() {
		return nationNm;
	}

	public void setNationNm(String nationNm) {
		this.nationNm = nationNm;
	}

	public String getGenreNm() {
		return genreNm;
	}

	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
	}

	public String getDirectorNm() {
		return directorNm;
	}

	public void setDirectorNm(String directorNm) {
		this.directorNm = directorNm;
	}

	public String getActorNm1() {
		return actorNm1;
	}

	public void setActorNm1(String actorNm1) {
		this.actorNm1 = actorNm1;
	}

	
	public String getActorNm2() {
		return actorNm2;
	}

	public void setActorNm2(String actorNm2) {
		this.actorNm2 = actorNm2;
	}

	public String getActorNm3() {
		return actorNm3;
	}

	public void setActorNm3(String actorNm3) {
		this.actorNm3 = actorNm3;
	}

	public String getCast1() {
		return cast1;
	}

	public void setCast1(String cast1) {
		this.cast1 = cast1;
	}

	public String getCast2() {
		return cast2;
	}

	public void setCast2(String cast2) {
		this.cast2 = cast2;
	}

	public String getCast3() {
		return cast3;
	}

	public void setCast3(String cast3) {
		this.cast3 = cast3;
	}

	public String getWatchGradeNm() {
		return watchGradeNm;
	}

	public void setWatchGradeNm(String watchGradeNm) {
		this.watchGradeNm = watchGradeNm;
	}
	
	
}
