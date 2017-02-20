define(function(require) {

    var page = 0;
    window.userId = -1;
    window.detectionResults = null;
		
	require('../../cmdmodule/common');
    require('../../cmdmodule/main-toast');
    require('../../cmdmodule/main-loading');
    require('../../cmdmodule/main-input-module');

    var util = require('../../cmdmodule/util');util.initKeyboard();
	window.slip = require('../../cmdmodule/slip');
    window.newUser = require('../../cmdmodule/index-new-user'); 
    var start = require('../../cmdmodule/index-start'); 
    window.home = require('../../cmdmodule/index-home'); 
    var dataAnalysising = require('../../cmdmodule/index-data-analysising'); 
    var testReport = require('../../cmdmodule/index-test-report'); 
    var userList = require('../../cmdmodule/index-user-list'); 

    window.mainPercentageBar = require('../../cmdmodule/main-percentage-bar');
    window.mainInputText = require('../../cmdmodule/main-input-text');
    window.mainInputRadio = require('../../cmdmodule/main-input-radio');
 
    $("body").css({
        width:util.windowWidth(),
        height:util.windowHeight()
    });
    
    window.pageChange = function (pPage){
 
        if(pPage!=page){
            page = pPage;
            if(pPage==1){
                start.init(home);
                home.init(newUser,userList);
                newUser.init(home);
                userList.init(home, testReport);
            }else if(pPage==2){
                $("#pageMain").show();
                userList.hide(); 
                testReport.hide(); 
                dataAnalysising.init(testReport);
                dataAnalysising.start();
            }else if(pPage==3){
                $("#pageMain").show();
                testReport.init();
            }
        }else if(pPage==2){

            $("#pageMain").show();
            userList.hide(); 
            testReport.hide(); 
            dataAnalysising.init(testReport);
            dataAnalysising.start();
        }
        
    }
    
    try {
        if (JavaCallJs) {
            window.onNewIntent = function(pPage) {
                pageChange(pPage);
            }
            window.headPortraitShootCallback = function() {
                var scanActivityTakingPicturesReturnData = $.parseJSON(window.JsCallJava.getScanActivityTakingPicturesReturnData());
                var headPortraitUrl = "http://120.132.68.148:18048"+scanActivityTakingPicturesReturnData.data.shortUrl;
                newUser.setHeadPortraitUrl(headPortraitUrl,scanActivityTakingPicturesReturnData.data.id);
            }
            pageChange(1);
        }
    } catch (e) {
        pageChange(util.getRequest().page);
    }

    

});