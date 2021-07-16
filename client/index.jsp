<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%
	String strResult = request.getParameter("result");
	
/*
	if(strResult == null){
		strResult = "N";
	}
1.strResult = 'Y'이면 로그인 성공이고 
2.strResult = 'N' 이면 로그인 실패
3.strResult = null이면 페이지가 처음으로 열린것이라서 null일때 n처리가 필요없어짐
*/
%>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<script>
		
		function chkLogin(result){
		
		result = 'N';
			if(result == 'N'){
				alert("아이디 또는 패스워드가 일치하지 않습니다.");
			}
			
		}
		
	
	</script>


</head>
<body onload="chkLogin('<%=strResult %>')">
	<%
	/*
		String strSID = session.getId();
	
		out.print(strSID);
	*/
	
	
	
	String strUserID = (String)session.getAttribute("userID");
	String strUserPass = (String)session.getAttribute("userPass");
	
	%>
	
	<%
		//if(!strResult.equals("Y")){
		if(strUserID == null){
	%>
	<div>
		<form action="./01_Member/login_ok.jsp" method="post">
			<div>아이디 : <input type="text" name="userID" /></div>
			<div>패스워드 : <input type="text" name="userPass" /></div>
			<div><input type="submit" value="로그인" /></div>
		</form>
	</div>
	<%
		}
		else{
	%>
	<div>
	  <form action="./01_Member/logout.jsp" method="post">
	  <div><%=strUserID %>로그인 성공</div>
	  <div><input type="submit" value="로그아웃" /></div>
	  </form>
	</div>
	<% } %>
</body>
</html>