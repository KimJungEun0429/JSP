<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@page import = "java.sql.*" %>
    <jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>

    <%
    
   		String strUserID = request.getParameter("userID");
    	String strUserPass = request.getParameter("userPass");
    	String strUserName = request.getParameter("userName");
    	String strUserYear = request.getParameter("userYear");
    	String strUserMonth = request.getParameter("userMonth");
    	String strUserDay = request.getParameter("userDay");
    	String strUserGender = request.getParameter("userGender");
    	String[] strUserIntrs = request.getParameterValues("userIntr");
    	String strUserPhone = request.getParameter("userPhone");
    	

    	String[] dbInfos = new String[3];
		dbInfos[0] = "jdbc:oracle:thin:@localhost:1521:xe";
		dbInfos[1] = "JSP";
		dbInfos[2] = "1";
		
		DBConn.setDBInfo(dbInfos);
    
    	//아이디 중복 체크는 db에 들어가기 전에 확인해야한다.
    		String strProc_Chk = "{call PKG_MEMBER.PROC_CHK_USERID(?,?)}";
    		String[] strParams_Chk = new String[1];
    		strParams_Chk[0] = strUserID;
    		//1개인데 배열을 쓰는 이유는 미리 만들어놓은 자바코딩의 매개변수가 배열타입이기 때문에
    		
    		ResultSet rs = DBConn.getResultSet(strProc_Chk, strParams_Chk);
    		rs.next();
    		
    		String strResult = rs.getString("RST");
    		
    		if(strResult.equals("Y"))//중복
    		{
    			//중복이라는 사실을 클라이언트한테 알려줘야해
    			response.sendRedirect("./memberjoin.jsp");
    		}//if(strResult == "Y")
    		else{
		    			
		    			
				    		out.print(strResult);
				    	
				    	//아래쪽 코딩은 db에 데이터를 저장하는 것
				    	String strUserIntr = "";
				    	
				    	int len = strUserIntrs.length;
				    	for(int i=0; i<len; i++){
				    		strUserIntr += strUserIntrs[i];
				    		
				    		
				    		if(i != len -1){
				    			strUserIntr += ",";
				    		}
				    	}
				    		
						String strProc = "{call PKG_MEMBER.PROC_MEMBER_INS(?,?,?,?,?,?,?)}";
								
						String[] strParams = new String[7];
						strParams[0] = strUserID;
						strParams[1] = strUserPass;
						strParams[2] = strUserName;
						strParams[3] = strUserGender;
						strParams[4] = strUserYear + "-" + strUserMonth + "-" + strUserDay;
						strParams[5] = strUserIntr;
						strParams[6] = strUserPhone;
						
						DBConn.executeQuery(strProc,strParams);
						DBConn.setClose();//Connection 객체를 닫고 null처리한다.
    			}//if(strResult == "Y")
    		
		//response.sendRedirect("suc.jsp");
    %>
    
