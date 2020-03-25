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
						id="signup" enctype="multipart/form-data" action="signUpForm.inc">
						
						<div class="form-group">
							<label class="control-label col-sm-3">ID <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<input type="text" class="form-control" name="id" id="signup_id"
									placeholder="ID">
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
									<input type="password" class="form-control" name="pw" id="signup_pw"
										placeholder="비밀번호 (4-20자 이내)">
									<span id="pw_span"></span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">이름 <span
								class="text-danger">*</span></label>
							<div class="col-md-8 col-sm-9">
								<input type="text" class="form-control" name="name" id="signup_name"
									placeholder="이름">
								<span id="name_span"></span>
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
										placeholder="korea@korea.com">
								</div>
								<span id="email_span"></span>
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
										placeholder="01011112222" onKeyPress="return checkNum(event)">
								</div>
								<span id="phone_span"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-3 col-xs-10">
								<input name="Submit" type="button" value="가입" disabled="disabled" id="submit"
									class="btn btn-primary" onclick="signUp(this.form)">
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			$("#signup_id").keyup(function(key) {
				
				var id = $("#signup_id").val().trim();
				var pw = $("#signup_pw").val().trim();
				
				if(id.length > 0){
					
					
					var param = "id=" + encodeURIComponent(id);
					
					$.ajax({
						url : "signUpKey.inc",
						type : "post",
						data : param,
						dataType: "json"
					}).done(function(data) {
						if(data.chk){
							$("#id_span").html("<font color='red'>이미 사용중인 아이디입니다.</font>");
							$("#submit").attr("disabled", "disabled");
						}else{
							$("#id_span").html("<font color='green'>사용하실 수 있는 아이디입니다.</font>");
							if(pw.length > 3 && pw.length < 21)
								$("#submit").removeAttr("disabled");
						}
					}).fail(function(err) {
						console.log(err);
					});
				}else{
					$("#id_span").html("");
					$("#submit").attr("disabled", "disabled");
				}
			
			});
			
			$("#signup_pw").keyup(function(key) {
				
				var id = $("#signup_id").val().trim();
				var pw = $("#signup_pw").val().trim();
				
				if(pw.length > 3 && pw.length < 21 && id.length > 0){
					if($("#id_span>font").attr("color") == "green")
						$("#submit").removeAttr("disabled");
				}else{
					$("#pw_span").html("");
					$("#submit").attr("disabled", "disabled");
				}
			
			});
			
			$("#signup_name").keyup(function(key) {
				$("#name_span").html("");	
			});
		});
		
		function signUp(frm){
			var email = frm.email.value;
			var phone = frm.phone.value;
			var name = frm.name.value;
			
			if(name.length <= 0){
				$("#name_span").html("<font color='red'>이름을 입력해주세요.</font>");
				return
			}
			
			if(email.length > 0){
				var i = email.indexOf("@");
				var str1 = email.substring(0, i);
				var str2 = email.substring(i+1);
				
				if(i < 0 || str1.length < 1 || str2.length <1){
					$("#email_span").html("<font color='red'>이메일 형식에 문제가 있습니다.</font>");
					return
				}else
					$("#email_span").html("");
			}
			
			if(phone.length > 0){
				if(phone.length != 11){
					$("#phone_span").html("<font color='red'>전화번호 형식에 문제가 있습니다.</font>");
					return
				}else{
					$("#phone_span").html("");
				}
			}
			
			var b = confirm("가입하시겠습니까?");
			if(b)
				document.signup.submit();
		}
		
		function checkNum(e) {
	        var keyVal = event.keyCode;
	 
	        if(((keyVal >= 48) && (keyVal <= 57))){
	        	$("#phone_span").html("");
	            return true;
	        }
	        else{
	        	$("#phone_span").html("<font color='red'>숫자만 입력해주세요.</font>");
	            return false;
	        }
	    }

	</script>
</body>
</html>