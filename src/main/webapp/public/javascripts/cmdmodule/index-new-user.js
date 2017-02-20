define(function(require, exports, module) {
		
	var util = require('./util');
   
    var newUser = {
        isShow: false,
        isInit:false,
        successGoScan:false,
        init: function(home){
            var that = this;
            if(!that.isInit){
                 that.isInit = true;
                 that.pageNewUserRecentAnalyzeContentOldHtml = $("#pageNewUserRecentAnalyzeContent").html();
                 that.home = home;
                 $("#pageNewUserBg, #pageNewUserCloseBtn").bind("click",function(){
                    that.hide();
                    that.home.show();
                 });
                 $("#pageNewUserSaveScanningBtn").bind("click",function(){
                    that.successGoScan = true;
                    if(that.newOrSaveUserInfo()){
                        mainLoading.show("正在保存，请等待");
                    }
                    

                 });
                 $("#pageNewUserSaveBackBtn").bind("click",function(){
                    that.successGoScan = false;
                    if(that.newOrSaveUserInfo()){
                        mainLoading.show("正在保存，请等待");
                    }
                 });
                 $("#pageNewUserHeadImg").bind("click",function(){

                     
                     window.JsCallJava.startTakingPictures();
                 });
             
                 that.initUi();
            }
             
        }, 
        newOrSaveUserInfo: function(){

            var that = this;
            var name = that.userNameMainInputText.getVal();
            var age = that.userAgeMainInputText.getVal();
            var birthdayStr = that.userBirthdayMainInputText.getVal();
            var addr = that.userAddressMainInputText.getVal();
            var phone = that.userPhoneMainInputText.getVal();
            var headImageId = $("#pageNewUserHeadImg").attr("data-headImageId");
            var sexArr = that.mainInputRadioPageNewUserGenderObject.getSelectArr();
            var sex = 0;
            if(sexArr[1]==1){
                sex = 1;
            }
            var mUrl = "";
            if(userId!=-1){
                //保存修改
                mUrl = "./client/update.html";
            }else{
                //新增用户
                mUrl = "./client/save.html";
            }
            if(name!=false&&age!=false){
                var postData;
                if(!birthdayStr){
                    birthdayStr = "";
                }
                if(!addr){
                    addr = "";
                }
                if(!phone){
                    phone = "";
                }
                if(!phone){
                    phone = "";
                }
                if(userId==-1){
                    postData = {
                        "sex":sex,
                        "name":name,
                        "age":age,
                        "birthdayStr":birthdayStr,
                        "addr":addr,
                        "phone":phone,
                        "headImageId":headImageId
                    };
                }else{
                    postData = {
                        "id":userId,
                        "sex":sex,
                        "name":name,
                        "age":age,
                        "birthdayStr":birthdayStr,
                        "addr":addr,
                        "phone":phone,
                        "headImageId":headImageId
                    };
                }
                $.ajax({
                    type:"post",
                    url: mUrl,
                    timeout: 10000,
                    data: postData,
                    beforeSend: function(){
                        
                    },
                    success: function(data){
                        if(data.state.code==2000000){
                            if(that.successGoScan){
                                userId = data.data;
                                $("#pageMain").hide();
                                that.hide();
                                mainLoading.hide();
                                window.JsCallJava.startScanSkin();

                            }else{
                                that.hide();
                                that.home.show();
                                mainLoading.hide();
                            }
                           

                        }else{
                            mainLoading.hide();
                            mainToast.showWarn("保存失败,请重试", 3000);
                        }

                    },
                    error: function(){
                        mainLoading.hide();
                        mainToast.showWarn("保存失败,请重试", 3000);
                    }
                });
                return true;
            }else{

                var tipField = ""
                if(name==false){
                    tipField += " 名字 ";
                }
                if(age==false){
                    tipField += " 年龄 ";
                }
                mainToast.showWarn("必须填写:"+tipField, 4000);
                return false;

            }
            
        },
        requestUserInfo: function(){
            var that = this;
            $.ajax({
                type:"post",
                url: "./client/get.html",
                timeout: 10000,
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

                    if(data.data.headImageUrl==null|data.data.headImageUrl==undefined|data.data.headImageUrl==""){
                        $("#pageNewUserHeadImg").attr("src","./public/images-dist/head-portrait-camera.jpg");
                    }else{
                        $("#pageNewUserHeadImg").attr("src","."+data.data.headImageUrl);
                    }
                    
                    var sexData;
                    
                    if(data.data.sex==0){
                        sexData = [0,1];
                    }else if(data.data.sex==1){
                        sexData = [1,0];
                    }

                    that.mainInputRadioPageNewUserGenderObject.select(sexData);

                    
                },
                error: function(){
                    
                }

            });
        },
        requestCheckRecordLast: function(){
            var that = this;
            $.ajax({
                type:"post",
                url: "./checkRecord/loadList.html",
                timeout: 10000,
                data:{
                    "clientId":userId,
                    "start":0,
                    "length":1
                },
                beforeSend: function(){
                    
                },
                success: function(data){
                    if(data.data.length>0){
                         that.recentAnalyzeHtml(data.data[0].checkResultList);
                    }
                   
                },
                error: function(){
                    
                }

            });
        },
        recentAnalyzeHtml:function(dataList){
            var that = this;
            var size = dataList.length;
            var html = "";

            for (var i = 0; i < size; i++) {
                
                html += '<div class="line">'+
                    '<div class="line-title">面部('+dataList[i].itemName+')</div>'+
                    '<div class="line-content">'+Math.round(dataList[i].score)+'分</div>'+
                '</div>';

            }
            $("#pageNewUserRecentAnalyzeContent").html(html);
            that.recentAnalyzeCss();
            
        },
        recentAnalyzeCss(){
            var that = this;
            $("#pageNewUserRecentAnalyze .line").css({
                height:that.pageNewUserRecentAnalyzeLine,
                lineHeight:that.pageNewUserRecentAnalyzeLine+"px",
                fontSize:Math.round(that.pageNewUserRecentAnalyzeLine/1.3)+"px"
            });
            $("#pageNewUserRecentAnalyzeContent").show();
        },
        show:function(pUserId){
            var that = this;
            that.isShow = true;
            userId = pUserId;
            if(userId!=-1){
                //查看用户
                that.requestUserInfo();
                that.requestCheckRecordLast();

            }else{
                //新建用户
                $("#pageNewUserHeadImg").attr("src","./public/images-dist/head-portrait-camera.jpg");
                that.userNameMainInputText.cleanContent();
                that.userAgeMainInputText.cleanContent();
                that.userBirthdayMainInputText.cleanContent();
                that.userIdMainInputText.cleanContent();
                that.userAddressMainInputText.cleanContent();
                that.userPhoneMainInputText.cleanContent();
                $("#pageNewUserRecentAnalyzeContent").html(that.pageNewUserRecentAnalyzeContentOldHtml);
                that.recentAnalyzeCss();
                that.mainInputRadioPageNewUserGenderObject.select([0,0]);
            }

            $("#pageNewUser").show();
        },
        hide:function(){
            var that = this;
            that.isShow = false;
            $("#pageNewUser").hide();
        },
        setHeadPortraitUrl: function(url,pId){
            var that = this;
            $("#pageNewUserHeadImg").attr("src",url);
            $("#pageNewUserHeadImg").attr("data-headImageId",pId);
        },
        initUi: function(){
            var that = this;

            var windowHeight = util.windowHeight();
            var windowWidth = util.windowWidth();
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
            var headImgHeight = windowHeight*0.2;
            var headImgWidth = headImgHeight*(165/211);
           
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
          
            that.userNameMainInputText = mainInputText.getObject();
            that.userAgeMainInputText = mainInputText.getObject();
            that.userBirthdayMainInputText = mainInputText.getObject();
            that.userIdMainInputText = mainInputText.getObject();

            that.userNameMainInputText.init($("#mainInputTextPageNewUserName"),basisInfoInputTextWidth,basisInfoInputTextHeight,2);
            that.userAgeMainInputText.init($("#mainInputTextPageNewUserAge"),basisInfoInputTextWidth,basisInfoInputTextHeight,2);
            that.userBirthdayMainInputText.init($("#mainInputTextPageNewUserBirthday"),basisInfoInputTextWidth,basisInfoInputTextHeight,2);
            that.userIdMainInputText.init($("#mainInputTextPageNewUserId"),basisInfoInputTextWidth,basisInfoInputTextHeight,2);
            that.userIdMainInputText.disabled();

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
            that.userAddressMainInputText = mainInputText.getObject();
            that.userPhoneMainInputText = mainInputText.getObject();
            that.userAddressMainInputText.init($("#mainInputTextPageNewUserAddress"),contactInfoWidth,contactInfoHeightOne,4);
            that.userPhoneMainInputText.init($("#mainInputTextPageNewUserPhone"),contactInfoWidth,contactInfoHeightOne,4);
            
            $("#pageNewUserContactInfo .mainInputText").css({
                marginBottom:Math.round(contactInfoHeightOneInterval)+"px"
            });
            $("#pageNewUserContactInfo .mainInputTextContent").css({
                textAlign: "left",
                textIndent: contactInfoHeightOneInterval+"px"
            });
            that.userConsultantMainInputText = mainInputText.getObject();
            that.userConsultantMainInputText.init($("#mainInputTextPageNewUserConsultant"),contactInfoWidth,contactInfoHeightOne,8);
            $("#mainInputTextPageNewUserConsultant .mainInputTextLabel").css({
                color: "#133984",
                fontWeight: "700"
            });
            
            
            that.mainInputRadioPageNewUserGenderObject = mainInputRadio.getObject();
            that.mainInputRadioPageNewUserGenderObject.init($("#mainInputRadioPageNewUserGender"),basisInfoInputTextHeight);
            that.mainInputRadioPageNewUserGenderObject.setRadio();
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

            that.pageNewUserRecentAnalyzeLine = Math.round((bodyHeight - bodyPadding*2)/14);
            
            $(".right .pageNewUserBigTitle").css({
                marginBottom:windowWidth*0.01
            });
            

        }
    };
    module.exports = newUser;

});