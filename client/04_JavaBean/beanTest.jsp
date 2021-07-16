<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@page import = "java.sql.*" %>
    <jsp:useBean id="TC" class="PKG_Test.TestClass" scope="page" />
    <!-- scope page, //response, request, application// -->
    <!-- 순수하게 자바 객체를 끌어다 사용하기 위한 코딩  -->
      <jsp:useBean id="DBCon" class="PKG_DB.DBHandle" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	/*
		//TestClass TC = new TestClass(); 이렇게 쓴 코딩과 동일한 코딩이 제일 위에 Bean으로 만들어 놓은 것
		TC.setName("안녕");
		String strName = TC.getName();
		
		int sum = TC.getSum(100);
		out.print("<font color ='red' size='7'>" + sum + "</font>");
		"<font color ='red' size='7'>" + sum + "</font>"
		*/
		
		/*
		String userID = "JSP";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		*/
		
		String[] dbInfos = new String[3];
		dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
		dbInfos[1] = "JSP";
		dbInfos[2] = "1";
		
		/*
		String userID = new String("JSP");
		String userPass = new String();
		String url = new String();
		*/
		
		
		DBCon.setDBInfo(dbInfos);
		String strSql = "DELETE FROM BOARD WHERE IDX=46";
		DBCon.executeQuery(strSql);
		
		String strSql2 = "SELECT * FROM BOARDS";
		ResultSet rs = DBCon.getResultSet(strSql2);
		
		while(rs.next()){
			out.println(rs.getString("TITLE") + "<br/>");
		}
		
		String strProc = "{call PKG_BOARD.PROC_BOARD_INS(?,?,?,?)}";
		
			String[] strParams = new String [4];
			strParams[0] = "this is a title";
			strParams[1] = "this is a content";
			strParams[2] = "Mem001";
			strParams[3] = "M001";
			
			DBCon.executeQuery(strProc, strParams);
			
			
			String strProc2 = "{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}";
			String[] strParams2 = new String[2];
			strParams2[0] = "List";
			strParams2[1] = "";
			
			ResultSet rs2 = DBCon.getResultSet(strProc2, strParams2);
			
			while(rs2.next()){
				out.println(rs2.getString("TITLE") + "<br/>");
			}
			
		
		/*
		DBCon.setUserID("JSP");
		
		Connection con = DBCon.getConnenction();
		
		
		Statement stmt = con.createStatement();
		String strSql = "SELECT * FROM BOARD";
		ResultSet rs = stmt.executeQuery(strSql);
		
		while(rs.next()){
			out.println(rs.getString("TITLE") + "<br/>");
		}*/
	%>
	
</body>
</html>