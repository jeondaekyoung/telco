

$(document).ready(function() {

});


var join_s = function() {
	if(checkValue() == true){
		$("#joinStudent").submit();
	}
    //console.log('aaaa  ' + checkValue());
};

var checkValue = function() {
    if($("#user_id").val() == ""){
		alert("아이디를 입력해주세요");
		$("#user_id").focus();
        return false;
	} else if($("#user_pw").val() == ""){
        alert("비밀번호를 입력해주세요");
        $("#user_pw").focus();
        return false;
    } else if($("#user_name").val() == ""){
        alert("이름를 입력해주세요");
        $("#user_name").focus();
        return false;
    } else if($("#email_address").val() == ""){
        alert("이메일를 입력해주세요");
        $("#email_address").focus();
        return false;
    } else if($("#school_name").val() == ""){
    	alert("학교이름을 입력해주세요.");
    	$("#school_name").focus();
    	return false;
    } else if($("#grade").val() == ""){
        alert("학년를 입력해주세요");
        $("#grade").focus();
        return false;
    } else if($("#affiliation").val() == ""){
        alert("계열/과를 입력해주세요");
        $("#affiliation").focus();
        return false;
    } else if($("#ban").val() == ""){
        alert("반를 입력해주세요");
        $("#ban").focus();
        return false;
    } else if($("#num").val() == ""){
        alert("번호를 입력해주세요");
        $("#num").focus();
        return false;
    } else if($("#user_pw").val() != $("#user_pw1").val()){
        alert("비밀번호를 확인해주세요.");
        $("#user_pw").focus();
        return false;
    } else return true;
};