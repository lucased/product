//visual effects for the navigation
function mainnavi(){
	//Add the rounded corners to each dropdown
	$('li ul').each(function(index) {
		$(this).find('li:first').css({'border-top':'none'});
		$(this).append('<li class="dropdown_bottom"></li>').prepend('<li class="dropdown_top"></li>')
	});
	//If browser isn't IE then applay a fade effect on hover
	if(!($.browser.msie)){
		$("#navigation ul").css({"display":"none", "opacity": 0});

		$("#navigation li").hover(function(){
			$(this).find('ul:first').css({'display':"block"}).stop().animate({'opacity':1},100);
		},function(){
			$(this).find('ul:first').stop().animate({'opacity':0},250,function(){
				$(this).css({'display':"none"});
			});
		});
	}
}
/*If the window size is below 960px set the width of all ellements with width 100% to 960px*/
function stretch(){
	var viewportWidth = $(window).width();
	if(viewportWidth < 960){
		$('#top_wrapper_line_t, #top_wrapper_line_b, #footer_very_bottom_wrapper, #footer_wrapper_line').css({width:960});
	}else{
		$('#top_wrapper_line_t, #top_wrapper_line_b, #footer_very_bottom_wrapper, #footer_wrapper_line').css({width:'100%'});
	}
	window.onresize = stretch;
}
function validate_contactform(){

	$('.contactform').append('<div id="c_loader"></div>');
	$('#c_submit').hide();
	
	var c_name = $('#c_name'), c_email = $('#c_email'), c_website = $('#c_website'), c_subject = $('#c_subject'), c_message = $('#c_message');
	var filter=/^(\w+(?:\.\w+)*)@((?:\w+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var error_exist = 0;
	
	
	if(c_name.val().length < 4){
		c_name.addClass('error');
		error_exist++;
	}else{
		c_name.removeClass('error');
	}	
	if(c_subject.val().length < 4){
		c_subject.addClass('error');
		error_exist++;
	}else{
		c_subject.removeClass('error');
	}
	if(c_website.val().length > 0){
		if(c_website.val().length < 4){
			c_website.addClass('error');
			error_exist++;
		}else{
			c_website.removeClass('error');
		}
	}else{
		c_website.removeClass('error');
	}	
	if(c_message.val().length < 10){
		c_message.addClass('error');
		error_exist++;
	}else{
		c_message.removeClass('error');
	}	
	if(!filter.test(c_email.val())){
		c_email.addClass('error');
		error_exist++;
	}else{
		c_email.removeClass('error');
	}
	
	if(error_exist > 0){
		$('#c_loader').remove();
		$('#c_submit').show();

	}else{
		var dataString = 'name='+ c_name.val() + '&subject='+ c_subject.val() + '&email=' + c_email.val() + '&website=' + c_website.val() + '&message=' + c_message.val();
		$.ajax({
			type: "POST",
			url: "sendmail.php",
			data: dataString,
			success: function(response) {
				if(response == "sent"){
					$('#c_loader').remove();
					$('.contactform').prepend('<div class="noti_success">Message has been sent successfull! We will get in contact with you shortly</div>');
				}else{
					$('#c_loader').remove();
					$('#c_submit').show();
					$('.contactform').prepend('<div class="noti_error">There was an error while sending your message</div>');
				}
			}
		});
	}
	
}
function validate_footercontactform(){
	
	var fc_name = $('#fc_name'), fc_email = $('#fc_email'), fc_message = $('#footer_textarea');
	var filter=/^(\w+(?:\.\w+)*)@((?:\w+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var error_exist = 0;
	
	
	if(fc_name.val().length < 4 || fc_name.val() == "name"){
		fc_name.addClass('error');
		error_exist++;
	}else{
		fc_name.removeClass('error');
	}	
	if(fc_message.val().length < 10 || fc_message.val() == "Your Message"){
		fc_message.addClass('error');
		error_exist++;
	}else{
		fc_message.removeClass('error');
	}	
	if(!filter.test(fc_email.val())){
		fc_email.addClass('error');
		error_exist++;
	}else{
		fc_email.removeClass('error');
	}
	
	if(error_exist > 0){
	}else{
		var dataString = 'name='+ fc_name.val() + '&email=' + fc_email.val() + '&message=' + fc_message.val();
		$.ajax({
			type: "POST",
			url: "sendmail_footer.php",
			data: dataString,
			success: function(response) {
				if(response == "sent"){
				
				}else{
				
				}
			}
		});
	}
	
}
$(document).ready(function(){
	mainnavi();
	stretch();
	$('#c_submit').click(function(){
		validate_contactform();
		return false;
	});
	$('#footer_submit').click(function(){
		validate_footercontactform();
		return false;
	});
	
	/*$('h1, h3').click(function(){
		$('#colorsheme').attr('href', 'styles/darkwood.css')
	});*/
});