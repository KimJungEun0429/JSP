<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
	<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<!DOCTYPE html>
<%

	String strIDX = request.getParameter("idx");
	String strselectedMenuID = request.getParameter("selectedMenuID");

	//글삭제 db에서 하기
		String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "JSP";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
	
	String strProcName = "{call PKG_BOARD.PROC_BOARDS_DEL(?)}";
	String [] strParams = new String[1];
	strParams[0] = strIDX;
	
	DBConn.executeQuery(strProcName, strParams);
	
	response.sendRedirect("./list.jsp?selectedMenuID=" + strselectedMenuID);

%>