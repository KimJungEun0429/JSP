<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import = "java.sql.*" %>
      <%@ page import="java.io.PrintWriter" %>
    <jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>

    <%
    
    String[] dbInfos = new String[3];
	dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
	dbInfos[1] = "JSP";
	dbInfos[2] = "1";
	
	DBConn.setDBInfo(dbInfos);
    
    String strProc = "{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}";
    
    String[] strParams = new String[2];
    strParams[0] = "CONTENTS";
    strParams[1] = "";
    
    ResultSet rs = DBConn.getResultSet(strProc,strParams);
    
    /*
    String strParam = request.getParameter("userName");
    out.print("hi " + strParam);
    */
    
    String strXML = "<?xml version='1.0'?>";
    //XML문서라고 인정하는 코딩
    strXML += "<rows>";
    while(rs.next()){
    	
    	strXML += "<row>";
    	strXML += "<IDX>" + rs.getString("IDX") + "</IDX>";
    	strXML += "<bnum>" + rs.getString("BNUM") + "</bnum>";
    	strXML += "<title>" + rs.getString("TITLE") + "</title>";
    	strXML += "<regdate>" + rs.getString("REGDATE") + "</regdate>";
    	strXML += "</row>";
    }
    strXML += "</rows>";
    //암기해도 된데....
    //request.setCharacterEncoding("utf-8");
    response.setContentType("text/xml"); //; charset=utf-8");
    //뭔데 암기하나요...ㅜㅜㅎ -> 한글깨지지않게 준 코딩이라 UTF-8로 셋팅해놨으면 지워도 됨
    
    PrintWriter writer = response.getWriter();
    //서버쪽에서 클라이언트한테 돌려준다
    writer.print(strXML);
    
    %>