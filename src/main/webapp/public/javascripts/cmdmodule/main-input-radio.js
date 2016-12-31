define(function(require, exports, module) {
	var mainInputRadio={


		getObject:function(){  
	            
			var app = {
				
				init:function(obj,height){
					var that = this;
					var boxWidth = Math.round(height*0.9); 
					var boxHeight = boxWidth;
					that.obj = obj;
					obj.find(".mainInputRadioItems").each(function(){
						
						$(this).css({
							height:Math.round(height)
						});
						$(this).find(".mainInputRadioBoxWrap").css({
							width:Math.round(height),
							marginRight:Math.round(height/3),
							height:Math.round(height)
						});
						$(this).find(".mainInputRadioBox").css({
							width:boxWidth,
							height:boxHeight,
							marginTop:Math.round((height-boxHeight)/2),
							borderRadius: Math.round(boxWidth/4)+"px"
						});
						var mainInputRadioLabelHeight = Math.round(height+(height-boxHeight)/2);
						$(this).find(".mainInputRadioLabel").css({
							lineHeight:Math.round(height)+1+"px",
							fontSize:Math.round(height),
							height:Math.round(height)
						});
						
					});
					obj.find(".mainInputRadioItems").bind("click",function(){
						var index = $(this).index();
						console.log("index"+index);
	                	if(that.selectArr[index]==0){
	                		$(this).find(".mainInputRadioBoxTick").show();
	                		that.selectArr[index] = 1;
	                	}else if(that.selectArr[index]==1){
	                		$(this).find(".mainInputRadioBoxTick").hide();
	                		that.selectArr[index] = 0;
	                	}
	            	});
					
				},
				select:function(selectArr){
					var that = this;
					that.selectArr = selectArr;
					that.obj.find(".mainInputRadioItems").each(function(){
						var index = $(this).index();
						
						if(selectArr[index]==1){
							$(this).find(".mainInputRadioBoxTick").show();
						}else if(selectArr[index]==0){
							$(this).find(".mainInputRadioBoxTick").hide();
						}
					});
				}
			}
			return app;
		}

	}
	
	
	
	module.exports = mainInputRadio;
	
});