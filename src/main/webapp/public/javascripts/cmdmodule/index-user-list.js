define(function(require, exports, module) {
    var util = require('./util');
    var mainInputText = require('./main-input-text');
    var indexTestList = require('./index-test-list');
    var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();   
    var userList = {
        isShow: false,
        isInit:false,
        isInitUi:false,
        init: function(home, testReport){
            var that = this;
            that.pageUserListSoName = mainInputText.getObject();
            that.pageUserListSoId = mainInputText.getObject();
            that.pageUserListSoPhoneNum = mainInputText.getObject();
            that.testReport = testReport;

           

            if(!that.isInit){
                that.isInit = true;
                that.initUi();
                $("#pageUserListBg, #pageUserListBody .backBtn").bind("click",function(){
                    that.hide();
                    home.show();
                });
                $("#pageUserListBody .soBtn").bind("click",function(){
                    if(that.pageUserListSoId.getVal()){
                        that.requestUserInfo(that.pageUserListSoId.getVal());
                    }else{
                        that.name = "";
                        that.phone = "";
                        if(that.pageUserListSoName.getVal()){
                            that.name = that.pageUserListSoName.getVal();
                        }
                        if(that.pageUserListSoPhoneNum.getVal()){
                            that.phone = that.pageUserListSoPhoneNum.getVal();
                        }
                        that.start = 0;
                        that.requestDataList();
                    }
                });
                
                $("#pageUserListBody").delegate(".lookTestListBtn","click",function(){
                    indexTestList.show($(this).parent(".main-dav-table-block").siblings().eq(0).html(),$(this).parent(".main-dav-table-block").siblings().eq(1).html());
                });
                indexTestList.init(that.testReport);
                $("#pageUserListBody").delegate(".lookUserInfoBtn","click",function(){
                    newUser.show($(this).parent(".main-dav-table-block").siblings().eq(0).html());
                });
                $("#pageUserListBody").delegate(".startScanSkinBtn","click",function(){
                    userId = $(this).parent(".main-dav-table-block").siblings().eq(0).html();
                    that.hide();
                    home.hide();
                    window.JsCallJava.startScanSkin();
                });
                $("#pageUserListTurnPage").delegate(".num-page","click",function(){
                    var pageNum = $(this).attr("data-num");
                    that.start = pageNum*5;
                    that.requestDataList();
                });
                $("#pageUserListTurnPage").delegate(".prev-page","click",function(){
                    that.start = that.start-5;
                    that.requestDataList();
                });
                $("#pageUserListTurnPage").delegate(".next-page","click",function(){
                    that.start = that.start+5;
                    that.requestDataList();
                });
                $("#pageUserListTurnPage").delegate(".first-page","click",function(){
                    that.start = 0;
                    that.requestDataList();
                });
                $("#pageUserListTurnPage").delegate(".last-page","click",function(){
                    that.start = (Math.ceil(that.totalDataLength/5)-1)*5;
                    that.requestDataList();
                });
                

                
            }

             

        },
        show:function(){
            var that = this;
            that.name = "";
            that.phone = "";
            that.start = 0;
            that.requestDataList();
            $("#pageUserList").show();
            that.isShow = true;

        },
        hide:function(){ 
            var that = this;
            $("#pageUserList").hide();
            indexTestList.hide();
            that.isShow = false;
        },
        initUi: function(){
            var that = this;

            var bodyWidth = Math.round(windowWidth*0.93);
            var bodyHeight = Math.round(windowHeight*0.83);
            $("#pageUserListBody").css({
                width:bodyWidth,
                height:bodyHeight,
                left:(windowWidth-bodyWidth)/2,
                top:(windowHeight-bodyHeight)/2

            });
            var contentWidth = Math.round(bodyWidth*0.93);
            var contentHeight = Math.round(bodyHeight*0.84);
            var spacing = Math.round(bodyHeight/20);
            var contentTop = Math.round((bodyHeight-contentHeight)/2);
            var tableLeft = Math.round((bodyWidth-contentWidth)/2);
            $("#pageUserListTable").css({
                marginLeft:tableLeft,
                marginTop:spacing,
                width:contentWidth
            });
            var blockHeight = Math.round((contentHeight-spacing*2)/8);
            $("#pageUserListTable .main-dav-table-block").css({
                height:blockHeight,
                lineHeight:blockHeight+"px",
                fontSize:blockHeight/2.5
            });
            $("#pageUserListTable .column-fill").css({
                height:blockHeight*5,
                lineHeight:blockHeight*5+"px",
                fontSize:blockHeight/2.5
            });
            var btnWidth = contentWidth*0.34*0.31;
            var btnHeight = blockHeight/1.5;
            var marginLeft = (contentWidth*0.34-btnWidth*3)/4;
            var marginTop = (blockHeight-btnHeight)/2;
            $("#pageUserListTable .btn").css({
                height:Math.round(btnHeight),
                lineHeight:Math.round(btnHeight)+"px",
                width:Math.round(btnWidth)+"px",
                fontSize:Math.round(blockHeight/2.5),
                marginLeft:Math.round(marginLeft),
                marginTop:Math.round(marginTop)
            });
            var soBtnHeight = blockHeight;
            var soBtnWidth = contentWidth/8;;
            $("#pageUserListBody .soBtn, #pageUserListBody .backBtn").css({
                width:Math.round(soBtnWidth),
                fontSize:Math.round(soBtnHeight/2.3),
                height:Math.round(soBtnHeight),
                lineHeight:Math.round(soBtnHeight)+"px",
                borderRadius:Math.round(soBtnHeight/10)+"px",
                marginRight:Math.round(tableLeft),
                marginTop:Math.round(contentTop)
            });
            $("#pageUserListBody .soBtn").css({
                marginRight:Math.round(spacing)
            });
            
            if(!that.isInitUi){
                that.isInitUi = true;    
               
                that.pageUserListSoName.init($("#pageUserListSoName"),contentWidth/5,blockHeight,-1.3);
                that.pageUserListSoName.showPlaceholder();
                that.pageUserListSoId.init($("#pageUserListSoId"),contentWidth/5,blockHeight,-1.3);
                that.pageUserListSoId.showPlaceholder();
                that.pageUserListSoPhoneNum.init($("#pageUserListSoPhoneNum"),contentWidth/5,blockHeight,-1.3);
                that.pageUserListSoPhoneNum.showPlaceholder();
                $("#pageUserListBody .main-input-text-content-wrap").css({
                    marginLeft:Math.round(spacing),
                    marginTop:Math.round(contentTop)
                });
                $("#pageUserListSoName").css({
                    marginLeft:Math.round(tableLeft)
                });
                $(".mainInputTextContent").css({
                    fontSize:Math.round(blockHeight/2.3)
                });

            }
            
            


            var turnPageItemFontSize = blockHeight/2.5;
            $("#pageUserList .main-turn-page").css({
                right:tableLeft,
                bottom:tableLeft,
                marginTop:spacing
            });
            $("#pageUserList .main-turn-page .turn-page-item").css({
                fontSize:Math.round(turnPageItemFontSize),
                width:blockHeight,
                height:blockHeight,
                marginLeft:turnPageItemFontSize/2,
                lineHeight:blockHeight+"px",
                textAlign:"center"
            });
            
          
        },
        requestDataList: function(){
            var that = this;
            $.ajax({
                type:"post",
                url: "./portal/client/getList.html",
                timeout: 10000,
                data:{
                    "name":that.name,
                    "phone":that.phone,
                    "start":that.start,
                    "length":5
                },
                beforeSend: function(){
                    mainLoading.show("正在查询数据，请等待");
                },
                success: function(data){
                    mainLoading.hide();
                    var listData = data.data;
                    
                    var totalDataLength = data.recordsTotal;
                    that.totalDataLength = totalDataLength;
                    var length = listData.length;
                    var html = "";
                    for(var i=0;i<length;i++){
                        html+=that.createItmeHtml(listData[i].id,listData[i].name, listData[i].sex, listData[i].age, listData[i].prevTimeStr,listData[i].invervalDays, listData[i].times);
                    }
                    if(length==0){
                        html = that.createItmeFillHtml();
                    }
                    $("#pageUserListTableBody").html(html);
                    $("#pageUserListTurnPage").html(that.createPage(totalDataLength));
                    that.initUi();
                },
                error: function(){
                    mainLoading.hide();
                    mainToast.showWarn("请求错误，请重试", 4000);
                }

            });
        },
        requestUserInfo: function(id){
            var that = this;
            $.ajax({
                type:"post",
                url: "./client/get.html",
                timeout: 10000,
                data:{
                    "id":id
                },
                beforeSend: function(){
                    mainLoading.show("正在查询数据，请等待");
                },
                success: function(data){

                    
                    mainLoading.hide();
                    var html = "";
                    if(data.data!=null){
                        html = that.createItmeHtml(data.data.id,data.data.name, data.data.sex, data.data.age, data.data.prevTimeStr,data.data.invervalDays, data.data.times);
                    }else{
                        html = that.createItmeFillHtml();
                    }
                    
                    $("#pageUserListTableBody").html(html);
                    $("#pageUserListTurnPage").html("");
                    that.initUi();
                    

                    
                },
                error: function(){
                    
                }

            });
        },
        createPage: function(length){
            var that = this;
            var pageNum = Math.ceil(length/5);
            var pageHtml = "";
            if(Math.ceil(that.start/5) != 0){
                pageHtml+='<div class="turn-page-item first-page hoverColor">首页</div>'+
                          '<div class="turn-page-item prev-page hoverColor">上页</div>';
            }
            for(var i=0;i<pageNum;i++){
                var pageNumStr = i;
                var klass = "";
                if(i<10){
                    pageNumStr = "0"+(i+1);
                }
                if(Math.ceil(that.start/5)==i){
                    klass = " on";
                }
                var pageOne = '<div data-num="'+i+'" class="turn-page-item num-page hoverColor '+klass+'">'+pageNumStr+'</div>';
                pageHtml+=pageOne;
            }
            if(Math.ceil(that.start/5) < (pageNum-1)){
                pageHtml+='<div class="turn-page-item next-page hoverColor">下页</div>'+
                          '<div class="turn-page-item last-page hoverColor">尾页</div>';
            }
            return pageHtml;

        },
        createItmeHtml: function(id, name, sex, age, prevTimeStr,invervalDays, times){
            var that = this;
            var sexStr = "男";
            if(sex != 0){
                sexStr = "女"
            }
            if(prevTimeStr==null){
                prevTimeStr = "";
            }
            if(invervalDays==null){
                invervalDays = "";
            }
            if(times==null){
                times = "";
            }
            var html = '<div class="main-dav-table-line">'+
                            '<div class="main-dav-table-block column-one">'+id+'</div>'+
                            '<div class="main-dav-table-block column-two">'+name+'</div>'+
                            '<div class="main-dav-table-block column-three">'+sexStr+'</div>'+
                            '<div class="main-dav-table-block column-four">'+age+'</div>'+
                            '<div class="main-dav-table-block column-five">'+prevTimeStr+'</div>'+
                            '<div class="main-dav-table-block column-six">'+invervalDays+'</div>'+
                            '<div class="main-dav-table-block column-seven">'+times+'</div>'+
                            '<div class="main-dav-table-block column-eight"><div class="btn hoverColor lookUserInfoBtn">查看/编辑</div><div class="btn hoverColor lookTestListBtn">检测记录</div><div class="btn hoverColor startScanSkinBtn">开始检测</div></div>'+
                        '</div>';
            return html;
        },
        createItmeFillHtml:function(){
            var that = this;
            var html = '<div class="main-dav-table-line">'+
                            '<div class="main-dav-table-block column-fill">没有相关数据</div>'+
                        '</div>';
            return html;
        }
        
        
    };
    module.exports = userList;

});