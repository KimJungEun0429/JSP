<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@page import = "java.sql.*" %>
 <%@page import = "oracle.jdbc.OracleTypes" %>
    <%
    
    String strIDX = request.getParameter("idx");

	//db연결해서 데이터 가져오자
	//Connection객체
	Connection con = null;
	CallableStatement csmt= null;
	
	String userID = "JSP";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	
	csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARDS_DEL(?)}");
	
	csmt.setString(1, strIDX);
	
	
	csmt.execute();
	
	response.sendRedirect("./list.jsp");
 
    %>
    
   de <%=strIDX%>