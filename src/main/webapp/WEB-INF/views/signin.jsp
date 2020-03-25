<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="css/style.css">

    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <title>로그인</title>
</head>
<body>
	<main class="login-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">

						<div class="card-header">Login</div>

						<div class="card-body">
							<form action="signInForm.inc" method="post">
								<div class="form-group row">
									<label for="email_address"
										class="col-md-4 col-form-label text-md-right">ID</label>
									<div class="col-md-6">
										<input type="text" id="id" class="form-control" name="id"
											required autofocus>
									</div>
								</div>

								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right">Password</label>
									<div class="col-md-6">
										<input type="password" id="pw" class="form-control" name="pw"
											required>
									</div>
								</div>
								
								<div class="col-md-6 offset-md-4">
									<c:if test="${isFailed}">
										<font color="red">아이디 또는 비밀번호가 올바르지 않습니다.</font><br><br>
									</c:if>
									<button type="submit" class="btn btn-primary">로그인</button>
								</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</main>

</body>
</html>