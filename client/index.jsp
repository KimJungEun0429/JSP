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
1.strResult = 'Y'�̸� �α��� �����̰� 
2.strResult = 'N' �̸� �α��� ����
3.strResult = null�̸� �������� ó������ �������̶� null�϶� nó���� �ʿ������
*/
%>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<script>
		
		function chkLogin(result){
		
		result = 'N';
			if(result == 'N'){
				alert("���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.");
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
			<div>���̵� : <input type="text" name="userID" /></div>
			<div>�н����� : <input type="text" name="userPass" /></div>
			<div><input type="submit" value="�α���" /></div>
		</form>
	</div>
	<%
		}
		else{
	%>
	<div>
	  <form action="./01_Member/logout.jsp" method="post">
	  <div><%=strUserID %>�α��� ����</div>
	  <div><input type="submit" value="�α׾ƿ�" /></div>
	  </form>
	</div>
	<% } %>
</body>
</html>