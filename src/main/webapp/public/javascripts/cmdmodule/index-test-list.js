define(function(require, exports, module) {
    var util = require('./util');
    var mainInputText = require('./main-input-text');
    var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();   
    var userList = {
        isShow: false,
        isInit:false,
        init: function(testReport){
            var that = this;
            that.pageUserListSoName = mainInputText.getObject();
            that.pageUserListSoId = mainInputText.getObject();
            that.pageUserListSoPhoneNum = mainInputText.getObject();
            that.testReport = testReport;
           

            if(!that.isInit){
                that.isInit = true;
                that.initUi();
                $("#pageTestListBg, #pageTestListBody .backBtn").bind("click",function(){
                    that.hide();
                });
                $("#pageTestListBody").delegate(".lookTestReportBtn","click",function(){
                    that.requestDetectionResults($(this).parent(".main-dav-table-block").siblings().eq(0).html());
                });
                $("#pageTestListBody").delegate(".delTestReportBtn","click",function(){

                    that.requestDetectiondel($(this).parent(".main-dav-table-block").siblings().eq(0).html());
                    $(this).parents(".main-dav-table-line").remove();
                });
                $("#pageTestListTurnPage").delegate(".num-page","click",function(){
                    var pageNum = $(this).attr("data-num");
                    that.start = pageNum*5;
                    that.requestDataList();
                });
                $("#pageTestListTurnPage").delegate(".prev-page","click",function(){
                    that.start = that.start-5;
                    that.requestDataList();
                });
                $("#pageTestListTurnPage").delegate(".next-page","click",function(){
                    that.start = that.start+5;
                    that.requestDataList();
                });
                $("#pageTestListTurnPage").delegate(".first-page","click",function(){
                    that.start = 0;
                    that.requestDataList();
                });
                $("#pageTestListTurnPage").delegate(".last-page","click",function(){
                    that.start = (Math.ceil(that.totalDataLength/5)-1)*5;
                    that.requestDataList();
                });
                
            }
            
        },
        show:function(clientId, name){
            var that = this;
            that.start = 0;
            that.clientId = clientId;
            $("#pageTestList").show();
            that.isShow = true;
            that.requestDataList();
            $("#pageTestListName").html("姓名："+name);
            $("#pageTestListNum").html("编号："+clientId);

        },
        hide:function(){ 
            var that = this;
            $("#pageTestList").hide();
            that.isShow = false;
        },
        initUi: function(){
            var that = this;
            var bodyWidth = Math.round(windowWidth*0.93);
            var bodyHeight = Math.round(windowHeight*0.83);
            $("#pageTestListBody").css({
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
            $("#pageTestListTable").css({
                marginLeft:tableLeft,
                marginTop:spacing,
                width:contentWidth
            });
            var blockHeight = Math.round((contentHeight-spacing*2)/8);
            $("#pageTestListTable .main-dav-table-block").css({
                height:blockHeight,
                lineHeight:blockHeight+"px",
                fontSize:blockHeight/2.5
            });
            $("#pageTestListTable .column-fill").css({
                height:blockHeight*5,
                lineHeight:blockHeight*5+"px",
                fontSize:blockHeight/2.5
            });
            var btnWidth = contentWidth*0.5*0.45;
            var btnHeight = blockHeight/1.5;
            var marginLeft = (contentWidth*0.5-btnWidth*2)/3;
            var marginTop = (blockHeight-btnHeight)/2;
            $("#pageTestListTable .btn").css({
                height:Math.round(btnHeight),
                lineHeight:Math.round(btnHeight)+"px",
                width:Math.round(btnWidth)+"px",
                fontSize:Math.round(blockHeight/2.5),
                marginLeft:Math.round(marginLeft),
                marginTop:Math.round(marginTop)
            });
            var soBtnHeight = blockHeight;
            var soBtnWidth = contentWidth/8;;
            $("#pageTestListBody .backBtn").css({
                width:Math.round(soBtnWidth),
                fontSize:Math.round(soBtnHeight/2.3),
                height:Math.round(soBtnHeight),
                lineHeight:Math.round(soBtnHeight)+"px",
                borderRadius:Math.round(soBtnHeight/10)+"px",
                marginRight:Math.round(tableLeft),
                marginTop:Math.round(contentTop)
            });
            $("#pageTestListName,#pageTestListNum").css({
                width:Math.round(soBtnWidth*2),
                fontSize:Math.round(soBtnHeight/1.8),
                height:Math.round(soBtnHeight),
                lineHeight:Math.round(soBtnHeight)+"px",
                marginLeft:Math.round(tableLeft),
                marginTop:Math.round(contentTop)
            });
            
            
           
            
            
            var turnPageItemFontSize = blockHeight/2.5;
            $("#pageTestList .main-turn-page").css({
                right:tableLeft,
                bottom:tableLeft,
                marginTop:spacing
            });
            $("#pageTestList .main-turn-page .turn-page-item").css({
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
                url: "./checkRecord/loadList.html",
                timeout: 10000,
                data:{
                    "clientId":that.clientId,
                    "start":that.start,
                    "length":5
                },
                beforeSend: function(){
                    
                },
                success: function(data){

                    var dataList = data.data;
                    var totalDataLength = data.recordsTotal;
                    that.totalDataLength = totalDataLength;
                    var length = dataList.length;
                    var htmlList = "";
                    for(var i=0; i<length; i++){
                        var intervalDay;
                        if(dataList[i].createTime==null|dataList[i].prevTime==null){
                            intervalDay = 0;
                        }else{
                            intervalDay = Math.round((dataList[i].createTime-dataList[i].prevTime)/1000/86400);
                        }

                        htmlList+=that.createItmeHtml(dataList[i].id, dataList[i].createTimeStr , intervalDay);
                    }
                    if(length==0){
                        htmlList = that.createItmeFillHtml();
                    }
                    $("#pageTestListTableBody").html(htmlList);
                    $("#pageTestListTurnPage").html(that.createPage(totalDataLength));
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
        createItmeHtml:function(recordId, createTimeStr,intervalNum ){
            var that = this;
            var html = '<div class="main-dav-table-line">'+
                            '<div class="main-dav-table-block column-one">'+recordId+'</div>'+
                            '<div class="main-dav-table-block column-two">'+createTimeStr+'</div>'+
                            '<div class="main-dav-table-block column-three">'+intervalNum+'</div>'+
                            '<div class="main-dav-table-block column-four"><div class="btn hoverColor lookTestReportBtn">查看检测记录</div><div class="btn hoverColor delTestReportBtn">删除检测记录</div></div>'+
                        '</div>';
            return html;
        },
        createItmeFillHtml:function(){
            var that = this;
            var html = '<div class="main-dav-table-line">'+
                            '<div class="main-dav-table-block column-fill">没有相关数据</div>'+
                        '</div>';
            return html;
        },
        requestDetectionResults: function(recordId){
            var that = this;
            $.ajax({
                type:"post",
                url: "./checkRecord/get.html",
                timeout: 10000,
                data:{
                    "clientId":that.clientId,
                    "recordId":recordId
                },
                beforeSend: function(){
                    
                },
                success: function(data){
                    detectionResults = data;
                    that.testReport.init();
                    that.testReport.show();
                },
                error: function(){

                }

            });
        },
        requestDetectiondel: function(recordId){
            var that = this;
            $.ajax({
                type:"post",
                url: "./checkRecord/delete.html",
                timeout: 10000,
                data:{
                    "recordId":recordId
                },
                beforeSend: function(){
                    
                },
                success: function(data){
                    if(data.state.code==2000000){

                    }
                },
                error: function(){

                }

            });
        }
        
        
    };
    module.exports = userList;

});