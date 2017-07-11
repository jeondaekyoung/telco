
$(document).ready(function() {
	$('#join_t').click(function(){
		if(checkValue() == true){
			$('#joinTeacher').submit();
		}
	});
});

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
    } else if($("#user_pw").val() != $("#user_pw1").val()){
        alert("비밀번호를 확인해주세요.");
        $("#user_pw").focus();
        return false;
    } 
    
    if($("#charge_or:checked").val() == "예"){
    	 if($("#grade").val() == ""){
    		 alert("학년를 입력해주세요");
    		 $("#grade").focus();
    		 return false;
    	 } else if($("#affiliation").val() == ""){
    	     alert("계열/과를 입력해주세요");
    	     $("#affiliation").focus();
    	     return false;
    	 } else if($("#ban").val() == ""){
    		 alert("반을 입력해주세요");
    		 $("#ban").focus();
    		 return false;
    	 }
    }
    return true;
}

//Ajax 데이터 널체크
var checkNull = function(data){
if(data==""){
	return undefined;
} else {
	return data;
}
};