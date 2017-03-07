define(function(require, exports, module) {
	var util = require('./util');
	var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();
	window.mainInputModule = {
        isShow: false,
        valNullShowPlaceholder: false,
        init: function(){
            var that = this;
            that.initUi(); 
            $("#mainInputModuleBtnOk").bind("click",function(){
                that.hide();
                var val = $("#mainInputModuleInput").val();
                if((val==null|val==""|val==undefined)&valNullShowPlaceholder){
                    that.targetObj.html(that.placeholder);
                }else{
                    var dataPassword = that.targetObj.attr("data-password");
                    if(dataPassword=="true"){
                        that.targetObj.attr("data-password-val", val);
                        that.targetObj.html(that.placeholder);
                        var startVal = "";
                        for(var i=0;i<val.length;i++){
                            startVal+="*";
                        }
                        that.targetObj.html(startVal);
                    }else{
                        that.targetObj.html(val);
                    }
                }
                
            });
            $("#mainInputModuleBtnCancel").bind("click",function(){
                that.hide();
            });
        },
        
        show:function(pTargetObj){
            var that = this;
            that.targetObj = pTargetObj;
            that.isShow = true;
            var placeholder = that.targetObj.attr("data-placeholder");
            that.placeholder = placeholder;
            var html = that.targetObj.html();
            if(placeholder==html){
                html = "";
            }else{
                var dataPassword = that.targetObj.attr("data-password");
                if(dataPassword=="true"){
                    html = that.targetObj.attr("data-password-val");
                }
            }
            
            $("#mainInputModuleInput").val(html).attr("placeholder",placeholder);
            $("#mainInputModule").show();
            setTimeout(function(){
                $("#mainInputModuleInput").focus();
            },500);
            
            var null_show_placeholder = that.targetObj.attr("data-null_show_placeholder");

            if(null_show_placeholder!=null&null_show_placeholder!=""&null_show_placeholder!=undefined){
                valNullShowPlaceholder = true;
            }else{
                valNullShowPlaceholder = false;
            }

            var dataPassword = that.targetObj.attr("data-password");
            if(dataPassword=="true"){
                $("#mainInputModuleInput").attr("type","password");
            }else{
                $("#mainInputModuleInput").attr("type","text");
            }
        },
        hide:function(){
            var that = this;
            that.isShow = false;
            that.targetObj.focus();
            $("#mainInputModule").hide();

        },
        initUi: function(){
            var that = this;
           
            $("#mainInputModule").css({
                width:windowWidth,
                height:windowHeight
            });
            var inputWidth = Math.round(windowWidth*0.6);
            var inputHeight = Math.round(windowHeight*0.1);
            var btnHeight = inputHeight; 
            var btnWidth = Math.round(inputWidth*0.2); 
            var interval = Math.round(windowWidth*0.02);
            var inputLeft = Math.round((windowWidth-interval*2-btnWidth*2-inputWidth)/2);
            var btnOkLeft = inputLeft+interval+inputWidth;
            var btnCancelLeft = inputLeft+interval+interval+btnWidth+inputWidth;
            $("#mainInputModuleInput").css({
                width:inputWidth,
                height:inputHeight,
                lineHeight:inputHeight+1+"px",
                left:inputLeft,
                top:inputLeft,
                fontSize:Math.round(inputHeight/2)+"px",
                paddingLeft:Math.round(interval/2),
                paddingRight:Math.round(interval/2)
            });
            $(".mainInputModuleBtn").css({
                fontSize:Math.round(btnHeight/2),
                width:btnWidth,
                height:btnHeight,
                lineHeight:inputHeight+"px",
                top:inputLeft
            });
            $("#mainInputModuleBtnOk").css({
                left:btnOkLeft
            });
            $("#mainInputModuleBtnCancel").css({
                left:btnCancelLeft
            });
        }
    }
    mainInputModule.init();
	
	
	
	
});