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
		


    	String strSql = "INSERT INTO BOARD";
    	strSql 		 += "(IDX, TITLE, CONTENTS, MEMID, MENUID, REGDATE)";
    	strSql 		 += "VALUES(";
    	strSql 		 += "BOARDSEQ.NEXTVAL,  ";
    	strSql 		 += "'" + strTitle + "', ";
    	strSql 		 += "'" + strContents + "', ";
    	strSql 		 += "'" + strMemID + "', ";
    	strSql 		 += "'" + strMenuID + "', ";
    	strSql 		 += "SYSDATE) ";
 
    	String userID = "JSP";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url, userID, userPass);
		stmt = con.createStatement();
		
		stmt.execute(strSql);
		
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
    
    <%=strTitle%>
    <%=strContents%> 
    