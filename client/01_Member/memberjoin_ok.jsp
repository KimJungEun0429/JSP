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
    
    	//���̵� �ߺ� üũ�� db�� ���� ���� Ȯ���ؾ��Ѵ�.
    		String strProc_Chk = "{call PKG_MEMBER.PROC_CHK_USERID(?,?)}";
    		String[] strParams_Chk = new String[1];
    		strParams_Chk[0] = strUserID;
    		//1���ε� �迭�� ���� ������ �̸� �������� �ڹ��ڵ��� �Ű������� �迭Ÿ���̱� ������
    		
    		ResultSet rs = DBConn.getResultSet(strProc_Chk, strParams_Chk);
    		rs.next();
    		
    		String strResult = rs.getString("RST");
    		
    		if(strResult.equals("Y"))//�ߺ�
    		{
    			//�ߺ��̶�� ����� Ŭ���̾�Ʈ���� �˷������
    			response.sendRedirect("./memberjoin.jsp");
    		}//if(strResult == "Y")
    		else{
		    			
		    			
				    		out.print(strResult);
				    	
				    	//�Ʒ��� �ڵ��� db�� �����͸� �����ϴ� ��
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
						DBConn.setClose();//Connection ��ü�� �ݰ� nulló���Ѵ�.
    			}//if(strResult == "Y")
    		
		//response.sendRedirect("suc.jsp");
    %>
    
