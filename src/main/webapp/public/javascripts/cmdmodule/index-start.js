define(function(require, exports, module) {
		
	var start = {
        isInit:false,
        init: function(home){
            var that = this;
            if(!that.isInit){
                that.isInit = true;
                that.show();
                $("#pageStart").bind(window.click,function(){
                    $("#pageMain").show();
                    home.show();
                    that.hide();
                });
            }
        },
        hide:function(){
            $("#pageStart").hide();
        },
        show: function(){
            $("#pageStart").show();
        }
    };
    module.exports = start;

});