$(document).ready(function(){
	// 初始化
	loadInit();

	$("form").submit(function(){
		// 操作
		popup.loading().show();

		$.ajax({
			type: 'post',
			url: $('form').attr('action'),
			data: $('form').serialize(),
			success: function (result) {
				popup.loading().hide();
				if (protocols.isSuccess(result)) {
					self.location.href = WEBROOT +'/client/index.html';
				} else {
					popup.tip(protocols.getMessage(result));
					console.log(protocols.getMessage(result));
				}
			},
			dataType: 'json'
		});
	});

	$("#sch_game").typeahead({
		source: function (query, process) {
			var parameter = {
				name: query,
				start : 0,
				length: 10
			};
			url = document.location.origin + '/game/rest/games/getList.shtml';
			$.post(WEBROOT + '/game/getListByName.html', parameter, function (result) {
				$("#gameid").val(""); // 清空
				names = [];
				map = {};
				var data = result;

				$.each(data, function (i, game) {
					var item = '[' + game.id +  ']' + game.name;
					map[item] = game;
					names.push(item);
				});
				process(names);
			}, 'json');
		},
		updater: function (item) {
			selectedId = map[item].id;
			$("#gameid").val(selectedId);
			return item;
		},
		matcher: function (item) {
			if (item.toLowerCase().indexOf(this.query.trim().toLowerCase()) != -1) {
				return true;
			}
		},
		sorter: function (items) {
			return items.sort();
		},
		highlighter: function (item) {
			var regex = new RegExp( '(' + this.query + ')', 'gi' );
			return item.replace( regex, "<strong>$1</strong>" );
		},
	});

});


bindHover = function() {
	$(".glyphicon-minus").click(removeGame);


	$(".select-game").hover(function(){
		$(this).children(".glyphicon-minus").show();
	}, function() {
		$(this).children(".glyphicon-minus").hide();
	});
}

addGame = function() {
	var gameId = $("#gameid").val();
	var gameName = $("#sch_game").val();
	if($(".select-game").length > 14) {
		popup.tip("最多只能添加15款游戏");
		return;
	}

	if(utils.empty(gameId)) {
		popup.tip("请选择游戏");
		return;
	}

	if(exist(gameId)) {
		popup.tip("游戏已存在");
		return;
	}

	var html = '<div class="col-lg-12 form-group" style="margin-left: 120px">'
		+ '<div class="form-inline col-sm-12 select-game">'
		+ '<input id="selectGameId" name="selectGameId" type="hidden" value="' + gameId + '">'
		+ '<input id="selectGameName" type="text" class="form-control input-sm" required value="'+ gameName +'" disabled>'
		+ '&nbsp;<input id="servers" value="" class="form-control input-sm" style="width:290px" placeholder="请输入区分,多个以英文逗号隔开...">'
		+ '<span class="glyphicon glyphicon-minus" style="display: none"></span>'
		+ '</div>'
		+ '</div>';
	$("#selected_games").append(html);
	bindHover();
}

/**
 * 确认游戏是否已被选中
 * @param gameId
 */
exist = function(gameId) {
	var selectGameIds = $("input[name='selectGameId']");
	var isExist = false;
	$.each(selectGameIds, function(i, item) {
		console.log($(item).val());
		if($(item).val() === gameId) {
			isExist = true;
			// 中断循环
			return false;
		}
	});

	return isExist;
}
/**
 * 移除操作
 */
removeGame = function() {
	$(this).parent().remove()
}

/**
 * 构建用户选择的栏目游戏
 */
buildUserGame = function() {
	var userGames = $(".select-game");
	var arr = [];
	$.each(userGames, function(i, data) {
		var userGame = {};
		var gameId = $(data).children("input#selectGameId").val();
		var servers = $(data).children("input#servers").val();
		userGame.gameId = gameId;
		userGame.servers = servers;

		arr.push(userGame);
	})

	console.log(JSON.stringify(arr));
	return arr.length > 0 ? JSON.stringify(arr) : null;
}

loadInit = function() {
	$("#btnAdd").click(addGame);
	bindHover();

	$("#image").fileinput({
		showUpload : false,
		showRemove : false,
		language : 'zh',
		//allowedPreviewTypes: ['image'],
		//allowedFileTypes: ['image'],
		previewSettings : {
			image: {width: "100%", height: "100%"}
		},
		initialPreview: imageArr,
		initialPreviewAsData: true,
		initialPreviewConfig: imageConfigArr,
		deleteUrl: "/image/del.html",
		overwriteInitial: false,
		maxFileCount: 1,
		//initialCaption: "",
		//maxFilePreviewSize: 10240
		allowedFileExtensions:  ['jpg', 'png'],
		uploadUrl: '/image/upload.html',
		maxFilePreviewSize: 10240,
		imageWidth: '200px',
		resizeImage: true,
		imageHeight: '200px'
	});

	$('#image').on('fileuploaded', function(event, data, previewId, index) {
		console.log(data);
		var result = data.response;
		if(!protocols.isSuccess(result)) {
			popup.tip(protocols.getMessage(result));
			return;
		}

		var imageId = data.response.data.id;
		if(imageId > 0) {
			$('#headImageId').val(imageId)
		}
	});
}




