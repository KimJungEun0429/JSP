<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
	<%
	
	 String strIdx = request.getParameter("idx");
	
	 Connection con = null;
	 Statement stmt = null;
	 ResultSet rs = null;
	
	String userID = "JSP";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String strSql = "SELECT * FROM BOARD WHERE IDX=" + strIdx;
	
	con = DriverManager.getConnection(url, userID, userPass);
	stmt = con.createStatement();
	rs = stmt.executeQuery(strSql);
	
	rs.next();
	%>
	
	<table border="1" cellpadding="0" cellspacing="0" width="600" align="center">
		<tr>
			<td width="100" align="center" height="">
				글제목
			</td>
			<td width="500" align="center" height="">
				<%=rs.getString("title")%>
			</td>
		</tr>
		<tr>
			<td width="100" align="center" height="">
				글내용
			</td>
			<td width="500" align="center" height="">
				<%=rs.getString("contents")%>
			</td>
		</tr>
		<tr>
			<td width="100" align="center" height="">
				작성자
			</td>
			<td width="500" align="center" height="">
				<%=rs.getString("MEMID")%>
			</td>
		</tr>
	
	</table>
	

</body>
</html>