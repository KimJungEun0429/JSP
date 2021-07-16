<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	var b;
	var init = function(){
		b = new boards();
	}
	var board = function(id, title){
		
		this.id = id;
		this.title = id;
	}//객체만들기, 생성자 같은 역할
	
	var boards = function(row){
		
		this.boardList = [];
		
		this.addRow = function(row){
			this.boardList.push(row);
		}//매써드.
	}
	
	function add(){
		
		var uid = document.getElementById("id").value;
		var utitle = document.getElementById("title").value;
		
		var r1 = new row();
		r1.id = uid;
		r1.title = utitle;
		
		b.addRow(r1);
	}// 단순 함수로 만들어서 db불러서 저장하는게 우리가 배운 형태

	//b객체안에 배열이 계속 쌓이게 된다. 데이터를 쌓아놓고 한꺼번에 서버로 보내는 방법이라는 것.
	//한개씩 서버에 밀어넣으면 시간이 오래걸려서 한꺼번에 가는 것.
	
	function list(){
		
		alert(b.boardList.length);
		
	}
</script>
</head>
<body onload="init();">
	<input type="text" id="id" />
	<input type="text" id="title" />
	<input type="button" value="확인" onclick="add()"/>
	<input type="button" value="리스트" onclick="list()"/>
</body>
</html>