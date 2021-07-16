<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="../Css/board.css" />
	<script src="../JS/board.js"></script>	
	
</head>
<body onload="getMenus();">
	<div id = "wrap">
	
		<div id= "menus">
			<span></span>
		</div>
		<div id="boards">
			<div id="bHead">
				<div></div>
				<div>
					<!--<input type="button" value="글쓰기" onclick="goWrite()"/>-->
				</div>
			</div>
			<div id="bBody">
				<div id="writeForm">
					<form action="" method="">
					
					</form>
				</div>
			</div>
			<div id="bBottom">
				
			</div>
		</div>
	</div>
</body>
</html>