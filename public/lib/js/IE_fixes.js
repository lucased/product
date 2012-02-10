$(document).ready(function(){
	$('a.button span').hover(function(){
		$(this).css("background-position","0 -34px");
	},function(){
		$(this).css("background-position","0 0");
	});
});