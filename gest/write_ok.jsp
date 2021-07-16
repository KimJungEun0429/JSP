<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
	<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%

	String strID = request.getParameter("id");
	String strTITLE = request.getParameter("title");
	//값을 받아서 db에 저장한다.
	String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "JSP";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "INSERT INTO GUEST(ID,TITLE)";
	strSql += "VALUES('" + strID + "')";
	strSql += "'" + strTITLE + "')";
	
	DBConn.executeQuery(strSql);
	
	response.sendRedirect("./list.jsp");
	//서버에서 이 페이지로 돌려버린다. 클라이언트한테 안돌아가는 이유

%>