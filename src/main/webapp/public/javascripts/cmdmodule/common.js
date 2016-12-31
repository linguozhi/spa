define(function(require) {
	
	
	
	var isSupportTouch = "ontouchend" in document ? true : false;
	if(isSupportTouch){
		window.click = "tap";
	}else{
		window.click = "click";
	}
	
	


	$("body").delegate(".hoverColor", "touchstart", function(){
	    $(this).addClass("hover-color");
	}); 

	$("body").delegate(".hoverColor", "touchmove", function(){
	    $(this).removeClass("hover-color");
	}); 

	$("body").delegate(".hoverColor", "touchend", function(){
	    $(this).removeClass("hover-color");
	}); 

	
	
	
	
});