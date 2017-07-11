$(function(){
	var speed = 3000;
	var index= $('.slide').index();
	var size= $('.bxslider>li').size() -1;
	var timer = setInterval(function(){
		slideMotion();
	},speed);
	$('.bxslider').hover(function(){
		clearInterval(timer);
	},function(){
		timer = setInterval(function(){
			slideMotion();
		},speed);
	});
	
	function slideMotion(){
		if(size == index){
			index = 0;
		}
		$('.bxslider>li').eq(index).fadeOut().next().fadeIn();
		index++;
	};
});