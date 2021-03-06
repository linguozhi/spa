define(function(require, exports, module) {
    var util = require('./util');
    var windowHeight = util.windowHeight();
    var windowWidth = util.windowWidth();   
    var testReport = {
        isShow: false,
        isInit:false,
        slipIsInit:false,
        init: function(){
            var that = this;
           
            that.isInit = true;
            that.show();
            that.initUi();
            
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
            var dataSize = Math.ceil(checkResultListSize/2);

            $("#pageTestReportDataWraps").css({
                width:bodyWidth*dataSize
            });
            $(".pageTestReportDataWrapsTwo").css({
                width:bodyWidth 
            });


            
            var slipDataWraps = slipReport('page',$("#pageTestReportDataWraps")[0],{
                  num: dataSize,
                  no_follow: true
            });
            slipDataWraps.toPage(0,0);
            
            



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
            

            
            
            
            
            
            

            if(!that.slipIsInit){

                that.slipIsInit = true;
                $("#pageTestReportRecommendBtn").bind("click",function(){
                    var length = slipDataWraps.page*2+2;
                    if(length>checkResultListSize){
                        length = checkResultListSize;
                    }
                   
                    var listHtml = "";
                    for(var i=slipDataWraps.page*2; i<length; i++){
                        var checkResultListOne = checkResultList[i];
                        listHtml+="<li style='width:"+recommendWidth+"px;'><img src="+checkResultListOne.product.imageUrl+" /></li>";
                    }
                    $("#pageTestReportRecommendProductList").html(listHtml);
                    
                    
                    $("#pageTestReportRecommendProductListWrap").css({
                        width:recommendWidth
                    });
                    $("#pageTestReportRecommendProductList").css({
                        width:recommendWidth*(length+2)
                    });

                    $("#pageTestReportRecommendBg").show();
                    $("#pageTestReportRecommend").show();
                    that.slip_img = slipRecommend('page',$("#pageTestReportRecommendProductList")[0],{
                      num: length-slipDataWraps.page*2,
                      no_follow: true
                    });
                    
                        
                    
                    
                    that.slip_img.toPage(0,0);
                    
                });
                $("#pageTestReportRecommendLeftArrow").bind("click",function(){
                    that.slip_img.backward(); // 上一张
                    console.log("上一张");
                });
                $("#pageTestReportRecommendRightArrow").bind("click",function(){
                    that.slip_img.forward(); // 下一张
                    console.log("下一张");
                });
                $("#pageTestReportBg").bind("click",function(){
                    that.hide();
                    home.show();
                });

                $("#pageTestReportRecommendClose, #pageTestReportRecommendBg").bind("click",function(){
                    $("#pageTestReportRecommendBg").hide();
                    $("#pageTestReportRecommend").hide();
                    
                });
                //临时--
                var omprehensiveImgIsShow = false;
                var omprehensiveImg = $("<img/>").attr("src", "http://gugugame-backup.oss-cn-shenzhen.aliyuncs.com/1489245648658.jpg").css({
                    width: bodyWidth, 
                    height: bodyHeight,
                    display: "block",
                    position: "absolute",
                    top:0,
                    left:0
                }).hide();
                var comprehensiveBtn = $("<div/>").css({
                    width:btnWidth/2,
                    height:btnHeight,
                    fontSize:btnFontSize,
                    lineHeight:btnHeight+1+"px",
                    top:0,
                    right:0,
                    position: "absolute",
                    background: "#004098",
                    border: "1px solid #23353f",
                    color: "#fff",
                    textAlign: "center",
                    fontWeight: "700"
                }).html("总报告").click(function(){
                    if(omprehensiveImgIsShow){
                        omprehensiveImgIsShow = false;
                        omprehensiveImg.hide();
                        $(this).html("总报告");
                    }else{
                        omprehensiveImgIsShow = true;
                        omprehensiveImg.show();
                        $(this).html("关 闭");
                    }
                   
                });
                $("#pageTestReportBody").append(omprehensiveImg);
                $("#pageTestReportBody").append(comprehensiveBtn);
                
                //临时--

            }
          
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
                                                    '<img class="mainInputRadioBoxTick main-input-radio-box-tick" src="/public/images-dist/main-input-radio-tick-red.png" />'+
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
    module.exports = testReport;

});