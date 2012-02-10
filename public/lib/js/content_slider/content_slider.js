/*contentslider by broof*/
function init(){

	var transition_time = 300;//duration how long the transition effect goes
	var duration = 6000; //duration how long a slide will stay

	var container = $('#content_slider');//get the container
	var container_nav = $('#content_slider_nav');
	var slides = $('#content_slider li');//get all slides
	var total = slides.size();//get all slides
	var active = 0;//set startslide to 0(first slide)
	var in_trans = 0;
	
	slides.hide();//hide all slides	
	container_nav.width(total*23);	
	for (var x = 1; x <= total; x++){
		container_nav.append('<li id="'+x+'">');
	}	
	function setSlide(new_active){
		in_trans = 1;
		$('#content_slider_nav li').removeClass('active');
		$('#content_slider_nav li').eq(new_active-1).addClass('active');
		slides.eq(active).stop().fadeOut(transition_time, function(){
			slides.eq(new_active-1).stop().fadeIn(transition_time, function(){
				$('#shadow').remove();
				slides.eq(new_active-1).append('<div id="shadow">');
				active = new_active-1;
				in_trans = 0;
				slides.eq(active).animate({opacity: 1},duration,function(){
					slides.eq(active).fadeOut(transition_time, function(){
						$('#content_slider_nav li').removeClass('active');
						if(active != total-1){
							active++;
							rotate();
						}else{
							active = 0;
							rotate();
						}
					});					
				});
			});
		});
	}	
	$('#content_slider_nav li').click(function(){
		if(in_trans == 0){
			var new_active = $(this).attr('id');
			if(active != new_active-1){
				setSlide(new_active);
			}	
		}
	});	
	function rotate(){	
		$('#content_slider_nav li').eq(active).addClass('active');
		slides.eq(active).fadeIn(transition_time, function(){
			slides.eq(active).append('<div id="shadow">');	
			slides.eq(active).animate({opacity: 1},duration,function(){			
				slides.eq(active).fadeOut(transition_time, function(){
					$('#shadow').remove();
					$('#content_slider_nav li').removeClass('active');
					if(active != total-1){
						active++;
						rotate();
					}else{
						active = 0;
						rotate();
					}				
				});	
			});
		});
	}
	rotate();//call rotate function
}
$(document).ready(function(){
init();
});