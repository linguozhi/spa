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
					self.location.href = WEBROOT +'/product/index.html';
				} else {
					popup.tip(protocols.getMessage(result));
					console.log(protocols.getMessage(result));
				}
			},
			dataType: 'json'
		});
	});

});



loadInit = function() {

	$("#input-24").fileinput({
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
		//resizeImage: true,
		imageHeight: '200px'
	});

	$('#input-24').on('fileuploaded', function(event, data, previewId, index) {
		console.log(data);
		var result = data.response;
		if(!protocols.isSuccess(result)) {
			popup.tip(protocols.getMessage(result));
			return;
		}

		var imageId = data.response.data;
		var imageIdStr = $('#imageIdStr').val();
		if(imageId > 0) {
			if(utils.empty(imageIdStr)) {
				$('#imageIdStr').val(imageId)
			}else {
				$('#imageIdStr').val(imageIdStr + "," + imageId)
			}
		}
	});
}







