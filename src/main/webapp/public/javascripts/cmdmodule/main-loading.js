define(function(require, exports, module) {
	var util = require('./util');
	window.mainLoading={

		init:function(windowWidth, windowHeight){
			var that = this;
			var mFontSize = Math.round(windowHeight/23);
			that.text = $("<div/>");
			that.text.css({

				textAlign:"center",
				lineHeight:windowHeight+"px",
				height:windowHeight+"px",
				width:windowWidth+"px",
				fontSize:mFontSize,
				background: "rgba(0,0,0,0.8)",
				zInxde:2,
				color: "#fff",
				position: "absolute",
    			top: 0
			}).hide();
			
			
			$("body").append(that.text);
			that.textSetInterval = null;
			that.i = 0;
		},
		show:function(pText){
			var that = this;
			that.text.html(pText).show();
			if(that.textSetInterval!=null){
				clearInterval(that.textSetInterval);
				that.textSetInterval = null;
			}

			that.textSetInterval = setInterval(function(){
				var dotHtml;
				if(that.i>=3){
					that.i=0;
				}else{
					that.i++;
				}
				if(that.i==0){
					dotHtml = "";
				}else if(that.i==1){
					dotHtml = "·";
				}else if(that.i==2){
					dotHtml = "··";
				}else if(that.i==3){
					dotHtml = "···";
				}

				that.text.html(pText+" "+dotHtml);
			},1000);
		},
		hide: function(){
			var that = this;
			that.text.hide();
			if(that.textSetInterval!=null){
				clearInterval(that.textSetInterval);
				that.textSetInterval = null;
			}
		}	

	}
	var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();
	mainLoading.init(windowWidth, windowHeight);
	
	
	
});