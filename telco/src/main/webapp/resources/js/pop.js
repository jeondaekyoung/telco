/* 레이어팝업 스크립트 */
$(document).ready(function () {
	//이용자등록탭 - 비밀번호 초기화
    $(".btn2").click(function() {
       $(".ly_pop").show();
    });
    //이용자등록탭 - 이용자 정보수정
    $(".btn3").click(function() {
    	if(checkValue1() == true){
    		$(".ly_pop2").show();
    	}
    });
    //학습상황탭 - 과제부여하기
    $(".btnTask2").click(function(){
        $(".btnTask").toggle();
    });
});

function close_lypop(frm, div){
    document.getElementById(div).style.display='none';
}


/* 메모 닫는 스크립트 */
$(document).ready(function () {
  $(".more").click(function() {
    $(".comment1").fadeToggle("slow");
  });
  $(".comment1").click(function() {
    $(this).hide("slow");
  });
});

$(document).ready(function () {
  $(".close").click(function() {
    $(".comment2").hide("slow");
    $(".images").hide("slow");
  });
  $(".note1").click(function() {
    $(".posi1").fadeToggle("slow");
    $(".posi12").fadeToggle("slow");
    $(".posi19").fadeToggle("slow");
    $(".posi20").fadeToggle("slow");
    $(".posi24").fadeToggle("slow");
    $(".posi31").fadeToggle("slow");
    $(".posi41").fadeToggle("slow");
    $(".posi42").fadeToggle("slow");
    $(".posi43").fadeToggle("slow");
    $(".posi47").fadeToggle("slow");
    $(".posi54").fadeToggle("slow");
    $(".posi60").fadeToggle("slow");
    $(".posi62").fadeToggle("slow");
  });
  $(".note2").click(function() {
    $(".posi2").fadeToggle("slow");
    $(".posi13").fadeToggle("slow");
    $(".posi21").fadeToggle("slow");
    $(".posi32").fadeToggle("slow");
    $(".posi44").fadeToggle("slow");
    $(".posi48").fadeToggle("slow");
    $(".posi56").fadeToggle("slow");
    $(".posi61").fadeToggle("slow");
    $(".posi63").fadeToggle("slow");
    $(".posi555").fadeToggle("slow");
  });
  $(".note3").click(function() {
    $(".posi3").fadeToggle("slow");
    $(".posi14").fadeToggle("slow");
    $(".posi22").fadeToggle("slow");
    $(".posi25").fadeToggle("slow");
    $(".posi33").fadeToggle("slow");
    $(".posi45").fadeToggle("slow");
    $(".posi49").fadeToggle("slow");
    $(".posi57").fadeToggle("slow");
    $(".posi64").fadeToggle("slow");
  });
  $(".note4").click(function() {
    $(".posi4").fadeToggle("slow");
    $(".posi15").fadeToggle("slow");
    $(".posi23").fadeToggle("slow");
    $(".posi26").fadeToggle("slow");
    $(".posi34").fadeToggle("slow");
    $(".posi46").fadeToggle("slow");
    $(".posi50").fadeToggle("slow");
    $(".posi58").fadeToggle("slow");
    $(".posi65").fadeToggle("slow");
  });
  $(".note5").click(function() {
    $(".posi5").fadeToggle("slow");
    $(".posi35").fadeToggle("slow");
    $(".posi51").fadeToggle("slow");
    $(".posi55").fadeToggle("slow");
    $(".posi59").fadeToggle("slow");
  });
  $(".note6").click(function() {
    $(".posi6").fadeToggle("slow");
    $(".posi16").fadeToggle("slow");
    $(".posi27").fadeToggle("slow");
    $(".posi36").fadeToggle("slow");
    $(".posi52").fadeToggle("slow");
  });
  $(".note7").click(function() {
    $(".posi7").fadeToggle("slow");
    $(".posi17").fadeToggle("slow");
    $(".posi28").fadeToggle("slow");
    $(".posi37").fadeToggle("slow");
    $(".posi53").fadeToggle("slow");
  });
  $(".note8").click(function() {
    $(".posi8").fadeToggle("slow");
    $(".posi18").fadeToggle("slow");
    $(".posi29").fadeToggle("slow");
    $(".posi38").fadeToggle("slow");
  });
  $(".note9").click(function() {
    $(".posi9").fadeToggle("slow");
    $(".posi30").fadeToggle("slow");
    $(".posi39").fadeToggle("slow");
  });
  $(".note10").click(function() {
    $(".posi10").fadeToggle("slow");
    $(".posi40").fadeToggle("slow");
  });
  $(".note11").click(function() {
    $(".posi11").fadeToggle("slow");
  });
});