<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.sql.*" %>

    <%
    
    String strIDX = request.getParameter("idx");
    
    String strTitle = request.getParameter("title");
    String strContents = request.getParameter("contents");
    String strMemID = "Mem001";
    String strMenuID = "M001";
    
    Connection con = null;
	CallableStatement csmt = null;
	ResultSet rs = null;
	
	
	String userID = "JSP";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARDS_UPD(?,?,?)}");
	
	csmt.setString(1, strIDX);
	csmt.setString(2, strTitle);
	csmt.setString(3, strContents);
	
	System.out.println(strIDX);
	System.out.println(strTitle);
	System.out.println(strContents);
	
	csmt.executeQuery();
	
	con.close();
	
	response.sendRedirect("./list.jsp");
    %>