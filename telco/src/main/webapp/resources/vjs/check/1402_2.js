if( window.location.host =='localhost:8080'){
	  var rootPath = window.location.protocol + '//' + window.location.host+'/telco';  
  }
  else
  var rootPath = window.location.protocol + '//' + window.location.host;



		$(document).ready(function(){
            $(".gnb_ul").mouseenter(function(){
                $(".sub_nav").stop().slideDown("slow");
                $(this).toggleClass("active"); return false;
            });
            $(".nav_wrap").mouseleave(function(){
                $(".sub_nav").stop().slideUp("slow");
                $(this).toggleClass("active"); return false;
            });
            
          //자기앞수표발행
            $("#publish").click(function(){
            	if(checkValue() == true){
            		console.log("자기앞수표발행");
            		$.ajax({
            			url: rootPath + "/check/publish.do"
            			,type: "POST"
            			,data: {
            				cash: checkNull($("#cash").val())
            				,alternative: checkNull($("#alternative").val())
            				,cashier_check: checkNull($("#cashier_check").val())
            				,cashier_nos: checkNull($("#cashier_nos").val())
            				,client_relation: $("#client_relation").val()
            				,client_realname_num: $("#client_realname_num").val()
            				,client_name: $("#client_name").val()
            				,sub_num: checkNull($("#sub_num").val())
            				,sub_name: checkNull($("#sub_name").val())
            				            				
            				,check_no1: checkNull($("#check_no1").val())
            				,check_sepa1: $("#check_sepa1").val()
            				,number_of_sheet1: checkNull($("#number_of_sheet1").val())
            				,start_num1: checkNull($("#start_num1").val())
            				,check_no2: checkNull($("#check_no2").val())
            				,check_sepa2: $("#check_sepa2").val()
            				,number_of_sheet2: checkNull($("#number_of_sheet2").val())
            				,start_num2: checkNull($("#start_num2").val())
            				,check_no3: checkNull($("#check_no3").val())
            				,check_sepa3: $("#check_sepa3").val()
            				,number_of_sheet3: checkNull($("#number_of_sheet3").val())
            				,start_num3: checkNull($("#start_num3").val())
            				,check_no4: checkNull($("#check_no4").val())
            				,check_sepa4: $("#check_sepa4").val()
            				,number_of_sheet4: checkNull($("#number_of_sheet4").val())
            				,start_num4: checkNull($("#start_num4").val())
            				,check_no5: checkNull($("#check_no5").val())
            				,check_sepa5: $("#check_sepa5").val()
            				,number_of_sheet5: checkNull($("#number_of_sheet5").val())
            				,start_num5: checkNull($("#start_num5").val())
            			}
            			,success: publishSuccess
            			,error: errorCallback
            		})
            		
            	}
            });
          
            //결과 팝업화면
			$('#resultPopup').avgrund({
				height: 350,
				holderClass: 'custom',
				closeByEscape: false,
				closeByDocument: false,
				showClose: true,
				showCloseText: '확인',
				onUnload: function () {
					window.location.reload()
				},
				template: $("#resultPopup")
			});
        });

var publishSuccess = function(resultData){
	$.each(resultData, function(key, value){
		if(key == "amount"){
			$("#resultTable > tbody").append("<tr><th>금액</th><td>" + value +"</td></tr>");
		} else if(key == "checks"){
			$.each(value, function(index, item){
				$("#resultTable > tbody").append("<tr><th>수표권종 정보</th><td>" + item + "</td></tr>");
			});
		} 
	});
	
	//팝업실행
	$("#resultPopup").show();
	$("#resultPopup").trigger('click');
}
//자기앞수표발행 전 체크
var checkValue = function(){
	if(($("#totalAmount").val() == "") || ($("#totalAmount").val() == 0)){
		alert("발행정보를 확인해주세요");
		return false;
	}
	if(($("#totalCash").val() == "") || ($("#totalCash").val() == 0)){
		alert("발행금액을 확인해주세요");
		return false;
	}
	if($("#totalAmount").val() != $("#totalCash").val()){
		alert("발행정보의 총금액과 발행금액 합계가 같아야합니다.");
		return false;
	}
	if($("#client_realname_num").val() == ""){
		alert("의회인 실명번호를 입력해주세요.");
		$("#client_realname_num").focus();
		return false;
	} 
	if($("#client_name").val() == "")	{
		alert("의뢰인 성명을 입력해주세요.");
		$("#client_name").focus();
		return false;
	}
	if($("#client_relation").val() == "02"){
		if(($("#sub_name").val() == "" ) || ($("#sub_num").val() == "")){
			alert("대리인 실명번호와 대리인 성명을 입력해주세요");
			return false;
		}
	}
	
	return true;
}
        
