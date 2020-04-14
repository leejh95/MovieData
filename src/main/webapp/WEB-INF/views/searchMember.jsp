<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

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
	
<div class="container" style="width: 1000px; margin-left: 0; box-shadow: 0px 5px 5px 1px gray; background-color: white; padding:">
	<div>
		<div id="searchDiv">
			<select name="searchType">
				<option value="0" >이름</option>
				<option value="1">아이디</option>
			</select>
			<input type="text" name="searchValue"/>
			<button onclick="searchMem('1')">검색</button>
		</div>
	</div>
	<c:if test="${list ne null }">
    <div class="method">
        <div class="row margin-0 list-header hidden-sm hidden-xs" style="margin-top: 20px;">
            <div class="col-md-2"><div class="header">No</div></div>
            <div class="col-md-2"><div class="header">ID</div></div>
            <div class="col-md-2"><div class="header">이름</div></div>
            <div class="col-md-3"><div class="header">가입일</div></div>
            <div class="col-md-3"><div class="header">관리</div></div>
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
	            <div class="col-md-2">
	                <div class="cell">
	                    <div class="type">
	                    <c:if test="${vo.id eq null}">
	                        <div class="propertyname">
	                        	${vo.email }
	                    	</div>
	                    </c:if>
	                    <c:if test="${vo.id ne null}">
	                        <div class="propertyname">
	                        	${vo.id }
	                    	</div>
	                    </c:if>		
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-2">
	                <div class="cell">
	                    <div class="propertyname">
							${vo.name }
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="cell">
	                   <div class="propertyname">
	                        ${vo.reg_date.substring(0, 10) }
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="cell">
	                <c:if test="${vo.status eq 0 && vo.sns_id eq null}">
	                    <div class="description">
	                        <input type="button" value="정지" onclick="memStop('${vo.m_idx }','${vo.pw }','${nowPage }')" />
	                    </div>
	                </c:if>
	                <c:if test="${vo.status eq 1 && vo.sns_id eq null}">
	                    <div class="description">
	                        <input type="button" value="복구" onclick="memRestore('${vo.m_idx }','${nowPage }')"/>
	                    </div>
	                </c:if>      
	                </div>
	            </div>
	             <c:if test="${empty list }">
	             <div class="col-md-2">
	                <div class="cell">
	                    <div class="propertyname">
								가입된 회원이 없습니다.
	                    </div>
                	</div>
	             </div>
	             </c:if>
	        </div>
	    </c:forEach>
        <!-- 리스트 내용 끝 -->
    </div>
    
    
    <div class="pagination">
       <ul>
           ${pageCode }  
       </ul>
   </div>
   </c:if>
</div>
</body>
</html>