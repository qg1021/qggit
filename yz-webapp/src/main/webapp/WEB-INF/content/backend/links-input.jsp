<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="com.drcl.yz.contant.Global"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidearea" name="activemenu" />
	<title>${typeName}</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/layer.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<link rel="stylesheet" href="${ctx}/KindEditor/themes/default/default.css" />
	<link rel="stylesheet" href="${ctx}/KindEditor/plugins/code/prettify.css" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/ajaxfileupload.js" type="text/javascript"></script>
	<script src="${ctx}/js/layer.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/KindEditor/kindeditor-min.js"></script>
	<script type="text/javascript" src="${ctx}/KindEditor/lang/zh_CN.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("a#picexample").fancybox();
		$("#title").focus();
		$("#inputForm").validate({
			rules: {
				title: {
					required:true
				}
			},
			messages: {
				title: {
					required: "请输入标题"
				}
			},
	        errorPlacement: function(error, element) {   
		        if (document.getElementById("error_"+element.attr("name")))  {
		            error.appendTo("#error_"+element.attr("name"));  
		        }
		        else       
		            error.insertAfter(element);   
		        }
		}); 
	});
	var htmlEditor = null;
	KindEditor.ready(function(K) {
		htmlEditor = K.create('textarea[name=content]', {
			cssPath : '${ctx}/KindEditor/themes/default/default.css',
			uploadJson : '${ctx}/KindEditor/jsp/upload_json.jsp',
			fileManagerJson : '${ctx}/KindEditor/jsp/file_manager_json.jsp',
			allowFileManager : true	//允许查看文件
		});
	});
	function onSubmit() {
		 if($("#inputForm").valid()){
		 if(!htmlEditor.isEmpty()){
		 	$("#content").val(htmlEditor.html());
		 	$("#inputForm").submit();
		 }	else{
		 	alert("内容不能为空");
		 }
		}
	}
	document.onkeydown = function(e){    
		e = e || window.event;   
		if(e.keyCode === 13){        
		 onSubmit();   
		}
	};

</script>
</head>
<body>
<!-- JS遮罩层 --> 
	<div id="fullbg"></div> 
	<!-- end JS遮罩层 --> 
	<!-- 对话框 --> 
	<div id="dialog"> 
		<div id="dialog_content"></div> 
	</div>
<div id="wrapper">
	<%@ include file="/common/top.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/menu.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				<tr  height="28">
					<td  background="${ctx}/image/admin/title_bg1.jpg">当前位置&gt;&gt;${typeName}</td>
				</tr>
				<tr>
					<td bgcolor="#b1ceef" height="1"></td>
				</tr>
				<tr height="20">
					<td background="${ctx}/image/admin/shadow_bg.jpg"></td>
				</tr>
			</table>
			<div class="pagehead01"></div>
				<div class="top_serach_box">
					<form id="inputForm" name="inputForm" action="links!save.action?mtype=${mtype}" method="post">
						<input type="hidden" id="id" name="id" value="${id}"/>
						<ul class="form district_edit_form">
					  		<li>
					  			<label>标题<span class="colorred">*</span></label>
					  			<input id="title" name="title" value="${title}" type="text" maxlength="100" style="width:350px;" />
					  		</li>
					  		<li>
					  			<label>外部链接<span class="colorred">*</span></label>
					  			<input id="link" name="link" value="${link}" type="text" maxlength="100" style="width:350px;" />
					  		</li>
					  		<li>
					  			<label>配图<span class="colorred">*</span></label>
					  			<input name="file" type="file" id="file" onchange="ajaxUploadPic('../upload.excsec');"/>
		        				<span id="picspan">
		        					<s:if test="picurl!=null">
		        						<a id="picexample" href="..<%=Global.picpath%>/${picurl}">预览</a>
		        					</s:if>
		        					<s:else>
		        						<a id="picexample" href="" style="display:none">查看</a>
		        					</s:else>
		        				</span>
		        				<input type="hidden" id="picurl" name="picurl" value="${picurl}"/>
		        				<input type="hidden" id="baseurl" name="baseurl" value="..<%=Global.picpath%>"/>
					  		</li>
					  		<li >
					  			<label style="vertical-align: top;">内容</label>
					  			<textarea id="content" name="content" cols="100" rows="8" style="width:800px;height:270px;visibility:hidden;">${content}</textarea>
			        			<span id="error_content"></span>
					  		</li>
					  	</ul>
						<p class="button_box">
							<button class="btn_confirm" type="submit">保存</button> 
							<button class="btn_cancell" type="button" onclick="window.location.href='links.action?mtype=${mtype}'">取消</button>
						</p>
						
					</form>
				</div>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>