//발행정보 계산
var endnum = function(tag){
	var checkSepa, ofSheet, amount, start_num;
	var amount1 = ($("#amount1").val() == "") ? 0 : parseInt($("#amount1").val());
	var amount2 = ($("#amount2").val() == "") ? 0 : parseInt($("#amount2").val());
	var amount3 = ($("#amount3").val() == "") ? 0 : parseInt($("#amount3").val());
	var amount4 = ($("#amount4").val() == "") ? 0 : parseInt($("#amount4").val());
	var amount5 = ($("#amount5").val() == "") ? 0 : parseInt($("#amount5").val());
	switch(tag.name){
	case "case1":
		checkSepa = $("#check_sepa1").val();
		ofSheet = ($("#number_of_sheet1").val() == "") ? 0 : parseInt($("#number_of_sheet1").val());
		start_num = ($("#start_num1").val() == "") ? 0 : parseInt($("#start_num1").val());
		switch(checkSepa){
			case "01": amount = 100000; break;
			case "02": amount = 300000; break;
			case "03": amount = 500000; break;
			case "04": amount = 1000000; break;
			default:
		}
		if(ofSheet != 0){
			$("#amount1").val(amount*ofSheet);
			$("#totalAmount").val(parseInt($("#amount1").val()) + amount2 + amount3 + amount4 + amount5);
			$("#end_num1").val(start_num+ofSheet-1);
		}
		if(ofSheet == ""){
			$("#amount1").val("");
			$("#totalAmount").val(amount2 + amount3 + amount4 + amount5);
			$("#end_num1").val("");
		} else if(ofSheet == 0){
			$("#amount1").val("");
			$("#totalAmount").val(amount2 + amount3 + amount4 + amount5);
			$("#end_num1").val("");
		}
		if(start_num == ""){
			$("#end_num1").val("");
		}
		
		break;
	case "case2":
		checkSepa = $("#check_sepa2").val();
		ofSheet = ($("#number_of_sheet2").val() == "") ? 0 : parseInt($("#number_of_sheet2").val());
		start_num = ($("#start_num2").val() == "") ? 0 : parseInt($("#start_num2").val());
		switch(checkSepa){
			case "01": amount = 100000; break;
			case "02": amount = 300000; break;
			case "03": amount = 500000; break;
			case "04": amount = 1000000; break;
			default:
		}
		if(ofSheet != 0){
			$("#amount2").val(amount*ofSheet);
			$("#totalAmount").val(amount1 + parseInt($("#amount2").val()) + amount3 + amount4 + amount5);
			$("#end_num2").val(start_num+ofSheet-1);
		}
		if(ofSheet == ""){
			$("#amount2").val('');
			$("#totalAmount").val(amount1 + amount3 + amount4 + amount5);
			$("#end_num2").val("");
		} else if(ofSheet == 0){
			$("#amount2").val("");
			$("#totalAmount").val(amount1 + amount3 + amount4 + amount5);
			$("#end_num2").val("");
		}
		if(start_num == ""){
			$("#end_num2").val("");
		}
		break;
	case "case3":
		checkSepa = $("#check_sepa3").val();
		ofSheet = ($("#number_of_sheet3").val() == "") ? 0 : parseInt($("#number_of_sheet3").val());
		start_num = ($("#start_num3").val() == "") ? 0 : parseInt($("#start_num3").val());
		switch(checkSepa){
			case "01": amount = 100000; break;
			case "02": amount = 300000; break;
			case "03": amount = 500000; break;
			case "04": amount = 1000000; break;
			default:
		}
		if(ofSheet != 0){
			$("#amount3").val(amount*ofSheet);
			$("#totalAmount").val(amount1 + amount2 + parseInt($("#amount3").val()) + amount4 + amount5);
			$("#end_num3").val(start_num+ofSheet-1);
		}
		if(ofSheet == ""){
			$("#amount3").val('');
			$("#totalAmount").val(amount1 + amount2 + amount4 + amount5);
			$("#end_num3").val("");
		} else if(ofSheet == 0){
			$("#amount3").val("");
			$("#totalAmount").val(amount1 + amount2 + amount4 + amount5);
			$("#end_num3").val("");
		}
		if(start_num == ""){
			$("#end_num3").val("");
		}
		break;
	case "case4":
		checkSepa = $("#check_sepa4").val();
		ofSheet = ($("#number_of_sheet4").val() == "") ? 0 : parseInt($("#number_of_sheet4").val());
		start_num = ($("#start_num4").val() == "") ? 0 : parseInt($("#start_num4").val());
		switch(checkSepa){
			case "01": amount = 100000; break;
			case "02": amount = 300000; break;
			case "03": amount = 500000; break;
			case "04": amount = 1000000; break;
			default:
		}
		if(ofSheet != 0){
			$("#amount4").val(amount*ofSheet);
			$("#totalAmount").val(amount1 + amount2 + amount3 + parseInt($("#amount4").val()) + amount5);
			$("#end_num4").val(start_num+ofSheet-1);
		}
		if(ofSheet == ""){
			$("#amount4").val('');
			$("#totalAmount").val(amount1 + amount2 + amount3 + amount5);
			$("#end_num4").val("");
		} else if(ofSheet == 0){
			$("#amount4").val("");
			$("#totalAmount").val(amount1 + amount2 + amount3 + amount5);
			$("#end_num4").val("");
		}
		if(start_num == ""){
			$("#end_num4").val("");
		}
		break;
	case "case5":
		checkSepa = $("#check_sepa5").val();
		ofSheet = ($("#number_of_sheet5").val() == "") ? 0 : parseInt($("#number_of_sheet5").val());
		start_num = ($("#start_num5").val() == "") ? 0 : parseInt($("#start_num5").val());
		switch(checkSepa){
			case "01": amount = 100000; break;
			case "02": amount = 300000; break;
			case "03": amount = 500000; break;
			case "04": amount = 1000000; break;
			default:
		}
		if(ofSheet != 0){
			$("#amount5").val(amount*ofSheet);
			$("#totalAmount").val(amount1 + amount2 + amount3 + amount4 + parseInt($("#amount5").val()));
			$("#end_num5").val(start_num+ofSheet-1);
		}
		if(ofSheet == ""){
			$("#amount5").val('');
			$("#totalAmount").val(amount1 + amount2 + amount3 + amount4);
			$("#end_num5").val("");
		} else if(ofSheet == 0){
			$("#amount5").val("");
			$("#totalAmount").val(amount1 + amount2 + amount3 + amount4);
			$("#end_num5").val("");
		}
		if(start_num == ""){
			$("#end_num5").val("");
		}
		break;
	default: break;
	}
};

//발행금액 합계
function addSum() {
	var sum =  Number($("#cash").val()) +  Number($("#alternative").val()) +  Number($("#cashier_check").val());
	$("#totalCash").val( sum );
	return;
};

//대리인 항목 출력여부
function relationshipAccountHolder() {
	if( $("#client_relation").val()=="01" ) {
		$(".ones").hide();
	}
	else {
		$(".ones").show();
		$("#sub_name").val("");
		$("#sub_num").val("");
	}
	return;
};

//채번발행으로 이동        
function moveUrl(form) {
    var Url=form.options[form.selectedIndex].value;
    if (Url!="") { location.href=Url;
    }
};

//Ajax 데이터 널체크
var checkNull = function(data){
	if(data==""){
		return undefined;
	} else {
		return data;
	}
};
//Ajax 에러 콜백함수
var errorCallback = function(){
	alert("수행 중 오류가 발생했습니다.");
};