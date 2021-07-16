<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.sql.*" %>
	<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>    
    <% 
    
		String strUserID = (String)session.getAttribute("userID");
		    
		    if(strUserID == null){
		    	
		    	response.sendRedirect("../index.jsp");
		    }
    
    	String selectedMenuID = request.getParameter("selectedMenuID");
		String strIDX = request.getParameter("idx");
		
		String strParam = "?idx=" + strIDX + "&selectedMenuID=" + selectedMenuID;
		
		request.setCharacterEncoding("UTF-8");

		String strIdx = request.getParameter("idx");
		System.out.print(strIdx);

		String[] dbInfos = new String[3];
		dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
		dbInfos[1] = "JSP";
		dbInfos[2] = "1";
		
		DBConn.setDBInfo(dbInfos);
		
		String strProcName = "{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}";
		String [] strParams = new String[2];
		strParams[0] = "LIST";
		strParams[1] = strIdx;
		
		ResultSet rs = DBConn.getResultSet(strProcName, strParams);
		
		rs.next();
		//response.sendRedirect("./list.jsp");
		
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="../../Css/board.css" />
	<script src="../../JS/board2.js"></script>	
	
	<script>
	
		function goDel(strParam){
			location.href="./delete.jsp" + strParam;
			//추천하지않는방법 a태그로 만들던지 sumit으로 만드는것추천
		}
	</script>
	
</head>
<body onload="getMenus();">
	<div id = "wrap">
	
		<div id= "menus">
			<span></span>
		</div>
		<div id="bWrite">
			<div id="bHead">
				<div></div>
				<div>
					<!--<input type="button" value="글쓰기" onclick="goWrite()"/>-->
				</div>
			</div>
			<div id="bBody">
				<input type="button" value="삭제" onclick="goDel('<%=strParam%>')"/>
				<a href="./delete.jsp<%=strParam%>">삭제</a>
				
			</div>
			<div id="writeForm">
					<form action="list.jsp" method="post">
						<div>
							<span class="left">글제목</span>
							<span class="right">
								<input type="text" name="title" value="<%=rs.getString("TITLE") %>"readonly />
							</span>
						</div>
						<div>
							<span class="left">글내용</span>
							<span class="right">
								<textarea name="content" cols="60" rows="12" readonly><%=rs.getString("CONTENTS") %></textarea>
							</span>
						</div>
						<div>
							<span>메뉴아이디</span>
							<span><input type="text" name="selectedMenuID" value="<%=selectedMenuID%>" readonly /></span>
						</div>
						<div>
							<span>작성자</span>
							<span><input type="text" name="userID" value=<%=strUserID%> readonly></span>
						</div>
						<div>
							<input type="submit" value="목록" />
						</div>
					</form>
			
			<div id="bBottom">
				
			</div>
		</div>
	</div>
</body>
</html>