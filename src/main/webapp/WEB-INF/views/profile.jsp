<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Insert title here</title>
	<!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="resources/style.css">
</head>
<body>

<div id="include_header" ></div>
<br><br><br><br>

<div class="container">
   <section>     
        <h1><span>${vo.name }님의 프로필</span> </h1>
        <br/><br/>
    <h4>프로필 수정</h4><br/>
    <form method="post" name="update" id="update">
    <input type="hidden" id="m_idx" value="${vo.m_idx }"/>
            <div class="col-12">
                <div class="group">
                    <input type="text" name="name" id="name" value="${vo.name }" placeholder="이름">
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>이름</label>
                </div>
			<div class="col-12">
		            <div class="group">
		                <input type="text" name="email" id="email" value="${vo.email }" placeholder="e-mail">
		                <span class="highlight"></span>
		                <span class="bar"></span>
		                <label>e-mail</label>
		            </div>
			</div>
			<div class="col-12">
			        <div class="group">
			            <input type="text" name="phone" id="phone" value="${vo.phone }" placeholder="phone">
			            <span class="highlight"></span>
			            <span class="bar"></span>
			            <label>Phone</label>
			        </div>
			</div>
			
					<div class="group">
						<button onclick="updateProfile(this.form)" class="btn original-btn">수정</button>
					</div>
				</div>
      </form>
      </section>
	
      <section>     
      
		<c:if test="${vo.sns_id eq null }">
       <br/>
       <h4>비밀번호 변경</h4><br/>
       <form method="post">
       <input type="hidden" id="password" value="${vo.pw }"/>
       <div class="col-12">
		        <div class="group">
		            <input type="text" name="pw1" id="pw1" placeholder="비밀번호">
		            <span class="highlight"></span>
		            <span class="bar"></span>
		            <label>기존 비밀번호</label>
		        </div>
		</div>
			<div class="col-12">
		        <div class="group">
		            <input type="text" name="pw2" id="pw2" placeholder="비밀번호 (5-20자 이내)">
		            <span class="highlight"></span>
		            <span class="bar"></span>
		            <label>새로운 비밀번호</label>
		        </div>
			</div>
			
			<div class="col-12">
		        <div class="group">
		            <input type="text" name="pw3" id="pw3" placeholder="비밀번호 (5-20자 이내)">
		            <span class="highlight"></span>
		            <span class="bar"></span>
		            <label>새로운 비밀번호 재입력</label>
		        </div>
			</div>
			
				<div class="group">
					<button type="button" onclick="updatePW(this.form)" class="btn original-btn">변경</button>
				</div>
			</form>
       	</c:if>
        <c:if test="${vo.sns_id ne null }">
        </c:if>
      </section>

      <section>     
       <br/>
       <h4>회원탈퇴</h4><br/>
       <form  method="post" name="delete" id="delete">
       
       <div class="col-12">
		        <div class="group">
		            <input type="text" name="pw4" id="pw4" placeholder="">
		            <span class="highlight"></span>
		            <span class="bar"></span>
		            <label>비밀번호</label>
		        </div>
		</div>
		<div class="group">
			<button onclick="deleteMem(this.form)" class="btn original-btn">탈퇴</button>
		</div>
      </form>
      </section>
</div>

<div id="include_footer"></div>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
    
<script type="text/javascript">

	$(function(){
		$("#include_header").load("header.inc");
		$("#include_footer").load("footer.inc");
	});

	function updateProfile(frm){
		
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
				if(data.chk) {
					alert("수정 완료되었습니다.");
					location.href="profile.inc?m_idx="+m_idx;
				} else {
					alert("수정에 실패했습니다.");
				}
			}).fail(function(err) {
				console.log(err);
			});
		}
	}

	function updatePW(frm){
		
		var password = document.getElementById("password").value;
		
		if(frm.pw1.value.trim().length <= 0){
			alert("기존 비밀번호를 입력해주세요");
			frm.pw1.value = "";
			frm.pw1.focus();
			return
		}
		if(frm.pw2.value.trim().length <= 0){
			alert("새로운 비밀번호를 입력해주세요.");
			frm.pw2.value = "";
			frm.pw2.focus();
			return
		}
		if(frm.pw3.value.trim().length <= 0){
			alert("새로운 비밀번호를 재입력해주세요.");
			frm.pw3.value = "";
			frm.pw3.focus();
			return
		}
		if(!(frm.pw1.value==password)){
			alert("기존 비밀번호가 일치하지 않습니다.");
			frm.pw.focus();
			return
		}
		if(!(frm.pw2.value==frm.pw3.value)){
			alert("새로운 비밀번호가 일치하지 않습니다.");
			frm.pw2.focus();
			return
		}
		
		var b = confirm("변경 하시겠습니까?");	
		
		if(b){
			var m_idx = $("#m_idx").val();
			var pw = $("#pw2").val();
			
			$.ajax({
				url : "edit_pw.inc",
				type : "post",
				data : "pw="+encodeURIComponent(pw)+
				"&m_idx="+encodeURIComponent(m_idx),
				dataType: "json"
			}).done(function(data) {
				if(data.chk){
					alert("비밀번호 변경 완료되었습니다.");
					location.href="profile.inc?m_idx="+m_idx;
				}
				else{
					alert("비밀번호 변경에 실패했습니다.");
				}	
			}).fail(function(err) {
				console.log(err);
			});
		}
		
	}	
	function deleteMem(frm){
		
		if(frm.pw4.value.trim().length <= 0){
			alert("비밀번호를 입력해주세요");
			frm.pw.value = "";
			frm.pw.focus();
			return
	}
		
		var b = confirm("탈퇴하시겠습니까?");
		
		if(b){
			var pw4 = frm.pw4.value;
			var m_idx = document.getElementById("m_idx").value;
			
			$.ajax({
				url : "delete_member.inc",
				type : "post",
				data : "pw="+encodeURIComponent(pw4)+
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