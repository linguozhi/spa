define(function(require, exports, module) {
	var mainInputText={
		getObject:function(){  
	            
			var app = {
				isDisabled: false,
				init:function(obj,width,height,labelNum){
					var that = this;

					that.obj = obj;
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
					obj.find(".mainInputTextContent").bind("click",function(){
						
						if(!that.isDisabled){
							mainInputModule.show($(this));
						}
		            });
				},
				showPlaceholder: function(){
					var that = this;
					that.placeholder = that.obj.find(".mainInputTextContent").attr("data-placeholder");
					that.obj.find(".mainInputTextContent").html(that.placeholder);
				},
				cleanContent:function(){
					var that = this;
					that.obj.find(".mainInputTextContent").html("");
				},
				disabled:function(){
					var that = this;
					that.isDisabled = true;
				},
				getVal:function(){
					var that = this;
					var val = $.trim(that.obj.find(".mainInputTextContent").eq(0).html());
					if(val==""||val==that.placeholder){
						return false;
					}
					return val;
				},
				getPasswordVal:function(){
					var that = this;
					var val = $.trim(that.obj.find(".mainInputTextContent").eq(0).attr("data-password-val"));
					if(val==""||val==that.placeholder){
						return false;
					}
					return val;
				}

			}
			return app;

		}
		
	};
	
	
	
	
	module.exports = mainInputText;
	
});