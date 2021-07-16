<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%@ page import="java.io.PrintWriter" %>
	      
	      
	<%
	
	String steMenuID = request.getParameter("menuid");
	
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "JSP";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
	
	
	String strSql = "SELECT * FROM BOARDS WHERE MENUID='" + steMenuID + "'";
	
	ResultSet rs = DBConn.getResultSet(strSql);
		
	String strXML = "<?xml version='1.0'?>";
	strXML += "<rows>";
	//root엘리먼트
	while(rs.next()){
		strXML += "<row>";
		strXML += "<idx>";
		strXML += rs.getString("IDX");
		strXML += "</idx>";
		strXML += "<bnum>";
		strXML += rs.getString("BNUM");
		strXML += "</bnum>";
		strXML += "<title>";
		strXML += rs.getString("TITLE");
		strXML += "</title>";
		strXML += "</row>";
	}
	strXML += "</rows>";
	
	 response.setContentType("text/xml"); //; charset=utf-8");
	 PrintWriter writer = response.getWriter();
	 writer.print(strXML);

	%>