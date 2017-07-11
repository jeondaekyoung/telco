
var rootPath = window.location.protocol + '//' +window.location.host + '/telco';

$(document).ready(function(){
	$('#login').click(function(){
		if(checkValue() == true){
			$('#loginForm').submit();
		}
	});
});

var checkValue = function(){
	if($('#user_id').val() == ""){
		alert("아이디를 입력해주세요");
		$('#user_id').focus();
		return false;
	} else if($('#user_pw').val() == ""){
		alert("비밀번호를 입력해주세요");
		$('#user_pw').focus();
		return false;
	} else {
		return true;
	}
};

var agree = function(){
	location.href=rootPath + "/views/user/agree.jsp";
};