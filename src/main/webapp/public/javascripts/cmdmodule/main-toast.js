define(function(require, exports, module) {
	var util = require('./util');
	window.mainToast={

		init:function(windowWidth, windowHeight){
			var that = this;
			var mFontSize = Math.round(windowHeight/23);
			var wrapHeight = Math.round(windowHeight/10);
			var wrapTop = Math.round((windowHeight-wrapHeight)/2);
			var toastPadding = Math.round(windowHeight/30);
			var toastBorderRadius = Math.round(windowHeight/50);
			that.toast = $("<div/>");
			that.toast.css({
				lineHeight:wrapHeight+"px",
				height:"100%",
				fontSize:mFontSize,
				background: "rgba(0,0,0,0.9)",
				zInxde:2,
				color: "#fff",
				display:"-webkit-inline-box",
				paddingLeft: toastPadding,
				paddingRight:toastPadding,
				borderRadius:toastBorderRadius
			});
			
			that.wrap = $("<div/>");
			that.wrap.css({
				top:wrapTop,
				width:"100%",
				position: "absolute",
				zInxde:2,
				textAlign: "center"
			}).hide();
			that.wrap.append(that.toast)
			$("body").append(that.wrap);
			that.hideSetTimeout;
		},
		show:function(text,time){
			var that = this;
			that.toast.html(text);
			that.wrap.show();
			if(that.hideSetTimeout!=null){
				clearTimeout(that.hideSetTimeout);
			}
			that.hideSetTimeout = setTimeout(function(){
				that.wrap.hide();
			},time);
		},
		showWarn: function(text,time){
			var that = this;
			that.toast.css({
				background: "rgba(168,8,30,0.9)"
			});
			that.show(text,time);
		}		

	}
	var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();
	mainToast.init(windowWidth, windowHeight);
	
	
	
});