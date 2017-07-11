var rootPath = window.location.protocol + '//' +window.location.host + '/telco';

$(document).ready(function(){
	
	
	
});

var searchJuso = function(){
	
	$.ajax({
		url: rootPath + "/customer/searchAddr.do"
		,type: "post"
		,data: {
			searchWord: $("#searchWord").val()
		}
		,success: searchAddr
		,error: errorCallback
			
	});
};

var searchAddr = function(resultData){
	$("#jusoTable > tbody").empty();
	//console.log(resultData);
	$.each(resultData, function(index, item){
		var listTr = "<tr>" + "<td>" + (index+1) + "</td>"
						+ "<td>" + item.zip_code + "</td>"
						+ "<td onclick='act(\"" + item.zip_code + "\"" + ",\"" + item.juso + "\" );'>" + item.juso + "</td>" + "</tr>";
		$("#jusoTable > tbody").append(listTr);
	});
};

var act = function(zip_code, juso){
	var tabValue = "${param.tab}";
	//console.log(tabValue);
	if(tabValue == 1){
		$("#tab1_zip_code", opener.document).val(zip_code);
		$("#tab1_address_before", opener.document).val(juso);
	} else if(tabValue == 2){
		$("#tab2_zip_code", opener.document).val(zip_code);
		$("#tab2_address_before", opener.document).val(juso);
	} else if(tabValue == 3){
		$("#tab3_zip_code", opener.document).val(zip_code);
		$("#tab3_address_before", opener.document).val(juso);
	}
	window.close();
};

//Ajax 에러 콜백함수
var errorCallback = function(){
	alert("수행 중 오류가 발생했습니다.");
};