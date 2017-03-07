define(function(require, exports, module) {
		
	
    var util = { 
        exitTime : 0,
        getRequest :function() {
  
           var url = location.search; //获取url中"?"符后的字串
           var theRequest = new Object();
           if (url.indexOf("?") != -1) {
              var str = url.substr(1);
              strs = str.split("&");
              for(var i = 0; i < strs.length; i ++) {
                 theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
              }
           } 
           return theRequest;
           
        },
        windowHeight: function() {
            return document.documentElement.clientHeight;
        },
        windowWidth: function() {
            return document.documentElement.clientWidth;
        },
        onKeyUp: function(keyEventType){
            var that = this;
            if(keyEventType=="Back"){
                if(newUser.isShow){
                    newUser.hide();
                    home.show();
                }else if(testReport.isShow){
                    testReport.hide();
                    home.show();
                }else{
                    var nowTime  = new Date().getTime();
                    if((nowTime-exitTime)<2500){
                        window.JsCallJava.QuitGame();  
                    }else{
                        window.JsCallJava.toast("再按一次退出程序");
                        exitTime = nowTime;
                    }
                    
                }
            }
        },
        onKeyDown:function(keyEventType){
            
        },
        keyEvent:function(Code){
            
            if(Code == 19||Code == 38){
                return "Up";
            }else if(Code == 20||Code == 40){
                return "Under";
            }else if(Code == 21||Code == 37){
                return "Left";
            }else if(Code == 22||Code == 39){
                return "Right";
            }else if(Code == 66||Code == 23||Code == 96||Code == 13){
                return "Ok";
            }else if(Code == 4||Code == 109||Code == 97||Code == 111||Code == 27){
                return "Back";
            }else if(Code == 82||Code == 108||Code == 41||Code == 262){
                return "Menu";
            }
            return null;

        },
        initKeyboard:function(){
            var that = this;

            try {
               
                if (JavaCallJs) {
                   
                    JavaCallJs.SetKeyCallbackFunction("KeyCallback");
                    window.KeyCallback = function(code,action) {
                        if(action=="1"){
                            that.onKeyUp(that.keyEvent(code));
                        }else if(action=="0"){
                            that.onKeyDown(that.keyEvent(code));
                        }
                    }

                }
            } catch (e) {
                
                document.onkeyup=function(event){
                    that.onKeyUp(that.keyEvent(event.keyCode));
                }
                document.onkeydown=function(event){
                    that.onKeyDown(that.keyEvent(event.keyCode));
                }
            }
        }
    } 
    module.exports = util;

});