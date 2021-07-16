<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@page import = "java.sql.*" %>
     <%@page import = "oracle.jdbc.OracleTypes" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
		#title{
			width:700px;
			height:30px;
			border:1px solid #dddddd;
		}
		
		#contents{
			width:700px;
			height:400px;
			border:1px solid #dddddd;
			color:#777777;
			font-family:궁서;
			font-size:13px;
		}
		.btn{
		display:block;
		width:90px;
		height:17px;
		border:1px solid #777;
		padding:3px 0px 7px 0px;
		text-align:center;
		border-radius:10px;
		background-color:#ededed;
		}
	</style>
	<script>
	 function writeOK(){
	
		 var objTitle = document.getElementById("title");
		 var objContent = document.getElementById("contents");
		 var objMsg = document.getElementById("msg");
		 
		 if(objTitle.value.length < 3){
			 objMsg.innerHTML = "글제목을 입력(3자이상)";
			 return;
		 } 
		 
		 if(objContent.value.length < 3){
			 objMsg.innerHTML = "글내용을 입력(3자이상)";
			 return;
		 } 
		 
		 document.getElementById("boardForm").submit();
	 }
	 </script>
</head>
<body>

    <%
    
    String strIDX = request.getParameter("idx");
	Connection con = null;
	CallableStatement csmt = null;
	ResultSet rs = null;
	
	String userID = "JSP";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}");
	
	csmt.setString(1,"List");
	csmt.setString(2,strIDX);
	csmt.registerOutParameter(3, OracleTypes.CURSOR);
	
	csmt.execute();
	rs = (ResultSet)csmt.getObject(3);	
	
	rs.next();
		
    	%>
    	


	<div id="wrap">
		<form action="update_ok.jsp?idx=<%=rs.getString("idx") %>" method="post" id="boardForm" name="boardForm">
			<div>
				<input type = "text" id="title" name="title" 
				 placeholder="제목을 입력해 주세요." onkeyup="checkTitle()" value="<%=rs.getString("TITLE")%>" />
				
			</div>
			
			<div>
				<textarea id="contents" name="contents" onkeyup="checkTitle()"><%=rs.getString("CONTENTS")%></textarea>
			</div>
			
			<div style="padding-left:600px">
				<span class="btn" onclick="writeOK()">확인</span>
				<div id="msg">
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>