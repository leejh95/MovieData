<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css">
</head>
<body>
	<div id="test">
		<p>1234</p>
	</div>

    <script src="resources/js/jquery-3.4.1.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
    	
    	$("#test").dialog();
    });
    </script>
</body>
</html>