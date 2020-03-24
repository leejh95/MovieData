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
    <div class="col-md-8">
      <section>     
        <h1 class="entry-title"><span>${vo.id }님의 프로필</span> </h1>
        <hr>
       <form class="form-horizontal" method="post" name="update" id="update" action="profileForm.inc">
       
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
            <input type="button" value="수정완료" onclick="update(this.form)" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
    
    <div class="col-md-8">
      <section>     
       <hr>
       <form class="form-horizontal" method="post" name="update" id="update" action="profileForm.inc">
       
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
              <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호 (5-20자 이내)" value="">
           </div>   
          </div>
        </div>
        
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input type="button" value="변경하기" onclick="update(this.form)" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
    
    <div class="col-md-8">
      <section>     
       <hr>
       <form class="form-horizontal" method="post" name="update" id="update" action="edit_profile.inc">
       
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
          <label class="control-label col-sm-3">비밀번호 확인 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호 (5-20자 이내)" value="">
           </div>   
          </div>
        </div>
        
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input type="button" value="탈퇴" onclick="update(this.form)" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
</div>
</div>
<script type="text/javascript">
	function update(frm){
		//유효성 검사 필요없
		
	}
</script>
</body>
</html>