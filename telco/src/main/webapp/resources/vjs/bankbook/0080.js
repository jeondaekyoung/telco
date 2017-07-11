if( window.location.host =='localhost:8080'){
	  var rootPath = window.location.protocol + '//' + window.location.host+'/telco';  
  }
  else
  var rootPath = window.location.protocol + '//' + window.location.host;


$(document).ready(function(){
    $(".gnb_ul").mouseenter(function(){
        $(".sub_nav").stop().slideDown("slow");
    });
    $(".nav_wrap").mouseleave(function(){
        $(".sub_nav").stop().slideUp("slow");
    });
    
    //계좌번호 조회
    $("#findBankbook").click(function(){
    	var findNum = $("#account_num").val();
    	if(findNum == ""){
    		alert("계좌번호를 입력해주세요");
    	} else {
    		$.ajax({
    			url: rootPath + "/bankbook/findBankbook.do"
    			,data : {
    				account_num: findNum
    			}
    			,success: findBankbookSuccess
    			,error: errorCallback
    		})
    	}
    });
});

//계좌조회 결과
var findBankbookSuccess = function(resultData){
console.log("계좌조회 - " + resultData);
if(resultData == ""){
alert("찾는 계좌번호가 없습니다.");
} else {
$("#imgBankbook").attr({
	src : rootPath + "/resources/image/bg/account.png"
	,width: "430"
	,height: "550"
});
}
};
//Ajax 에러 콜백함수
var errorCallback = function(){
alert("수행 중 오류가 발생했습니다.");
};