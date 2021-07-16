
//필수값 체크 함수
function chkValue(id1, id2){
	
	var obj = document.getElementById(id1);

	if(obj.value == ""){
		var obj2 = document.getElementById(id2);
		obj2.innerHTML = "필수값입니다.";
	}
	else{
		var obj2 = document.getElementById(id2);
		obj2.innerHTML = "";
	}

}


function chkPass(){
	
	var obj1 = document.getElementById("userPass");
	var obj2 = document.getElementById("userPass_Re");

	if(obj1.value != obj2.value){
		var obj3 = document.getElementById("passMsg_Re");
		obj3.innerHTML = "두개의 패스워드값이 일치하지 않습니다.";
	}
	else{
		var obj3 = document.getElementById("passMsg_Re");
		obj3.innerHTML = "패스워드 일치";
	}

}

function memberOK(){
	document.getElementById("memberForm").submit();
}
