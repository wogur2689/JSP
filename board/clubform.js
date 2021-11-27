/**
 * 
 */
function deletecheck() {
	if ( document.clubform.password.value=="") {
		alert("암호를 입력해 주세요");
		document.boardform.password.focus();
		return;
	}		

	ok = confirm("삭제하시겠습니까?");
	if (ok) {
		document.clubform.menu.value='delete';
		document.clubform.submit();
	} else {
		return;
	}			
}

function insertcheck() {
	if ( document.clubform.name.value=="" ) {
		alert("이름을 입력해 주세요.");
		document.clubform.name.focus();
		return;
	}
	if ( document.clubform.password.value=="" ) {
		alert("암호를 입력해 주세요.");
		document.clubform.password.focus();
		return;
	}
	document.clubform.menu.value='insert';
	document.clubform.submit();
}

function updatecheck() {
	if ( document.clubform.name.value=="" ) {
		alert("이름을 입력해 주세요.");
		document.clubform.name.focus();
		return;
	}
	if ( document.clubform.password.value=="" ) {
		alert("암호를 입력해 주세요.");
		document.clubform.password.focus();
		return;
	}
	document.clubform.menu.value='update';
	document.clubform.submit();			
}