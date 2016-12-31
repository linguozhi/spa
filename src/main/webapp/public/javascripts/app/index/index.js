define(function(require) {
		
	require('../../cmdmodule/common');
	var slip = require('../../cmdmodule/slip');
    var mainInputText = require('../../cmdmodule/main-input-text');
    var mainInputRadio = require('../../cmdmodule/main-input-radio');
    var mainPercentageBar = require('../../cmdmodule/main-percentage-bar');
    var detectionResults;
    var userId = 7;
    var exitTime = 0;
    var util = {
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
    util.initKeyboard();
    

    var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();

    $("body").css({
        width:windowWidth,
        height:windowHeight
    });


    var newUser = {
        isShow: false,
        init: function(){
             var that = this;
            
             $("#pageNewUserBg, #pageNewUserCloseBtn").bind(window.click,function(){
                that.hide();
                home.show();
             });
             $("#pageNewUserSaveScanningBtn").bind(window.click,function(){
                $("#pageMain").hide();
                that.hide();
                window.JsCallJava.startScanSkin();

             });
             $("#pageNewUserSaveBackBtn").bind(window.click,function(){
                that.hide();
                home.show();
             });

             
             that.initUi();
             
        }, 
        requestUserInfo: function(){
            var that = this;
            $.ajax({
                type:"post",
                url: "./client/get.html",
                timeout: 5000,
                data:{
                    "id":userId
                },
                beforeSend: function(){
                    
                },
                success: function(data){

                    
                    $("#mainInputTextPageNewUserName .mainInputTextContent").html(data.data.name);
                    $("#mainInputTextPageNewUserAge .mainInputTextContent").html(data.data.age);
                    $("#mainInputTextPageNewUserBirthday .mainInputTextContent").html(data.data.birthday);
                    $("#mainInputTextPageNewUserId .mainInputTextContent").html(data.data.id);
                    $("#mainInputTextPageNewUserAddress .mainInputTextContent").html(data.data.addr);
                    $("#mainInputTextPageNewUserPhone .mainInputTextContent").html(data.data.phone);
                    $("#pageNewUserHeadImg").attr("src","."+data.data.headImageUrl);

                    that.mainInputRadioPageNewUserGenderObject.select([0,1]);

                    
                },
                error: function(){
                    that.requestPayStateQueryAgain();
                }

            });
        },
        show:function(pUserId){
            var that = this;
            that.isShow = true;
            userId = pUserId;
            if(userId!=-1){
                that.requestUserInfo();
            }

            $("#pageNewUser").show();
        },
        hide:function(){
            var that = this;
            that.isShow = false;
            $("#pageNewUser").hide();
        },
        initUi: function(){
            var that = this;
            var bodyWidth = windowWidth*0.93;
            var bodyHeight = windowHeight*0.83;
            var bodyPadding = bodyWidth*0.06;
            $("#pageNewUserBody").css({
                width:bodyWidth,
                height:bodyHeight,
                left:(windowWidth-bodyWidth)/2,
                top:(windowHeight-bodyHeight)/2,
                paddingLeft:bodyPadding,
                paddingRight:bodyPadding,
                paddingTop:bodyPadding*0.6

            });
            var btnWidth = windowWidth*0.18;
            var btnHeight = windowHeight*0.078;
            var btnFontSize = btnHeight/2;
            $("#pageNewUserSaveScanningBtn").css({
                right:"24%"
            });
            $("#pageNewUserSaveBackBtn").css({
                left:"24%"
            });
            $("#pageNewUserSaveScanningBtn,#pageNewUserSaveBackBtn").css({
                width:btnWidth,
                height:btnHeight,
                fontSize:btnFontSize,
                lineHeight:btnHeight+"px",
                bottom:-btnHeight/2
            }).show();


            var closeBtnWidth = windowWidth/13;
            var closeBtnHeight = windowHeight/17;
            var closeBtnFontSize = closeBtnHeight/2;

            var bigTitleFontSize = windowWidth*0.022;
            $(".pageNewUserBigTitle").css({
                lineHeight:Math.round(bigTitleFontSize)+"px",
                height:Math.round(bigTitleFontSize),
                fontSize:Math.round(bigTitleFontSize),
                marginBottom: Math.round(bigTitleFontSize)
            });
            var headImgWidth = windowWidth*0.0875;
            var headImgHeight = headImgWidth*1.28;
            $("#pageNewUserHeadImg").css({
                width:headImgWidth,
                height:headImgHeight,
                marginRight:headImgWidth/2.3
            }); 
            var basisInfoHeight = headImgHeight;
            var basisInfoWidth = headImgWidth*2.4;
            $("#pageNewUserBasisInfo").css({
                width:basisInfoWidth,
                height:basisInfoHeight
            });

            var basisInfoInputTextWidth = basisInfoWidth;
            var basisInfoInputTextHeight = headImgHeight/5;
            var basisInfoInputTextInterval = basisInfoInputTextHeight/5;
            basisInfoInputTextHeight = basisInfoInputTextHeight-basisInfoInputTextInterval;
          
            mainInputText.init($("#mainInputTextPageNewUserName"),basisInfoInputTextWidth,basisInfoInputTextHeight,2);
            mainInputText.init($("#mainInputTextPageNewUserAge"),basisInfoInputTextWidth,basisInfoInputTextHeight,2);
            mainInputText.init($("#mainInputTextPageNewUserBirthday"),basisInfoInputTextWidth,basisInfoInputTextHeight,2);
            mainInputText.init($("#mainInputTextPageNewUserId"),basisInfoInputTextWidth,basisInfoInputTextHeight,2);
            $("#pageNewUserBasisInfo .mainInputText").css({
                marginBottom:Math.round(basisInfoInputTextInterval)+"px"
            });

            var contactInfoHeight = windowHeight*0.13;
            var contactInfoHeightOne = contactInfoHeight/2;
            var contactInfoHeightOneInterval = contactInfoHeightOne/2;
            contactInfoHeightOne = contactInfoHeightOne-contactInfoHeightOneInterval;
            var contactInfoWidth = (bodyWidth-(bodyPadding*2))/2;
            $("#pageNewUserContactInfo").css({
                height:Math.round(contactInfoHeight),
                width:Math.round(contactInfoWidth),
                marginTop:Math.round(contactInfoHeightOneInterval)+"px"

            });
            mainInputText.init($("#mainInputTextPageNewUserAddress"),contactInfoWidth,contactInfoHeightOne,4);
            mainInputText.init($("#mainInputTextPageNewUserPhone"),contactInfoWidth,contactInfoHeightOne,4);
            $("#pageNewUserContactInfo .mainInputText").css({
                marginBottom:Math.round(contactInfoHeightOneInterval)+"px"
            });
            $("#pageNewUserContactInfo .mainInputTextContent").css({
                textAlign: "left",
                textIndent: contactInfoHeightOneInterval+"px"
            });

            mainInputText.init($("#mainInputTextPageNewUserConsultant"),contactInfoWidth,contactInfoHeightOne,8);
            $("#mainInputTextPageNewUserConsultant .mainInputTextLabel").css({
                color: "#133984",
                fontWeight: "700"
            });
            
            
            that.mainInputRadioPageNewUserGenderObject = mainInputRadio.getObject();
            that.mainInputRadioPageNewUserGenderObject.init($("#mainInputRadioPageNewUserGender"),basisInfoInputTextHeight);
            $("#mainInputRadioPageNewUserGender").css({
                marginBottom:basisInfoInputTextInterval*2+"px"
            });
            $("#mainInputRadioPageNewUserGender .mainInputRadioItems").eq(1).css({
                float:"right"
            });
            var pageNewUserCaseHistoryBlockItemsHeight = windowHeight*0.1;
            $("#pageNewUserCaseHistory .pageNewUserCaseHistoryBlockItems").css({
                height:Math.round(pageNewUserCaseHistoryBlockItemsHeight),
                borderRadius:Math.round(pageNewUserCaseHistoryBlockItemsHeight/10),
                fontSize:Math.round(pageNewUserCaseHistoryBlockItemsHeight/2.8),
                padding:Math.round(pageNewUserCaseHistoryBlockItemsHeight/15),
                lineHeight:Math.round((pageNewUserCaseHistoryBlockItemsHeight-pageNewUserCaseHistoryBlockItemsHeight/15*2)/2+1)+"px"
            });

            var pageNewUserCaseHistoryTickHeight = pageNewUserCaseHistoryBlockItemsHeight/2;
            pageNewUserCaseHistoryTickObject = mainInputRadio.getObject();
            pageNewUserCaseHistoryTickObject.init($("#pageNewUserCaseHistoryTick"),pageNewUserCaseHistoryTickHeight);
            pageNewUserCaseHistoryTickObject.select([1,1]);


            $("#pageNewUserCaseHistoryTick .mainInputRadioItems .mainInputRadioBoxWrap").css({
                marginLeft: contactInfoWidth*0.4/2-pageNewUserCaseHistoryTickHeight/2
            });
            $("#pageNewUserCaseHistoryTick").css({
                marginTop: pageNewUserCaseHistoryTickHeight*0.4,
                marginBottom: pageNewUserCaseHistoryTickHeight*0.8
            });

            pageNewUserGenderAnalyzeProjectObject = mainInputRadio.getObject();
            pageNewUserGenderAnalyzeProjectObject.init($("#pageNewUserGenderAnalyzeProject"),basisInfoInputTextHeight);
            pageNewUserGenderAnalyzeProjectObject.select([1,1,1,1,1,1,1,1]);
            $("#pageNewUserGenderAnalyzeProject .mainInputRadioItems").css({
                marginBottom: Math.round(basisInfoInputTextHeight*0.7)
            });

            var pageNewUserRecentAnalyzeLine = Math.round((bodyHeight - bodyPadding*2)/14);
            $("#pageNewUserRecentAnalyze .line").css({
                height:pageNewUserRecentAnalyzeLine,
                lineHeight:pageNewUserRecentAnalyzeLine+"px",
                fontSize:Math.round(pageNewUserRecentAnalyzeLine/1.3)+"px"
            });
            $(".right .pageNewUserBigTitle").css({
                marginBottom:windowWidth*0.01
            });
            

        }
    };
    var start = {
        init: function(){
            var that = this;
            that.show();
            setTimeout(function(){
                $("#pageMain").show();
                home.show();
                that.hide();
            },2000);
        },
        hide:function(){
            $("#pageStart").hide();
        },
        show: function(){
            $("#pageStart").show();
        }
    };
	var home = {
        init: function(){
            var that = this;
            that.initUi();
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
            $("#btnNew").bind(window.click,function(){
                that.hide();
                newUser.show(7);
            });

        }
    };
    var dataAnalysising = {
        init: function(){
            var that = this;
            that.show();
            that.initUi();
            that.requestDetection();
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
            $.ajax({
                type:"post",
                url: "./client/caculate.html",
                timeout: 5000,
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
                type:"post",
                url: "./checkRecord/get.html",
                timeout: 5000,
                data:{
                    "clientId":userId,
                    "recordId":that.recordId
                },
                beforeSend: function(){
                    
                },
                success: function(data){
                    console.log(data);
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
            var time = 15000;
            $("#pageDataAnalysisingComplete").css({  
                transform: "translate3d(0,0,0)"  
            }); 
            $("#pageDataAnalysisingComplete").animate({  
                translate3d: ''+that.progressBarWidth+'px,0,0'  
            }, time); 
            setTimeout(function(){
                that.hide();
                testReport.init();
            },time);
        }
    };
    var testReport = {
        isShow: false,
        init: function(){
            var that = this;
            that.show();
            that.initUi();
            $("#pageTestReportBg").bind(window.click,function(){
                that.hide();
                home.show();
            });
        },
        show:function(){
            var that = this;
            $("#pageTestReport").show();
            that.isShow = true;
        },
        hide:function(){
            var that = this;
            $("#pageTestReport").hide();
            that.isShow = false;
        },
        initUi: function(){
            var that = this;
            var bodyWidth = windowWidth*0.93;
            var bodyHeight = windowHeight*0.83;
            $("#pageTestReportBody").css({
                width:bodyWidth,
                height:bodyHeight,
                left:(windowWidth-bodyWidth)/2,
                top:(windowHeight-bodyHeight)/2

            });
            var pageTestReportTitleHeight = bodyHeight*0.08;
            $("#pageTestReportTitle").css({
                height:Math.round(pageTestReportTitleHeight),
                marginTop:Math.round(pageTestReportTitleHeight/1.5),
                marginBottom:Math.round(pageTestReportTitleHeight/2),
                fontSize:Math.round(pageTestReportTitleHeight)
            });
            var checkResultList = detectionResults.data.checkResultList;
            var checkResultListSize = checkResultList.length;
            var dataHtml = "";
            for(var i=0; i<checkResultListSize; i+=2){
                var checkResultListOne = checkResultList[i];
                var dataItems = that.createDataItem(checkResultListOne);
                if((i+1)<checkResultListSize){
                    var checkResultListtwo = checkResultList[i+1];
                    dataItems+=that.createDataItem(checkResultListtwo);
                }
                dataHtml += that.createDataWrapsTwo(dataItems);
            }
            $("#pageTestReportDataWraps").html(dataHtml);
            var percentageBarWidth = bodyWidth*0.4;
            var percentageBarHeight = bodyHeight*0.05;
            for(var i=0; i<checkResultListSize*2; i+=2){
                mainPercentageBar.init($(".pageTestReportMainPercentageBar").eq(i),percentageBarWidth,percentageBarHeight,3,checkResultList[i/2].generalScore);
                mainPercentageBar.init($(".pageTestReportMainPercentageBar").eq(i+1),percentageBarWidth,percentageBarHeight,3,checkResultList[i/2].score);
            }
  



            var pageTestReportInputRadioHeight = bodyHeight*0.06;
            var pageTestReportCompareOptionsMarginBottom = pageTestReportInputRadioHeight*0.6;

            $(".pageTestReportInputRadio").each(function(){
                var pageTestReportInputRadioObject = mainInputRadio.getObject();
                pageTestReportInputRadioObject.init($(this),pageTestReportInputRadioHeight);
                pageTestReportInputRadioObject.select([1]);
            }).css({
                marginBottom:Math.round(pageTestReportCompareOptionsMarginBottom),
                height:Math.round(pageTestReportInputRadioHeight)
            });

            $(".pageTestReportCompareOptions").css({
                lineHeight:Math.round(pageTestReportInputRadioHeight)+"px",
                height:Math.round(pageTestReportInputRadioHeight),
                fontSize:Math.round(pageTestReportInputRadioHeight),
                marginBottom:Math.round(pageTestReportCompareOptionsMarginBottom)
            });

           
           
            $(".pageTestReportMainPercentageBar").css({
                marginLeft:bodyWidth*0.1/2,
                marginBottom:percentageBarHeight*1.5
            });
            var dataSize = 2;
            $("#pageTestReportDataWraps").css({
                width:bodyWidth*dataSize
            });
            $(".pageTestReportDataWrapsTwo").css({
                width:bodyWidth 
            });
            
            var slipDataWraps = slip('page',$("#pageTestReportDataWraps")[0],{
                  num: dataSize,
                  no_follow: true
            });




            var btnWidth = bodyWidth*0.22;
            var btnHeight = bodyHeight*0.1;
            var btnFontSize = btnHeight/2;
            $("#pageTestReportRecommendBtn").css({
                width:btnWidth,
                height:btnHeight,
                fontSize:btnFontSize,
                lineHeight:btnHeight+1+"px",
                bottom:-1,
                marginLeft:"50%",
                left:-(btnWidth)/2
            }).show();

            var dataItemsTitleHeight = bodyHeight*0.06;
            var dataItemsTitleFontSize = dataItemsTitleHeight;
            $("#pageTestReport .dataItemsTitle").css({
                fontSize:Math.round(dataItemsTitleFontSize),
                height:Math.round(dataItemsTitleHeight),
                marginBottom:Math.round(dataItemsTitleHeight/1.7)
            });

 

            var recommendHeight = windowHeight*0.65;
            var recommendWidth = windowWidth*0.57;
            var recommendLeft = (windowWidth-recommendWidth)/2;
            var recommendTop = (windowHeight-recommendHeight)/2;
            $("#pageTestReportRecommend").css({
                width:recommendWidth,
                height:recommendHeight,
                left:recommendLeft,
                top:recommendTop
            });
            var arrowWidthWrap = recommendWidth/8;
            $("#pageTestReportRecommendLeftArrow").css({
                width:arrowWidthWrap
            });
            $("#pageTestReportRecommendRightArrow").css({
                width:arrowWidthWrap
            });
            var arrowWidth = windowWidth*0.03;
            var arrowBorderWidth = windowWidth*0.007;
            var arrowTop = (recommendHeight-arrowWidth)/2;
            var arrowLeft = (arrowWidthWrap-arrowWidth)/2;
            $("#pageTestReportRecommendLeftArrow .arrow").css({
                marginTop:arrowTop,
                marginLeft:arrowLeft,
                borderWidth:arrowBorderWidth,
                width:arrowWidth,
                height:arrowWidth
            });
            $("#pageTestReportRecommendRightArrow .arrow").css({
                marginTop:arrowTop,
                marginRight:arrowLeft,
                borderWidth:arrowBorderWidth,
                width:arrowWidth,
                height:arrowWidth
            });
            var closeBtnWidth = windowWidth*0.04;

            $("#pageTestReportRecommendClose").css({
                width:closeBtnWidth,
                height:closeBtnWidth,
                borderRadius:closeBtnWidth/2,
                top:closeBtnWidth/4,
                right:closeBtnWidth/4,
                fontSize:closeBtnWidth/1.5,
                lineHeight:closeBtnWidth+"px"
            });

            var listHtml = "";
            for(var i=0; i<checkResultListSize; i++){
                var checkResultListOne = checkResultList[i];
                listHtml+="<li style='width:"+recommendWidth+"px;'><img src=."+checkResultListOne.product.imageUrl+" /></li>";
            }

            var imgSize = checkResultListSize; 
            
            $("#pageTestReportRecommendProductListWrap").css({
                width:recommendWidth
            });
            $("#pageTestReportRecommendProductList").css({
                width:recommendWidth*(imgSize+2)
            });
            
            
            
            $("#pageTestReportRecommendProductList").html(listHtml);
            $("#pageTestReportRecommendClose, #pageTestReportRecommendBg").bind(window.click,function(){
                $("#pageTestReportRecommendBg").hide();
                $("#pageTestReportRecommend").hide();
            });

            var slipIsInit = false;
            var slip_img = null;
            $("#pageTestReportRecommendBtn").bind(window.click,function(){
                $("#pageTestReportRecommendBg").show();
                $("#pageTestReportRecommend").show();
                if(!slipIsInit){
                    slipIsInit = true;
                    slip_img = slip('page',$("#pageTestReportRecommendProductList")[0],{
                      num: imgSize,
                      no_follow: true,
                      loop: true
                    });
                    $("#pageTestReportRecommendLeftArrow").bind("click",function(){
                        slip_img.backward(); // 上一张
                        console.log("上一张");
                    });
                    $("#pageTestReportRecommendRightArrow").bind("click",function(){
                        slip_img.forward(); // 下一张
                        console.log("下一张");
                    });
                }
                slip_img.toPage(slipDataWraps.page*2,0);
                
            });
          
        },
        
        createDataWrapsTwo:function(str){
            return '<li class="pageTestReportDataWrapsTwo data-wraps-two">'+str+'</li>'
        },
        createDataItem:function(obj){

            var itemLevelList = obj.itemLevelList;
            var itemLevelListSize = itemLevelList.length;
            var itemLevelListHtml = "";
            for(var i=0;i<itemLevelListSize;i++){
                if(itemLevelList[i].selected==1){
                    itemLevelListHtml+='<div class="pageTestReportInputRadio main-input-radio">'+
                                            '<div class="mainInputRadioItems main-input-radio-items">'+
                                                '<div class="mainInputRadioBoxWrap main-input-radio-box-wrap">'+
                                                    '<div class="mainInputRadioBox main-input-radio-box"></div>'+
                                                    '<img class="mainInputRadioBoxTick main-input-radio-box-tick" src="./public/images-dist/main-input-radio-tick-red.png" />'+
                                                '</div>'+
                                                '<div class="mainInputRadioLabel main-input-radio-label">'+itemLevelList[i].name+'</div>'+
                                            '</div>'+
                                        '</div>';
                }else{
                    itemLevelListHtml+='<div class="pageTestReportCompareOptions compare-options">'+itemLevelList[i].name+'</div>';
                }
                
            }

            return  '<div class="data-items">'+
                        '<h2 class="dataItemsTitle data-items-title">'+obj.itemName+'</h2>'+
                        '<div class="pageTestReportMainPercentageBar main-percentage-bar">'+
                            '<div class="mainPercentageBarLabel main-percentage-bar-label">标准值</div>'+
                            '<div class="mainPercentageBarBar main-percentage-bar-bar">'+
                                '<div class="mainPercentageBarComplete main-percentage-bar-complete">'+
                                    '<div class="mainPercentageBarCompleteDot main-percentage-bar-complete-dot">'+
                                        '<div class="mainPercentageBarCompleteNum main-percentage-bar-complete-num"></div>'+
                                    '</div>'+
                                '</div>'+
                            '</div>'+
                        '</div>'+
                        '<div class="pageTestReportMainPercentageBar main-percentage-bar">'+
                            '<div class="mainPercentageBarLabel main-percentage-bar-label">检测值</div>'+
                            '<div class="mainPercentageBarBar main-percentage-bar-bar">'+
                                '<div class="mainPercentageBarComplete main-percentage-bar-complete">'+
                                    '<div class="mainPercentageBarCompleteDot main-percentage-bar-complete-dot">'+
                                        '<div class="mainPercentageBarCompleteNum main-percentage-bar-complete-num"></div>'+
                                    '</div>'+
                                '</div>'+
                            '</div>'+
                        '</div>'+itemLevelListHtml+
                    '</div>';

        }
    };
    var page = 0;
    
    try {
        if (JavaCallJs) {
            
            window.onNewIntent = function(pPage) {
                pageChange(pPage)
            }
            window.onStop = function() {

                
            }
            pageChange(1);
        }
    } catch (e) {
        pageChange(util.getRequest().page);
    }

    function pageChange(pPage){

        if(pPage!=page){
            page = pPage;
            if(pPage==1){
                start.init();
                home.init();
                newUser.init();
            }else if(pPage==2){
                $("#pageMain").show();
                dataAnalysising.init();
                dataAnalysising.start();
            }else if(pPage==3){
                $("#pageMain").show();
                testReport.init();
            }
        }else if(pPage==2){

            $("#pageMain").show();
            dataAnalysising.init();
            dataAnalysising.start();
        }
        
    }
	
    //window.JsCallJava.onLoadOk();

});