$(function() {

	$("select#product_category_id").change(function(){
		var category_name = this.options[1].text
		if (category_name === "Jibs & Cranes") {
			$("#product_sub_category_input").visibility =  nil;
			$("select#product_sub_category_id").enabled = true;
		}else{
			$("#product_sub_category_input").visibility =  hidden;
			$("select#product_sub_category_id").disabled = true;	
		};
	});

});
