define(function(require, exports, module) {
    var util = require('./util');
    var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();   
    var home = {
        isInit:false,
        init: function(newUser, userList){
            var that = this;
            if(!that.isInit){
                that.isInit = true;
                that.initUi();
                that.newUser = newUser;
                that.userList = userList;
            }
        },
        show:function(){
            var that = this;
            $("#pageHome").show();
        },
        hide:function(){
            var that = this;
            $("#pageHome").hide();
        },
        initUi: function(){
            var that = this;
            var btnWidth = windowWidth/4;
            var btnHeight = windowHeight/9;
            var fontSize = btnHeight/2;
            $("#btnNew").css({
                width:btnWidth,
                height:btnHeight,
                borderRadius:btnHeight/2,
                fontSize:fontSize,
                lineHeight:btnHeight+"px",
                top:"48%",
                left:"20%"
            }).show();
            $("#btnRecord").css({
                width:btnWidth,
                height:btnHeight,
                borderRadius:btnHeight/2,
                fontSize:fontSize,
                lineHeight:btnHeight+"px",
                top:"48%",
                right:"20%"
            }).show();
            $("#btnNew").bind("click",function(){
                that.hide();
                that.newUser.show(-1);
            });
            $("#btnRecord").bind("click",function(){
                that.hide();
               
                that.userList.show();
                //that.newUser.show(7);
            });
            

        }
    };
    module.exports = home;

});