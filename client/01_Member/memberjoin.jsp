<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>

	<link rel="stylesheet" href="../Css/member.css">
	<script src="../JS/mem.js"></script>

	
	<script>
	var httpRequest;
	
	function gethttpRequest(){
		
		httpRequest = new XMLHttpRequest();
	}//계속 쳐야하니 매써드로 하나 만들어 놓자
	
	function chkID(){
	
		var userID = document.getElementById("userID").value;
		//백에서 데이터베이스를 연결해서 아이디가 중복되는지 확인이 하고 싶다
		//ajax를 사용해야한다.
		//그럴려면 httpxml
		gethttpRequest();
		
		httpRequest.onreadystatechange = callback;
		httpRequest.open("GET","./ajax/chkID.jsp?userID=" + userID ,true);
		httpRequest.send(null);
		//비동기, 동기 중 어떻게 움직일지 정하도록 하는 코딩
		//GET- 보낼 값이 짧고 파라미터 값이 작을때
		//보내는 양이 진짜 많다(데이터가 많고 변수가 많다 10개 이상)할때는 POST
		//POST로 보낼거면 "userID=" + userID 이걸 SEND에 넣어준다
	}//콜백함수가 필요
	
	function callback(){
		//오류시 callback함수가 호출이 되는지 본다
		if (httpRequest.readyState == 4) 
		{
		//실행이 끝났다는 신호
			if (httpRequest.status == 200) 
			{
				var datas = httpRequest.responseXML;
				var resultTag = datas.getElementsByTagName("result");
				
				var result = resultTag[0].childNodes[0].nodeValue;
				
				if(result == "Y"){
					//Y는 중복
					
					document.getElementById("idMsg").innerHTML = "아이디가 중복이다";
				}
				else{
					//N는 중복아니다	
					document.getElementById("idMsg").innerHTML = "사용가능한 아이디 입니다";
				}
			}
			else{
				
				alert("실패:" + httpRequest.status);
			}
		}
	}
	
	</script>

</head>
<body>
	 <body>
	<div id="wrap">
		<form name="memberForm" id="memberForm" action="./memberjoin_ok.jsp" method="post">
			
			<!-- 아이디 -->
			<div class="line">
				<span class="row1">아이디</span>
				<span class="row2">				
					<span class="col1">
						<input type="text" name="userID" id="userID" class="textbox1"
						 
						 onkeyup="chkID();"
						 /><!-- onblur="chkValue('userID','idMsg');" -->
					</span>
					<span class="col2">
						@naver.com
					</span>				
				</span>
				<span id="idMsg" class="msg"></span>
			</div>

			<div class="line">
				<span class="row1">비밀번호</span>
				<span class="row2">
					<input type="text" name="userPass" id="userPass" class="textbox1"
					style="width:396px;"
					onblur="chkValue('userPass','passMsg');chkPass();"
					/>
				</span>
				<span id="passMsg" class="msg"></span>
			</div>

			<div class="line">
			
				<span class="row1">비밀번호확인</span>
				<span class="row2">
					<input type="text" name="userPass_Re" id="userPass_Re" class="textbox1"
					style="width:396px;"
					onblur="chkValue('userPass_Re','passMsg_Re');chkPass();"
					/>
				</span>
				<span id="passMsg_Re" class="msg"></span>
			</div>

			<div style="height:30px;"></div>

			<div class="line">
				<span class="row1">이름</span>
				<span class="row2">
					<input type="text" name="userName" id="userName" class="textbox1"
					style="width:396px;"/>
				</span>
				<span id="nameMsg" class="msg"></span>
			</div>

			<div class="line">
				<span class="row1">생년월일</span>
				<span id="userBirth">
					<span class="row2" >
						<input type="text" name="userYear" id="userYear" class="textbox1"
						style="width:120px;" placeholder="년(4자)"/>
					</span>
					<span class="empty"></span>
					<span class="row2" >
						<select id="userMonth" name="userMonth" onchange="chk_Month();">
						
						<% 
							String strHTML = "";
							for(int i=1; i<12;i++){
								strHTML += "<option value='" + i + "'>" + i + "</option>";
							}
						%>
							
							<%=strHTML %>

						</select>
					</span>
					<span class="empty"></span>
					<span class="row2" >
						<input type="text" name="userDay" id="userDay" class="textbox1"
						style="width:120px;" placeholder="일"/>
					</span>
				</span>
				<span id="birthMsg" class="msg"></span>
			</div>

			<div class="line" id="">
				<span class="row1">성별</span>
				<span class="row2">
					<label>
						<input type="radio" id="userGender1" name="userGender" value="M" class="gender"/> <span class="rtxt">남자</span>
					</label>
					<label>
						<input type="radio" id="userGender2" name="userGender" value="F" class="gender"/> <span class="rtxt">여자</span>
					</label>
					<label>
						<input type="radio" id="userGender3" name="userGender" value="E" class="gender"/> <span class="rtxt">선택안함</span>
					</label>
					
				</span>
				<span id="passMsg" class="msg"></span>
			</div>

			<div class="line" id="">
				<span class="row1">관심사</span>
				<span class="row2">
					<label>
						<input type="checkbox" id="userIntr1" name="userIntr" value="M" class="intr"/> <span class="rtxt">돈</span>
					</label>
					<label>
						<input type="checkbox" id="userIntr2" name="userIntr" value="F" class="intr"/> <span class="rtxt">명예</span>
					</label>
					<label>
						<input type="checkbox" id="userIntr3" name="userIntr" value="E" class="intr"/> <span class="rtxt">코딩</span>
					</label>
					
				</span>
				<span id="passMsg" class="msg"></span>
			</div>

			<div class="line">
				<span class="row1"></span>
				<span class="row2">
					<select id="selectIntr" name="selectIntr" class="selectIntr">
						<option>선택하세요</option>
					</select>
				</span>
				<span id="nameMsg" class="msg"></span>
			</div>

			<div style="height:30px;"></div>

			<div class="line">
				<span class="row1">휴대전화</span>
				<span class="row2" style="width:250px;float:left">
					<input type="text" name="userPhone" id="userPhone" class="textbox1"
					style="width:245px;"/>
				</span>
				<btn class="btn">
					인증번호 받기 
				</btn>
				<span id="nameMsg" class="msg"></span>
			</div>
			<div class="line" style="height:30px;"></div>
			<div class="line">
				
				<btn class="btn" style="width:400px;" onclick="memberOK();" />
					가입하기 
				</btn>

			</div>

		</form>
	</div>
 </body>
</body>
</html>