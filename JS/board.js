/**
 * 
 */

var httpRequest = null;
var httpRequest2 = null;
var MenuID = "";

function getHttpRequest(){

	return new XMLHttpRequest();
}


function getMenus(selecteMenuID){
	//server에 있는 list.jsp를 호출
	MenuID = selecteMenuID;
	
	httpRequest = getHttpRequest();
	
	httpRequest.onreadystatechange = menuList;
	
	httpRequest.open("POST","./ajax/getMenus.jsp",true);
	
	httpRequest.send(null);
	
}

function menuList(){

	if (httpRequest.readyState == 4) 
	{
		if (httpRequest.status == 200) 
		{
			
			var datas = httpRequest.responseXML;
			
			setMenus(datas);
			
		}
		else{
			
			alert("실패:" + httpRequest.status);
		}
	}	
}


function setMenus(datas){
	
	var menuIDs = datas.getElementsByTagName("menuid");
	var menuNames = datas.getElementsByTagName("menuname");

	var strHTML = "";
	for(var i=0; i<menuIDs.length; i++){
		strHTML += "<a href='javascript:getBoardList(&quot;"+menuIDs[i].childNodes[0].nodeValue +"&quot;);'>"
		strHTML += "<span>";
		strHTML += menuNames[i].childNodes[0].nodeValue;
		strHTML += "</span>"
		strHTML += "</a>"
	}
	
	document.getElementById("menus").innerHTML = strHTML;
	
	getBoardList(MenuID);
}

function getBoardList(selectedMenuID){
	httpRequest2 = getHttpRequest();
	
	clickMenuID = selectedMenuID;
	
	httpRequest2.onreadystatechange = boardList;
	httpRequest2.open("GET","./ajax/getBoardList.jsp?menuid=" + clickMenuID, true);	
	httpRequest2.send(null);
}

function boardList(){
	if (httpRequest2.readyState == 4) 
	{
		if (httpRequest2.status == 200) 
		{
			var datas = httpRequest2.responseXML;

			setBoards(datas);
			
		}
		else{
			
			alert("실패:" + httpRequest2.status);
		}
	}
}
	function setBoards(datas){
		
		var bnums = datas.getElementsByTagName("bnum");
		var titles = datas.getElementsByTagName("title");
		var idxs = datas.getElementsByTagName("idx");
		
		var strHTML = "";
			strHTML += "<div class='row'>";
			strHTML += "<span>글번호</span>";
			strHTML += "<span style='width:500px'>글제목</span>";
			strHTML += "</div>";
		
		for(var i=0; i<bnums.length; i++){
			
			var bnum = bnums[i].childNodes[0].nodeValue;
			var title = titles[i].childNodes[0].nodeValue;
			var idx = idxs[i].childNodes[0].nodeValue;
			
			var param = "?idx=" + idx + "&selectedMenuID=" + clickMenuID;
			
			strHTML += "<div class='row' style='clear:both'>";
			strHTML += "<span>" + bnum  + "</span>";
			strHTML += "<span style='width:500px'><a href = 'content.jsp"+ param +"'>" + title  + "</a></span>";
			strHTML += "</div>";
			
		}
		
		document.getElementById("bBody").innerHTML = strHTML;
	}



