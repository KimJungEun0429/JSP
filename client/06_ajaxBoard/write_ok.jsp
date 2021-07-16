<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
	<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
	
<%
	request.setCharacterEncoding("UTF-8");
//리퀘스트쪽에 인코딩 방식을 정하는 것. response쪽은 미리 셋팅이 되어있으나 request쪽은 안되있으므로 추가해줘야함
	String strTitle = request.getParameter("title");
	String strContent = request.getParameter("content");
	String strSelectedMenuID = request.getParameter("selectedMenuID");
	String strMemID = "Mem001"; 

	String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "JSP";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
	
	String strProcName = "{call PKG_BOARD.PROC_BOARD_INS(?,?,?,?)}";
	String [] strParams = new String[4];
	strParams[0] = strTitle;
	strParams[1] = strContent;
	strParams[2] = strMemID;
	strParams[3] = strSelectedMenuID;
	
	DBConn.executeQuery(strProcName, strParams);
	
	response.sendRedirect("./list.jsp");
	

%>