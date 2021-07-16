<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import = "java.sql.*" %>

    <%
    
    String strTitle = request.getParameter("title");
    //아이디가 아니라 네임으로 받기
    String strContents = request.getParameter("contents");
    String strMemID = "Mem001";
    String strMenuID = "M001";
    
    Connection con = null;
	CallableStatement csmt = null;
	
	
	String userID = "JSP";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_INS(?,?,?,?)}");
	
	csmt.setString(1, strTitle);
	csmt.setString(2, strContents);
	csmt.setString(3, strMemID);
	csmt.setString(4, strMenuID);
	
	csmt.execute();
	
	response.sendRedirect("./list.jsp");
    %>
    
 