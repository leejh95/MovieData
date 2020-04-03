<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

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
</style>
</head>
<body>


<div class="container">
	
	<c:if test="${category=='free' }">
    <h2>자유게시판</h2>
    <hr />
    </c:if>
    
    <c:if test="${category=='review'}">
    <h2>리뷰게시판</h2>
    <hr />
    </c:if>

    <div class="method">
    <!-- 글쓰기 버튼 -->
    <div class="btn-toolbar">
    	<button class="btn" onClick="javascript:location.href='writeForm.inc?nowPage=${nowPage}&category=${category }'">글쓰기</button>
	</div>
    
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
	                        <c:if test="${category == free }">
	                        <%-- 들여쓰기 반복문 --%>
								<c:forEach begin="1" end="${vo.step }">
									<c:out value="&nbsp;&nbsp;" escapeXml="flase"/>
								</c:forEach>
								<%-- step이 0이 아닐때 화살표 이미지 출력 --%>
								<c:if test="${vo.step ne 0 }">
									<img src="resources/images/arrow.JPG"/>
								</c:if>
							</c:if>
							<c:if test="${vo.status == 1 }">
								삭제된 게시글
							</c:if>
							<c:if test="${vo.status == 0 }">
								<a href="javascript:goBoardView('${vo.b_idx }', '${nowPage}')">${vo.subject }</a>
							</c:if>
	                    	</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="cell">
	                    <div class="propertyname">
							<c:if test="${vo.status == 0 }">
								${vo.mvo.name }
							</c:if>	
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
    <div class="pagination">
       <ul>
           ${pageCode }
       </ul>
   </div>
   
</div>
</body>
</html>