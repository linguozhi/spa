define(function(require, exports, module) {
	
	var app = {
		
		init:function(obj,width,height,labelNum){
			obj.css({
				width:Math.round(width),
				height:Math.round(height)
			});
			var labelWidth = Math.round(height*(labelNum+1.3));
			obj.find(".mainInputTextLabel").css({
				width:labelWidth,
				height:Math.round(height),
				fontSize:Math.round(height),
				lineHeight:Math.round(height+1)+"px"
			});
			obj.find(".mainInputTextContent").css({
				width:Math.round(width-labelWidth),
				height:Math.round(height),
				marginLeft:labelWidth,
				fontSize:Math.round(height*0.9),
				lineHeight:Math.round(height-1)+"px"
			});
		}
		
	};
	
	
	
	
	module.exports = app;
	
});