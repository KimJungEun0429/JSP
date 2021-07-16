<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import = "java.sql.*" %>

    <%
    
    	String strTitle = request.getParameter("title");
   		String strContents = request.getParameter("contents");
   		String strMemID = "Mem001";
   		String strMenuID = "M001";
    //암기사항 - return타입은 스트링이니까 스트링 타입의 변수에 넣어주기
    %>
    
    
    <%
    	//데이터베이스 연결할 것.
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
		//충분히 다 사용해서 쓰고나면 닫아줘야할 필요가 있다 오라클과 자바가 연결되어있는 것은 끊어준다.
		
		
		//PAGE를 LIST.JSP로 이동
		response.sendRedirect("./list.jsp");
		
		/*
		try{
			
		}
		catch(Exception e){
			
		}*/
    %>
    
    <%=strTitle%>
    <%=strContents%> 
    