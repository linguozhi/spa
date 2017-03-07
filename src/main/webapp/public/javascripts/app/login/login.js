define(function(require) {

   
	var MD5 = require('../../cmdmodule/md5');
    var mainInputText = require('../../cmdmodule/main-input-text');
    var util = require('../../cmdmodule/util');
	require('../../cmdmodule/common');
    require('../../cmdmodule/main-toast');
    require('../../cmdmodule/main-loading');
    require('../../cmdmodule/main-input-module');
    
    
   
    var login = {
        init: function(newUser, userList){
            var that = this;
            that.initUi();
            that.newUser = newUser;
            that.userList = userList;
            $("#pageLoginBtn").click(function(){
                var userName = that.userNameMainInputText.getVal();
                var password = that.passwordMainInputText.getPasswordVal();
                console.log("userName"+userName);
                console.log("password"+password);
                if(!userName||!password){
                    mainToast.showWarn("请填写用户名、密码", 3000);
                }else{
                    that.requestLogin(userName, MD5(password));
                }
            });
        },
        show:function(){
            var that = this;
            $("#pageLogin").show();
        },
        hide:function(){
            var that = this;
            $("#pageLogin").hide();
        },
        initUi: function(){
            var that = this;
            var windowHeight = util.windowHeight();
            var windowWidth = util.windowWidth();   
            $("body").css({
                width:windowWidth,
                height:windowHeight
            });
            var wrapWidth = windowWidth*0.7;
            var wrapHeight = windowHeight*0.7;
            $("#pageLoginWrap").css({
                width:Math.round(wrapWidth),
                height:Math.round(wrapHeight),
                left:Math.round((windowWidth-wrapWidth)/2),
                top:Math.round((windowHeight-wrapHeight)/2)
            });
            var inputWidth = Math.round(wrapWidth*0.8);
            var inputHeight = Math.round(wrapHeight/12);

            var inputLeft = (wrapWidth-inputWidth)/2;
            var inputTop = inputLeft;

            that.userNameMainInputText = mainInputText.getObject();
            that.userNameMainInputText.init($("#mainInputTextPageLoginUserName"),inputWidth,inputHeight,3);

            that.passwordMainInputText = mainInputText.getObject();
            that.passwordMainInputText.init($("#mainInputTextPageLoginPassword"),inputWidth,inputHeight,3);

            $("#mainInputTextPageLoginUserName, #mainInputTextPageLoginPassword").css({
                marginLeft:inputLeft,
                marginTop:inputTop
            });
            var btnWidth = Math.round(wrapWidth*0.4);
            var btnHeight = Math.round(wrapHeight*0.15);
            var btnFontSize = Math.round(btnHeight*0.5);
            var btnLeft = Math.round((wrapWidth-btnWidth)/2);
            $("#pageLoginBtn").css({
                width: btnWidth,
                height: btnHeight,
                fontSize:btnFontSize+"px",
                marginTop:inputTop,
                left:btnLeft,
                lineHeight:btnHeight+"px"
            });
        },
        requestLogin: function(email, pswd){
            var that = this;
            $.ajax({
                contentType: "application/x-www-form-urlencoded; charset=utf-8", 
                type:"post",
                url: "./submitLogin.html",
                timeout: 10000,
                data:{
                    "email":email,
                    "pswd":pswd
                },
                beforeSend: function(){
                    
                },
                success: function(data){
                    console.log(data);
                    if(data!=null&&data.state.code==2000000){
                        //登录成功，跳转
                        window.location.href="../client/client.html";
                    }else{
                        //登录失败
                        mainToast.showWarn("登录失败，请检查用户名、密码", 3000);
                    }
                },
                error: function(){
                    
                }

            });
        }
    };
    
    
    login.init();
    

});