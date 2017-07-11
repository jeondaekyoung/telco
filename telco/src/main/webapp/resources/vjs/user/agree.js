

var goLogin = function() {
	location.href="login.jsp";
}
var goJoin = function() {
    var n = $('input:checked').length;
    if(n != 2) {
    	alert("텔코 이용약관과 개인정보수집 및 이용 안내에 동의해주세요.");
    } else {
    	location.href="join.jsp";
    }
	
}