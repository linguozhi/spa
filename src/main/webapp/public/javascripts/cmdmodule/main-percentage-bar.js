define(function(require, exports, module) {
	
	var app = {
		 
		init:function(obj,pWidth,pHeight,textNum,percentage){
			
			obj.css({
				width:Math.round(pWidth),
				height:Math.round(pHeight)
			});
			var labelWidth = Math.round((textNum)*pHeight);
			obj.find(".mainPercentageBarLabel").css({
				height:Math.round(pHeight),
				lineHeight:Math.round(pHeight)+"px",
				width:labelWidth,
				fontSize:Math.round(pHeight*0.9)

			});
			var barHeight = Math.round(pHeight/2.8);
			var barWidth = Math.round(pWidth-labelWidth-2);
			obj.find(".mainPercentageBarBar").css({
				marginTop:Math.round((pHeight-barHeight)/2-1),
				width:barWidth,
				height:barHeight
			});
			if(percentage>100){
				percentage = 99;
			}
			obj.find(".mainPercentageBarComplete").css({
				width:percentage+"%",
				height:barHeight-2
			});
			var dotWidth = Math.round(pHeight/1.8);
			var dotTop = Math.round((barHeight-dotWidth)/2-1);
			obj.find(".mainPercentageBarCompleteDot").css({
				width:dotWidth,
				height:dotWidth,
				borderRadius:dotWidth*2,
				top:dotTop,
				right:Math.round(-dotWidth/2)
			});
			var numWidth = Math.round(pHeight*2);

			obj.find(".mainPercentageBarCompleteNum").css({
				fontSize:Math.round(pHeight*0.8),
				width:numWidth,
				height:numWidth,
				top:Math.round(dotWidth*1.5),
				left:-Math.round((numWidth-dotWidth)/2)
			}).html(Math.round(percentage)+"%");
			
			
		}
		
	};
	
	
	
	
	module.exports = app;
	
});