<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자모드 - 메뉴관리</title>

	<style>
		.mList{
			clear:both;
		}
		
		.mList div{
			clear:both;
		}
		.mList span{
			
			display:block;
			height:30px;
			border:1px solid #888888;
			float:left;
			padding:7px 0px 0px 0px;
			text-align:center;
		}
		
		.txtBox1{
		
			width:100px;
			border-width:0px;
			text-align:center;
		}
		
		.txtBox2{
		
			width:450px;
			border-width:0px;
			text-align:center;
		}
	</style>
	
	<script>
	
	var httpRequest = null;
	
	/*
	var border = function(){
		this.a = "가";
		
		this.plus = function(){
			this.a = "나";

		}
	}
	
	var c = new Object();
	c.a = "다";
	c.plus = function(){
		c.a = "마"
	}
	
	alert(c.value);
	c.plus();
	alert(c.value);

	
	var a = border();
	alert(a.a);
	a.plus();
	alert(a.a);
	*/
	
	
	function getHttpRequest(){

		return new XMLHttpRequest();
	}
	
	function getList(){
		//server에 있는 list.jsp를 호출
		httpRequest = null;
		httpRequest = getHttpRequest();
		
		httpRequest.onreadystatechange = callback;
		
		httpRequest.open("POST","./ajax/mngMenus.jsp",true);
		
		httpRequest.send(null);
	}
	
	function callback(){
		
		if (httpRequest.readyState == 4) 
			{
			if (httpRequest.status == 200) 
			{
				var datas = httpRequest.responseXML;
				setList(datas);
			}
			else{
				
				alert("실패:" + httpRequest.status);
			}
		}
	}
	
	function setList(datas){
		//alert("이게 뜨면 에이작스가 잘 날라온 것");
		var menuTags = datas.getElementsByTagName("menu");
		//태그이름이 메뉴인 것을 찾자 그 덩어리가 반복이 되기 때문에 길이를 알기 위해서
		
		var menuCount = menuTags.length;
		
		var menuID = "";
		var menuName = "";
		var strHTML = "";
		
		for(var i=0; i<menuCount; i++){
			menuID = menuTags[i].childNodes[0].childNodes[0].nodeValue;    
			menuName = menuTags[i].childNodes[1].childNodes[0].nodeValue;
		
			strHTML += "<div class='mList'>";
			strHTML += "<span style='width:50px;'><input type='checkbox' name='chk' onclick='onlyChk(" + i + ")'/></span>";
			strHTML += "<span style='width:120px;'><input type='text' class ='txtBox1' value='" + menuID + "'/></span>";
			strHTML += "<span style='width:480px;'><input type='text' class ='txtBox1' value='" + menuName + "' onchang='chg("+ i + ")'/></span>";
			strHTML += "<span style='width:100px;'><a href='javascript:setDel(&quot;" + menuID + "&quot;)'>삭제</a></span>";
			//javascript:setDel(" + menuID + ")는 menuID가 문자열이므로 ""가 필요한것 그걸 해결하려고 &quot
			strHTML += "</div>";
		}
		
		document.getElementById("menuList").innerHTML = strHTML;
	}
	
	function setDel(menuID){
		
		httpRequest = null;
		httpRequest = getHttpRequest();
		
		httpRequest.onreadystatechange = callback2;
		httpRequest.open("get","./ajax/delMenu.jsp?menuID=" + menuID,true);
		httpRequest.send(null);
	}
	
	function callback2(){
		if (httpRequest.readyState == 4) 
			{
			if (httpRequest.status == 200) 
			{
				getList();
			}
			else{
				
				alert("실패:" + httpRequest.status);
			}
		}
	}
	
	
	function addMenu(){
	
		var strHTML = "";
		
		strHTML += "<div class='mList'>";
		strHTML += "<span style='width:50px;'><input type='checkbox' /></span>";
		strHTML += "<span style='width:120px;'><input type='text' name='menuID' /></span>";
		strHTML += "<span style='width:480px;'><input type='text' name='menuName'/></span>";
		strHTML += "<span style='width:100px;'></span>";
		strHTML += "</div>";
		
		document.getElementById("menuList").innerHTML += strHTML;
	
	}
	
	function menuSave(){
		
	var menuIDs = document.getElementsByName("menuID");
	var menuNames = document.getElementsByName("menuName");
		
	var strParams = "";
	
		for(var i=0; i<menuIDs.length; i++){
			
			strParams += "&menuID=" + menuIDs[i].value;
			strParams += "&menuName=" + menuNames[i].value;
			
		}
		//strParams = strParams.substr(1);
		//alert(strParams.substr(1));
		
		httpRequest = null;
		httpRequest = getHttpRequest();
		
		httpRequest.onreadystatechange = afterSave;
		httpRequest.open("GET","./ajax/saveMenus.jsp?" + strParams,true);
		httpRequest.send(null);
		
	
	}
	
	function afterSave(){
		
		if (httpRequest.readyState == 4) 
		{
		if (httpRequest.status == 200) 
		{
			//alert(httpRequest.responseText);
			//var datas = httpRequest.responseXML;
			//setList(datas);
			
			var result = httpRequest.responseText;
			if(result.trim() == "Y"){
				getList();
			}
			else{
				alert(httpRequest.responseText)
			}
		}
		else{
			
			alert("실패:" + httpRequest3.status);
		}
	}
		
		
	}
	
	function onlyChk(i){
		
		var chkObj = document.getElementsByName("chk");
		//내가 체크한 것만 checked = true, 나머지는 checked = false;
		
		//일단 전부다 checked = false;
		for(var j=0; j<chkObj.length; j++){
			chkObj[j].checked = false;
		}
		
		chkObj[i].checked = true;
	}
	
	function menuMod(){
		
		chkNumber = 0;
		
		var chkObj = document.getElementsByName("chk");
		
		for(var j=0; j<chkObj.length; j++){
			
			if(chkObj[j].checked){
				
				chkNumber = j;
			}
			
		}
		
	var objMenuIDs = document.getElementsByName("menuID");
	var objMenuNames = document.getElementsByName("menuName");
	
	var chkMenuId = objMenuIDs[chkNumber].value;
	var chkMenuName = objMenuNames[chkNumber].value;
	
	httpRequest = null;
	httpRequest = getHttpRequest();
	
	var strParams = "menuID=" + chkMenuID + "&menuName=" + chkMenuName;
	
	httpRequest.onreadystatechange = afterMod;
	httpRequest.open("GET","./ajax/modMenus.jsp?" + strParams,true);
	httpRequest.send(null);
	}
	
	function afterMod(){
		if (httpRequest.readyState == 4) 
		{
		if (httpRequest.status == 200) 
		{
			getList();
		}
		else{
			
			alert("실패:" + httpRequest3.status);
		}
	}
		
	}
	
	
	function chg(i){
		
		var chkObj = document.getElementsByName("chk");
		chkObj[i].checked = true;
		
		menuMod();
	}
		
	
	</script>

</head>
<body onload= "getList();">

	<div id="wrap">
	
		<div id="buttons">
			<input type="button" value="메뉴추가" onclick="addMenu();"/>
			<!--<input type="button" value="리스트 보기" onclick="getList()"/>  -->
			<input type="button" value="저장" onclick="menuSave();"/>
			<input type="button" value="수정" onclick="menuMod();"/>
		</div>
		
		<div class="mList" >
			<div>
				<span style="width:50px;"></span>
				<span style="width:120px;">메뉴아이디</span>
				<span style="width:480px;">메뉴이름</span>
				<span style="width:100px;"></span>
			</div>
		<div  id="menuList">
			
		
		</div>
		
		</div>
	</div>


</body>
</html>