<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import = "java.sql.*" %>

    <%
    
    	String strTitle = request.getParameter("title");
   		String strContents = request.getParameter("contents");
   		String strMemID = "Mem001";
   		String strMenuID = "M001";
    //�ϱ���� - returnŸ���� ��Ʈ���̴ϱ� ��Ʈ�� Ÿ���� ������ �־��ֱ�
    %>
    
    
    <%
    	//�����ͺ��̽� ������ ��.
    	Connection con = null;
		Statement stmt = null;
		
		String strIdx = request.getParameter("idx");

    	String strSql = "UPDATE BOARD SET TITLE = ";
    	strSql 		 += "'" + strTitle + "'   , ";
    	strSql 		 += "CONTENTS = ";
    	strSql 		 += "'" + strContents + "', ";
    	strSql 		 += "MEMID = ";
    	strSql 		 += "'" + strMemID + "'   , ";
    	strSql 		 += "MENUID = ";
    	strSql 		 += "'" + strMenuID + "'  , ";
    	strSql 		 += "REGDATE = ";
    	strSql 		 += "SYSDATE ";
    	strSql 		 += "WHERE IDX = " + strIdx ;
    
    	String userID = "JSP";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url, userID, userPass);
		stmt = con.createStatement();
		
		stmt.executeQuery(strSql);
		
		con.close();
		//����� �� ����ؼ� ������ �ݾ������ �ʿ䰡 �ִ� ����Ŭ�� �ڹٰ� ����Ǿ��ִ� ���� �����ش�.
		
		
		//PAGE�� LIST.JSP�� �̵�
		response.sendRedirect("./list.jsp");
		
		/*
		try{
			
		}
		catch(Exception e){
			
		}*/
    %>
   
    