<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#menu_bar").load("menu.jsp");
		$("#left_menu").load("myPage_menu.jsp");
		$("#right_content").load("myBoard.jsp");
		$("#footer").load("footer.jsp");
 	});
</script>
</body>
</html>