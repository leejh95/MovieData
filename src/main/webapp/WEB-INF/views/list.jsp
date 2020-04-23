<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
.method .header, .method .cell {
  padding: 6px 6px 6px 10px; }
.method .list-header .header {
  font-weight: normal;
  text-transform: uppercase;
  font-size: 0.8em;
  color: #999;
  background-color: #eee; }
.method [class^="row"],
.method [class*=" row"] {
  border-bottom: 1px solid #ddd; }
  .method [class^="row"]:hover,
  .method [class*=" row"]:hover {
    background-color: #f7f7f7; }
.method .cell {
  font-size: 0.85em; }
  .method .cell .mobile-isrequired {
    display: none;
    font-weight: normal;
    text-transform: uppercase;
    color: #aaa;
    font-size: 0.8em; }
  .method .cell .propertyname {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis; }
  .method .cell .type {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis; }
  .method .cell code {
    color: #428bca; }
  .method .cell a, .method .cell a:hover {
    text-decoration: none; }
  .method .cell code.custom {
    color: #8a6d3b;
    text-decoration: none; }
  .method .cell .text-muted {
    color: #ddd; }
@media (max-width: 991px) {
  .method [class^="row"],
  .method [class*=" row"] {
    padding-top: 10px;
    padding-bottom: 10px; }
  .method .cell {
    padding: 0 10px; }
    .method .cell .propertyname {
      font-weight: bold;
      font-size: 1.2em; }
      .method .cell .propertyname .lookuplink {
        font-weight: normal;
        font-size: 1.5em;
        position: absolute;
        top: 0;
        right: 10px; }
    .method .cell .type {
      padding-left: 10px;
      font-size: 1.1em; }
    .method .cell .isrequired {
      padding-left: 10px;
      display: none; }
    .method .cell .description {
      padding-left: 10px; }
    .method .cell .mobile-isrequired {
      display: inline; } }


/* Row Utilities */
[class^='row'].margin-0,
[class*=' row'].margin-0,
[class^='form-group'].margin-0,
[class*=' form-group'].margin-0 {
  margin-left: -0px;
  margin-right: -0px; }
  [class^='row'].margin-0 > [class^='col-'],
  [class^='row'].margin-0 > [class*=' col-'],
  [class*=' row'].margin-0 > [class^='col-'],
  [class*=' row'].margin-0 > [class*=' col-'],
  [class^='form-group'].margin-0 > [class^='col-'],
  [class^='form-group'].margin-0 > [class*=' col-'],
  [class*=' form-group'].margin-0 > [class^='col-'],
  [class*=' form-group'].margin-0 > [class*=' col-'] {
    padding-right: 0px;
    padding-left: 0px; }
  [class^='row'].margin-0 [class^='row'],
  [class^='row'].margin-0 [class*=' row'],
  [class^='row'].margin-0 [class^='form-group'],
  [class^='row'].margin-0 [class*=' form-group'],
  [class*=' row'].margin-0 [class^='row'],
  [class*=' row'].margin-0 [class*=' row'],
  [class*=' row'].margin-0 [class^='form-group'],
  [class*=' row'].margin-0 [class*=' form-group'],
  [class^='form-group'].margin-0 [class^='row'],
  [class^='form-group'].margin-0 [class*=' row'],
  [class^='form-group'].margin-0 [class^='form-group'],
  [class^='form-group'].margin-0 [class*=' form-group'],
  [class*=' form-group'].margin-0 [class^='row'],
  [class*=' form-group'].margin-0 [class*=' row'],
  [class*=' form-group'].margin-0 [class^='form-group'],
  [class*=' form-group'].margin-0 [class*=' form-group'] {
    margin-left: 0;
    margin-right: 0; }
  .commPage{
  margin: 20px 0 20px 0;
  }
  .commPage li{
  display: inline-block;
  padding-left: 8px;
  padding-right: 8px;
  border-left:1px solid #c2c2c2;
  }
  .commPage li:nth-child(1){
  border: none;
  }
  .commPage .now{
  background-color: #e2e2e2;
  }
</style>
</head>
<body>

<div id="include_header" ></div>
<br><br><br><br>

<div class="container">
	
	<c:if test="${category=='qna' }">
    <h2>Q&A게시판</h2>
    <hr />
    </c:if>
    
    <c:if test="${category=='review'}">
    <h2>리뷰게시판</h2>
    <hr />
    </c:if>

    <div class="method">
    <!-- 글쓰기 버튼 -->
    <c:if test="${sessionScope.memVO ne null}"> 
    <div class="btn-toolbar">
    	<button class="btn" onClick="goWrite('${nowPage}', '${category }')">글쓰기</button>
	</div><br>
    </c:if>
        <div class="row margin-0 list-header hidden-sm hidden-xs">
            <div class="col-md-2"><div class="header">No</div></div>
            <div class="col-md-4"><div class="header">제목</div></div>
            <div class="col-md-3"><div class="header">작성자</div></div>
            <div class="col-md-2"><div class="header">작성일</div></div>
            <div class="col-md-1"><div class="header">조회수</div></div>
        </div>
        <!-- 리스트 내용 -->
        <c:forEach var="vo" items="${list}" varStatus="st">
        <div class="row margin-0">
	            <div class="col-md-2">
	                <div class="cell">
	                    <div class="propertyname">
						${rowTotal - ((nowPage-1) * blockList + st.index) }
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="cell">
	                    <div class="type">
	                        <div class="propertyname">
	                        <c:if test="${category == 'qna' }">
		                        <%-- 들여쓰기 반복문 --%>
									<c:forEach begin="1" end="${vo.step }">
										<c:out value="&nbsp;&nbsp;" escapeXml="flase"/>
									</c:forEach>
									<%-- step이 0이 아닐때 화살표 이미지 출력 --%>
									<c:if test="${vo.step ne 0 }">
										<img src="resources/images/hsp.png"/>
									</c:if>
									
								<c:if test="${vo.status == 2 }">
									삭제된 게시글입니다.
								</c:if>
								<c:if test="${vo.status == 0 }">
									<a href="javascript:location.href='boardview.inc?b_idx=${vo.b_idx }&nowPage=${nowPage}'">${vo.subject }</a>
								</c:if>
							</c:if>
							
							<c:if test="${category == 'review' }">
								<a href="javascript:location.href='boardview.inc?b_idx=${vo.b_idx }&nowPage=${nowPage}'">
								${vo.subject }
								<c:if test="${vo.c_count > 0}">
									&nbsp;(${vo.c_count })
								</c:if>	
								</a>
							</c:if>
	                    	</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="cell">
	                    <div class="propertyname">
								${vo.mvo.name }
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-2">
	                <div class="cell">
	                   <div class="propertyname">
	                        ${fn:substring(vo.write_date, 0, 10) }
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-1">
	                <div class="cell">
	                    <div class="description">
	                        ${vo.hit }
	                    </div>
	                </div>
	            </div>
	             <div class="col-md-2">
	                <div class="cell">
	                    <div class="propertyname">
	                    <c:if test="${empty list }">
							등록된 게시물이 없습니다.
						</c:if>
	                    </div>
	                </div>
	             </div>
	        </div>
	    </c:forEach>
        <!-- 리스트 내용 끝 -->
    </div>
    
    <!-- 페이징 -->
    <div class="commPage">
       <ul>
           ${pageCode }
       </ul>
   </div>
   <br><br>
</div>

<div id="include_footer"></div>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#include_header").load("header.inc");
	$("#include_footer").load("footer.inc");
});

function goWrite(nowPage, category) {
	location.href="writeForm.inc?nowPage=" + nowPage + "&category=" + category;
}
</script>
</body>
</html>