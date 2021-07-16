<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
	<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
	      <%@ page import="java.io.PrintWriter" %>
	      
	      
	<%
	String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "JSP";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "SELECT * FROM MENUS ORDER BY MENUID";
	
	ResultSet rs = DBConn.getResultSet(strSql);
	
	String strXML = "<?xml version='1.0'?>";
	strXML += "<menus>";
	//root엘리먼트
	while(rs.next()){
		strXML += "<menu>";
		strXML += "<menuid>";
		strXML += rs.getString("MENUID");
		strXML += "</menuid>";
		strXML += "<menuname>";
		strXML += rs.getString("MENUNAME");
		strXML += "</menuname>";
		strXML += "</menu>";
	}
	strXML += "</menus>";
	
	 response.setContentType("text/xml"); //; charset=utf-8");
	 PrintWriter writer = response.getWriter();
	 writer.print(strXML);
	
	 %>