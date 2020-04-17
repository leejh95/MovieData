<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bt{
	margin-left: 17px;
}
</style>
</head>
<body>

<div id="include_header" ></div>
<br><br><br><br>

<div class="container">
   <div class="row">
   <input type="hidden" id="m_idx" value="${vo.m_idx }">
    <div class="col-md-8">
      <section>     
        <h1 class="entry-title"><span>${vo.name }님의 프로필</span> </h1>
        <hr>
       <form class="form-horizontal" method="post" name="update" id="update">
       
       <div class="form-group">
          <label class="control-label col-sm-3">이름 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="name" id="name" placeholder="이름" value="${vo.name }">
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">Email <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="email" class="form-control" name="email" id="email" placeholder="Email" value="${vo.email }">
                </div>
            </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">전화번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
             <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
            <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone" value="${vo.phone }">
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input type="button" value="수정완료" onclick="updateProfile(this.form)" class="btn btn-primary bt">
          </div>
        </div>
      </form>
      </section>
    </div>

	 
    <div class="col-md-8">
      <section>     
      <c:if test="${vo.sns_id eq null }">
       <hr>
       <form class="form-horizontal" method="post" name="updatePw" id="updatePw">
        <div class="form-group">
          <label class="control-label col-sm-3">새로운 비밀번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호 (5-20자 이내)" value="">
           </div>   
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-4">새로운 비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="pw2" id="pw2" placeholder="비밀번호 (5-20자 이내)" value="">
           </div>   
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input type="button" value="변경하기" onclick="updatePW(this.form)" class="btn btn-primary bt">
          </div>
        </div>
        </c:if>
        <c:if test="${vo.sns_id ne null }">
        </c:if>
      </form>
      </section>
    </div>
    
    <div class="col-md-8">
      <section>     
       <hr>
       <form class="form-horizontal" method="post" name="delete" id="delete">
       
       <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호 (5-20자 이내)" value="">
           </div>   
          </div>
        </div>
        
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input type="button" value="탈퇴" onclick="deleteMem(this.form)" class="btn btn-primary bt">
          </div>
        </div>
      </form>
      </section>
    </div>
</div>
</div>

<div id="include_footer"></div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#include_header").load("header.inc");
		$("#include_footer").load("footer.inc");
	});

	function updateProfile(frm){
		//유효성 검사 필요없
		var b = confirm("수정하시겠습니까?");
		
		if(b){
			var name = frm.name.value;
			var email = frm.email.value;
			var phone = frm.phone.value;
			var m_idx = document.getElementById("m_idx").value;
			
			$.ajax({
				url : "edit_profile.inc",
				type : "post",
				data : "name="+encodeURIComponent(name)+
				"&email="+encodeURIComponent(email)+
				"&phone="+encodeURIComponent(phone)+
				"&m_idx="+encodeURIComponent(m_idx),
				dataType: "json"
			}).done(function(data) {
				if(data.chk)
					alert("수정완료");
				else
					alert("수정실패!!");
			}).fail(function(err) {
				console.log(err);
			});
		}
	}
	
	function updatePW(frm){
		if(frm.pw.value.trim().length <= 0){
			alert("비밀번호를 입력해주세요");
			frm.pw.value = "";
			frm.pw.focus();
			return
		}
		if(frm.pw2.value.trim().length <= 0){
			alert("비밀번호 확인을 입력해주세요");
			frm.pw2.value = "";
			frm.pw2.focus();
			return
		}
		if(!(frm.pw.value==frm.pw2.value)){
			console.log(frm.pw.value);
			console.log(frm.pw2.value);
			alert("두 비밀번호가 일치하지 않습니다!");
			frm.pw2.focus();
			return
		}
		
		var b = confirm("변경하시겠습니까?");
		
		if(b){
			var pw = frm.pw.value;
			var m_idx = document.getElementById("m_idx").value;
			
			$.ajax({
				url : "edit_pw.inc",
				type : "post",
				data : "pw="+encodeURIComponent(pw)+
				"&m_idx="+encodeURIComponent(m_idx),
				dataType: "json"
			}).done(function(data) {
				if(data.chk)
					alert("비밀번호 변경완료");
				else
					alert("비밀번호 변경실패!!");
			}).fail(function(err) {
				console.log(err);
			});
		}
		
	}
	
	function deleteMem(frm){
		
		if(frm.pw.value.trim().length <= 0){
			alert("비밀번호를 입력해주세요");
			frm.pw.value = "";
			frm.pw.focus();
			return
		}
		
		var b = confirm("탈퇴하시겠습니까?");
		
		if(b){
			var pw = frm.pw.value;
			var m_idx = document.getElementById("m_idx").value;
			
			console.log(pw);
			console.log(m_idx);
			
			$.ajax({
				url : "delete_member.inc",
				type : "post",
				data : "pw="+encodeURIComponent(pw)+
					"&m_idx="+encodeURIComponent(m_idx),
				dataType: "json"
			}).done(function(data) {
				if(data.chk == "1")
					location.href = "index.inc";
				else
					alert("비밀번호가 일치하지 않습니다.");
			}).fail(function(err) {
				console.log(err);
			});
		}
		
	}
</script>
</body>
</html>