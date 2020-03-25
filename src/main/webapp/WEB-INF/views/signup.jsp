<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<section>
					<h1 class="entry-title">
						<span>회원가입</span>
					</h1>
					<hr>
					<form class="form-horizontal" method="post" name="signup"
						id="signup" enctype="multipart/form-data">
						
						<div class="form-group">
							<label class="control-label col-sm-3">ID <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<input type="text" class="form-control" name="id" id="signup_id"
									placeholder="ID" required="required">
								<span id="id_span"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">비밀번호 <span
								class="text-danger">*</span></label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-lock"></i>
									</span> 
									<input type="password" class="form-control" name="pw" id="pw"
										placeholder="비밀번호 (5-20자 이내)" required="required">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">이름 <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<input type="text" class="form-control" name="name" id="name"
									placeholder="이름" required="required">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">Email </label>
							<div class="col-md-8 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-envelope"></i>
									</span> 
									<input type="email" class="form-control" name="email" id="email"
										placeholder="Email" required="required">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">전화번호 </label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-phone"></i>
									</span> 
									<input type="text" class="form-control" name="phone" id="phone"
										placeholder="Phone">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-3 col-xs-10">
								<input name="Submit" type="button" value="가입"
									class="btn btn-primary" onclick="signUp(this.form)">
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			
			$("#signup_id").keydown(function(key) {
				var len = $("#signup_id").val().trim().length
				
				$.ajax({
					url : "signUpKey.inc",
					type : "post",
					data : "?len="+encodeURIComponent(len),
					dataType: "json"
				}).done(function(data) {
					if(data.chk)
						alert("수정완료");
					else
						alert("수정실패!!");
				}).fail(function(err) {
					console.log(err);
				});
			
			});
		})
		
		function signUp(frm){
			
		}
	</script>
</body>
</html>