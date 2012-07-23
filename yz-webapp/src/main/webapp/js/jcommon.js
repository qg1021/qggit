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
//根据考区查询所辖考点
function getSiteByAreaID() {
	var areaid = $("#areaid").val();
	if(areaid) {
		$.post("../relatedsite.excsec",{"areaid":areaid},function(data) {
			$("#siteid option[value!='']").remove();
			var site = eval(data.site);
			if(site==null || site=='' || site.length == 0) return;
			for(var i = 0 ;i < site.length ; i++) {
				$("#siteid").append("<option value='"+site[i].value+"'>"+site[i].label+"</option>");
			}
		});
	}
	else {
		$("#siteid option[value!='']").remove();
	}
}
//根据考点查询所辖考场
function getRoomBySiteID() {
	var siteid = $("#siteid").val();
	if(siteid) {
		$.post("../relatedroom.excsec",{"siteid":siteid},function(data) {
			$("#roomid option[value!='']").remove();
			var room = eval(data.room );
			if(room==null || room=='' || room.length == 0) return;
			for(var i = 0 ;i < room.length ; i++) {
				$("#roomid").append("<option value='"+room[i].value+"'>"+room[i].label+"</option>");
			}
		});
	}
	else {
		$("#roomid option[value!='']").remove();
	}
}
function getSiteByAreaIDAndTimesID() {
	var areaid = $("#areaid").val();
	var timesid = $("#timesid").val();
	if(areaid) {
		$.post("../relatedsite!siteCurrentTimes.excsec",{"areaid":areaid,"timesid":timesid},function(data) {
			$("#siteid option[value!='']").remove();
			var site = eval(data.site);
			if(site==null || site=='' || site.length == 0) return;
			for(var i = 0 ;i < site.length ; i++) {
				$("#siteid").append("<option value='"+site[i].value+"'>"+site[i].label+"</option>");
			}
		});
	}
	else {
		$("#siteid option[value!='']").remove();
	}
}
/**上传项目风格样式**/
function uploadStyle(fileurl){
	
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
					var example="<a id='stylelink' href='"+$("#baseurl").val()+"/"+data.fileName+"'>下载现有样式包</a>"
					$("#style").val(data.fileName);
					document.getElementById("stylespan").innerHTML = example;
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
					var example="<a id='picexample' href='"+$("#picbaseurl").val()+data.fileName+"'>查看个人照片</a>"
					$("#picurl").val(data.fileName);
					$("#picspan").show();
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
/**上传身份证扫描件**/
function ajaxUploadIdcard(fileurl){
	
	showLayer('dialog','dialog_content',"<span style='text-align:center'><img align='top' alt='正在上传...' src='../image/loading.gif'/></span>");
	
	$.ajaxFileUpload
	(
		{
			url:fileurl,//用于文件上传的服务器端请求地址
			secureuri:false,//一般设置为false
			fileElementId:'idimage',//文件上传空间的id属性  <input type="file" id="file" name="file" />
			dataType: 'json',//返回值类型 一般设置为json
			success: function (data, status)  //服务器成功响应处理函数
			{
				alert(data.message);//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
				closeLayer();
				if(data.message=='上传成功'){
					var example="<a id='idcardexample' href='"+$("#idcardbaseurl").val()+data.fileName+"'>查看身份证扫描件</a>"
					$("#idcardurl").val(data.fileName);
					$("#idcardspan").show();
					document.getElementById("idcardspan").innerHTML = example;
					$("a#idcardexample").fancybox();
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
/**
 * 后台导入报考记录或考试资源
 * @param fileurl
 * @return
 */
function uploadArrange(fileurl){
	
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
				onSave();
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
/**
 * ajax提交
 * @param _url
 * @param _head 参数 json格式
 * @param _callbackFun 回调函数
 * @return
 */
function ajaxSubmit(_url,_head,_callbackFun){
	$.ajax({   
        type: "POST",   
        beforeSend: function(){
        	  showLoading();
        },
        url: _url,   
        data:{tableDetail:JSON.stringify(_head)},   
        dataType:"json",   
        complete: function(){
        	  hideLoading();
        },
        error: function(xhr,status,errMsg){
        	alert("提交失败");
        },
        success:function(data){
        	  _callbackFun(data);
        }   
     });
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
function onSeatSave(seatid,seatstatus){
	if(seatid!='' && seatstatus!=''){
		$.post("outsideseat!save.excsec",{"seatid":seatid,"seatstatus":seatstatus},function(data) {
			var data = eval(data);
			if(data.value=='修改成功'){
				parent.location.reload();
			}else{
				alert("修改失败");
			}
			
		});
	}
}
//验证正整数(生成座位表时使用)
function checkPositiveInteger(obj){
	var re = /^[1-9]\d*$/;
	$("#iscreateSeat").val(0);
	if(obj.value*1<=0){
		obj.value = "";
		obj.focus();
		return false
	}
	if (!re.test(obj.value)) {
		obj.value = "";
		obj.focus();
		return false;
	}
} 
function setRealSeatSize(){
	var i=0;
	$("select[name='seatstatus']").each(function(){
		if($(this).val()!='2')
			i++;
	});
	$("#realSeatSize").text(i);
}
//生成座位表
function onCreateSeat(){
	var lineNum = $("#lineNum").val()*1;//行
	var columnNum = $("#columnNum").val()*1;//列
	var lnum = $("#lnum").val()*1;
	var cnum = $("#cnum").val()*1;
	$("#iscreateSeat").val(0);
	if(lineNum>0 && columnNum>0){
		if(lineNum==lnum && columnNum==cnum){
			alert("座位布局没有变化无需重新生成");
		}else{
			$("#seatlist").text('');
			$("#seatlist").width(columnNum*80+"px");
			$("#iscreateSeat").val(1);
			for(var i=1;i<=lineNum*columnNum;i++){
				var seat="<li id='seat"+i+"' class='seat_border'><select id='seatstatus' onchange='onSeatClass("+i+",this);' name='seatstatus'><option selected='selected' value='0'>考位机</option><option value='2'>不可用</option></select></li>";
				$("#seatlist").append(seat);
			}
		}
		setRealSeatSize();
	}else{
		alert("座位行列输入的不合法");
	}
}
function onSeatClass(seatnum,obj){
	$("#seat"+seatnum).removeClass();
	if(obj.value*1==2){
		$("#seat"+seatnum).addClass("seat_detail_none seat_border");
	}else{
		$("#seat"+seatnum).addClass("seat_border");
	}
	setRealSeatSize();
}
function onSeatSubmit(){
	if($("#inputForm").valid()){
		if($("#iscreateSeat").val()==0){
			alert("请生成座位表");
			return false;
		}else{
			$("#inputForm").submit();
		}
	}	
}
//撤销资源上报
function onReportCancel(url){
	if($("#endDate").val() =='false'){
		alert("已到资源上报截止日期不能进行资源上报或撤销上报操作!");
		return false;
	}
	if(confirm("确定撤销向考区上报？")){
		$("#inputForm").attr("action",url).submit();
	}
}



