<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<style>
		#title{
		
			width:380px;height:40px;
			font-size:25px;
			border:0px;
		}
		#contents{
			width:480px;height:380px;
			font-size:25px;
			border:0px;
		}
	
	</style>
	
	<script>
		
		function check_Value(){
			
			var obj = document.getElementById("title");
			var obj2 = document.getElementById("contents");
			
			if(obj.value == ""){
				alert("글제목을 적으시오");
				obj.focus();
				return;
				//리턴을 만나면 함수는 종료가 된다
			}
			
			if(obj2.value == ""){
				alert("글내용을 적으시오");
				obj2.focus();
				return;
				//리턴을 만나면 함수는 종료가 된다
			}
			
			document.boardForm.submit();
		}
	
	</script>

<title>Insert title here</title>
</head>
<body>
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="150">
			<!-- 메뉴자리 -->
		</td>
		<td width="550" align="center">
		<form action="./write_ok.jsp" method="post" name="boardForm" id="boardForm">
		<!-- get방식으로 날리면 주소창에 날린 값들이 다 보이기 때문에 post방식으로 날린다 -->
			<table border="1" cellpadding="0" cellspacing="0" align="center" width="500">
				<tr>
					<td width="100" align="center" height="50">
					글제목
					</td>
					
					<td width="400" height="30">
						<input type="text" name="title" id="title"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" width="500" height="400" valign="top">
						<textarea cols="70" rows="10" name="contents" id="contents"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="저장" onclick="check_Value()"/>
					</td>
				</tr>
			</table>
			</form><!-- 폼태그 안에 들어있는 모든 코딩들의 값을 name이라는 속성 값에 붙어있는 내요잉 변수화 되어서 action을 통해 서버(write_ok)로 날린다 -->
			<!--submit는 위에 script랑 상관이 없어서 위에서 조건문을 뭘 주던 실행을 해버린다. 그래서 일단 button으로 바꿔놓고 document.getElementById("boardForm").submit();이라고 sumit매써드를 script 조건문 밑에 붙여놓는다  -->
		</td>
	</tr>
	</table>
</body>
</html>