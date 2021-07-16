<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <%@ page import="java.io.PrintWriter" %>
 <jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page" />
 
 <%
 
 	String steMenuID = request.getParameter("menuid");
 
	String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "board";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "SELECT * FROM BOARDS WHERE MENUID='" + steMenuID + "'";
	
	ResultSet rs = DBConn.getResultSet(strSql);
	
	String strXML = "<?xml version='1.0'?>";
	
	strXML += "<rows>";
	while(rs.next()){
		strXML += "<row>";
		strXML += "<bnum>";	
		strXML += rs.getString("BNUM");
		strXML += "</bnum>";
		strXML += "<title>";	
		strXML += rs.getString("TITLE");
		strXML += "</title>";
		strXML += "</row>";
	}
	strXML += "</rows>";
	
	//http를 활용해서 출력을하면 된다.
	response.setContentType("text/xml");
	
 PrintWriter writer = response.getWriter();
 writer.print(strXML);
 
 
 
 %>