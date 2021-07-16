<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import = "java.sql.*" %>
    <%@page import = "oracle.jdbc.OracleTypes" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판리스트</title>

<style>

	#board{
			width:708px;
			height:100px;
			border:3px solid #444444;
			border-width:1px 0px 0px 0px;
		}
		
	#board span{
		display:block;
		width:100px;
		border:1px solid #dddddd;
		border-width:0px 0px 1px 0px;
		height:20px;
		padding-top:4px;
		float:left;
		font-size : 13px;
		text-align:center;
	}
	
	#btnBlock{
			width:708px;
			height:40px;
			padding-left:600px;
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

	

</script>


</head>
<body>

	<%
		//db 연결
		
		Connection con = null;
		CallableStatement csmt = null;
		ResultSet rs = null;
		
		String userID = "JSP";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url, userID, userPass);
		csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}");
		
		csmt.setString(1,"LIST");
		csmt.setString(2,"");
		csmt.registerOutParameter(3, OracleTypes.CURSOR);
		
		csmt.execute();
		rs = (ResultSet)csmt.getObject(3);	
		
		
	%>
	<div id="wrap">
	
		<div id="board">
		
		<div id="btnBlock">
			<a href="./write.jsp"><span class="btn">글쓰기</span></a>
			
		</div>
		
		<% 
			while(rs.next()){
				
			
		%>
			<div><!-- 반복을 위한 div -->
				<span style="width:50px"><%=rs.getInt("BNUM")%></span>
				<span style="width:350px">
					<a href="./contents.jsp?idx=<%=rs.getString("IDX")%>"><%=rs.getString("TITLE")%></a>
				</span>
				<span><%=rs.getString("MEMID")%></span>
				<span><%=rs.getString("REGDATE")%></span>
				<span><%=rs.getString("VISITED")%></span>
			</div><!-- 반복을 위한 div -->
		<% 
			}
		con.close();
		rs.close();
		%>
		</div>
	</div>
	
</body>
</html>