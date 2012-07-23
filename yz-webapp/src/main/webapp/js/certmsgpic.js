$(document).ready(function(){
		//手动导出密钥验证fancybox弹出框
		$("a.showPicurlClass").fancybox({
			'titlePosition'		: 'outside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',  
			'hideOnOverlayClick':true, 
			'showCloseButton':true,  
			'padding': 0, //边框距离
			'margin':0, //边框距离  
			'onStart':function(selectedArray){
				var globalUrl = $(selectedArray[0]).attr('globalUrl');
			 	var picurl = $(selectedArray[0]).attr('picurl');
			 	if(picurl!=null && ''!=picurl){
			 		var purl= globalUrl+picurl;
					var img ='<img src="'+purl+'" width="180" id="cetImg" alt=""/>';
					$("#inline1").html(img);
				}
			} 
		});    
	});