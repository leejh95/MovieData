<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<div class="container">
   <div class="row">
   <input type="hidden" id="m_idx" value="${vo.m_idx }">
    <div class="col-md-8">
      <section>     
        <h1 class="entry-title"><span>${vo.id }님의 프로필</span> </h1>
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
            <input type="button" value="수정완료" onclick="updateProfile(this.form)" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
    
    <div class="col-md-8">
      <section>     
       <hr>
       <form class="form-horizontal" method="post" name="updatePW" id="updatePW">
       
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
          <label class="control-label col-sm-3">새로운 비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="pw2" id="pw2" placeholder="비밀번호 (5-20자 이내)" value="">
           </div>   
          </div>
        </div>
        
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input type="button" value="변경하기" onclick="updatePW(this.form)" class="btn btn-primary">
          </div>
        </div>
      </form>
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
            <input type="button" value="탈퇴" onclick="deleteMem(this.form)" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
</div>
</div>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
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
		if(!frm.pw.value.equals(frm.pw2.value)){
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
			
			$.ajax({
				url : "delete_member.inc",
				type : "post",
				data : "pw="+encodeURIComponent(pw)+
					"&m_idx="+encodeURIComponent(m_idx),
				dataType: "json"
			}).done(function(data) {
				if(data.chk)
					location.href = "index.inc";
				else
					alert("비밀번호 변경실패!!");
			}).fail(function(err) {
				console.log(err);
			});
		}
		
	}
</script>
</body>
</html>