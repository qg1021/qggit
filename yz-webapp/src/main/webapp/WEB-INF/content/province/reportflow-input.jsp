<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidereport" name="activemenu" />
	<title>报名流程</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx }/js/DatePicker/WdatePicker.js" ></script>
	<script type="text/javascript" src="${ctx}/fckeditor/fckeditor.js"></script> 
	<script type="text/javascript" src="${ctx}/fckeditor/lsfckeditor.js"></script>
	<script src="${ctx}/js/ajaxfileupload.js" type="text/javascript"></script>
	<link href="${ctx}/css/layer.css" type="text/css" rel="stylesheet"/>  
	<script src="${ctx}/js/layer.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#content").focus();
		//自定义验证规则
 		$.validator.addMethod("validNotNullContent",function(value,element,params){
 		 	if(getLenght() == 0)   
 				return false;  
 		 	else
	 		 	return true;  
		},"请输入内容");
		
 		$.validator.addMethod("validMaxLenghtContent",function(value,element,params){
 		 	if(getLenght() > 5000)   
 				return false;  
 		 	else
	 		 	return true;  
		},"内容长度最多为5000个字符");
		$("#form1").validate({
			rules: {
				createDate:"required", 
				content: {
					"validNotNullContent":true,
					"validMaxLenghtContent": true
				}
			},
			messages: { 
				createDate:"请选择日期" 
			},
	        errorPlacement: function(error, element) {   
		        if (document.getElementById("error_"+element.attr("name")))  {
		            error.appendTo("#error_"+element.attr("name"));  
		        }
		        else       
		            error.insertAfter(element);   
		        },
		        errorElement: "em"
		}); 
	});
	function getLenght(){
		var oEditor = FCKeditorAPI.GetInstance("content");
	 	var oDOM = oEditor.EditorDocument;
	 	var iLength ;
	 	if(document.all){
			 	var strCont =$.trim(oDOM.body.innerText);
	 		iLength = strCont.length;
	 	}else{
		 	var r = oDOM.createRange();
		 	r.selectNodeContents(oDOM.body);
		 	var strCont =$.trim(r.toString());
		  
		 	iLength = strCont.length;
	 	}
			return iLength;
	}	
	//判断上传附件的文件格式
 	function check(files) 
 	{ 
 		var val = files.value.substr(files.value.lastIndexOf(".")).toLowerCase(); 
 		var fileType = new Array(".rar",".zip",".doc",".docx",".xls",".xlsx",".txt",".ppt",".pptx",".pdf");
 		var flag = false;
 	 	for(var i=0;i<fileType.length;i++)
 	 	{ 
			if(fileType[i]==val){
				flag =true;
			}
 	 	}
 	  
 	 	if(!flag){
			alert("上传附件的格式不正确,请重新选择.");
			var objVal = document.getElementById('hid_picfile').value; 
			if(objVal==null || ""==objVal){
				document.getElementById('span1').innerHTML='<input type="file" name="file" id="file" style="width:300px;" value="选择文件" onchange="check(this);"/>';
			}
 	 	 	return;
 	 	} 
 	 	
 	 	//上传附件
 	 	ajaxAttchFileUpload();
 	} 
 	
 	//上传附件 
	function ajaxAttchFileUpload(){
		showLayer('dialog','dialog_content',"<span style='text-align:center'><img align='top' alt='正在上传...' src='../image/loading.gif'/></span>");
				$.ajaxFileUpload
				(
					{
						url:'../upload!uploadAttach.excsec',//用于文件上传的服务器端请求地址
						secureuri:false,//一般设置为false
						fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
						dataType: 'json',//返回值类型 一般设置为json
						success: function (data, status)  //服务器成功响应处理函数
						{ 
						closeLayer();//关闭提示层
						if(data!=null){
							if(data.message!=null){
								alert(data.message);//错误提示信息，如附件太大，上传失败
								//上传失败后，清空上传文件框
								document.getElementById('span1').innerHTML='<input type="file" name="file" id="file" style="width:300px;" value="选择文件" onchange="check(this);"/>';
								return;
							}else{
								var picfilepath = data.fileName;//获得上传成功后的文件名
								var picfilename = data.fileFileName;//获得上传成功后的真实文件名
 
								document.getElementById('hid_picfile').value=picfilepath;//将上传成功后的文件名赋与hidden文本框，以保存文件名到数据库
								document.getElementById('hid_picfileName').value=picfilename;//将上传成功后的文件名赋与hidden文本框，以保存文件真实名到数据库
								  
								document.getElementById("name").value=picfilepath; //为下载downLoadForm文件名赋值
			 					document.getElementById("trueName").value=picfilename;//为下载downLoadForm文件真实名赋值
								document.getElementById('show_val').innerHTML='<a style=margin-left:5px; href=javascript:void(0) onclick=onDownLoad();>'+picfilename+'</a>';
		
						 	 	//显示"删除文件"
						 	 	document.getElementById('delFile_div').style.display="block";
							}
						}	
							if(typeof(data.error) != 'undefined')
							{
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
						}
					}
				)
				return false;
	}

	//上传后的文件的下载
	function onDownLoad(){
		var x=document.getElementById("downLoadForm");  
		 x.submit();
	}

	//删除附件 	
	function onDelAttch(){
		//清空附件文本框
		document.getElementById('span1').innerHTML='<input type="file" name="file" id="file" style="width:300px;" value="选择文件" onchange="check(this);"/>';

		//取得附件路径
		var attachmentPath = document.getElementById('hid_picfile').value;
		 
		//后台删除附件
		$.getJSON("../upload!deleteAttch.excsec",{"attachmentPath":attachmentPath},function(data) {
 
			 if(data!=null){//删除失败，打印提示信息
			 	alert(data.value);
			 }else{
			   //删除成功
				document.getElementById('delFile_div').style.display='none'; //隐藏＂删除文件＂的链接
				document.getElementById('hid_picfile').value='';//删除完成后将附件名清置空
				document.getElementById('hid_picfileName').value='';//删除完成后将附件真实名清置空
				document.getElementById('show_val').innerHTML="&nbsp;"//将显示上传成功后的文件名的DIV置空
			 }
		});
	}
	//预览
	function doView(){
		$("#form1").validate();
		$("#form1").attr("target","_blank");
		$("#form1").attr("action","${ctx}/province/reportflow!view.action");
		$("#form1").submit();
	}
	//保存
	function doSave(){
		$("#form1").validate();
		$("#form1").attr("target","");
		$("#form1").attr("action","${ctx}/province/reportflow!save.action");
		$("#form1").submit();
	}
</script>
</head>
<body>
<!--浮动层-->
	<!-- JS遮罩层 --> 
	<div id="fullbg"></div> 
	<!-- end JS遮罩层 --> 
	<!-- 对话框 --> 
	<div id="dialog"> 
		<div id="dialog_content"></div> 
	</div>
    <!--浮动层 end --> 
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/left.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start --> 
		<form action="${ctx}/province/reportflow!save.action" method="post" id="form1" name="form1" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${id}" />  
		<div class="right_content">
			<div id="message" style="line-height: 35px;">
	 	<s:actionmessage theme="custom" cssClass="tipbox"/> 
	</div>
		<h2>报名流程</h2>
		<div class="pagehead01"></div>
		<!--<div class="pagehead02"></div>--> 
		<!-- top_serach_box_registration start -->
		<div class="top_serach_box">
		<ul class="form district_edit_form" style="width:720px;">
		<li>以下有<span class="colorred">*</span>的内容为必填项：</li>
		<li>
		<label>提交日期<span class="colorred">*</span></label>
		<input type="text" onclick="WdatePicker();" value="<s:if test="id==null"><%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString()%></s:if><s:else><s:date name="createDate" format="yyyy-MM-dd"/></s:else>" style="width:130px" name="createDate" id="createDate" readonly="readonly"/>
		</li> 
		<li>
		<label style=" vertical-align: top;">文字内容<span class="colorred">*</span></label>
		 	<textarea name="content" id="content" style="width: 550px;">${content }</textarea>
		  	  <script type="text/javascript">
				createCkEditor("${ctx}/fckeditor/","content",550,350,"MyToolbar",'','',true,80,'replace');
				function FCKeditor_OnComplete(editorInstance) { 
					//IE,搜狗浏览器的
					if(document.all){
						editorInstance.EditorDocument.attachEvent("onkeyup", editor_keyup); 
					}else{//火狐浏览器
						editorInstance.EditorDocument.addEventListener('keyup', editor_keyup,false) ;
					}
				}
				function editor_keyup(e) 
			    { 
				    if(getLenght()>0)
						$('#error_content').hide();
				    else
				    	$('#error_content').show();
			    }
			</script> <br/>
        <em id="error_content" style="padding-left:110px;"></em> 
		</li>
<!--		<li>-->
<!--		<label>其他附件</label>支持PPT、PDF、XLS等格式；文件大小不得超过5M-->
<!--		</li>-->
<!--		<li>-->
<!--		<label style="float: left;">&nbsp;</label>-->
<!--	       	<input type="hidden" name="attachmentPath" id="hid_picfile" value="${attachmentPath}"/>-->
<!--	       	<input type="hidden" name="attachmentName" id="hid_picfileName" value="${attachmentName}"/>   -->
<!--	   		<div id="span1" style="float: left;">-->
<!--	   		<input type="file" name="file" id="file" style="width:300px;" value="选择文件" onchange="check(this);"/>-->
<!--	    	</div>&nbsp;&nbsp;	-->
<!--			<div style="float: left;" id="show_val"> -->
<!--				<s:if test="attachmentPath!=null&& ''!=attachmentPath">-->
<!--					<a style=margin-left:5px; href=javascript:void(0) onclick=onDownLoad();>${attachmentName}</a>-->
<!--				</s:if>								-->
<!--			</div>&nbsp;&nbsp;-->
<!--	      	<div id="delFile_div" class="ml20" style="<s:if test="attachmentPath!=null && ''!=attachmentPath">display: block;</s:if><s:else>display: none;</s:else>float:left;">-->
<!--	       		<a href="javascript:void(0);" onclick="onDelAttch();">删除文件</a>&nbsp;-->
<!--	       	</div>	  -->
<!--		</li>-->
		
	</ul>
	<p class="ta_c mt15"><input type="button" class="btn_blue mr20" value="预览" onclick="doView();"/><input type="submit" class="btn_red mr20" value="提交" onclick="doSave();"/></p>
	
	</div>        
	<!-- top_serach_box_registration end --> 
	</div>
	</form>
	<!-- 右侧内容 column  end-->        
	</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
<form action="../attachdownload.excsec" method="post" id="downLoadForm">
	<input type="hidden" name="name" id="name" value="${attachmentPath}"/>
	<input type="hidden" name="trueName" id="trueName" value="${attachmentName}"/>  
</form>
</body>
</html>