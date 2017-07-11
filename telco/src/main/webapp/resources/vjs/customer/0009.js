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

      
      //계좌조회
      $("#findBankbook").click(function(){
    	  var findNum = $("#account_num").val();
    	  if(findNum == ""){
    		  alert("계좌번호를 입력해주세요");
    	  } else {
        	  $.ajax({
        		  url: rootPath + "/customer/findBankbook.do"
        		  ,type: "POST"
        		  ,data: {
        			  account_num: findNum
        		  }
        		  ,success: findBankbookSuccess
        		  ,error: errorCallback
        	  });
    		  
    	  }
      });
});//-->read end

var findBankbookSuccess = function(resultData){
	if(resultData == ""){
		alert("찾는 계좌번호가 없습니다.");
		return ;
	}
	$.each(resultData, function(key, value){
		//console.log(key + " / " + value);
		if(key == "customer_name"){
			$("#customer_name").val(value);
		} else if(key == "customer_qualf_name"){
			$("#customer_qualf_name").val(value);
		} else if(key == "open_date"){
			$("#open_date").val(value);
		} else if(key == "item_name"){
			$("#item_name").val(value);
		} else if(key == "balance"){
			$("#balance").val(value);
		} else if(key == "management_point"){
			$("#management_point").val(value);
		} else if(key == "bankbookTrades"){
			$("#myTable > tbody").empty();
			$.each(value, function(index, item){
				var sbmTr = sbmHtmlTemplate.makesbmTr(index, item);
				$("#myTable > tbody").append(sbmTr);
			});
		}
	});
	
	
};

var sbmHtmlTemplate = {
	makesbmTr : function(index, item){
		var sysdate = new Date(item.trade_datetime);
		//console.log(index + " / " + sysdate);
		var sbmTr = "<tr><td>" + sysdate.toLocaleString() + "</td><td>" + item.trade_sepa + "</td>"
						+ "<td>" + item.currency_code + "</td><td>" + item.trade_amount + "</td>"
						+ "<td>" + item.trade_balance + "</td><td>" + item.summary + "</td>"
						+ "<td>" + item.client_name + "</td><td>" + item.management_point + "</td></tr>";
		return sbmTr;
	}
}

//Ajax 에러 콜백함수
var errorCallback = function(){
	alert("수행 중 오류가 발생했습니다.");
};