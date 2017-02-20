define(function(require, exports, module) {
	var mainInputRadio={


		getObject:function(){  
	            
			var app = {
				
				init:function(obj,height){
					var that = this;
					var boxWidth = Math.round(height*0.9); 
					var boxHeight = boxWidth;
					that.radio = false;
					that.obj = obj;
					that.selectArr = new Array();
					that.itemSize = obj.find(".mainInputRadioItems").size();
					obj.find(".mainInputRadioItems").each(function(){
						var index = $(this).index();
						that.selectArr[index] = 0;
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

	                	if(that.selectArr[index]==0){
	                		if(that.radio){
	                			for(var i=0; i<that.itemSize; i++){
	                				that.selectArr[i] = 0;
	                			}
								obj.find(".mainInputRadioBoxTick").hide();
	                		}

	                		$(this).find(".mainInputRadioBoxTick").show();
	                		that.selectArr[index] = 1;

	                	}else if(that.selectArr[index]==1){
	                		$(this).find(".mainInputRadioBoxTick").hide();
	                		that.selectArr[index] = 0;
	                	}
	            	});
					
				},
				setRadio:function(){
					var that = this;
					that.radio = true;
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
				},
				getSelectArr:function(){
					var that = this;
					return that.selectArr;
				}
			}
			return app;
		}

	}
	
	
	
	module.exports = mainInputRadio;
	
});