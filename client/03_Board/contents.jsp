<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@page import = "java.sql.*" %>
 <%@page import = "oracle.jdbc.OracleTypes" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글내용보기</title>
<style>
	#title{
		width:700px;
		height:50px;
		border:1px solid #999999;
		border-width:0px 0px 1px 0px;
		clear:both;
	}
	
	.memid{
		display:block;
		width:250px;
		height:50px;
		font-size:12px;
		float:left;
	}
	.memid span{
		display:block;
		padding:4px 0px 4px 20px;
	}
	.title2{
		width:100px;
		display:block;
		float:left;
		padding:4px;
	}
	
	#content{
			clear:both;
			width:700px;
			height:500px;
			padding:15px;
			border:3px solid #999999;
			border-width:0px 0px 1px 0px;
	}
	
	.btn{
		display:block;
		width:70px;
		height:12px;
		border:1px solid #777;
		padding:2px 0px 5px 0px;
		text-align:center;
		border-radius:7px;
		background-color:#ededed;
		font-size:12px;
		float:left;
		}
		
		#botton{
			padding:5px 0px 0px 0px;
		}
</style>

	<script>
	function formSubmit(strURL){
		
		document.getElementById("delForm").action = strURL;
		document.getElementById("delForm").method = "post";
		document.getElementById("delForm").submit();
	}
</script>
</head>
<body>
	<%
String strIDX = request.getParameter("idx");
	
	
	//db연결해서 데이터 가져오자
	//Connection객체
	Connection con = null;
	CallableStatement csmt= null;
	ResultSet rs = null;
	
	String userID = "JSP";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	
	csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}");
	
	csmt.setString(1, "List");
	csmt.setString(2, strIDX);
	csmt.registerOutParameter(3, OracleTypes.CURSOR);
	
	csmt.execute();
	
	rs = (ResultSet)csmt.getObject(3);
	
	rs.next();
	
	%>

	<div id="wrap">
	
		<div id="title">
			<span class="memid">
				<span><%=rs.getString("MEMID") %></span>
				<span>
					<%=rs.getString("REGDATE_CON") %>
					&nbsp;&nbsp;&nbsp;&nbsp;
					조회 : <%=rs.getString("VISITED") %>
				</span>
			</span>
			<span class="title2">
				글제목 : <%=rs.getString("TITLE") %>
			</span>
		</div>
		<div id="content">
			<%=rs.getString("CONTENTS") %>
		</div>
		<div id="bottom">
		
			<a href="./list.jsp"><span class="btn">리스트</span></a>
			<a href="javascript:formSubmit('./delete.jsp')"><span class="btn">삭제</span></a>
			<a href="javascript:formSubmit('./update.jsp')"><span class="btn">수정</span></a>
		
		</div>
	
	
	</div>

	<script>
		function formSubmit(strURL){
			document.getElementById("delForm").action = strURL;
			document.getElementById("delForm").method = "post";
			document.getElementById("delForm").submit();
		}
	</script>


	<form id="delForm">
		<input type="hidden" name="idx" value="<%=rs.getString("IDX")%>"/>
		
	</form>
</body>
</html>