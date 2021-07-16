<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>

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
			font-family:�ü�;
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
			 objMsg.innerHTML = "�������� �Է�(3���̻�)";
			 return;
		 } 
		 
		 if(objContent.value.length < 3){
			 objMsg.innerHTML = "�۳����� �Է�(3���̻�)";
			 return;
		 } 
		 
		 document.getElementById("boardForm").submit();
	 }
	 
	
	 
	 var checkTitle = function(){
		 var objTitle = document.getElementById("title");
		 var objContent = document.getElementById("contents");
		 var titleLength = objTitle.value.length;
		 var ContentLength = objContent.value.length;
		 var objMsg = document.getElementById("msg");
		
		 
		 if(titleLength < 3){
			 objMsg.innerHTML = "�������� �Է��� �ּ���(3���̻�)"; 
			 
			 
		 }

		 else if(ContentLength < 3){
			 objMsg.innerHTML = "�۳����� �Է��� �ּ���(3���̻�)";
			 
		 }
		 
		 else{
			 objMsg.innerHTML = "";
			
		 }
	 }
	</script>
</head>
<body>
	<div id="wrap">
		<form action="write_ok.jsp" method="post" id="boardForm" name="boardForm">
			<div>
				<input type = "text" id="title" name="title" 
				 placeholder="������ �Է��� �ּ���." onkeyup="checkTitle()"/>
				 <!--onkeypress �̺�Ʈ�� �߻��ϰ� ���� �޾ƿ´�
				 onkeyup�� �����ٰ� ������ �̺�Ʈ�� �߻�
				 onkeydown��  -->
			</div>
			
			<div>
				<textarea id="contents" name="contents" onkeyup="checkTitle()"></textarea>
			</div>
			
			<div style="padding-left:600px">
				<span class="btn" onclick="writeOK()">Ȯ��</span>
				<div id="msg">
				</div>
			</div>
		</form>
	</div>
</body>
</html>