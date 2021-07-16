<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%

	String[] menuIDs = request.getParameterValues("menuID");
	String[] menuNames = request.getParameterValues("menuName");
	
	//out.print(menuIDs[0]);
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "JSP";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
	String result = "Y";
	try{
	String strSql = "";
	for(int i=0; i<menuIDs.length;i++){
		strSql = "";
		strSql += "INSERT INTO MENUS(MENUID, MENUNAME) ";
		strSql += "VALUES(";
		strSql += "'" + menuIDs[i] + "' ," ;
		strSql += "'" + menuNames[i] + "')" ;
		
		DBConn.executeQuery(strSql);
	}
	}catch(Exception e){
		//어떤 예외처리를 해줄지 모르겠으면 최상위로 처리
		result = e.getMessage();
		//에러 메세지 받는 법
	}
	
	out.print(result);

%>