<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="java.io.PrintWriter" %>
        <%@page import = "java.sql.*" %>
    <jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<!-- id=DBconn 객체 인스턴트 이름 -->

<%

	//1. client에서 날려준 파라메터들을 받아야한다
	String strUserID = request.getParameter("userID");

	//2.db에 연결하자
		String[] dbInfos = new String[3];
		dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
		dbInfos[1] = "JSP";
		dbInfos[2] = "1";
		
		DBConn.setDBInfo(dbInfos);
		
		String strProcName = "{call PKG_MEMBER.PROC_CHK_USERID(?,?)}";
		
		String[] strParams = new String[1];
		strParams[0] = strUserID;
		
		ResultSet rs = DBConn.getResultSet(strProcName,strParams);
		
		rs.next();
		
		String strResult = rs.getString("RST");
		
		//strResult가 'Y'이면 중복, 'N'이면 중복되지 않았다.
		
		String strXML = "<?xml version='1.0'?>";
		strXML += "<result>" + strResult + "</result>";
		//root element임 => 이게 뭣이냐..
		 
		response.setContentType("text/xml");
				
		PrintWriter writer = response.getWriter();
   		writer.print(strXML);

%>