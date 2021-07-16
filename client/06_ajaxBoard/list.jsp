<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    //로그인이 되어 있는지 판단
    String strUserID = (String)session.getAttribute("userID");
    
    if(strUserID == null){
    	
    	response.sendRedirect("../index.jsp");
    }
    	String selecteMenuID = request.getParameter("selecteMenuID");
    
    if(selecteMenuID == null){
    	selecteMenuID = "M001";
    	
    }//참조없음 = null이고 string는 객체이고 값이 없는 것이 아니라 참조를 하지 않는 것임 콜 바이 레퍼런스여서
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<link rel="stylesheet" href="../../Css/board.css" />
	<script src="../../JS/board.js"></script>
	
	<script>
	var clickMenuID = "";//이 값을 어떻게 찾을것이냐
	
	function goWrite(){
		
		location.href = "./write.jsp?MenuID=" + clickMenuID;
		//GET방식으로 보낼때 ""하면 안된다 띄워쓰기해서 보내고 싶으면 POST로 보내시오
	}
	
	</script>

</head>
<body onload="getMenus('<%=selecteMenuID%>');">
	<div id = "wrap">
	
		<div id= "menus">
			<span></span>
		</div>
		<div id="boards">
			<div id="bHead">
				<div></div>
				<div>
					<input type="button" value="글쓰기" onclick="goWrite()"/>
				</div>
			</div>
			<div id="bBody">
			</div>
			<div id="bBottom">
				
			</div>
		</div>
	</div>
</body>
</html>