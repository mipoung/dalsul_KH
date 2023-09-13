function chkData(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

function formCheck(item, msgItem, msg){
	if($(item).val().replace(/\s/g, "") == "") {
		$(msgItem).val($(msg)+" 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}