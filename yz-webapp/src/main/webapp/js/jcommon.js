/*!
 * 考务js公用
 * 
 * author:qingang
 * date:2011-11-16
 * 
 */

/**删除**/
function delRecord(url){
	if(confirm("你确认删除？")){
		window.location.href = url;
	}
}




/**上传个人照片**/
function ajaxUploadPic(fileurl){
	
	showLayer('dialog','dialog_content',"<span style='text-align:center'><img align='top' alt='正在上传...' src='../image/loading.gif'/></span>");
	
	$.ajaxFileUpload
	(
		{
			url:fileurl,//用于文件上传的服务器端请求地址
			secureuri:false,//一般设置为false
			fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
			dataType: 'json',//返回值类型 一般设置为json
			success: function (data, status)  //服务器成功响应处理函数
			{
				alert(data.message);//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
				closeLayer();
				if(data.message=='上传成功'){
					var example="<a id='picexample' href='"+$("#baseurl").val()+data.fileName+"'>预览</a>"
					$("#picurl").val(data.fileName);
					document.getElementById("picspan").innerHTML = example;
					$("a#picexample").fancybox();
				}
				
				if(typeof(data.error) != 'undefined')
				{
					closeLayer();
					if(data.error != '')
					{
						alert(data.error);
					}else
					{
						
						alert(data.message);
					}
				}
			},
			error: function (data, status, e)//服务器响应失败处理函数
			{
				alert(e);
				closeLayer();
			}
		}
	)
	
	return false;

}

//控制input的输入值，让它只能输入数字。
//param: bln  是否允许小数点。 true 为允许，false为禁止
//param: bolsign 是否允许负数。 true 为允许，false为禁止
function gNumeric(bln,bolsign,e){
	e = window.event||e;
	var code = e.keyCode||e.which;
	if (bolsign!=false){
		bolsign=true;
	}
	if (code < 48 || code > 57){ 
	    if (bolsign==true){
			if (code==13 || code==43 || code==45 || code==46 || code==8 && bln){
		
			}else{
				if(window.event)
					e.returnValue = false;
	            else
	                e.preventDefault();//for firefox
			}
	    }else{
			if (code==13 || code==46 || code==8 && bln){
		
			}else{
				if(window.event)
					e.returnValue = false;
	            else
	                e.preventDefault();//for firefox
			}
	    }
	}

}

//控制input的输入值，让它只能输入数字和字母。
function gNumericAndLetter(){
	if (event.keyCode < 48 || event.keyCode > 57){ 
	
	   	if (event.keyCode < 65 || event.keyCode > 90){
			event.returnValue = false;
		}else{
			
		}
	}
}


//显示一个半透明div，遮挡页面
function showLoading(){   
	showLayer('dialog','dialog_content',"<span style='text-align:center'><img align='top' alt='正在上传...' src='../image/loading.gif'/></span>");
}  
function hideLoading(){   
	closeLayer();
}
//设置排考管理tab的css样式
function setTabClass(currentIndex){
	for(var i=1;i<=7;i++){
		if(currentIndex == i)
			$("#tab"+i).addClass("switch_tab_current");
		else
			$("#tab"+i).removeClass();
	}
}

function pageClose(){ 
	var browserName=navigator.appName; 
	if (browserName=="Netscape") {
		window.open('','_parent',''); 
		window.close();
	} else if (browserName=="Microsoft Internet Explorer") { 
		window.opener = "whocares"; window.close(); 
		} 
}





