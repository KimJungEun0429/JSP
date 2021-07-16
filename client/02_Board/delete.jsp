<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@page import = "java.sql.*" %>

<%
	String strIDX = request.getParameter("idx");
	Connection con = null;
	Statement stmt = null;

	String userID = "JSP";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	stmt = con.createStatement();
	
	String strSql = "DELETE FROM BOARD WHERE IDX=" + strIDX;
	
	stmt.execute(strSql);
	
	con.close();
	
	response.sendRedirect("./list.jsp");
%>