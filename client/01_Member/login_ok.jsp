<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import = "java.sql.*" %>
    <jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%
	//로그인 처리를 할것
	//1.userID, userPass
	
	String strUserID = request.getParameter("userID");

	String strUserPass = request.getParameter("userPass");

	//2.아이디와 패스워드가 일치하는지 검사
		
		String[] dbInfos = new String[3];
		dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
		dbInfos[1] = "JSP";
		dbInfos[2] = "1";
		
		DBConn.setDBInfo(dbInfos);
	
		String strProcName = "{call PKG_MEMBER.PROC_LOGIN(?,?,?)}";
		String[] strParams = new String[2];
		strParams[0] = strUserID;
		strParams[1] = strUserPass;
		
		ResultSet rs = DBConn.getResultSet(strProcName, strParams);
		
		rs.next();
	
		String Login_YN = rs.getString("LOGIN_YN");
	
		
		/*
			Login_YN = 'Y' --> 로그인 가능
			Login_YN = 'N' --> 아이디 또는 패스워드가 틀렸다는 메세지
		
		*/
		if(Login_YN.equals("Y")){
			//Login_YN == "Y" 주소가 같냐는 얘기
					
			session.setAttribute("userID", strUserID);
			//각각 1번칸은 String 타입으로 session변수명을 넣어준다. 2번칸은 Object 타입
			//세팅되어있는 시간이 끊어지기 전까지 userID가 살아있다.
			//session은 메모리에 계속 상주되어 있고 모든 페이지에 존재한다. 메모리를 계속 써먹는다는 것으로 함부러 쓰면 안된다.
			response.sendRedirect("../06_ajaxBoard/list.jsp");
		}
		
		else{
			response.sendRedirect("../index.jsp?result=N");
			
		}



%>