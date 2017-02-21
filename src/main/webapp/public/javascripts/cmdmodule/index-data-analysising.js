define(function(require, exports, module) {
    var util = require('./util');
    var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();   
    var dataAnalysising = {
        isInit:false,
        init: function(testReport){
            var that = this;
            that.show();
            that.initUi();
            that.requestDetection();
            that.testReport = testReport;
        },
        show:function(){
            var that = this;
            $("#pageDataAnalysising").show();
        },
        hide:function(){
            var that = this;
            $("#pageDataAnalysising").hide();
        },
        requestDetection: function(){
            var that = this;
            console.log("#userId"+userId);
            $.ajax({
                contentType: "application/x-www-form-urlencoded; charset=utf-8", 
                type:"post",
                url: "./client/caculate.html",
                timeout: 10000,
                data:{
                    "id":userId
                },
                beforeSend: function(){
                    
                },
                success: function(data){
                    that.recordId = data.data.recordId;
                    that.requestDetectionResults();
                },
                error: function(){

                }

            });
        },
        requestDetectionResults: function(){
            var that = this;
            $.ajax({
                contentType: "application/x-www-form-urlencoded; charset=utf-8", 
                type:"post",
                url: "./checkRecord/get.html",
                timeout: 10000,
                data:{
                    "clientId":userId,
                    "recordId":that.recordId
                },
                beforeSend: function(){
                    
                },
                success: function(data){

                    detectionResults = data;
                },
                error: function(){

                }

            });
        },
        initUi: function(){
            var that = this;
            var tipTextHeight = windowHeight/12;
            var tipTextFontSize = tipTextHeight/2;
            var tipTextTop = windowHeight/2.5;
            $("#pageDataAnalysisingTipText").css({
                height:tipTextHeight,
                lineHeight:tipTextHeight+"px",
                fontSize:tipTextFontSize,
                top:tipTextTop
            });
            var progressBarHeight = windowHeight/40;
            that.progressBarWidth = windowWidth/2;
            var progressBarTop = windowHeight/2;
            $("#pageDataAnalysisingProgressBar").css({
                width:that.progressBarWidth,
                height:progressBarHeight,
                top:progressBarTop,
                left:(windowWidth-that.progressBarWidth)/2
            });
            
        },
        start: function(){
            var that = this;
            var time = 5000;
            $("#pageDataAnalysisingComplete").css({  
                transform: "translate3d(0,0,0)"  
            }); 
            $("#pageDataAnalysisingComplete").animate({  
                translate3d: ''+that.progressBarWidth+'px,0,0'  
            }, time); 
            setTimeout(function(){
                that.hide();
               
                that.testReport.init();
            },time);
        }
    };
    module.exports = dataAnalysising;

});