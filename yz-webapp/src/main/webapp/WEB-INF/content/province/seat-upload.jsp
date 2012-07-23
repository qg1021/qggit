<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="timecell" name="activemenu" />
	<title>考试资源上传</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/layer.css" type="text/css" rel="stylesheet"/>  
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/ajaxfileupload.js" type="text/javascript"></script>
	<script src="${ctx}/js/layer.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script  type="text/javascript">
		function onSave(){
			parent.location.reload();
			parent.$.fancybox.close();
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
  	<div class="layer_box">
		导入资源：<input type="file" id="file" name="file" onchange="uploadArrange('../upload!seat.excsec');"/><a target="_blank" href="../templatedownload.excsec?name=seat.xlsx">模板</a>
  	</div>
    <!--浮动层 end --> 
</body>
</html>