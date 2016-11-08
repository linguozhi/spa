$(document).ready(function(){
	// 初始化
	loadInit();

	$("form").submit(function(){
		$("#ageLevelStr").val(buildAgeLevel());
		$("#childItemStr").val(buildChildItem());

		// 操作
		popup.loading().show();

		$.ajax({
			type: 'post',
			url: $('form').attr('action'),
			data: $('form').serialize(),
			success: function (result) {
				popup.loading().hide();
				if (protocols.isSuccess(result)) {
					self.location.href = WEBROOT +'/checkItem/index.html';
				} else {
					popup.tip(protocols.getMessage(result));
					console.log(protocols.getMessage(result));
				}
			},
			dataType: 'json'
		});
	});
});


bindHover = function() {
	$(".glyphicon-minus").click(removeGame);


	$(".add-item").hover(function(){
		$(this).children(".glyphicon-minus").show();
	}, function() {
		$(this).children(".glyphicon-minus").hide();
	});
}


addAgeLevel = function() {
	var html = '<div class="form-inline age-set add-item form-group" style="padding-left: 15px">'
		+ '		<input id="gtAge" type="number" class="form-control input-sm " style="width: 120px" placeholder="年龄>=" required value="">'
		+ '		<label>到</label>'
		+ '		<input id="ltAge" type="number" class="form-control input-sm " style="width: 120px" placeholder="年龄<" required value="">'
		+ '		<input id="score" type="number" class="form-control input-sm " style="width: 120px" maxlength="25" required placeholder="基数" value="">'
		+ '		<span class="glyphicon glyphicon-minus" style="display: none"></span>'
		+ '	</div>';

	$("#age-sets").append(html);
	bindHover();
}

addChildItem = function() {
	var html = '<div class="form-inline item-set add-item form-group" style="padding-left: 15px">'
		+ '<input id="childItemName" type="childItemName" class="form-control input-sm " style="width: 200px" placeholder="名称" required value="">'
		+ '</div>';
	$("#item-sets").append(html);
	bindHover();

}

/**
 * 移除操作
 */
removeGame = function() {
	$(this).parent().remove()
}

/**
 * 构建年龄设置
 */
buildAgeLevel = function() {
	var ageSets = $(".age-set");
	var arr = [];
	$.each(ageSets, function(i, data) {
		var ageSet = {};
		var gtAge = $(data).children("input#gtAge").val();
		var ltAge = $(data).children("input#ltAge").val();
		var score = $(data).children("input#score").val();
		ageSet.gtAge = gtAge;
		ageSet.ltAge = ltAge;
		ageSet.score = score;

		arr.push(ageSet);
	})

	console.log(JSON.stringify(arr));
	return arr.length > 0 ? JSON.stringify(arr) : null;
}

/**
 *  构建子品相
 */
buildChildItem = function() {
	var childItems = $('.item-set');
	var arr = [];

	$.each(childItems, function(i, data) {
		var checkItem = {};
		var name = $(data).children("input#childItemName").val();
		checkItem.name = name;

		arr.push(checkItem);
	})


	console.log(JSON.stringify(arr));
	return arr.length > 0 ? JSON.stringify(arr) : null;

}

loadInit = function() {
	$("#btnAdd").click(addAgeLevel);
	$("#btnItemAdd").click(addChildItem);

	bindHover();
}




