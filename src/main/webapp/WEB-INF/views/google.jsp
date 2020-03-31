<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<meta name = "google-signin-client_id"content = "887841589622-j1dblm1i54bkud8gji6a2nm4dv6k778f.apps.googleusercontent.com">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <title>로그인</title>
</head>
<body>
	<form action="googlelogin.inc" method="post" name="googleform" id="googleform">
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<input type="hidden" name="name" id="name"/>
	<input type="hidden" name="email" id="email"/>
	<input type="hidden" name="sns_id" id="sns_id"/>
	<input type="hidden" name="sns_type" id="sns_type"/>
	</form>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  $("#sns_id").val(profile.getId());
	  $("#name").val(profile.getName());
	  $("#email").val(profile.getEmail());
	  $("#sns_type").val("google");
	  
	  $("#googleform").submit();
	}
	

</script>
</body>
</html>