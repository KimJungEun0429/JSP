<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function test(){
		
		alert();
	}
	
</script>
</head>
<body>
	
	<%
	
		//out.print("<a href='http://www.naver.com'>안녕</a>"); -> 자바코딩인 얘만 서버에서 실행 나머지는 브라우저에서 실행
		//자바인장에선 a태그가 아니라 스트링이다.
	out.print("<a href='javascript:test();'>안녕</a>");
	
	%>
	<form action="/write_ok.jsp" method="post">
		<div>
			아이디 : <input type="text" name="id"/>
		</div>
		<div>
			제목 : <input type="text" name="title"/>
		</div>
		<div>
			<input type="button" value="확인" />
		</div>
	</form>
</body>
</html>